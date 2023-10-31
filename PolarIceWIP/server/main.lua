local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("AS-polar:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'polar' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                       if Config.SQL == 'oxmysql' then
                        exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        else
                          exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname
                           })
                       end
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

QBCore.Functions.CreateCallback('AS-polar:server:get:chocolate_icecream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chocolate2 = Player.Functions.GetItemByName("chocolate2")
    local milk = Player.Functions.GetItemByName("milk")
    local icecream_cone = Player.Functions.GetItemByName("icecream_cone")
    if chocolate2 ~= nil and milk ~= nil and icecream_cone ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('AS-polar:server:chocolate_icecream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('chocolate2', 1)
    Player.Functions.RemoveItem('milk', 1)
    Player.Functions.RemoveItem('icecream_cone', 1)
    Player.Functions.AddItem('chocolate_icecream', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["milk"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chocolate2"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["icecream_cone"], "remove")
    TriggerClientEvent('inventory:client:itembox', src, QBCore.Shared.Items["chocolate_icecream"], "add")
end)

QBCore.Functions.CreateCallback('AS-polar:server:get:gelato', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chocolate2 = Player.Functions.GetItemByName("chocolate2")
    local milk = Player.Functions.GetItemByName("milk")
    local vanilla_essence = Player.Functions.GetItemByName("vanilla-essence")
    if chocolate2 ~= nil and milk ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('AS-polar:server:gelato', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('chocolate2', 1)
    Player.Functions.RemoveItem('milk', 1)
    Player.Functions.RemoveItem('vanilla-essence', 1)
    Player.Functions.AddItem('gelato', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["milk"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chocolate2"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["vanilla-essence"], "remove")
    TriggerClientEvent('inventory:client:itembox', src, QBCore.Shared.Items["gelato"], "add")
end)

QBCore.Functions.CreateCallback('AS-polar:server:get:strawberry_icecream', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local strawberry = Player.Functions.GetItemByName("strawberry")
    local milk = Player.Functions.GetItemByName("milk")
    local icecream_cone = Player.Functions.GetItemByName("icecream_cone")
    if strawberry ~= nil and milk ~= nil and icecream_cone ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('AS-polar:server:strawberry_icecream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('strawberry', 1)
    Player.Functions.RemoveItem('milk', 1)
    Player.Functions.RemoveItem('icecream_cone', 1)
    Player.Functions.AddItem('strawberry_icecream', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["milk"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["strawberry"], "remove")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["icecream_cone"], "remove")
    TriggerClientEvent('inventory:client:itembox', src, QBCore.Shared.Items["strawberry_icecream"], "add")
end)

QBCore.Functions.CreateCallback('AS-polar:server:get:snowcone', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local syrup = Player.Functions.GetItemByName("syrup")
    if syrup ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('AS-polar:server:snowcone', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem('syrup', 1)
    Player.Functions.AddItem('snowcone', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["syrup"], "remove")
    TriggerClientEvent('inventory:client:itembox', src, QBCore.Shared.Items["snowcone"], "add")
end)