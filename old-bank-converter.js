inlets = 1;
outlets = 1;



var currentInstr = "";
//var currentNumber = 0; // inside instr
//var instrObj = {};
//var bankObj = {};
var outputDict = new Dict();
var instrDict = new Dict();

function instr(ins) {
  currentInstr = ins.replace('.instr', '');
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
  //var json = JSON.stringify(bankObj);
  //outputDict.parse(json);
  outlet(0, "dictionary", outputDict.name);
  post(outputDict.stringify());
}


function refreshBank() {
  //bankObj = {};
  outputDict.clear();
}

// LEGACY

/*

function refreshInstr() {
  instrObj = {};
}

function num(k) {
  currentNumber = k; 
}

function endInstrDump() {
  bankObj[currentInstr] = instrObj;
}

function append(sample, root_key, key_zone_floor, vel_zone_floor, envelope, loop, start_point, direction) {
  instrObj[currentNumber] = {
    sample: sample,
    root_key: root_key,
    key_zone_floor: key_zone_floor,
    vel_zone_floor: vel_zone_floor,
    envelope: parseEnvelope(envelope),
    loop: parseLoop(loop),
    start: start_point,
    direction: direction,
    timestretch: 0
  };
}


*/

// changes envelope string into array in new format
function parseEnvelope(envelopeString) {
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