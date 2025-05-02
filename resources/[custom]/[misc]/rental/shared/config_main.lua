Config = {}

Config.QBMenuName = 'qb-menu'
Config.QBCoreName = 'qb-core'
Config.QBTargetName = 'qb-target'
Config.InventoryName = 'qb-inventory'
Config.QBInputName = 'qb-input'
Config.QBPhoneName = 'qb-phone'
Config.PhoneName = 'qb-phone' -- Can be qb-phone or gksphone (Maybe later can i'll update to use qs-smartphone)
Config.DebugPoly = false
Config.BillingAfterMailTime = 1 -- Time to receive bill after receive mail to take vehicle back (in minutes)
Config.PriceMultiplier = 2 -- The fees price multiplier (It multipliers vehicle price)

Config.RentalSpots = {
    ["Rental1"] = {
        ["SpotName"] = "Rental1",
        ["LabelSpotName"] = "Pillbox Car Rental",
        ["PedCoords"] = vector3(244.5, -573.42, 42.29),
        ["PedHeading"] = 257.15,
        ["MapBlipSprite"] = 67,
        ["MapBlipColour"] = 5,
        ["TargetIcon"] = "fas fa-car",
        ["PedModel"] = "csb_anita",
        ["PedModelHash"] = 0x0703F106,
        ["VehicleSpawnLocation"] = vector4(251.37, -573.94, 42.57, 159.56),
        ["AvailableVehicles"] = {
            [1] = { VehicleSpawnName = "bison", VehicleLableName = "bison", RentPrice = 40, MenuIcon = "fas fa-car" },
            [2] = { VehicleSpawnName = "rocoto", VehicleLableName = "rocoto", RentPrice = 45, MenuIcon = "fas fa-car" },
            [3] = { VehicleSpawnName = "pcj", VehicleLableName = "pcj", RentPrice = 30, MenuIcon = "fas fa-motorcycle" },
            [4] = { VehicleSpawnName = "issi5", VehicleLableName = "issi5", RentPrice = 150, MenuIcon = "fas fa-car" },
        },
    },
    ["Rental2"] = {
        ["SpotName"] = "Rental2",
        ["LabelSpotName"] = "Tinsel Apartment Rental",
        ["PedCoords"] = vector3(-520.72, -36.71, 43.52),
        ["PedHeading"] = 90.07,
        ["MapBlipSprite"] = 67,
        ["MapBlipColour"] = 5,
        ["TargetIcon"] = "fas fa-car",
        ["PedModel"] = "csb_anita",
        ["PedModelHash"] = 0x0703F106,
        ["VehicleSpawnLocation"] = vector4(-528.25, -35.62, 44.52, 351.91),
        ["AvailableVehicles"] = {
            [1] = { VehicleSpawnName = "bison", VehicleLableName = "bison", RentPrice = 40, MenuIcon = "fas fa-car" },
            [2] = { VehicleSpawnName = "rocoto", VehicleLableName = "rocoto", RentPrice = 45, MenuIcon = "fas fa-car" },
            [3] = { VehicleSpawnName = "pcj", VehicleLableName = "pcj", RentPrice = 30, MenuIcon = "fas fa-motorcycle" },
            [4] = { VehicleSpawnName = "issi5", VehicleLableName = "issi5", RentPrice = 150, MenuIcon = "fas fa-car" },
        },
    },
    ["Rental3"] = {
        ["SpotName"] = "Rental3",
        ["LabelSpotName"] = "Pink Cage Car rental",
        ["PedCoords"] = vector3(316.15, -222.72, 53.07),
        ["PedHeading"] = 254.37,
        ["MapBlipSprite"] = 67,
        ["MapBlipColour"] = 5,
        ["TargetIcon"] = "fas fa-car",
        ["PedModel"] = "csb_anita",
        ["PedModelHash"] = 0x0703F106,
        ["VehicleSpawnLocation"] = vector4(333.47, -216.7, 54.09, 66.53),
        ["AvailableVehicles"] = {
            [1] = { VehicleSpawnName = "bison", VehicleLableName = "bison", RentPrice = 40, MenuIcon = "fas fa-car" },
            [2] = { VehicleSpawnName = "rocoto", VehicleLableName = "rocoto", RentPrice = 45, MenuIcon = "fas fa-car" },
            [3] = { VehicleSpawnName = "pcj", VehicleLableName = "pcj", RentPrice = 30, MenuIcon = "fas fa-motorcycle" },
            [4] = { VehicleSpawnName = "issi5", VehicleLableName = "issi5", RentPrice = 150, MenuIcon = "fas fa-car" },
        },
    },
    ["Rental4"] = {
        ["SpotName"] = "Rental4",
        ["LabelSpotName"] = "Paleto Car Parking",
        ["PedCoords"] = vector3(83.66, 6420.6, 30.76),
        ["PedHeading"] = 34.79,
        ["MapBlipSprite"] = 67,
        ["MapBlipColour"] = 5,
        ["TargetIcon"] = "fas fa-car",
        ["PedModel"] = "csb_anita",
        ["PedModelHash"] = 0x0703F106,
        ["VehicleSpawnLocation"] = vector4(88.22, 6423.92, 31.37, 45.17),
        ["AvailableVehicles"] = {
            [1] = { VehicleSpawnName = "bison", VehicleLableName = "bison", RentPrice = 40, MenuIcon = "fas fa-car" },
            [2] = { VehicleSpawnName = "rocoto", VehicleLableName = "rocoto", RentPrice = 45, MenuIcon = "fas fa-car" },
            [3] = { VehicleSpawnName = "pcj", VehicleLableName = "pcj", RentPrice = 30, MenuIcon = "fas fa-motorcycle" },
            [4] = { VehicleSpawnName = "issi5", VehicleLableName = "issi5", RentPrice = 150, MenuIcon = "fas fa-car" },
        },
    },
    ["Rental5"] = {
        ["SpotName"] = "Rental5",
        ["LabelSpotName"] = "Sandy Shores Car Parking",
        ["PedCoords"] = vector3(1982.37, 3708.29, 31.1),
        ["PedHeading"] = 92.99,
        ["MapBlipSprite"] = 67,
        ["MapBlipColour"] = 5,
        ["TargetIcon"] = "fas fa-car",
        ["PedModel"] = "csb_anita",
        ["PedModelHash"] = 0x0703F106,
        ["VehicleSpawnLocation"] = vector4(1975.98, 3711.49, 32.08, 66.09),
        ["AvailableVehicles"] = {
            [1] = { VehicleSpawnName = "bison", VehicleLableName = "bison", RentPrice = 40, MenuIcon = "fas fa-car" },
            [2] = { VehicleSpawnName = "rocoto", VehicleLableName = "rocoto", RentPrice = 45, MenuIcon = "fas fa-car" },
            [3] = { VehicleSpawnName = "pcj", VehicleLableName = "pcj", RentPrice = 30, MenuIcon = "fas fa-motorcycle" },
            [4] = { VehicleSpawnName = "issi5", VehicleLableName = "issi5", RentPrice = 150, MenuIcon = "fas fa-car" },
        },
    },
}

Lang = {
    ["MenuHeader"] = "Renting Menu",
    ["CloseMenu"] = "Close menu",
    ["InputHeader"] = "How many time you want to rent the vehicle?",
    ["Submit"] = "Submit",
    ["InputText"] = "Time (In minutes)",
    ["AlreadyRenting"] = "You are already renting an vehicle...",
    ["NoMoney"] = "You dont have money for this...",
    ["CancelCurrentRenting"] = "Cancel current renting",
    ["ConfirmMenuHeader"] = "You are sure you want to rent this vehicle?",
    ["Yes"] = "Yes",
    ["No"] = "No",
    ["MailSender"] = "Rent a car department",
    ["MailSubject"] = "Vehicle renting",
    ["MailMessage"] = "Your renting time as been ended. <br> You have 1 minutes to take the vehicle back to our department or you will need to pay more for renting! <br> Bes regards Rent a car department",
    ["MailMessage2"] = "Like i said, you dont put vehicle at rent department at time and need to pay more... Let's go take that to here...",
    ["PerMinute"] = " per minute",
}