var bank = new Dict;
bank.name = jsarguments[1] + "-save_load";
bank.clear();
var tempbank = new Dict;
tempbank.name = jsarguments[1] + "-temp";
var pb = new PolyBuffer(jsarguments[1] + "-clientbuffer");
var clientbuffersoundindex = new Dict;
clientbuffersoundindex.name = jsarguments[1] + "-clientbuffersoundindex";

// read bank from old or new formats: (code from James)

var envelopeLengthChange = false;

// changes envelope string into array in new format
function parseEnvelope(envelope) {
  var envelopeArray;
  if (Array.isArray(envelope)) {
    if (envelope[envelope.length-1] == 'linear') return envelope;
    else {
      envelopeArray = envelope;
    }
  }
  else if (typeof(envelope) == 'string') {
    envelopeArray = envelope.split(' ');
    envelopeArray.shift(); // remove "envelope" as 1st element
  } 
  for (var i = 0; i < envelopeArray.length; i++) {
    // format: [index_of_sustain_point, start_level, pairs of level & ramp time]
    envelopeArray[i] = parseFloat(envelopeArray[i]);
  }
  var functionArray = [0, 0, 1, 0, envelopeArray[1]]; 
  var currentTime = 0;
  for (var i = 1; i*2 <  envelopeArray.length; i++) {
    currentTime += envelopeArray[i*2+1]
    functionArray.push(currentTime);
    functionArray.push(envelopeArray[i*2]);
    functionArray.push(envelopeArray[0] == i ? 2 : 0);
  }
  functionArray.push('linear');
  functionArray[0] = currentTime;
  // format: [domain, range_min, range_max, triples of (x, y, point_type), "linear"]: point_type is 0 if normal and 2 if sustain_point
  return functionArray;
}

// changes loop string into array in new format
function parseLoop(loopString) {
  //if (Array.isArray(loopString)) return loopString; // when already in correct format, parsing not needed
  if (typeof(loopString) == 'undefined') return [0, 0, 0];
  var loopArray = loopString.split(' ');
  if (loopArray[0] == 'noloop') {
    loopArray[0] = 0;
  }
  else if (loopArray[0] == 'loop') {
    loopArray[0] = 1;
  }
  for (var i = 0; i < loopArray.length; i++) {
    loopArray[i] = parseFloat(loopArray[i]);
  }
  // format: [loop_or_noloop, loop_start, loop_end]
  return loopArray;
}

// When json is imported, check if json bank is in correct format:

function readJsonInstr(filePath) {
  bank.clear();
  bank.import_json(filePath);

  //post(bank.stringify());

  // check if envelope and loop are in new format
  var instrNames = [].concat(bank.getkeys());
  var envelopeArray = bank.get(instrNames[0]+"::1::envelope");
  if (envelopeArray[envelopeArray.length-1] != 'linear') {
    post('old json bank format detected\n');
    for (var i = 0; i < instrNames.length; i++) {
      var numKeys = bank.get(instrNames[i]).getkeys();
      for (var j = 0; j < numKeys.length; j++) {
        // change envelope into new format
        var location = instrNames[i]+"::"+numKeys[j];
        bank.replace(location+"::envelope", parseEnvelope(bank.get(location+"::envelope")));
        // change loop into new format
        var loopOrNoloop;
        if (bank.contains(location+"::loop")) loopOrNoloop = 1;
        else if (bank.contains(location+"::noloop")) loopOrNoloop = 0;
        var loopArray = bank.get(location+(loopOrNoloop?"::loop":"::noloop"));
        bank.replace(location+"::loop", loopOrNoloop);
        bank.append(location+"::loop", loopArray[0]);
        bank.append(location+"::loop", loopArray[1]);
        bank.replace(location+"::start", loopArray[2]);
        if (!loopOrNoloop) bank.remove(location+"::noloop"); 
      }
    }
	loadBank();
  }
  else {
	loadBank();
  }
}

// When txt is imported:

var currentInstr = "";
var instrDict = new Dict();

function setCurrentInstr(ins) {
  currentInstr = ins/*.replace('.instr', '')*/; // removing ".instr" causes problems?
}

function readInstr() {
  instrDict.clear();
  instrDict.pull_from_coll('old_instr');

  for (var i = 1; i <= instrDict.getsize(i.toString()); i++) {
    var sampleArray = instrDict.get(i.toString());
    if (sampleArray.length == 4) {
	  envelopeLengthChange = true;
      var envelopePresets = new Dict('envelope-presets');
      var preset = sampleArray[3];
      sampleArray[3] = 0;
      sampleArray[4] = envelopePresets.get(preset);
      //post(sampleArray[4]+"\n");
    }
    else if (sampleArray.length == 7) {
      sampleArray.splice(3, 0, 0);
    }
    bank.replace(currentInstr+"::"+i+"::sample", sampleArray[0]);
    bank.replace(currentInstr+"::"+i+"::root_key", sampleArray[1]);
    bank.replace(currentInstr+"::"+i+"::key_zone_floor", sampleArray[2]);
    bank.replace(currentInstr+"::"+i+"::vel_zone_floor", sampleArray[3]||0);
    bank.replace(currentInstr+"::"+i+"::envelope", parseEnvelope(sampleArray[4]));
    bank.replace(currentInstr+"::"+i+"::loop", parseLoop(sampleArray[5]));
    bank.replace(currentInstr+"::"+i+"::start", sampleArray[6]||0);
    bank.replace(currentInstr+"::"+i+"::direction", sampleArray[7]||'fw');
    bank.replace(currentInstr+"::"+i+"::timestretch", 0);
  }
}

function endBankDump() {
  loadBank();
}


function refreshBank() {
  bank.clear();
}

// load bank: (code from Georg)

function loadBank()
{
	outlet(0, "bank", "clear");
	pb.clear();
	clientbuffersoundindex.clear();
	var bankkeys = [].concat(bank.getkeys());
	for (var i = 0; i < bankkeys.length; i++) {
		outlet(0, "bank", i + 1, bankkeys[i]);
		for (var j = 0; j < bank.get(bankkeys[i]).getkeys().length; j++) {
				//post(bank.getkeys()[i], "\n");
			pb.append(bank.get(bankkeys[i] + "::" + bank.get(bankkeys[i]).getkeys()[j] + "::sample"));
		}
	}
	var dump = pb.dump();

	// fix envelope length for old bank formats
	for (var i = 0; i < dump.length / 6; i++){
		clientbuffersoundindex.set(dump[i * 6 + 2], dump[i * 6 + 1]);
		post(dump);
		if (envelopeLengthChange) {
			var sampleLength = dump[i*6+3];
			var envelope = bank.get(bankkeys[0] + "::" + (i+1) + "::envelope");
			post(envelope);
			var ratio = sampleLength / envelope[0];
			envelope[0] = sampleLength;
			envelope[envelope.length-4] = sampleLength;
			for (var j = 2; j < envelope.length / 3 - 2; j++) {
				envelope[j*3] *= ratio;
			}
			bank.replace(bankkeys[0] + "::" + (i+1) + "::envelope", envelope);
		}
	}

	for (var i = 0; i < 32; i++) {	
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("clear");
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("append", "<none>");
		for (var j = 0; j < bankkeys.length; j++) {
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("append", bankkeys[j]);			
		}
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message(0);			
	}
	//this.patcher.parentpatcher.getnamed("instrument-list-1").message("select", -1, -1);
	outlet(0, "instrument", "clear");	
	outlet(0, "notify_cellblock", 0, 0);
}

function symbol(instr)
{
	bank.replace(instr, "*");
	var bankkeys = [].concat(bank.getkeys());
	outlet(0, "bank", bankkeys.length, instr);
	outlet(0, "instrument", "clear");	
	outlet(0, "notify_cellblock", 0, bankkeys.length - 1);
	for (var i = 0; i < 32; i++) {	
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("append", instr);			
	}
}

function import(instr)
{
	//post(tempbank.get(instr).stringify(),"\n");
	bank.replace(instr, tempbank.get(instr));
	for (var i = 0; i < bank.get(instr).getkeys().length; i++) {
		pb.append(bank.get(instr + "::" + bank.get(instr).getkeys()[i] + "::sample"));
	}
	clientbuffersoundindex.clear();
	var dump = pb.dump();
	for (var i = 0; i < dump.length / 6; i++){
		clientbuffersoundindex.set(dump[i * 6 + 2], dump[i * 6 + 1]);
	}	
	for (var i = 0; i < 32; i++) {	
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("append", instr);			
	}
	outlet(0, "bank", bank.getkeys().length, instr);
}

function rename(oldname, newname)
{
	//needs to be redone to preserve order
	//clone bank to "bankclone"
	//copy all instrs up the renamed one
	//copy temp
	//continue with instrs after renamed one
	//replace bank with content of clonedbank
	var temp = bank.get(oldname);
	bank.replace(newname, temp);
	bank.remove(oldname);
	outlet(0, "bank", "clear");
	var bankkeys = [].concat(bank.getkeys());
	for (var i = 0; i < bankkeys.length; i++) outlet(0, "bank", i + 1, bankkeys[i]);
	outlet(0, "notify_cellblock", "bang");
}

function append(source, target)
{
	var instrument = tempbank.get(source);
	var offset = Number(bank.get(target).getkeys()[bank.get(target).getkeys().length - 1]) + 1;
	for (var i = 0; i < instrument.getkeys().length; i++) bank.replace(target + "::" + (i + offset), instrument.get(instrument.getkeys()[i]));
	for (var i = 0; i < instrument.getkeys().length; i++) pb.append(instrument.get(instrument.getkeys()[i] + "::sample"));
	clientbuffersoundindex.clear();
	var dump = pb.dump();
	for (var i = 0; i < dump.length / 6; i++) clientbuffersoundindex.set(dump[i * 6 + 2], dump[i * 6 + 1]);
}

function updateinstrument(u)
{
	post("updateinstrument", u, "\n");
	var currentInstrumentName = this.patcher.parentpatcher.getnamed("instrument").subpatcher().getnamed("current-instrument").getvalueof();
	var currentInstrument = new Dict;
	currentInstrument.pull_from_coll(jsarguments[1] + "-current-instrument");
	var currentInstrumentkeys = currentInstrument.getkeys();
	//sample : root_key : key_zone_floor : vel_zone_floor : envelope : loop : start : direction : timestretch :
	if (u == "all") {
		for (var i = 0; i < currentInstrumentkeys.length;  i++)
		{
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::sample", currentInstrument.get(currentInstrumentkeys[i])[0]);
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::root_key", currentInstrument.get(currentInstrumentkeys[i])[1]);
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::key_zone_floor", currentInstrument.get(currentInstrumentkeys[i])[2]);
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::vel_zone_floor", currentInstrument.get(currentInstrumentkeys[i])[3]);
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::envelope", currentInstrument.get(currentInstrumentkeys[i])[4].split(" "));
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::loop", [Number(currentInstrument.get(currentInstrumentkeys[i])[5].split(" ")[0]), Number(currentInstrument.get(currentInstrumentkeys[i])[5].split(" ")[2]), Number(currentInstrument.get(currentInstrumentkeys[i])[5].split(" ")[3])]);
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::start", Number(currentInstrument.get(currentInstrumentkeys[i])[5].split(" ")[1]));
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::direction", currentInstrument.get(currentInstrumentkeys[i])[6]);
		bank.replace(currentInstrumentName + "::" + currentInstrumentkeys[i] + "::timestretch", currentInstrument.get(currentInstrumentkeys[i])[7]);
		}
	}
	else {
		post(currentInstrumentName, u, currentInstrument.get(u)[0],"\n");
		bank.replace(currentInstrumentName + "::" + u + "::sample", currentInstrument.get(u)[0]);
		bank.replace(currentInstrumentName + "::" + u + "::root_key", currentInstrument.get(u)[1]);
		bank.replace(currentInstrumentName + "::" + u + "::key_zone_floor", currentInstrument.get(u)[2]);
		bank.replace(currentInstrumentName + "::" + u + "::vel_zone_floor", currentInstrument.get(u)[3]);
		bank.replace(currentInstrumentName + "::" + u + "::envelope", currentInstrument.get(u)[4].split(" "));
		bank.replace(currentInstrumentName + "::" + u + "::loop", [Number(currentInstrument.get(u)[5].split(" ")[0]), Number(currentInstrument.get(u)[5].split(" ")[2]), Number(currentInstrument.get(u)[5].split(" ")[3])]);
		bank.replace(currentInstrumentName + "::" + u + "::start", Number(currentInstrument.get(u)[5].split(" ")[1]));
		bank.replace(currentInstrumentName + "::" + u + "::direction", currentInstrument.get(u)[6]);
		bank.replace(currentInstrumentName + "::" + u + "::timestretch", currentInstrument.get(u)[7]);		
	}
}

function remove(instr)
{
	bank.remove(instr);
	var temp = new Dict;
	temp.pull_from_coll(jsarguments[1] + "-bank");
	var tempkeys = [].concat(temp.getkeys());
	for (var i = 0; i < tempkeys.length; i++) {
		if (temp.get(tempkeys[i]) == instr) {
			outlet(0, "notify_cellblock", 0, i);
			outlet(0, "bank", "delete", Number(tempkeys[i]));
		}
	}
}

function removesamples(instr, sample)
{
	if (sample == "all") for (var i = 0; i < bank.get(instr).getkeys().length; i++) bank.remove(instr + "::" + bank.get(instr).getkeys()[i]);
	else bank.remove(instr + "::" + sample);
}

function clearall(instr)
{
	outlet(0, "bank", "clear");
	outlet(0, "instrument", "clear");
	bank.clear();
    pb.clear();
	for (var i = 0; i < 32; i++) {	
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("clear");
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("append", "<none>");
	}
}


function notifydeleted()
{    
    pb.freepeer();    // delete the polybuffer
}

function openwindow()
{
    pb.open();
}

function closewindow()
{
    pb.wclose();
}
