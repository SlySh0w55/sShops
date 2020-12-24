ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('Shop:buyItem')
AddEventHandler('Shop:buyItem', function(price, item, label)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Merci de votre achat : ~g~"..label.."~w~.", "", 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Pas assez d'argent.", "", 1)
    end
end)

RegisterServerEvent('Shop:buyWeapons')
AddEventHandler('Shop:buyWeapons', function(price, weapons, label)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addWeapon(weapons, 500)
        TriggerClientEvent('esx:showNotification', source, "Merci de votre achat : ~g~"..label.."~w~.", "", 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Pas assez d'argent.", "", 1)
    end
end)