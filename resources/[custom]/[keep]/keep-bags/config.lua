Config = {}

-- Maximum inventory slots for players (inventory slots)
Config.max_inventory_slots = 50

Config.clothingScript = 'qb-clothing' -- illenium-appearance or qb-clothing oe esx (skinchanger)
-- When set to skinchanger, it only supports 'bag' as a clothing option and nothing else!

-- Default durations (in seconds)
Config.duration = {
     open = 10,    -- Time to open a bag
     lockpick = 5 -- Time to lockpick a bag
}

-- Prevent players from carrying multiple backpacks
-- They will stuck in one place until they put the extra bags away
Config.notAllowedToCarryMultipleBackpacks = true
-- Maximum allowed backpacks per player
Config.maxAllowedBackpacks = 1

-- Whitelist for lockpicking access
Config.lockpick_whitelist = {
     active = false,
     jobs = { 'police' }, -- Jobs with lockpicking access
     citizenid = {}
}

Config.npc = {
     position = vector4(-1340.67, -1267.1, 4.9, 98.6),
     model = 's_m_m_gardener_01',
     scenario = 'WORLD_HUMAN_DRINKING'
}

-- Config.retrieval = {
--      available_at = 2, -- hours
--      expire_at = 24,   -- hours
-- }

-- Backpack configurations
Config.Bags = {
     {
          item = 'backpack1',
          slots = 50,
          size = 100000,
          cloth = {
               male = {
                    ["bag"] = { item = 214, texture = 2 }
               },
               female = {
                    ["bag"] = { item = 72, texture = 1 }
               }
          },
          -- -- If active, the backpack only accepts items listed here and returns other items to the player
          -- whitelist = {
          --      'iron',
          --      'steel'
          -- },
          duration = {
               opening = 2,
         
          }
     },
     {
          item = 'backpack2',
          slots = 60,
          size = 200000,
          cloth = {
               male = {
                    ["bag"] = { item = 219, texture = 1 }
               },
               female = {
                    ["bag"] = { item = 264, texture = 0 }
               }
          },
          duration = {
               opening = 2,
         
          }
     },
     {
          item = 'backpack3',
          slots = 70,
          size = 300000,
          cloth = {
               male = {
                    ["bag"] = { item = 86, texture = 9 }
               },
               female = {
                    ["bag"] = { item = 180, texture = 9 }
               }
          },
          duration = {
               opening = 2,
          
          }
     },
     -- {
     --      item = 'duffle1',
     --      slots = 20,
     --      size = 200000,
     --      cloth = {
     --           male = {
     --                ["bag"] = { item = 82, texture = 4 }
     --           },
     --           female = {
     --                ["accessory"] = { item = 123, texture = 0 }
     --           }
     --      }
     -- },
     {
          item = 'paramedicbag',
          slots = 70,
          size = 300000,
          cloth = {
                         male = {
                              ["bag"] = { item = 194, texture = 0 }
                         },
                         female = {
                              ["accessory"] = { item = 123, texture = 0 }
                         }
                    },
                    duration = {
                         opening = 2,
                    
                    }
     },
     -- {
     --      item = 'briefcase',
     --      slots = 5,
     --      size = 10000,
     --      locked = true,
     --      prop = GetProp('suitcase2') -- Use props from shared/props.lua
     -- },
     -- {
     --      item = 'policepouches',
     --      slots = 6,
     --      size = 200000,
     --      cloth = {
     --           male = {
     --                ["accessory"] = { item = 146, texture = 0 }
     --           },
     --           female = {
     --                ["accessory"] = { item = 123, texture = 0 }
     --           }
     --      }
     -- },
     -- {
     --      item = 'policepouches1',
     --      slots = 12,
     --      size = 400000,
     --      cloth = {
     --           male = {
     --                ["accessory"] = { item = 147, texture = 0 }
     --           },
     --           female = {
     --                ["accessory"] = { item = 123, texture = 0 }
     --           }
     --      }
     -- }
}
