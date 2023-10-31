local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "polar" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    polar = AddBlipForCoord(277.11, 140.39, 104.44)
    SetBlipSprite (polar, 267)
    SetBlipDisplay(polar, 4)
    SetBlipScale  (polar, 0.8)
    SetBlipAsShortRange(polar, true)
    SetBlipColour(polar, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("polar")
    EndTextCommandSetBlipName(polar)
end) 

RegisterNetEvent("AS-polarduty:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("AS-polar:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "polarcounter")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "polarcounter", {
        maxweight = 10000,
        slots = 25,
    })
end)

RegisterNetEvent("AS-polar:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "polarstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "polarstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("AS-polar:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "polarstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "polarstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Meal Creations
RegisterNetEvent("AS-polar:chocolate_icecream", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('AS-polar:server:get:chocolate_icecream', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making chocolate ice cream..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('AS-polar:server:chocolate_icecream')
                    QBCore.Functions.Notify("You made a chocolate ice cream", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

TriggerServerEvent('AS-polar:server:chocolate_icecream')

RegisterNetEvent("AS-polar:gelato", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('AS-polar:server:get:gelato', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making gelato..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('AS-polar:server:gelato')
                    QBCore.Functions.Notify("You made a gelato", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

TriggerServerEvent('AS-polar:server:gelato')
   
RegisterNetEvent("AS-polar:strawberry_icecream", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('AS-polar:server:get:strawberry_icecream', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making strawberry ice cream..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('AS-polar:server:strawberry_icecream')
                    QBCore.Functions.Notify("You made a strawberry ice cream", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

TriggerServerEvent('AS-polar:server:strawberry_icecream')

RegisterNetEvent("AS-polar:snowcone", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('AS-polar:server:get:snowcone', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making snowcone..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('AS-polar:server:snowcone')
                    QBCore.Functions.Notify("You made a snowcone", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

TriggerServerEvent('AS-polar:server:snowcone')

RegisterNetEvent("AS-polar:coffee_icecream", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('AS-polar:server:get:coffee_icecream', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making coffee icecream..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('AS-polar:server:coffee_icecream')
                    QBCore.Functions.Notify("You made a coffee icecream", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

TriggerServerEvent('AS-polar:server:coffee_icecream')

RegisterNetEvent("AS-polar:vanilla_icecream", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('AS-polar:server:get:vanilla_icecream', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making vanilla icecream..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('AS-polar:server:vanilla_icecream')
                    QBCore.Functions.Notify("You made a vanilla icecream", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

TriggerServerEvent('AS-polar:server:vanilla_icecream')
   
RegisterNetEvent("AS-polar:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "polar", Config.Items)
end)