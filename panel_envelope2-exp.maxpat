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
		"rect" : [ 110.0, 87.0, 858.0, 795.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
					"comment" : "",
					"id" : "obj-15",
					"index" : 3,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 212.0, 744.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 75.5, 68.0, 61.0, 20.0 ],
					"text" : "from coll"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 490.0, 75.0, 79.0, 20.0 ],
					"text" : "from preset"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-125",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 348.25, 68.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 348.25, 129.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 758.0, 121.0, 89.0, 20.0 ],
					"text" : "len from info~"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-117",
					"index" : 3,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 719.0, 121.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-116",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 49.0, 744.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"activebgoncolor" : [ 0.675, 0.804, 0.945, 1.0 ],
					"fontname" : "Avenir Next Regular",
					"id" : "obj-115",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 57.0, 229.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.199996948242188, 22.0, 80.800003051757812, 19.0 ],
					"saved_attribute_attributes" : 					{
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"activebgoncolor" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_longname" : "live.text[17]",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text[33]",
							"parameter_type" : 2
						}

					}
,
					"text" : "Adjust",
					"textcolor" : [ 0.082353, 0.082353, 0.098039, 1.0 ],
					"texton" : "Adjust",
					"varname" : "env_adjust"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"activetricolor2" : [ 0.675, 0.804, 0.945, 1.0 ],
					"appearance" : 1,
					"fontname" : "Avenir Next Regular",
					"fontsize" : 12.0,
					"id" : "obj-110",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 428.5, 75.0, 44.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 58.5, 22.0, 62.0, 20.0 ],
					"saved_attribute_attributes" : 					{
						"activebgcolor" : 						{
							"expression" : ""
						}
,
						"activetricolor2" : 						{
							"expression" : ""
						}
,
						"textcolor" : 						{
							"expression" : ""
						}
,
						"valueof" : 						{
							"parameter_initial" : [ 7 ],
							"parameter_longname" : "live.numbox[15]",
							"parameter_mmax" : 9.0,
							"parameter_mmin" : 1.0,
							"parameter_shortname" : "live.numbox",
							"parameter_steps" : 1,
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.082353, 0.082353, 0.098039, 1.0 ],
					"varname" : "env_preset"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-109",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 39.5, 65.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "bang", "bang", "", "bang", "clear" ],
					"patching_rect" : [ 39.5, 164.0, 237.0, 22.0 ],
					"text" : "t b b b b l b clear"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-64",
					"index" : 2,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 143.0, 744.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 7,
					"outlettype" : [ "bang", "bang", "bang", "bang", "int", "bang", "clear" ],
					"patching_rect" : [ 428.5, 164.0, 237.0, 22.0 ],
					"text" : "t b b b b i b clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"linecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 666.0, 10.0, 5.0, 100.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 17.0, 212.800003051757812, 5.0 ],
					"saved_attribute_attributes" : 					{
						"linecolor" : 						{
							"expression" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Avenir Next Regular",
					"fontsize" : 10.0,
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.5, 64.0, 122.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 21.0, 43.0, 20.0 ],
					"text" : "Preset",
					"textcolor" : [ 0.082353003323078, 0.082353003323078, 0.098039001226425, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Avenir Next Regular",
					"fontsize" : 10.0,
					"id" : "obj-104",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 655.5, 40.0, 124.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.0, 1.0, 214.0, 20.0 ],
					"text" : "Envelope",
					"textcolor" : [ 0.082353003323078, 0.082353003323078, 0.098039001226425, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 0.0,
					"background" : 1,
					"bgcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 684.0, 10.0, 34.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.0, 1.0, 216.0, 44.5 ],
					"proportion" : 0.39
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "clear" ],
					"patching_rect" : [ 98.0, 488.0, 67.0, 22.0 ],
					"text" : "t b b l clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 306.5, 316.0, 42.0, 20.0 ],
					"text" : "adjust"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 98.0, 437.0, 38.0, 22.0 ],
					"text" : "zl reg"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 573.833333333333371, 362.0, 42.666666666666572, 22.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 145.5, 316.0, 105.0, 20.0 ],
					"text" : "3: L = from recall"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 398.5, 316.0, 75.0, 20.0 ],
					"text" : "3: I = Preset"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 474.5, 651.0, 54.0, 20.0 ],
					"text" : "1: LEN"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 688.0, 81.0, 22.0 ],
					"text" : "setdomain $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 250.0, 658.0, 55.5, 22.0 ],
					"text" : "f"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 9,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 2, 0.0, 1.0, 20.0, 1.0, 5000.0, 0.0, 50.0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2, 0.0, 1.0, 20.0, 1.0, 500.0, 0.0, 30.0 ]
							}
, 							{
								"key" : 3,
								"value" : [ 5, 0.0, 1.0, 10.0, 1.0, 500.0, 0.2, 1500.0, 0.05, 2500.0, 0.025, 3500.0, 0.0, 50.0 ]
							}
, 							{
								"key" : 4,
								"value" : [ 1, 0.0, 0.536, 20.618998999999999, 0.0, 340.205993999999976 ]
							}
, 							{
								"key" : 5,
								"value" : [ 3, 0.0, 1.0, 30.0, 1.0, 70.0, 0.0, 30, 0.0, 10.0 ]
							}
, 							{
								"key" : 6,
								"value" : [ 2, 0.0, 0.56, 263.917999000000009, 0.96, 7886.598144999999931, 0.0, 350.845214999999996 ]
							}
, 							{
								"key" : 7,
								"value" : [ 2, 0.0, 0.24, 1701.031005999999934, 1.0, 1546.391967999999906, 0.0, 50.0 ]
							}
, 							{
								"key" : 8,
								"value" : [ 2, 0.0, 1.0, 2000.0, 1.0, 2000.0, 0.0, 2000.0 ]
							}
, 							{
								"key" : 9,
								"value" : [ 2, 0.0, 1.0, 50.0, 0.01, 2500.0, 0.0, 50 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 597.499999999999886, 420.0, 104.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1,
						"precision" : 6
					}
,
					"text" : "coll qn.envelopes"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-108", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-108", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 1 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-124", 0 ],
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-28", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-28", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"disabled" : 1,
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-76", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-76", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-90", 0 ]
				}

			}
 ],
		"styles" : [ 			{
				"name" : "maxscore.default.buttons",
				"default" : 				{
					"accentcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"bgcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
		"editing_bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ]
	}

}
