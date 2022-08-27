ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function GetVehicle()
	local playerPos = GetEntityCoords(GetPlayerPed(-1), false)
	currentVehicle = GetClosestVehicle(playerPos.x, playerPos.y, playerPos.z, 1.5,  0,  71)
	return currentVehicle ~= nil and DoesEntityExist(currentVehicle)
end


RegisterNetEvent('FP:useItem:FakePlate')
AddEventHandler('FP:useItem:FakePlate', function(source)
    local platenum = math.random(1000, 9999)
    local prefix = 'FAKE'
    GetVehicle()
    savedPlate = GetVehicleNumberPlateText(currentVehicle)
    SetVehicleNumberPlateText(currentVehicle, prefix .. platenum)
    local test = GetVehicleNumberPlateText(currentVehicle)
    if test == savedPlate then
        TriggerServerEvent('fakeplate:giveFake', 1)
        ESX.ShowAdvancedNotification("ILLEGAL", "Fausse Plaque", "Ca n'a pas fonctionné, recommence.", "CHAR_LESTER_DEATHWISH", 9)
    else
        TriggerServerEvent('fakeplate:giveSaved', 1)
        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
        Wait(3000)
        ClearPedTasks(PlayerPedId())
        ESX.ShowAdvancedNotification("ILLEGAL", "Fausse Plaque", "Plaque modifié.", "CHAR_LESTER_DEATHWISH", 9)
    end

end)

RegisterNetEvent('FP:useItem:SavePlate')
AddEventHandler('FP:useItem:SavePlate', function(source)
    GetVehicle()
    SetVehicleNumberPlateText(currentVehicle, savedPlate)
    local test = GetVehicleNumberPlateText(currentVehicle)
    if test ~= savedPlate then
        TriggerServerEvent('fakeplate:giveSaved', 1)
        ESX.ShowAdvancedNotification("ILLEGAL", "Fausse Plaque", "Ca n'a pas fonctionné, recommence.", "CHAR_LESTER_DEATHWISH", 9)
    else
        TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
        Wait(3000)
        ClearPedTasks(PlayerPedId())
        ESX.ShowAdvancedNotification("ILLEGAL", "Fausse Plaque", "Plaque modifié.", "CHAR_LESTER_DEATHWISH", 9)
    end

end)
