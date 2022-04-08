var bank = new Dict;
var pb = new PolyBuffer(jsarguments[1] + "-clientbuffer");
var clientbuffersoundindex = new Dict;
clientbuffersoundindex.name = jsarguments[1] + "-clientbuffersoundindex";

function dictionary(d)
{
	bank.name = d;
	//post(bank.stringify(),"\n");
	pb.clear();
	clientbuffersoundindex.clear();
	for (var i = 0; i < bank.getkeys().length; i++) {
		for (var j = 0; j < bank.get(bank.getkeys()[i]).getkeys().length; j++) {
				//post(bank.getkeys()[i], "\n");
			pb.append(bank.get(bank.getkeys()[i] + "::" + bank.get(bank.getkeys()[i]).getkeys()[j] + "::sample"));
		}
	}
	var dump = pb.dump();
	for (var i = 0; i < dump.length / 6; i++){
		clientbuffersoundindex.set(dump[i * 6 + 2], dump[i * 6 + 1]);
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
