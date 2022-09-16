inlets = 1;
outlets = 1;

var outputDict = new Dict;

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
  outputDict.clear();
  outputDict.import_json(filePath);

  post(outputDict.stringify());

  // check if envelope and loop are in new format
  var instrNames = outputDict.getkeys();
  var envelopeArray = outputDict.get(instrNames[0]+"::1::envelope");
  if (envelopeArray[envelopeArray.length-1] != 'linear') {
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
        outputDict.replace(location+"::loop", loopOrNoloop);
        outputDict.append(location+"::loop", loopArray[0]);
        outputDict.append(location+"::loop", loopArray[1]);
        outputDict.replace(location+"::start", loopArray[2]);
        if (!loopOrNoloop) outputDict.remove(location+"::noloop"); 
      }
    }
    outlet(0, "dictionary", outputDict.name);
    //outlet(0, "save_as"); // not needed because save button is available
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
    var sampleArray = instrDict.get(i.toString());
    if (sampleArray.length == 4) {
      var envelopePresets = new Dict('envelope-presets');
      var preset = sampleArray[3];
      sampleArray[3] = 0;
      sampleArray[4] = envelopePresets.get(preset);
      //post(sampleArray[4]+"\n");
    }
    else if (sampleArray.length == 7) {
      sampleArray.splice(3, 0, 0);
    }
    outputDict.replace(currentInstr+"::"+i+"::sample", sampleArray[0]);
    outputDict.replace(currentInstr+"::"+i+"::root_key", sampleArray[1]);
    outputDict.replace(currentInstr+"::"+i+"::key_zone_floor", sampleArray[2]);
    outputDict.replace(currentInstr+"::"+i+"::vel_zone_floor", sampleArray[3]||0);
    outputDict.replace(currentInstr+"::"+i+"::envelope", parseEnvelope(sampleArray[4]));
    outputDict.replace(currentInstr+"::"+i+"::loop", parseLoop(sampleArray[5]));
    outputDict.replace(currentInstr+"::"+i+"::start", sampleArray[6]||0);
    outputDict.replace(currentInstr+"::"+i+"::direction", sampleArray[7]||'fw');
    outputDict.replace(currentInstr+"::"+i+"::timestretch", 0);
  }
}

function endBankDump() {
  outlet(0, "dictionary", outputDict.name);
  //outlet(0, "save_as"); // not needed because save button is available
}


function refreshBank() {
  outputDict.clear();
}