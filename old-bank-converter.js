inlets = 1;
outlets = 1;

var currentInstr = "";
var currentNumber = 0; // inside instr
var instrObj = {};
var bankObj = {};

function instr(ins) {
  currentInstr = ins;
}

function refreshBank() {
  bankObj = {};
}

function refreshInstr() {
  instrObj = {};
}

function num(k) {
  currentNumber = k; 
}

function endBankDump() {
  post(JSON.stringify(bankObj));
  outlet(0, JSON.stringify(bankObj));
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