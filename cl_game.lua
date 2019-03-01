-- Local variables
local camPos = {
	{ pos = vector3(0.0, -75.0, 20.0), rot = vector3(-10.0, 0.0, 0.0) },
	{ pos = vector3(0.0, 45.0, 0.0), rot = vector3(0.0, 0.0, 180.0) },
}

local planeModel = "cargoplane"
local pilotModel = "s_m_y_pilot_01"
local availableWeapons = {"weapon_doubleaction","WEAPON_PISTOL50","WEAPON_FLAREGUN","WEAPON_MICROSMG","WEAPON_SMG","WEAPON_ASSAULTRIFLE","WEAPON_CARBINERIFLE","WEAPON_GUSENBERG","WEAPON_PUMPSHOTGUN"}
local allSeats = { { pos = vector3(2.75, 11.1, -3.65), rot = 90.0 }, { pos = vector3(-2.75, 11.1, -3.65), rot = -90.0 }, { pos = vector3(2.75, 10.6, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 10.6, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 10.1, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 10.1, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 9.6, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 9.6, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 3.1, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 3.1, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 2.6, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 2.6, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 2.1, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 2.1, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 1.6, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 1.6, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 1.1, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 1.1, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 0.6, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 0.6, -3.65), rot = -90.0 },	{ pos = vector3(2.75, 0.1, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, 0.1, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -0.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -0.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -0.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -0.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -1.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -1.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -1.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -1.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -2.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -2.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -2.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -2.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -3.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -3.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -3.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -3.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -4.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -4.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -4.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -4.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -5.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -5.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -5.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -5.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -6.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -6.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -6.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -6.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -7.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -7.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -7.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -7.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -8.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -8.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -8.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -8.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -9.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -9.4, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -9.9, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -9.9, -3.65), rot = -90.0 },	{ pos = vector3(2.75, -10.4, -3.65), rot = 90.0 },	{ pos = vector3(-2.75, -10.4, -3.65), rot = -90.0 },}
local currentCam = 1
local allPickups = {}
local blips = {}
local closestPickups = {}
local InPlane = false
local topRightY = 0.07
local killCount = 0
local specPlayer = 0
local viewCam
local driver


RegisterNetEvent("BR:UpdateData")
AddEventHandler("BR:UpdateData", function(varName, varValue)
	print("RESET GAME 2")
	if not varValue then
		for k,v in pairs(varName) do
			if BR[k] ~= nil then
				BR[k] = v
			end
		end
	else
		BR[varName] = varValue
	end
end)

local function DeleteAllVehicles()
	local handle, veh = FindFirstVehicle()
	local success
	repeat
		success, veh = FindNextVehicle(handle)
		if DoesEntityExist(veh) then DeleteVehicle(veh) end
	until not success
		EndFindVehicle(handle)
end

function BR:ResetGame()
	print("RESET GAME")
	killCount = 0
	currentCam = 1
	specPlayer = 0
	InPlane = false
	viewCam = nil

	if self.PlaneNet ~= 0 then
		local plane = NetworkDoesNetworkIdExist(self.PlaneNet) and NetworkGetEntityFromNetworkId(self.PlaneNet)
		if plane then
			DeleteVehicle(plane)
			self.PlaneNet = 0
		end
	end

	self.IsHost = false
	self.StartTime = 0
	self.Players = {}
	self.Zone = false
	self.ZoneRadius = false
	self.ZoneTime = false
	self.FormerZone = false
	self.FormerZoneRadius = false
	self.ZoneTimer = false
	self.Map = false
	self.Status = 0

	if NetworkIsInSpectatorMode() then
		NetworkSetInSpectatorMode(false)
	end

	if self.ShowBlips then
		for k,v in pairs(self.Blips) do
			if DoesBlipExist(v) then RemoveBlip(v) end
		end

		self.Blips = {}
	end

	for k,v in pairs(allPickups) do
		if DoesPickupExist(v.handle) then RemovePickup(v.handle) end
	end
	allPickups = {}
end

local function formatTwoDigitNumbers(string)
	string = tostring(string)
	return string.len(string) == 1 and "0" .. string or string
end

local function SecondsToClock(seconds)
	if seconds <= 0 then
		return "00:00";
	else
		mins = string.format("%02.f", math.floor(seconds / 60 - (math.floor(seconds / 3600) * 60)));
		secs = string.format("%02.f", math.floor(seconds - math.floor(seconds / 3600) * 3600 - mins * 60));
		return mins .. ":" .. secs
	end
end

-- STATUS ONE / PLANE
local function CreatePlaneCam(plane)
	viewCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
	AttachCamToEntity(viewCam, plane, camPos[currentCam].pos, true)
end

local function SeatInPlane(plane)
	forceAnim({"amb@code_human_in_bus_passenger_idles@female@sit@base", "base"}, 1)
	local seatPos = allSeats[PlayerId() + 1] or allSeats[1]
	if seatPos and plane then
		AttachEntityToEntity(GetPlayerPed(-1), plane, 0, seatPos.pos, 0.0, 0.0, seatPos.rot, 0, 0, 0, 0, 2, true)

		local planeBlip = AddBlipForEntity(plane)
		SetBlipSprite(planeBlip, 307)
		SetBlipScale(planeBlip, 1.5)
		SetBlipRotation(planeBlip, math.floor(GetEntityHeading(plane)))
		SetBlipDisplay(planeBlip, 8)
	end

	InPlane = true
end

local function CreateStartPlane(centerPos, planePos)
	RequestAndWaitModel(planeModel)

	local centerVector = vector3(centerPos.x, centerPos.y, 800.0)
	local destPos = centerVector + (centerVector - planePos)

	local heading = GetHeadingFromVector_2d(destPos.x - planePos.x, destPos.y - planePos.y)

	local planeEntity = CreateVehicle(GetHashKey(planeModel), planePos, heading, true, 0)
	SetModelAsNoLongerNeeded(GetHashKey(planeModel))
	SetEntityInvincible(planeEntity, true)
	SetVehicleEngineOn(planeEntity, 1, 1, 0)
	SetVehicleForwardSpeed(planeEntity, 100.0)
	SetHeliBladesSpeed(planeEntity, 100.0)
	SetEntityCollision(planeEntity, 0, 1)
	SetEntityHeading(planeEntity, heading)
	SetVehicleLandingGear(planeEntity, 1)
	Citizen.InvokeNative(0xCFC8BE9A5E1FE575, planeEntity, 0)

	RequestAndWaitModel(pilotModel)
	driver = CreatePed(29, GetHashKey(pilotModel), GetEntityCoords(planeEntity), 0.0, true, 0)
	SetPedIntoVehicle(driver, planeEntity, -1)
	SetEntityInvincible(driver, true)
	SetBlockingOfNonTemporaryEvents(driver, true)

	Citizen.Wait(0)

	TaskVehicleDriveToCoord(driver, planeEntity, destPos.x, destPos.y, destPos.z, 70.0, 0, GetEntityModel(planeEntity), 786603, 2.0, 2.0)

	SetNetworkIdCanMigrate(VehToNet(planeEntity), false)
	SetNetworkIdCanMigrate(VehToNet(driver), false)

	table.insert(BR.Blips, createCBlip(planePos, 1, 0, "Landing"))

	print("plane created " .. VehToNet(planeEntity) .. " - " .. tostring(NetworkDoesEntityExistWithNetworkId( VehToNet(planeEntity))))

	return VehToNet(planeEntity)
end

function BR:ApplyFireDamage(ped, damageAmount)
	--PlayPain(ped, 8, true)
	ApplyDamageToPed(ped, damageAmount, false)
	--ChatNotif("-1 PV")
end

function BR:CreateZone(zonePos, zoneRadius) -- set current safe zone
	if self.Blips["zone"] and DoesBlipExist(self.Blips["zone"]) then RemoveBlip(self.Blips["zone"]) end

	if self.ZoneRadius or self.Zone then
		self.FormerZoneRadius = self.ZoneRadius or zoneRadius
		self.FormerZone = self.Zone
	end

	if not self.Blips["safezone"] then
		local blip = AddBlipForRadius(zonePos, self.FormerZoneRadius or zoneRadius)
		SetBlipColour(blip, 69)
		SetBlipAlpha(blip, 75)
		SetBlipDisplay(blip, 8)
		self.Blips["safezone"] = blip
	end

	local blip2 = AddBlipForRadius(zonePos, zoneRadius)
	SetBlipSprite(blip2, 10)
	SetBlipDisplay(blip2, 8)

	self.ZoneTime = false
	self.ZoneTimer = false

	self.Zone = zonePos
	self.ZoneRadius = zoneRadius

	self.Blips["zone"] = blip2

	return zonePos
end

function BR:StartZoneTimer(zoneTime)
	self.ZoneTimer = zoneTime
	self.ZoneTime = GetGameTimer() + self.ZoneTimer * 1000
end

function BR:PlaneTick(plane)
	local ped = GetPlayerPed(-1)
	local camActive = IsCamActive(viewCam)
	local camRotation = camPos[currentCam] and camPos[currentCam].rot

	DisableControlAction(0, 51, true)
	ShowHelp("Press ~INPUT_CONTEXT~ to use another view.~n~Press ~INPUT_ENTER~ to jump." .. (camActive and "~n~~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ to change the camera." or ""))

	if camActive then
		if camRotation then
			SetCamRot(viewCam, camRotation.x, camRotation.y, GetEntityHeading(plane) - camRotation.z, 2)
		end

		local rightPressed, leftPressed = IsControlJustPressed(0, 175), IsControlJustPressed(0, 174)
		if rightPressed or leftPressed then
			currentCam = rightPressed and (currentCam == #camPos and currentCam or currentCam + 1) or leftPressed and (currentCam == 1 and currentCam or currentCam - 1) or currentCam
			AttachCamToEntity(viewCam, plane, camPos[currentCam].pos, true)
		end
	end

	if IsDisabledControlJustPressed(0, 51) then
		if camActive then
			DoScreenFadeOut(250)
			Citizen.Wait(250)
			SetFollowPedCamViewMode(4)
			SetCamActive(viewCam, false)
			RenderScriptCams(0, 0, 0, 1, 0)
			Citizen.Wait(250)
			DoScreenFadeIn(500)
		else
			SetCamActive(viewCam, true)
			RenderScriptCams(1, 1, 3000, 1, 0)
		end
	end

	local playerCount = tableCount(self.Players)
	local paddingX = DrawHUDRect(0.975, topRightY, "ALIVE", tostring(playerCount))

	local jumpTimer = math.max(0, math.floor((self.StartTime + self.JumpTime * 1000 - GetGameTimer()) / 1000))
	DrawHUDRect(0.975 - paddingX - 0.005, topRightY, "JUMP", SecondsToClock(jumpTimer))

	-- Jump system
	if InPlane and (IsControlJustPressed(0, 23) or jumpTimer <= 5) then
		InPlane = false

		DetachEntity(ped, 0, 1)
		DestroyCam(viewCam, false)
		RenderScriptCams(0, 0, 0, 1, 0)
		BR.Spawn:SpawnPlayer(ped)

		SetPedGadget(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), true)
		GiveDelayedWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), 1, 1)
	end
end

function BR:GameTick(ped)
	local playerCount = tableCount(self.Players)
	local paddingX = DrawHUDRect(0.975, topRightY, "ALIVE", tostring(playerCount))
	if not InPlane then
		paddingX = paddingX + DrawHUDRect(0.975 - paddingX - 0.005, topRightY, "KILL", tostring(killCount))
	end

	DrawHUDRect(0.24, 0.955, "END", SecondsToClock(((self.StartTime + self.GameTime * 1000) - GetGameTimer()) / 1000))

	local zoneRadius, remaining = self.FormerZoneRadius
	if self.ZoneTime and self.ZoneTime ~= 0 and self.Zone then
		remaining = math.max(0, self.ZoneTime - GetGameTimer()) / (self.ZoneTimer * 1000)
		zoneRadius = math.max(self.ZoneRadius, self.ZoneRadius + (self.FormerZoneRadius - self.ZoneRadius) * remaining)

		if remaining > 0 then
			DrawHUDRect(0.975, 0.955, "ZONE", SecondsToClock(math.floor(remaining * self.ZoneTimer)))
		end

		if self.Blips["safezone"] and DoesBlipExist(self.Blips["safezone"]) then
			SetBlipScale(self.Blips["safezone"], zoneRadius)

			if GetDistanceBetweenCoords(GetBlipCoords(self.Blips["safezone"]), GetBlipCoords(self.Blips["zone"])) > 0 then
				local diff = VecLerp(self.FormerZone, GetBlipCoords(self.Blips["zone"]), 1.0 )
				SetBlipCoords(self.Blips["safezone"], self.FormerZone + (diff - self.FormerZone) * ((self.FormerZoneRadius - zoneRadius) / self.ZoneRadius))
			end
		end
	end

	if not InPlane and zoneRadius then
		DrawMarker(28, GetBlipCoords(self.Blips["safezone"]), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, zoneRadius, zoneRadius, 1000.0, 100, 180, 255, 140, 0, 0, 0, 0, 0, 0, 0)
	end

	local plyPos = GetEntityCoords(ped)
	if not InPlane and (zoneRadius and GetDistanceBetweenCoords(plyPos, GetBlipCoords(self.Blips["safezone"])) > math.ceil(zoneRadius * 0.99333333333) or (self.FormerZone and GetDistanceBetweenCoords(plyPos, self.FormerZone) > math.ceil(self.FormerZoneRadius * 0.99333333333))) then
		SetWeatherTypeNow("THUNDER")
		SetWeatherTypeNowPersist("THUNDER")
		SetOverrideWeather("THUNDER")
	else
		SetWeatherTypeNow("EXTRASUNNY")
		SetWeatherTypeNowPersist("EXTRASUNNY")
		SetOverrideWeather("EXTRASUNNY")
	end

	if self.Status == 1 and IsEntityDead(GetPlayerPed(-1)) and self.Status > 0 then
		self:EntityDamage(GetPlayerPed(-1), false, false, true)
	end

	for k,v in pairs(closestPickups) do
		if DoesPickupExist(v.handle) and GetDistanceBetweenCoords(v.pos, plyPos) <= 0.5 then
			RemovePickup(v.handle)
			TriggerServerEvent("BR:SendToServer", 3, k)
			closestPickups[k] = nil
			break
		end
	end
end

local function FindNextPlayer(left)
	local allPlayers = BR.Players
	local start, endInt, padding, selectedPlayer = specPlayer, left and 0 or 64, left and -1 or 1
	for i = start, endInt, padding do
		if allPlayers[i] and i ~= specPlayer then
			selectedPlayer = i
			break
		end
	end

	return selectedPlayer
end

function BR:OnGameTick(ped)
	if self.Status == 0 then
		local paddingX, allPlayers = 0.0, NetworkGetNumConnectedPlayers()
		paddingX = DrawHUDRect(0.975, topRightY, "PLAYERS", tostring(allPlayers))
		if self.StartTime and self.StartTime ~= 0 then
			DrawHUDRect(0.975 - paddingX - 0.005, topRightY, "START", "00:" .. formatTwoDigitNumbers(math.max(0, math.floor((self.StartTime + self.WarmUP * 1000 - GetGameTimer()) / 1000))))
		end

		if allPlayers >= self.MinPlayers then
			ShowHelp("The game is going to start.")
		else
			ShowHelp(string.format("We need at least ~b~%s players~w~ to start.", self.MinPlayers))
		end
		HideHudAndRadarThisFrame()
	else
		local plane = InPlane and NetworkDoesNetworkIdExist(self.PlaneNet) and NetworkGetEntityFromNetworkId(self.PlaneNet)
		if self.Status == 1 and plane and DoesEntityExist(plane) then
			self:PlaneTick(plane)
		end

		self:GameTick(ped)

		if self.Status == 1 and IsPedInParachuteFreeFall(ped) and GetPedParachuteState(ped) <= 0 then
			local plyPos = GetEntityCoords(ped)
			local found, groundZ = GetGroundZFor_3dCoord(plyPos.x, plyPos.y, plyPos.z, false)

			if found and plyPos.z - groundZ <= 65 then
				ForcePedToOpenParachute(ped)
			end
		end

		if self.Status == 2 then
			-- spectate mode
			HideHudAndRadarThisFrame()
			ShowHelp("Press ~INPUT_CONTEXT~ to unspectate.~n~~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ to move to another player.")
			local leftPress, rightPress = IsControlJustPressed(0, 174), IsControlJustPressed(0, 175)
			if leftPress or rightPress then
				local player = FindNextPlayer(leftPress)
				if player and GetPlayerPed(player) then
					NetworkSetInSpectatorMode(1, GetPlayerPed(player))
					specPlayer = player
				end
			end

			if IsControlJustPressed(0, 51) then
				self:ToggleSpectatorMode(false)
			end
		end
	end

	if self.PlaneNet ~= 0 and self.StartTime ~= 0 then
		local plane = NetworkDoesNetworkIdExist(self.PlaneNet) and NetworkGetEntityFromNetworkId(self.PlaneNet)

		if DoesEntityExist(plane) then
			if self.IsHost and math.floor(self.StartTime + self.JumpTime * 1000) <= GetGameTimer() + 15000 then
				SetEntityAsMissionEntity(driver, 1, 1)
				SetEntityAsMissionEntity(plane, 1, 1)

				NetworkRequestControlOfEntity(plane)
				NetworkRequestControlOfEntity(driver)

				while not NetworkHasControlOfDoor(plane) do print("wait") Citizen.Wait(0) end

				DeleteEntity(driver)
				DeleteEntity(plane)
				print("plane deleted")
			end
			SetEntityRotation(plane, 0.0, 0.0, GetEntityHeading(plane), 2)
		end
	end

	HideHudComponentThisFrame(1)
	HideHudComponentThisFrame(2)
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(9)
	-- HideHudComponentThisFrame(14)
end

function BR:GameTimer(ped)
	if self.Status == 0 then
		SetWeatherTypeNow("EXTRASUNNY")
		SetWeatherTypeNowPersist("EXTRASUNNY")
		SetOverrideWeather("EXTRASUNNY")
	elseif self.Status == 1 then
		local plyPos = GetEntityCoords(ped)
		local zoneRadius = self.FormerZoneRadius
		if self.ZoneTime and self.ZoneTime ~= 0 and self.Zone then
			local remaining = math.max(0, self.ZoneTime - GetGameTimer()) / (self.ZoneTimer * 1000)
			zoneRadius = math.max(self.ZoneRadius, self.ZoneRadius + (self.FormerZoneRadius - self.ZoneRadius) * remaining)
		end

		if not InPlane and (zoneRadius and GetDistanceBetweenCoords(plyPos, GetBlipCoords(self.Blips["safezone"])) > math.ceil(zoneRadius * 0.99333333333) or (self.FormerZone and GetDistanceBetweenCoords(plyPos, self.FormerZone) > math.ceil(self.FormerZoneRadius * 0.99333333333))) then
			self:ApplyFireDamage(ped, 2)
		end

		for k,v in pairs(allPickups) do
			if GetDistanceBetweenCoords(v.pos, plyPos) <= 30 then
				closestPickups[k] = { handle = v.handle, pos = v.pos }
			elseif closestPickups[k] then
				closestPickups[k] = nil
			end
		end
	end
end

function BR:EntityDamage(victimEntity, attackEntity, _, fatalBool, weaponUsed, _, _, _, _, _, entityType)
	local ped = GetPlayerPed(-1)
	if ped and ped == victimEntity and fatalBool then
		local killer = IsPedAPlayer(attackEntity) and attackEntity or GetEntityType(attackEntity) == 2 and IsPedAPlayer(GetPedInVehicleSeat(attackEntity, -1)) and GetPedInVehicleSeat(attackEntity, -1)
		killer = killer and NetworkGetPlayerIndexFromPed(killer)
		if BR.Status == 1 and BR.Players[PlayerId()] then TriggerServerEvent("BR:SendToServer", 2, killer and GetPlayerServerId(killer) or false) end
		Citizen.CreateThread(function()
			Citizen.Wait(10000)
			if not IsEntityDead(GetPlayerPed(-1)) then return end
			self.Spawn:SpawnPed()
			print("respawn player.")
			if not InPlane and BR.Status == 1 and tableCount(BR.Players, 2) then
				self:ToggleSpectatorMode(true)
			end
		end)
	end
end

local cars = {"bf400", "sanchez", "sultan", "phantom3", "fmj", "blazer", "blazer4", "bodhi2", "brawler", "kamacho", "mesa", "rebel", "guardian", "rumpo2"}
local boats = {"seashark", "dinghy2", "dinghy3", "jetmax", "suntrap"}

function BR:SetupMap(map)
	RequestAndWaitModel("prop_time_capsule_01")

	local createBlip = self.ShowBlips
	for k,v in pairs(map.pickups) do
		if math.random(1, 4) ~= 4 then
			local pickup = CreatePickupRotate(GetHashKey("PICKUP_MONEY_PAPER_BAG"), v[1], v[2], v[3], vector3(-72.0, 0.0, 42.0), 512, -1, 2, 1)
			if createBlip then
				local blip = AddBlipForCoord(v[1], v[2], v[3])
				SetBlipSprite(blip, 478)
				SetBlipColour(blip, 0)
				SetBlipAsShortRange(blip, true)
				SetBlipDisplay(blip, 5)
				blips[#blips + 1] = blip
			end
			table.insert(allPickups, { handle = pickup, pos = vec3(v[1], v[2], v[3]) })
		end
	end

	if self.IsHost then
		for k,v in pairs(map.boats) do
			local modelHash = boats[math.random(1, #boats)]
			RequestAndWaitModel(modelHash)
			local veh = CreateVehicle(modelHash, v.x, v.y, v.z, v.a, true, true)
			SetEntityAsMissionEntity(veh, true, true)
			SetVehicleHasBeenOwnedByPlayer(veh, true)
		end

		for k,v in pairs(map.cars) do
			local modelHash = cars[math.random(1, #cars)]
			RequestAndWaitModel(modelHash)
			local veh = CreateVehicle(modelHash, v.x, v.y, v.z, v.a, true, true)
			SetEntityAsMissionEntity(veh, true, true)
			SetVehicleHasBeenOwnedByPlayer(veh, true)
		end

		for k,v in pairs(cars) do
			if HasModelLoaded(v) then SetModelAsNoLongerNeeded(GetHashKey(v)) end
		end

		for k,v in pairs(boats) do
			if HasModelLoaded(v) then SetModelAsNoLongerNeeded(GetHashKey(v)) end
		end
	end
end

RegisterNetEvent("BR:Event")
AddEventHandler("BR:Event", function(eventID, _tbl)
	if eventID == 1 then
		local map = LoadResourceFile(GetCurrentResourceName(), "maps/" .. _tbl.name .. ".json")
		map = map and json.decode(map)
		if not map then return end

		local netID = CreateStartPlane(map.center, _tbl.planePos)
		TriggerServerEvent("BR:SendToServer", 1, { PlaneNet = netID })
	elseif eventID == 2 then
		BR.Status = 0
		print("status ? ")
		BR.StartTime = GetGameTimer()
		DeleteAllVehicles()
	elseif eventID == 3 then
		BR:ResetGame()
		print("plane search")
		for k,v in pairs(_tbl.var) do
			if BR[k] ~= nil then
				BR[k] = v
			end
		end

		local map = LoadResourceFile(GetCurrentResourceName(), "maps/" .. BR.Map .. ".json")
		map = map and json.decode(map)
		if not map then return end

		print("planeNet " .. BR.PlaneNet)

		DoScreenFadeOut(1000)
		Citizen.Wait(1000)

		local ped, plane = GetPlayerPed(-1)
		while not plane do
			Citizen.Wait(100)
			SetEntityCoords(ped, _tbl.planePos)
			plane = NetworkDoesNetworkIdExist(BR.PlaneNet) and NetworkGetEntityFromNetworkId(BR.PlaneNet)
		end

		print("plane foud")


		BR.IsHost = tonumber(BR.Host) == GetPlayerServerId(PlayerId())
		BR:SetupMap(map)

		BR.Players = {}
		for i = 0, 64 do
			if NetworkIsPlayerActive(i) then
				BR.Players[i] = true
			end
		end

		_tbl.safeZone = vector3(_tbl.safeZone.x, _tbl.safeZone.y, _tbl.safeZone.z)

		BR:CreateZone(_tbl.safeZone, _tbl.radius)
		BR.StartTime = GetGameTimer()
		PlayAudio("PUBG", { volume = 0.1 })

		FreezeEntityPosition(GetPlayerPed(-1), false)

		print(BR.PlaneNet .. " - " .. tostring(plane) .. " - " .. tostring(NetworkDoesNetworkIdExist(BR.PlaneNet)))
		SeatInPlane(plane)
		CreatePlaneCam(plane)

		DoScreenFadeIn(1000)
	elseif eventID == 4 then
		local victim, killer, killerName = _tbl.killed, _tbl.killer
		victim = GetPlayerFromServerId(victim)

		BR.Players[victim] = nil

		if killer then
			killer = GetPlayerFromServerId(killer)
			if killer and GetPlayerName(killer) then
				killerName = GetPlayerName(killer)
				ShowAboveRadarMessageIcon(1, 0, "Battle Royale", "~r~" .. tableCount(BR.Players) .. " player(s) remaining", "~b~" .. GetPlayerName(victim) .. "~w~ got killed by ~b~" .. killerName .. "~w~.")
				if killer == PlayerId() then
					killCount = killCount + 1
				end
			else
				ShowAboveRadarMessageIcon(1, 0, "Battle Royale", "~r~" .. tableCount(BR.Players) .. " player(s) remaining", "~b~" .. GetPlayerName(victim) .. "~w~ got killed.")
			end

			if killer == PlayerId() and BR.Status == 1 then
				SetEntityHealth(GetPlayerPed(-1), GetPedMaxHealth(GetPlayerPed(-1)))
			end
		end
	elseif eventID == 5 then
		-- create next zone
		_tbl.Zone = vector3(_tbl.Zone.x, _tbl.Zone.y, _tbl.Zone.z)
		BR:CreateZone(_tbl.Zone, _tbl.ZoneRadius)
	elseif eventID == 6 then
		-- start zone timer
		BR:StartZoneTimer(_tbl)
	elseif eventID == 7 then
		-- end game
		Citizen.Wait(3000)
		local winnerPlayer = _tbl and GetPlayerFromServerId(_tbl)
		if winnerPlayer and GetPlayerName(winnerPlayer) then
			ShowAboveRadarMessageIcon(1, 0, "Battle Royale", "~g~TOP 1", "~b~" .. GetPlayerName(winnerPlayer) .. "~w~ won the game.")
		end

		if winnerPlayer == PlayerId() then
		--	ChatNotif("You won!!")
		end

		BR:ResetGame()
		BR.Spawn:SpawnPed()
	elseif eventID == 8 and allPickups[_tbl.index] then
		local pickup = allPickups[_tbl.index]
		if pickup then
			if BR.ShowBlips then
				for k,v in pairs(blips) do
					if DoesBlipExist(v) and GetDistanceBetweenCoords(GetBlipCoords(v), pickup.pos) <= 1 then
						RemoveBlip(v)
						table.remove(blips, k)
						break
					end
				end
			end

			if DoesPickupExist(pickup.handle) then
				RemovePickup(pickup.handle)
			end
		end

		if GetPlayerFromServerId(_tbl.receiver) == PlayerId() then
			BR:GiveWeapon(GetPlayerPed(-1), availableWeapons[math.random(1, #availableWeapons)])
		end

		table.remove(allPickups, _tbl.index)
	end
end)

RegisterCommand("debug", function()
	PrintTable(BR)
end)