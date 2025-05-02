Config = Config or {}

Config.menu = 'keep-menu' -- keep-menu (recommended) / qb-menu
CRAFTING_LOG_WEBHOOK = "https://discord.com/api/webhooks/1347728920719396864/7eJ_EkF_YzADyqYSGduFtqVf6wcHEd5I8GnUUXPVWfys0fNeigFIvYdklw3FKNhlAfJT"

Config.model_loading = {
     timeout = 1500, --ms
     dealy = 50,     --ms
}

Config.MagicTouch = false

Config.categories = {
     ['misc'] = {
          key = 'misc',
          label = 'Misc',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },
     ['ammo'] = {
          key = 'ammo',
          label = 'Ammo Crafting',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },

     ['drugs2'] = {
          key = 'drugs',
          label = 'Drugs',
          icon = 'fa-solid fa-tags',
          jobs = {},
          sub_categories = {
              ['packing2'] = {label = 'Make Weed Baggy'},
              ['packing3'] = {label = 'Make Joints'}
          }
      },
     -- ['weapons'] = {
     --      key = 'weapons',
     --      label = 'Weapons',
     --      icon = 'fa-solid fa-gun',
     --      jobs = {},
     --      sub_categories = {
     --           ['tools'] = {
     --                label = 'Tools',
     --           },
     --           ['pistol'] = {
     --                label = 'Pistol',
     --           },
     --           ['smg'] = {
     --                label = 'SMG',
     --           },
     --      }
     -- },
     -- ['medical'] = {
     --      key = 'medical',
     --      label = 'Medical',
     --      icon = 'fa-solid fa-hand-holding-medical',
     --      jobs = {}
     -- },
     -- ['blueprints'] = {
     --      key = 'blueprints',
     --      label = 'Blueprints Craft',
     --      icon = 'fa-solid fa-file',
     --      jobs = {}
     -- },
}

Config.permanent_items = {
     ['weapon_wrench'] = true
}

local misc_recipe = {
     ['screw_driver'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Screwdriver',
               -- icon = 'fa-solid fa-gun',
               object = {
                    name = 'prop_tool_screwdvr01', -- <-- this model can fail to load
                    rotation = vector3(45.0, 0.0, -45.0)
               },
               -- image = 'screwdriver', -- use inventory's images
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 10,
               materials = {
                    ["shredded_fabric"] = 10,
                    ["scrap_tin"] = 5,
                    ["crushed_glass"] = 10,
                    ["scrap_iron"] = 5,
                    ["paper_pulp"] = 5
               },
               exp_per_craft = 1
          }
     },
     ['wire'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Wire',
               -- icon = 'fa-solid fa-gun',
               object = {
                    name = 'p_ld_cable_tie_01_s', -- <-- this model can fail to load
                    rotation = vector3(45.0, 0.0, -45.0)
               },
               -- image = 'weapon_flashlight', -- use inventory's images
               level = 50,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["scrap_tin"] = 15,
                     ["crushed_glass"] = 10,
                     ["broken_circuit"] = 5,
                    ["rusted_gears"] = 20,
                     ["compressed_cardboard"] = 10,
               },
               exp_per_craft = 3
          }
     },
     ['lockpick'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Lockpick',
               -- image = 'lockpick', -- use inventory's images
               object = {
                    name = 'prop_tool_screwdvr02',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 200,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["twisted_wires"] = 10,
                    ["broken_circuit"] = 15,
                    ["carbon_fiber_shards"] = 10,
                    ["hardened_clay"] = 7,
                    ["crushed_glass"] = 10,
                    ["screw_driver"] = 1

               },
               exp_per_craft = 4
          }
     },
     ['advancedlockpick'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Advanced Lockpick',
               -- image = 'advanced_lockpick', -- use inventory's images
               object = {
                    name = 'prop_tool_screwdvr03',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 260,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["shredded_fabric"] = 30,
                    ["broken_circuit"] = 20,
                    ["paper_pulp"] = 15,
                    ["crushed_glass"] = 25,
                    ["electronic_chips"] = 25,
                    ["rusted_gears"] = 15,
                    ["compressed_cardboard"] = 20,
                    ["screw_driver"] = 2

               },
               exp_per_craft = 5
          }
     },
     ['handcuffs'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Handcuffs',
               -- icon = 'fa-solid fa-gun',
               object = {
                    name = 'p_cs_cuffs_02_s', -- <-- this model can fail to load
                    rotation = vector3(45.0, 0.0, -45.0)
               },
               -- image = 'handcuffs', -- use inventory's images
               level = 500,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["scrap_tin"] = 25,
                    ["rusted_gears"] = 30,
                    ["scrap_iron"] = 35,
                    ["electronic_chips"] = 40,
                    ["hardened_clay"] = 20,
                    ["compressed_cardboard"] = 25,
                    ["crushed_glass"] = 30,
                    ["shredded_fabric"] = 25,
                    ["twisted_wires"] = 2
               },
               exp_per_craft = 10
          }
     },
     
     
    

     
     -- ['lightarmor'] = {
     --      categories = {
     --           main = 'misc',
     --      },
     --      item_settings = {
     --           label = 'Armor',
     --           image = 'lightarmor', -- use inventory's images
     --           object = {
     --                name = 'prop_bodyarmour_03',
     --                rotation = vector3(0.0, 0.0, 0.0)
     --           },
     --           level = 0,
     --           job = {
     --                allowed_list = {},
     --                allowed_grades = {}
     --           }
     --      },
     --      crafting = {
     --           success_rate = 100,
     --           amount = 1, -- crafted amount
     --           duration = 60,
     --           materials = {
     --                ["steel"] = 25,
     --                ["aluminum"] = 20,
     --                ["rubber"] = 15,
     --                ["copper"] = 10,
     --                ["plastic"] = 5
     --           },
     --           exp_per_craft = 5
     --      }
     -- },
    
}

local ammo_recipe = {
     ['ammo-9'] = {
          categories = {
               main = 'ammo',
          },
          item_settings = {
               label = 'Ammo 9MM',
               image = 'ammo-9', -- use inventory's images
               object = {
                    name = 'prop_box_ammo07b',
                    rotation = vector3(360.0, 0.0, 0.0)
               },
               level = 700,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
          },
          crafting = {
               success_rate = 100,
               amount = 5, -- crafted amount
               duration = 20,
               materials = {
                    ["scrap_iron"] = 10,
                    ["shredded_fabric"] = 10,
                    ["hardened_clay"] = 10,
                    ["scrap_tin"] = 10,
                    ["compressed_cardboard"] = 10,
               },
               exp_per_craft = 12
          }
     },
     ['ammo-45'] = {
          categories = {
               main = 'ammo',
          },
          item_settings = {
               label = 'Ammo .45',
               image = 'ammo-45', -- use inventory's images
               object = {
                    name = 'prop_box_ammo07b',
                    rotation = vector3(360.0, 0.0, 0.0)
               },
               level = 900,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
          },
          crafting = {
               success_rate = 100,
               amount = 5, -- crafted amount
               duration = 20,
               materials = {
                    ["scrap_iron"] = 14,
                    ["shredded_fabric"] = 14,
                    ["hardened_clay"] = 14,
                    ["scrap_tin"] = 14,
                    ["compressed_cardboard"] = 14,
               },
               exp_per_craft = 13
          }
     },
}

local drug_recipe2 = {
     -- ['weed_ak47'] = {
     --     categories = {sub = 'packing2'},
     --     item_settings = {
     --         label = 'Weed Ak47 Packets',
     --         -- icon = 'fa-solid fa-gun',
     --         object = {
     --             name = 'prop_drug_package_02', -- <-- this model can fail to load
     --             rotation = vector3(45.0, 0.0, -45.0)
     --         },
     --         image = 'weed_baggy', -- use inventory's images
     --         level = 0,
     --         job = {allowed_list = {}, allowed_grades = {}}
     --     },
     --     crafting = {
     --         success_rate = 100,
     --         amount = 15, -- crafted amount
     --         duration = 20,
     --         materials = {['weed_ak47_leaves'] = 15, ['empty_weed_bag'] = 15},
     --         exp_per_craft = 0
     --     }
     -- },
     ['weed_skunk'] = {
         categories = {sub = 'packing2'},
         item_settings = {
             label = 'Weed Skunk Packets',
             -- icon = 'fa-solid fa-gun',
             object = {
                 name = 'prop_drug_package_02', -- <-- this model can fail to load
                 rotation = vector3(45.0, 0.0, -45.0)
             },
             image = 'weed_baggy', -- use inventory's images
             level = 0,
             job = {allowed_list = {}, allowed_grades = {}}
         },
         crafting = {
             success_rate = 100,
             amount = 10, -- crafted amount
             duration = 20,
             materials = {['weed_skunk_leaves'] = 10, ['weed_empty_bag'] = 10},
             exp_per_craft = 0
         }
     },
     -- ['weed_og-kush'] = {
     --     categories = {sub = 'packing2'},
     --     item_settings = {
     --         label = 'Weed Og Kush Packets',
     --         -- icon = 'fa-solid fa-gun',
     --         object = {
     --             name = 'prop_drug_package_02', -- <-- this model can fail to load
     --             rotation = vector3(45.0, 0.0, -45.0)
     --         },
     --         image = 'weed_baggy', -- use inventory's images
     --         level = 0,
     --         job = {allowed_list = {}, allowed_grades = {}}
     --     },
     --     crafting = {
     --         success_rate = 100,
     --         amount = 15, -- crafted amount
     --         duration = 20,
     --         materials = {['weed_og-kush_leaves'] = 15, ['empty_weed_bag'] = 15},
     --         exp_per_craft = 0
     --     }
     -- },
     ['ak47_joint'] = {
         categories = {sub = 'packing3'},
         item_settings = {
             label = 'Ak47 Joint',
             -- icon = 'fa-solid fa-gun',
             object = {
                 name = 'prop_drug_package_02', -- <-- this model can fail to load
                 rotation = vector3(45.0, 0.0, -45.0)
             },
             image = 'ak47_joint', -- use inventory's images
             level = 0,
             job = {allowed_list = {}, allowed_grades = {}}
         },
         crafting = {
             success_rate = 100,
             amount = 10, -- crafted amount
             duration = 45,
             materials = {['weed_ak47_leaves'] = 20, ['rolling_paper'] = 10},
             exp_per_craft = 0
         }
     },
     ['joint'] = {
         categories = {sub = 'packing3'},
         item_settings = {
             label = 'Joint',
             -- icon = 'fa-solid fa-gun',
             object = {
                 name = 'prop_drug_package_02', -- <-- this model can fail to load
                 rotation = vector3(45.0, 0.0, -45.0)
             },
             image = 'jointg', -- use inventory's images
             level = 0,
             job = {allowed_list = {}, allowed_grades = {}}
         },
         crafting = {
             success_rate = 100,
             amount = 10, -- crafted amount
             duration = 30,
             materials = {['weed_skunk'] = 10, ['rolling_paper'] = 10},
             exp_per_craft = 0
         }
     },
 }
-- local medial = {
--      ['bandage'] = {
--           categories = {
--                main = 'medical',
--           },
--           item_settings = {
--                label = 'Bandage',
--                image = 'bandage', -- use inventory's images
--                level = 125,
--                job = {
--                     allowed_list = {},
--                     allowed_grades = {}
--                },
--                -- gang = {
--                --      allowed_list = {},
--                --      allowed_grades = {}
--                -- }
--           },
--           crafting = {
--                success_rate = 100,
--                amount = 1, -- crafted amount
--                duration = 3,
--                materials = {
--                     ["plastic"] = 1,
--                },
--                exp_per_craft = 5
--           }
--      },
-- }

-- local weapons_recipe = {
--      ['weapon_handcuffs'] = {
--           categories = {
--                sub = 'tools',
--           },
--           item_settings = {
--                label = 'Handcuffs',
--                image = 'weapon_handcuffs', -- use inventory's images
--                object = {
--                     name = 'p_cs_cuffs_02_s',
--                     rotation = vector3(250.0, 0.0, 0.0)
--                },
--                level = 50,
--                job = {
--                     allowed_list = {},
--                     allowed_grades = {}
--                }
--           },
--           crafting = {
--                success_rate = 100,
--                amount = 1, -- crafted amount
--                duration = 30,
--                materials = {
--                     ["steel"] = 30,
--                },
--                exp_per_craft = 5
--           }
--      },
--      ['pistol_ammo'] = {
--           categories = {
--                sub = 'pistol',
--           },
--           item_settings = {
--                label = 'Pistol ammo',
--                image = 'pistol_ammo', -- use inventory's images
--                object = {
--                     name = 'prop_ld_ammo_pack_01',
--                     rotation = vector3(250.0, 0.0, 0.0)
--                },
--                level = 150,
--                job = {
--                     allowed_list = {},
--                     allowed_grades = {}
--                }
--           },
--           crafting = {
--                success_rate = 100,
--                amount = 1, -- crafted amount
--                duration = 30,
--                materials = {
--                     ["steel"] = 30,
--                },
--                exp_per_craft = 5
--           }
--      },
--      ['weapon_pistol'] = {
--           categories = {
--                sub = 'pistol',
--           },
--           item_settings = {
--                label = 'Walther P99',
--                image = 'weapon_pistol', -- use inventory's images
--                object = {
--                     name = 'w_pi_pistol50',
--                     rotation = vector3(45.0, 0.0, 0.0)
--                },
--                level = 150,
--                job = {
--                     allowed_list = {},
--                     allowed_grades = {}
--                }
--           },
--           crafting = {
--                success_rate = 100,
--                amount = 1, -- crafted amount
--                duration = 60,
--                materials = {
--                     ["aluminum"] = 80,
--                     ["steel"] = 70,
--                     ["rubber"] = 30,
--                },
--                exp_per_craft = 30
--           }
--      },
--      ['weapon_combatpistol'] = {
--           categories = {
--                sub = 'pistol',
--           },
--           item_settings = {
--                label = 'Combat Pistol',
--                image = 'weapon_combatpistol', -- use inventory's images
--                object = {
--                     name = 'w_pi_combatpistol',
--                     rotation = vector3(45.0, 0.0, 0.0)
--                },
--                level = 200,
--                job = {
--                     allowed_list = {},
--                     allowed_grades = {}
--                }
--           },
--           crafting = {
--                success_rate = 100,
--                amount = 1, -- crafted amount
--                duration = 60,
--                materials = {
--                     ["aluminum"] = 100,
--                     ["steel"] = 90,
--                     ["rubber"] = 50,
--                },
--                exp_per_craft = 40
--           }
--      },
--      ['weapon_appistol'] = {
--           categories = {
--                sub = 'pistol',
--           },
--           item_settings = {
--                label = 'AP Pistol',
--                image = 'weapon_appistol', -- use inventory's images
--                object = {
--                     name = 'w_pi_appistol',
--                     rotation = vector3(45.0, 0.0, 0.0)
--                },
--                level = 500,
--                job = {
--                     allowed_list = {},
--                     allowed_grades = {}
--                }
--           },
--           crafting = {
--                success_rate = 100,
--                amount = 1, -- crafted amount
--                duration = 60,
--                materials = {
--                     ["aluminum"] = 130,
--                     ["steel"] = 120,
--                     ["rubber"] = 70,
--                },
--                exp_per_craft = 50
--           }
--      },
--      ['pistol_suppressor'] = {
--           categories = {
--                sub = 'smg',
--           },
--           item_settings = {
--                label = 'Pistol suppressor',
--                image = 'pistol_suppressor', -- use inventory's images
--                object = {
--                     name = 'w_at_ar_supp_02',
--                     rotation = vector3(45.0, 0.0, 0.0)
--                },
--                level = 5,
--                hide_until_reaches_level = true,
--                job = {
--                     allowed_list = {},
--                     allowed_grades = {}
--                }
--           },
--           crafting = {
--                success_rate = 100,
--                amount = 1, -- crafted amount
--                duration = 60,
--                materials = {
--                     ["metalscrap"] = 50,
--                     ["steel"] = 60,
--                     ["rubber"] = 30,
--                },
--                exp_per_craft = 5
--           }
--      },
-- }

Config.workbench_default_model = 'gr_prop_gr_bench_04a'

Config.workbenches = {
     -- -- items
     -- {
     --      table_model = "gr_prop_gr_bench_04b",
     --      coords = vector3(1346.55, 4391.04, 43.36),
     --      item_show_case_offset = vector3(0.0, 0.0, 1.3),
     --      rotation = vector3(0.0, 0.0, 350),
     --      -- just use either job or gang using both at same time won't work.
     --      job = {
     --           allowed_list = {},
     --           allowed_grades = {}
     --      },
     --      -- gang = {
     --      --      allowed_list = { 'ballas' },
     --      --      allowed_grades = { ['ballas'] = { 1, 2, 3, 4 } }
     --      -- },
     --      categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical },
     --      recipes = { misc_recipe, medial },
     --      radius = 3.0
     -- },
     {
          table_model = 'gr_prop_gr_bench_04b',
          coords = vector3(2939.04, 4623.81, 47.72),
          rotation = vector3(0.0, 0.0, 47.0),
          job = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical },
          recipes = { misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(56.55, 3689.7, 38.92),
          item_show_case_offset = vector3(0.0, 0.0, 1.2),
          rotation = vector3(0.0, 0.0, 150.0),
          job = {
               allowed_list = {},
               allowed_grades = { }
          },
          categories = { Config.categories.ammo },
          recipes = { ammo_recipe },
          radius = 3.0
     },
      {-- weed
      table_model = 'hei_prop_heist_weed_block_01',
      coords = vector3(1038.35, -3205.95, -38.28),
      item_show_case_offset = vector3(0.0, 0.0, 0.2),
      rotation = vector3(0.0, 0.0, 262.55),
      job = {allowed_list = {}, allowed_grades = {}},
      categories = {Config.categories.drugs2},
      recipes = {drug_recipe2},
      radius = 3.0
  },
  { -- weed
      table_model = 'hei_prop_heist_weed_block_01',
      coords = vector3(1033.68, -3206.24, -38.28),
      item_show_case_offset = vector3(0.0, 0.0, 0.2),
      rotation = vector3(0.0, 0.0, 75.0),
      job = {allowed_list = {}, allowed_grades = {}},
      categories = {Config.categories.drugs2},
      recipes = {drug_recipe2},
      radius = 3.0
  },
}


--gr_prop_gr_jailer_keys_01a

-- gr_prop_gr_missle_long
-- gr_prop_gr_missle_short
-- gr_int02_generator_01
-- gr_prop_gr_hammer_01

-- w_sr_heavysnipermk2_mag2
-- w_sb_smgmk2_mag2
-- w_sb_smgmk2_mag1
-- w_pi_pistolmk2_mag1
-- w_mg_combatmgmk2_mag1
-- w_ar_carbineriflemk2_mag1
-- w_ar_assaultriflemk2_mag1
-- w_ex_vehiclemissile_3
-- w_ex_vehiclemissile_1
-- w_ex_vehiclemissile_2
-- w_ex_vehiclemortar

-- w_sg_pumpshotgunmk2_mag1
-- w_sg_pumpshotgunh4_mag1
-- gr_prop_gr_adv_case

-- w_at_pi_flsh_2
-- w_at_afgrip_2
-- w_at_muzzle_1
-- w_at_muzzle_3
-- w_at_muzzle_2
-- w_at_muzzle_5
-- w_at_muzzle_6
-- w_at_muzzle_7
-- w_at_muzzle_8
-- w_at_muzzle_9

-- w_at_pi_comp_1
-- w_at_pi_rail_1
-- w_at_scope_macro_2_mk2
-- w_at_scope_small_mk2
-- w_at_scope_medium_2
-- w_at_scope_nv
-- w_at_sights_1
-- w_at_sights_smg
-- w_at_sr_supp3


-- gr_prop_gr_drill_01a

-- gr_prop_gr_driver_01a
-- gr_prop_gr_pliers_01
-- gr_prop_gr_pliers_02
-- gr_prop_gr_rasp_01
-- gr_prop_gr_rasp_02
-- gr_prop_gr_rasp_03
-- gr_prop_gr_sdriver_01
-- gr_prop_gr_sdriver_02
-- gr_prop_gr_sdriver_03

-- gr_prop_gr_vice_01a
