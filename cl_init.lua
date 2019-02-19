local waitingJoin = true
function BR:PlayerInitialSpawn()
	exports.spawnmanager:setAutoSpawn(false)

	NetworkSetTalkerProximity(0.0)
	NetworkSetVoiceActive(false)

	self.Spawn:SpawnPed()
end

function BR:OnTick()
	local ped = GetPlayerPed(-1)

	self.Spawn:OnTick(ped)
	self:OnGameTick(ped)
end

function BR:Timer()
	local ped = GetPlayerPed(-1)

	self.Cheat:Timer(ped)
	self:GameTimer(ped)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		BR:OnTick()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		BR:Timer()
	end
end)

AddEventHandler("onClientMapStart", function()
	if not waitingJoin then return end
	ShutdownLoadingScreen()
	BR:PlayerInitialSpawn()
	TriggerServerEvent("playerJoined")

	waitingJoin = nil
end)

AddEventHandler("onResourceStart", function(r)
	if r ~= GetCurrentResourceName() or not waitingJoin then return end
	TriggerServerEvent("playerJoined")
	BR:PlayerInitialSpawn()

	waitingJoin = nil
end)