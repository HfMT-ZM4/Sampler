{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 3,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 286.0, 87.0, 816.0, 582.0 ],
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
					"patching_rect" : [ 172.0, 76.0, 318.0, 228.0 ],
					"varname" : "maxscore.sampler",
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
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
				"obj-3::obj-43::obj-2::obj-17::obj-3::obj-24" : 				{
					"parameter_range" : [ 0.0, 10216.670000000000073 ]
				}
,
				"obj-3::obj-43::obj-2::obj-17::obj-3::obj-27" : 				{
					"parameter_range" : [ 0.0, 10216.670000000000073 ]
				}
,
				"obj-3::obj-43::obj-2::obj-17::obj-3::obj-6" : 				{
					"parameter_range" : [ 0.0, 10216.670000000000073 ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "Sampler.Preferences-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "Sampler.json",
				"bootpath" : "/Users/Shared/Max 8/Library/Raindrops Keep Falling",
				"patcherrelativepath" : "../Raindrops Keep Falling",
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
				"name" : "maxscore.multisamples-player-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
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
				"name" : "maxscore.sampler.menus.maxpat",
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
				"name" : "panel_loop-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
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
				"name" : "samplerGUI2-exp.maxpat",
				"bootpath" : "/Users/Shared/Max 8/Library/Sample-Bank-Dev",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
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
