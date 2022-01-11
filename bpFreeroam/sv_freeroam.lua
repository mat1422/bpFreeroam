ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

RegisterNetEvent("bpcore:starterpack")
AddEventHandler('bpcore:starterpack', function(name, qty)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(name, qty)
    xPlayer.showNotification("<C>Starter Pack</C>\n~p~Vous venez de recevoir votre starterpack")
end)

RegisterNetEvent('bpcore:starterpack2')
AddEventHandler('bpcore:starterpack2', function(account, qty)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney(account, qty)
end)

RegisterNetEvent('bpcore:addjob')
AddEventHandler('bpcore:addjob', function(job, grade)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob(job, grade)
end)