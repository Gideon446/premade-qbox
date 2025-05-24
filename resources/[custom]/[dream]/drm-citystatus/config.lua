Config = {
    Core = 'qb-core',                      -- do not change 
    DefaultCooldown = 0.20,                -- can be changed according to your needs
    CurrentCooldown = 0,
    CurrentType = false,
    JobType = 'leo',
    Types = {
        ["cooldown"] = { label = "CoolDown" },
        ["honhold"] = { label = "On Hold" },
        ["inprogress"] = { label = "In Progress" },
        ["meeting"] = { label = "Police Meeting" },
        ["safe"] = { label = "City Safe" },
        ["inactive"] = { label = "Inactive" }
    },
    Logslimit = 15,                         -- how many logs you want to show recommended below 20
    CoolDownCommand = "citystatus",         -- command to open cooldown settings ingame
    CoolDownHideCommand = "cityhide",       -- command to hide city status if a player wants
    PlayerName = true,                      -- if a player start any illegal activity his/her name wont show in ui logs ( set to true if you want his/her names in logs )
                                            -- if you are using Script_Name in auto cooldown trigger set playername to false  
                                            -- do not use for now under development
}