Config = {
    Framework = 'QBCore',  -- QBCore or ESX or OLDQBCore or NewESX
    FakePlayers = false,    -- Show fake players?
    FakePlayerCount = 50,  -- Number of fake players to generate
    ServerEvents = false,   -- Show server events?
    Debug = true,          -- Show debug messages?
    UseTimeout = true,     -- Use timeout for callbacks?
    TimeoutDuration = 5000 -- Callback timeout duration (ms)
}

-- Job labels and translations
Config.JobLabels = {
    police = "Police",
    ambulance = "EMS",
    mechanic = "Mechanic",
    taxi = "Taxi",
    lawyer = "Lawyer",
    realtor = "Realtor",
    unemployed = "Unemployed",
    cardealer = "Car Dealer",
    garbage = "Garbage Collector",
    trucker = "Trucker",
    reporter = "Reporter",
    vineyard = "Vineyard Worker",
    judge = "Judge"
}

-- Server events example data
Config.Events = {
    {
        id = 1,
        title = 'BANK HEIST',
        description = 'The boldest bank heist in the city! Daring criminals can expect big rewards for completing this complex operation.',
        date = '23.04.2023',
        time = '02:54 PM',
        icon = 'fa-bank',
        category = 'heist',
        reward = 25000,
        xp = 500,
        featured = true,
        location = 'Los Santos',
        duration = '30 MIN',
        players = 7
    },
    {
        id = 2,
        title = 'POLICE CHASE',
        description = 'An exciting police chase is taking place in the city center. Multiple suspects are on the run after a major heist.',
        date = '23.04.2023',
        time = '03:30 PM',
        icon = 'fa-car',
        category = 'police',
        reward = 35000,
        xp = 700,
        featured = true,
        location = 'Downtown',
        duration = '20 MIN',
        players = 8
    },
    {
        id = 3,
        title = 'RACING EVENT',
        description = 'Join the illegal street racing tournament starting at the airport. Big cash prizes for winners!',
        date = '24.04.2023',
        time = '11:00 PM',
        icon = 'fa-flag-checkered',
        category = 'racing',
        reward = 40000,
        xp = 800,
        featured = false,
        location = 'Airport',
        duration = '25 MIN',
        players = 10
    },
    {
        id = 4,
        title = 'MONEY LAUNDERING',
        description = 'Help local business owners launder their illegal cash. High risk but big cash rewards for those who can keep quiet.',
        date = '25.04.2023',
        time = '08:00 AM',
        icon = 'fa-money-bill-wave',
        category = 'money',
        reward = 45000,
        xp = 900,
        featured = true,
        location = 'Vinewood',
        duration = '35 MIN',
        players = 5
    },
    {
        id = 5,
        title = 'VEHICLE THEFT',
        description = 'Luxury vehicle theft ring is looking for new members. Steal high-end cars and deliver them to the port for export.',
        date = '25.04.2023',
        time = '10:30 PM',
        icon = 'fa-car-side',
        category = 'vehicle',
        reward = 30000,
        xp = 600,
        featured = false,
        location = 'Rockford Hills',
        duration = '40 MIN',
        players = 6
    },
    {
        id = 6,
        title = 'RACING CHAMPIONSHIP',
        description = 'The annual underground racing championship has begun. Race in multiple rounds to win the title and a large prize pool.',
        date = '26.04.2023',
        time = '09:00 PM',
        icon = 'fa-trophy',
        category = 'racing',
        reward = 60000,
        xp = 1200,
        featured = true,
        location = 'Sandy Shores',
        duration = '60 MIN',
        players = 12
    }
}

function GetFramework()
    local Get = nil
    if Config.Framework == "ESX" then
        while Get == nil do
            TriggerEvent('esx:getSharedObject', function(Set) Get = Set end)
            Citizen.Wait(0)
        end
    elseif Config.Framework == "NewESX" then
        Get = exports['es_extended']:getSharedObject()
    elseif Config.Framework == "QBCore" then
        Get = exports["qb-core"]:GetCoreObject()
    elseif Config.Framework == "OLDQBCore" then
        while Get == nil do
            TriggerEvent('QBCore:GetObject', function(Set) Get = Set end)
            Citizen.Wait(200)
        end
    end
    return Get
end
