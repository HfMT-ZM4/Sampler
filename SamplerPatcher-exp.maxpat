{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 5,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 582.0, 454.0, 1006.0, 531.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 244.0, 70.0, 82.0, 22.0 ],
					"text" : "note 6000 0 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 138.5, 70.0, 95.0, 22.0 ],
					"text" : "note 6000 100 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 538.0, 453.0, 50.0, 22.0 ],
					"text" : "bang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 461.0, 453.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 431.0, 376.0, 97.0, 22.0 ],
					"text" : "killall coreaudiod"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 431.0, 416.0, 33.0, 22.0 ],
					"saved_object_attributes" : 					{
						"shell" : "(default)"
					}
,
					"text" : "shell"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 25.0, 37.0, 22.0 ],
					"text" : "panic"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "maxscore.sampler.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 454.0, 87.0, 318.0, 228.0 ],
					"varname" : "maxscore.sampler[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 205.0, 25.0, 82.0, 22.0 ],
					"text" : "note 6000 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 98.0, 25.0, 95.0, 22.0 ],
					"text" : "note 6000 100 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 98.0, 380.0, 54.0, 22.0 ],
					"text" : "mc.dac~"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "maxscore.sampler-exp.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "multichannelsignal" ],
					"patching_rect" : [ 98.0, 134.0, 318.0, 228.0 ],
					"varname" : "maxscore.sampler",
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 1 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-2::obj-11" : [ "mc.live.gain~[2]", "mc.live.gain~", 0 ],
			"obj-2::obj-2" : [ "live.text[34]", "live.text", 0 ],
			"obj-2::obj-40" : [ "live.text[35]", "live.text", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-107" : [ "live.text[13]", "live.text", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-17" : [ "live.tab[2]", "live.tab", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-3::obj-116" : [ "live.text[24]", "live.text", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-3::obj-24" : [ "live.numbox[19]", "live.numbox", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-3::obj-27" : [ "live.numbox[17]", "live.numbox", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-3::obj-5" : [ "live.text[8]", "live.text", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-3::obj-6" : [ "live.numbox[18]", "live.numbox", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-46::obj-110" : [ "live.numbox[20]", "live.numbox", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-46::obj-115" : [ "live.text[12]", "live.text[33]", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-53::obj-21" : [ "live.text[10]", "live.text[19]", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-53::obj-66" : [ "live.text[11]", "live.text[19]", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-53::obj-76" : [ "live.numbox[16]", "live.numbox[4]", 0 ],
			"obj-2::obj-43::obj-2::obj-17::obj-78" : [ "live.tab[1]", "live.tab[1]", 0 ],
			"obj-2::obj-43::obj-2::obj-29" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-2::obj-43::obj-2::obj-66" : [ "live.text[25]", "live.text", 0 ],
			"obj-2::obj-43::obj-2::obj-89::obj-17::obj-10::obj-156" : [ "live.text[22]", "live.text[20]", 0 ],
			"obj-2::obj-43::obj-2::obj-89::obj-17::obj-10::obj-157" : [ "live.text[4]", "live.text[20]", 0 ],
			"obj-2::obj-43::obj-2::obj-89::obj-17::obj-10::obj-93" : [ "live.tab[6]", "live.tab[6]", 0 ],
			"obj-2::obj-43::obj-2::obj-89::obj-17::obj-162::obj-156" : [ "live.text[3]", "live.text[20]", 0 ],
			"obj-2::obj-43::obj-2::obj-89::obj-17::obj-162::obj-157" : [ "live.text[21]", "live.text[20]", 0 ],
			"obj-2::obj-43::obj-2::obj-89::obj-17::obj-162::obj-80" : [ "live.tab[11]", "live.tab[6]", 0 ],
			"obj-2::obj-74" : [ "Edit Button[2]", "Edit Button", 0 ],
			"obj-3::obj-11" : [ "mc.live.gain~[1]", "mc.live.gain~", 0 ],
			"obj-3::obj-2" : [ "live.text[9]", "live.text", 0 ],
			"obj-3::obj-40" : [ "live.text[16]", "live.text", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-107" : [ "live.text[6]", "live.text", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-17" : [ "live.tab[12]", "live.tab", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-3::obj-116" : [ "live.text[32]", "live.text", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-3::obj-24" : [ "live.numbox[11]", "live.numbox", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-3::obj-27" : [ "live.numbox[10]", "live.numbox", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-3::obj-5" : [ "live.text[33]", "live.text", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-3::obj-6" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-46::obj-110" : [ "live.numbox[15]", "live.numbox", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-46::obj-115" : [ "live.text[17]", "live.text[33]", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-53::obj-21" : [ "live.text[23]", "live.text[19]", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-53::obj-66" : [ "live.text[5]", "live.text[19]", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-53::obj-76" : [ "live.numbox[8]", "live.numbox[4]", 0 ],
			"obj-3::obj-43::obj-2::obj-17::obj-78" : [ "live.tab[9]", "live.tab[1]", 0 ],
			"obj-3::obj-43::obj-2::obj-29" : [ "live.toggle[1]", "live.toggle", 0 ],
			"obj-3::obj-43::obj-2::obj-66" : [ "live.text[7]", "live.text", 0 ],
			"obj-3::obj-74" : [ "Edit Button[1]", "Edit Button", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-2::obj-11" : 				{
					"parameter_longname" : "mc.live.gain~[2]"
				}
,
				"obj-2::obj-2" : 				{
					"parameter_longname" : "live.text[34]"
				}
,
				"obj-2::obj-40" : 				{
					"parameter_longname" : "live.text[35]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-107" : 				{
					"parameter_longname" : "live.text[13]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-17" : 				{
					"parameter_longname" : "live.tab[2]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-3::obj-116" : 				{
					"parameter_longname" : "live.text[24]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-3::obj-24" : 				{
					"parameter_longname" : "live.numbox[19]",
					"parameter_range" : [ 0.0, 29910.200000000000728 ]
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-3::obj-27" : 				{
					"parameter_longname" : "live.numbox[17]",
					"parameter_range" : [ 0.0, 29910.200000000000728 ]
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-3::obj-5" : 				{
					"parameter_longname" : "live.text[8]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-3::obj-6" : 				{
					"parameter_longname" : "live.numbox[18]",
					"parameter_range" : [ 0.0, 29910.200000000000728 ]
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-46::obj-110" : 				{
					"parameter_longname" : "live.numbox[20]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-46::obj-115" : 				{
					"parameter_longname" : "live.text[12]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-53::obj-21" : 				{
					"parameter_longname" : "live.text[10]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-53::obj-66" : 				{
					"parameter_longname" : "live.text[11]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-53::obj-76" : 				{
					"parameter_longname" : "live.numbox[16]"
				}
,
				"obj-2::obj-43::obj-2::obj-17::obj-78" : 				{
					"parameter_longname" : "live.tab[1]"
				}
,
				"obj-2::obj-43::obj-2::obj-29" : 				{
					"parameter_longname" : "live.toggle[2]"
				}
,
				"obj-2::obj-43::obj-2::obj-66" : 				{
					"parameter_longname" : "live.text[25]"
				}
,
				"obj-2::obj-74" : 				{
					"parameter_longname" : "Edit Button[2]"
				}
,
				"obj-3::obj-43::obj-2::obj-17::obj-3::obj-24" : 				{
					"parameter_range" : [ 0.0, 360.0 ]
				}
,
				"obj-3::obj-43::obj-2::obj-17::obj-3::obj-27" : 				{
					"parameter_range" : [ 0.0, 360.0 ]
				}
,
				"obj-3::obj-43::obj-2::obj-17::obj-3::obj-6" : 				{
					"parameter_range" : [ 0.0, 360.0 ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "Bandoneon.instr",
				"bootpath" : "/Users/Shared/Max 8/Packages/Quintet.net/patchers/Projects/Tutorial/Instruments",
				"patcherrelativepath" : "../../Packages/Quintet.net/patchers/Projects/Tutorial/Instruments",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "LtoC.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "Marimba.instr",
				"bootpath" : "/Users/Shared/Max 8/Packages/Quintet.net/patchers/Projects/Tutorial/Instruments",
				"patcherrelativepath" : "../../Packages/Quintet.net/patchers/Projects/Tutorial/Instruments",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "Sampler.Preferences-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "Sampler.Preferences.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "Sampler.json",
				"bootpath" : "/Users/Shared/Max 8/Library/Summer 2021",
				"patcherrelativepath" : "../Summer 2021",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "Tutorial.bank.txt",
				"bootpath" : "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/Max 8/Packages/Quintet.net/patchers/Projects/Tutorial",
				"patcherrelativepath" : "../../../../hajdu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Max 8/Packages/Quintet.net/patchers/Projects/Tutorial",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "bank-wavefor.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "bank-waveform-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "first-v2.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.multisamples-player-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.multisamples-player.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.sample-player-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.sample-player_v2.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.sampler-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.sampler.bank.js",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.sampler.instrument.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.sampler.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "maxscore.sampler.menus.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multibuffer-stereo.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "my-LtoColl.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/extensions",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/extensions",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "panel_envelope2-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "panel_envelope2.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "panel_loop-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "panel_loop.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "panel_normalize.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "qn.envelopes.txt",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "samplerGUI2-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "samplerGUI2.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"patcherrelativepath" : "../../Packages/MaxScore/patchers/modules/MaxScore-Sampler",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "shell.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "swissarmyknife.js",
				"bootpath" : "/Users/Shared/Max 8/Packages/MaxScore/javascript",
				"patcherrelativepath" : "../../Packages/MaxScore/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
