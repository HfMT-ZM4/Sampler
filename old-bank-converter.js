inlets = 1;
outlets = 1;

var outputDict = new Dict;

// changes envelope string into array in new format
function parseEnvelope(envelopeString) {
  //if (Array.isArray(envelopeString)) return envelopeString; // when already in correct format, parsing not needed

  var envelopeArray = envelopeString.split(' ');
  envelopeArray.shift(); // remove "envelope" as 1st element
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
  outputDict.clear();
  outputDict.import_json(filePath);

  // check if envelope and loop are in new format
  var instrNames = outputDict.getkeys();
  if (!Array.isArray(outputDict.get(instrNames[0]+"::1::envelope"))) {
    post('old format json detected\n');
    for (var i = 0; i < instrNames.length; i++) {
      var numKeys = outputDict.get(instrNames[i]).getkeys();
      for (var j = 0; j < numKeys.length; j++) {
        // change envelope into new format
        var location = instrNames[i]+"::"+numKeys[j];
        outputDict.replace(location+"::envelope", parseEnvelope(outputDict.get(location+"::envelope")));
        // change loop into new format
        var loopOrNoloop;
        if (outputDict.contains(location+"::loop")) loopOrNoloop = 1;
        else if (outputDict.contains(location+"::noloop")) loopOrNoloop = 0;
        var loopArray = outputDict.get(location+(loopOrNoloop?"::loop":"::noloop"));
        outputDict.setparse(location+"::loop", '['+loopOrNoloop+','+loopArray[0]+','+loopArray[1]+']');
        outputDict.replace(location+"::start", loopArray[2]);
        if (!loopOrNoloop) outputDict.remove(location+"::noloop");
      }
    }
    outlet(0, "dictionary", outputDict.name);
    outlet(0, "save_as");
  }
  else {
    outlet(0, "dictionary", outputDict.name);
  }
}

// When txt is imported:

var currentInstr = "";
var instrDict = new Dict();

function instr(ins) {
  currentInstr = ins/*.replace('.instr', '')*/; // remove .instr causes problems?
}

function readInstr() {
  instrDict.clear();
  instrDict.pull_from_coll('old_instr');

  for (var i = 1; i <= instrDict.getsize(i.toString()); i++) {
    outputDict.replace(currentInstr+"::"+i+"::sample", instrDict.get(i.toString())[0]);
    outputDict.replace(currentInstr+"::"+i+"::root_key", instrDict.get(i.toString())[1]);
    outputDict.replace(currentInstr+"::"+i+"::key_zone_floor", instrDict.get(i.toString())[2]);
    outputDict.replace(currentInstr+"::"+i+"::vel_zone_floor", instrDict.get(i.toString())[3]);
    outputDict.replace(currentInstr+"::"+i+"::envelope", parseEnvelope(instrDict.get(i.toString())[4]));
    outputDict.replace(currentInstr+"::"+i+"::loop", parseLoop(instrDict.get(i.toString())[5]));
    outputDict.replace(currentInstr+"::"+i+"::start", instrDict.get(i.toString())[6]);
    outputDict.replace(currentInstr+"::"+i+"::direction", instrDict.get(i.toString())[7]);
    outputDict.replace(currentInstr+"::"+i+"::timestretch", 0);
  }
}

function endBankDump() {
  outlet(0, "dictionary", outputDict.name);
  outlet(0, "save_as");
}


function refreshBank() {
  outputDict.clear();
}