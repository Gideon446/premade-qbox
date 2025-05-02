
# Dream CityStatus

- This script manages and displays the cooldown time for different cities along with their current status. The key functionalities include:

- Cooldown Timer: Tracks and updates the remaining cooldown time for each city.

- Status Management: Displays different statuses such as:

- Meeting – City is currently engaged in an event.

- On Hold – Temporarily inactive but not in cooldown.

- Inactive – No active processes or events.

- Inprogress - Active situatuion ongoing. 

- Real-Time Updates: Ensures that cooldown timers and statuses are dynamically updated.

- User Interface Integration: Displays relevant information clearly for users to monitor city activities.

## Note
- Don't Change Script Name

## Client
- Export for getting coodlwon 
```lua
if exports['drm-citystatus']:GetCurrentStatus() == 'cooldown' then
    -- your events 
end
```

## Client
- Trigger for setting cooldowon auto in client
```lua
TriggerServerEvent('drm-citystatus:server:setcd', 'cooldown', 'Script_Name') -- replace Script_name for example house robbery
```

## Server
- Trigger for setting cooldowon auto in server
```lua
TriggerEvent('drm-citystatus:server:setcd', 'cooldown', 'Script_Name') -- replace Script_name for example house robbery
```

## Screenshots

![UiWhite](https://imgur.com/BPhFdiY.png)
![UiBlack](https://imgur.com/Mk55hez.png)


## 🔗 Links
[Tebex](https://damon.tebex.io/) | [Discord](https://discord.gg/mgERW8Jcdy)


## Authors

- [@Suy4sh4](https://github.com/Suy4sh4/)
- [@koolaash](https://www.github.com/koolaash)