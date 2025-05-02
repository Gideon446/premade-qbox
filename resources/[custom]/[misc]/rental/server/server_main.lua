local QBCore = exports[Config.QBCoreName]:GetCoreObject()

QBCore.Functions.CreateCallback('mt-rental:server:VerifyMoney', function(source, cb, RentPrice)
    -- local hasMoney = false
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player.Functions.GetMoney('bank') >= RentPrice then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('mt-rental:server:RentVehicle', function(RentPrice, VehicleLableName, VehiclePlate, TimeAmount, PlayerData)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    info.name = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
    info.plate = VehiclePlate
    info.time = TimeAmount
    info.price = RentPrice
    info.vehiclename = VehicleLableName


    if not Player.Functions.RemoveMoney('bank', RentPrice) then 
      
        TriggerClientEvent('qs-smartphone:client:notify', source, {
            title = 'Rental Company',
            text = 'Not Enough Money',
            icon = "./img/apps/mail.png",
            timeout = 12000
        })
        TriggerClientEvent('QBCore:Notify', source, 'You Are Poor', 'error')
        return
    else
        Player.Functions.AddItem('renting_contract', 1, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["renting_contract"], "add", 1)
    end
end)

RegisterNetEvent('mt-rental:server:rmoney', function(FeesPrice)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = FeesPrice
    Player.Functions.RemoveMoney('bank', amount)

    TriggerClientEvent('qs-smartphone:client:notify', source, {
        title = 'Rental Company',
        text = 'You were charged with $' .. FeesPrice .. ' by the rental company!!',
        icon = "./img/apps/mail.png",
        timeout = 12000
    })
    -- TriggerClientEvent('QBCore:Notify', src, 'You were charged with $' .. FeesPrice .. ' by the rental company!!', "primary")
end)

RegisterNetEvent('mt-rental:server:RemoveContract', function()
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.RemoveItem('renting_contract', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["renting_contract"], "remove", 1)
end)

-- RegisterNetEvent('mt-rental:server:BillPlayer', function(FeesPrice)
--     local Player = QBCore.Functions.GetPlayer(source)
--     if Config.PhoneName == "qb-phone" then
--         MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)',{
--             Player.PlayerData.citizenid,
--             FeesPrice,
--             'Renting', 
--             'Jóse das couves', 
--             'CVS04712'
--         })
--         TriggerClientEvent(Config.QBPhoneName..':RefreshPhone', Player.PlayerData.source)
--     elseif Config.PhoneName == "gksphone" then
--         MySQL.Async.execute('INSERT INTO gksphone_invoices (citizenid, amount, society, sender, sendercitizenid, label) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid, @label)', {
--             ['@citizenid'] = Player.PlayerData.citizenid,
--             ['@amount'] = FeesPrice,
--             ['@society'] = 'Renting',
--             ['@sender'] = 'Jóse das couves',
--             ['@sendercitizenid'] = 'CVS04712',
--             ['@label'] = 'Renting',
--         })
--         TriggerClientEvent('gksphone:notifi', src, {title = 'Billing', message = Lang.InvoiceSuccess})
--         TriggerClientEvent('gksphone:notifi', Player.PlayerData.source, {title = 'Billing', message = Lang.InvoiceRecieved})
--     end
-- end)