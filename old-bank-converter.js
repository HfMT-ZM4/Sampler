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
  post('endBankDump\n');
  outlet(0, JSON.stringify(bankObj));
}

function endInstrDump() {
  post('endInstrDump\n');
  bankObj[currentInstr] = instrObj;
}

function append(sample, root_key, key_zone_floor, vel_zone_floor, envelope, noloop, timestretch, direction) {
  instrObj[currentNumber] = {
    sample: sample,
    root_key: root_key,
    key_zone_floor: key_zone_floor,
    vel_zone_floor: vel_zone_floor,
    envelope: parseEnvelope(envelope),
    noloop: parseNoloop(noloop),
    direction: direction,
    timestretch: timestretch
  };
}

function parseEnvelope(envelopeString) {
  var envelopeArray = envelopeString.split(' ');
  envelopeArray.shift(); // remove "envelope" as 1st element
  for (var i = 0; i < envelopeArray.length; i++) {
    envelopeArray[i] = parseFloat(envelopeArray[i]);
  }
  return envelopeArray;
}

function parseNoloop(noloopString) {
  var noloopArray = noloopString.split(' ');
  noloopArray.shift(); // remove "noloop" as 1st element
  for (var i = 0; i < noloopArray.length; i++) {
    noloopArray[i] = parseFloat(noloopArray[i]);
  }
  noloopArray.push(0);
  return noloopArray;
}