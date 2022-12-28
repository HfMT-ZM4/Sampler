//var numFiles = 0;
outlets = 0;

var output = [];
var dynamicsToVel = {
    pp : 0,
    mf : 42,
    ff : 84
}
var pitchToMidi = {
    C: 0,
    'C#': 1,
    D: 2,
    'D#': 3,
    E: 4,
    F: 5,
    'F#': 6,
    G: 7,
    'G#': 8,
    A: 9,
    'A#': 10,
    B: 11
}

function reset() {
    output = [];
}

function append(fileName) {
    var sampleObj = {
        sample : fileName,
        root_key : 0,
        key_zone_floor : 0,
        vel_zone_floor : 0,
        envelope : 1,
        direction : 'fw',
        timestretch : 1,
        loop : [0, 0, 0],
        start: 0
    };
    var fileNameArray = fileName.split('.')[0].split('-').slice(-2);
    //post(JSON.stringify(fileNameArray)+'\n');
    var dynamics = fileNameArray[1];
    // check if last element in fileNameArray is a dynamic, if not, vel zone floor is defaulted to 0
    if (dynamics == 'pp' || dynamics == 'mf' || dynamics == 'ff') {
        sampleObj.vel_zone_floor = dynamicsToVel[dynamics];
        fileNameArray.pop();
    }
    // here the last element of fileNameArray is the pitch in format "C#5"
    var pitchClass = fileNameArray[fileNameArray.length-1].replace(/\d+/, '');
    var octave = parseInt(fileNameArray[fileNameArray.length-1].match(/\d+/));
    var midi = pitchToMidi[pitchClass] + 12 * (octave + 1);
    if (midi === null) midi = 0;
    sampleObj.root_key = midi;
    sampleObj.key_zone_floor = midi;

    // add to output array ready for sorting
    output.push(sampleObj);
}

// sort output array by key_zone_floor then vel_zone_floor, and then translate into object
function sortConvert(arr) {
  var sorted = arr.sort(function(a,b) {
    var x = a.vel_zone_floor;
    var y = b.vel_zone_floor;
    return ((x < y) ? -1 : ((x > y) ? 1 : 0));
  }).sort(function(a,b) {
    var x = a.key_zone_floor;
    var y = b.key_zone_floor;
    return ((x < y) ? -1 : ((x > y) ? 1 : 0));
  });
  var sortedObj = {};
  for (var i = 0; i < sorted.length; i++) {
    sortedObj[i+1] = sorted[i];
  }
  return sortedObj;
}

// write bank json file
function write(path) {
  var sortedObj = sortConvert(output);
	var f = new File(path,"write","TEXT"); 
	if (f.isopen) {
		post("Writing file:\n" + path + "\n");
		f.writestring(prettyStringify(sortedObj));
        //f.writestring(JSON.stringify(output, null, 2));
		f.close();
        post("Success!\n");
	} else {
		post("ERROR: could not create file:\n" + path + "\n");
	}
}

function prettyStringify(json) {
    return JSON.stringify(json, function(k,v) {
      if(v instanceof Array)
        return JSON.stringify(v);
      return v;
    }, 2).replace(/\\/g, '')
          .replace(/\"\[/g, '[')
          .replace(/\]\"/g,']')
          .replace(/\"\{/g, '{')
          .replace(/\}\"/g,'}');
  }