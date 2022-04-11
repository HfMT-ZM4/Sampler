var bank = new Dict;
bank.name = jsarguments[1] + "-save_load";
bank.clear();
var tempbank = new Dict;
tempbank.name = jsarguments[1] + "-temp";
var pb = new PolyBuffer(jsarguments[1] + "-clientbuffer");
var clientbuffersoundindex = new Dict;
clientbuffersoundindex.name = jsarguments[1] + "-clientbuffersoundindex";

function dictionary(d)
{
	outlet(0, "clear");
	pb.clear();
	clientbuffersoundindex.clear();
	var bankkeys = bank.getkeys();
	for (var i = 0; i < bankkeys.length; i++) {
		outlet(0, i + 1, bankkeys[i]);
		for (var j = 0; j < bank.get(bankkeys[i]).getkeys().length; j++) {
				//post(bank.getkeys()[i], "\n");
			pb.append(bank.get(bankkeys[i] + "::" + bank.get(bankkeys[i]).getkeys()[j] + "::sample"));
		}
	}
	var dump = pb.dump();
	for (var i = 0; i < dump.length / 6; i++){
		clientbuffersoundindex.set(dump[i * 6 + 2], dump[i * 6 + 1]);
	}
	for (var i = 0; i < 32; i++) {	
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("clear");
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("append", "<none>");
		for (var j = 0; j < bankkeys.length; j++) {
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message("append", bankkeys[j]);			
		}
		this.patcher.parentpatcher.parentpatcher.parentpatcher.getnamed("maxscore.sampler.menus").subpatcher().getnamed(i+"-instrument").subpatcher().getnamed("instrument").message(0);			
	}
}

function symbol(instr)
{
	bank.replace(instr, "*");
	outlet(0, bank.getkeys().length, instr);
	outlet(0, "notify", bank.getkeys().length - 1);
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
}

function append(source, target)
{
	var instrument = tempbank.get(source);
	post(instrument.getkeys(),"\n");
	var offset = Number(bank.get(target).getkeys()[bank.get(target).getkeys().length - 1]) + 1;
	for (var i = 0; i < instrument.getkeys().length; i++) bank.replace(target + "::" + (i + offset), instrument.get(instrument.getkeys()[i]));
	for (var i = 0; i < instrument.getkeys().length; i++) pb.append(instrument.get(instrument.getkeys()[i] + "::sample"));
	clientbuffersoundindex.clear();
	var dump = pb.dump();
	for (var i = 0; i < dump.length / 6; i++) clientbuffersoundindex.set(dump[i * 6 + 2], dump[i * 6 + 1]);
}

function remove(instr)
{
	bank.remove(instr);
}

function clearall(instr)
{
	bank.clear();
    pb.freepeer();
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
