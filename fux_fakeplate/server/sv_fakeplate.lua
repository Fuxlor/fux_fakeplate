ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('fakeplate', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('fakeplate', 1)
    TriggerClientEvent('FP:useItem:FakePlate', source)

end)

ESX.RegisterUsableItem('saveplate', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('saveplate', 1)
    TriggerClientEvent('FP:useItem:SavePlate', source)

end)

RegisterNetEvent('fakeplate:giveFake')
AddEventHandler('fakeplate:giveFake', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('fakeplate', amount)
end)

RegisterNetEvent('fakeplate:giveSaved')
AddEventHandler('fakeplate:giveSaved', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('saveplate', amount)
end)