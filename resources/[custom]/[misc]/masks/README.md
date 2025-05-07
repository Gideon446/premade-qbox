# Dream masks
A simple script that adds masks as items. Remove your mask with /mask to get the item in your inventory. You can then either use the mask item to put it on, or do /mask again to put on the first mask in your inventory.

## Dependencies
 - [qb-core](https://github.com/qbcore-framework/qb-core)

# Installation


## Step 1
* Drag `drm-masks` into your resources folder or any subfolder
* Make sure that the folder is named `drm-masks` and NOT `drm-masks-main`

## Step 2
* Add the following line to your **qb-core/shared/items.lua**
```lua
    ---- qb-core item -----
	['mask']  = {['name'] = 'mask', ['label'] = 'Mask',  ['weight'] = 1,  ['type'] = 'item',  ['image'] = 'mask.png',  ['unique'] = true,  ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = nil, 	['description'] = ''},
    ['maskcreator']  = {['name'] = 'maskcreator', ['label'] = 'Mask Creator',  ['weight'] = 1,  ['type'] = 'item',  ['image'] = 'maskcreator.png',  ['unique'] = false,  ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = true, 	['description'] = 'Use to get yourself a sweet mask!'},

    --------- ox_item ---------
    ["mask"] = {
		label = "Mask",
		weight = 1,
		stack = false,
		close = true,
		description = "Hmm you can wear it and do some biz!",
		allowArmed = true,
		metadata = {
			drawableId = 0,
			textureId = 0,
		},	
		client = {
			image = "mask.png",
		}
	},
    
    ['maskcreator'] = {
        name = 'maskcreator',
        label = 'Mask Creator',
        weight = 1,
        image = 'maskcreator.png',
        stack = true,
        description = 'Use to get yourself a sweet mask!'
    },
```

* Drag the "mask.png" image into your **inventory/html/images**

## Step 3

- If using qb-radialmenu 
* Find the following line in your **qb-radialmenu/config.lua**
```lua
id = 'Mask',
title = 'Mask',
icon = 'masks-theater',
type = 'client',
event = 'qb-radialmenu:ToggleProps',
shouldClose = true
```

* and replace it with :

```lua
id = 'Mask',
title = 'Mask',
icon = 'masks-theater',
type = 'client',
event = 'lucid-masks:client:ToggleMask',
shouldClose = true
```

- If using qbx_radialmenu  
* Find the following line in your **qbx_radialmenu/config.lua**
```lua
{
    id = 'mask',
    icon = 'masks-theater',
    label = 'Mask',
    event = 'qb-radialmenu:ToggleClothing',
    args = {id = 'Mask'},
},
```

* and replace it with :

```lua
{
    id = 'mask',
    icon = 'masks-theater',
    label = 'Mask',
    event = 'drm-masks:client:ToggleMask',
    -- args = {id = 'Mask'},
},
```

## Step 4
* Find the following line to your **qb-radialmenu/config.lua**
```lua
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
    or 
        mask = {
            Func = function() ToggleClothing({'Mask'}) end,
            Sprite = 'mask',
            Desc = 'Take your mask off/on',
            Button = 6,
            Name = 'Mask',
        },
```

* and comment it out :

```lua
    --["mask"] = {
    --    Func = function() ToggleClothing("Mask") end,
    --    Sprite = "mask",
    --    Desc = "Take your mask off/on",
    --    Button = 6,
    --    Name = "Mask"
    --}
    or
 -- mask = {
        --     Func = function() ToggleClothing({'Mask'}) end,
        --     Sprite = 'mask',
        --     Desc = 'Take your mask off/on',
        --     Button = 6,
        --     Name = 'Mask',
-- },
```

## Installation Complete
* restart your server
* do not spawn in the mask item using a menu as it will have no stored data and wont work, go to a clothing store or something
* enjoy!
