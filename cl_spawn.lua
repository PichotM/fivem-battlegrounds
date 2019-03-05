BR.Spawn = {}
local spawnPos = vector3(-2194.53, 3302.67, 31.0)

function BR.Spawn:OnTick(Player)
	SetPedDensityMultiplierThisFrame(0.0)
	SetVehicleDensityMultiplierThisFrame(0.0)
	SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
	SetParkedVehicleDensityMultiplierThisFrame(0.0)
	SetRandomVehicleDensityMultiplierThisFrame(0.0)

	SetVehiclePopulationBudget(0)
end

local randomFirst = {"WEAPON_BAT","WEAPON_NIGHTSTICK","WEAPON_MACHETE","WEAPON_DAGGER", "WEAPON_KNIFE"}
function BR.Spawn:SpawnPlayer(ped)
	if IsEntityDead(ped) then
		NetworkResurrectLocalPlayer(GetEntityCoords(ped), 0.0)
		ped = GetPlayerPed(-1)
	end

	SetEntityInvincible(ped, false)
	SetPedCanBeDraggedOut(ped, true)
	SetPedCanBeKnockedOffVehicle(ped, true)
	SetPedCanBeShotInVehicle(ped, true)
	SetPedCanBeTargetted(ped, true)
	SetPedSuffersCriticalHits(ped, false)
	SetPedCanRagdollFromPlayerImpact(ped, true)
	SetEntityVisible(ped, true, true)
	SetPedDropsWeaponsWhenDead(ped, true)
	SetPlayerCanLeaveParachuteSmokeTrail(ped)
	SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
	ClearPedBloodDamage(ped)
	FreezeEntityPosition(ped, false)
	SetPedDefaultComponentVariation(ped)
	SetPedRandomComponentVariation(ped, 1)
	SetPedCanRagdoll(ped, true)
	SetPedCanSwitchWeapon(ped, true)
	SetPedMute(ped, false)
	SetPedMaxHealth(ped, GetPedMaxHealth(ped))

	SetCanAttackFriendly(ped, true, true)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
	NetworkSetFriendlyFireOption(true)
	SetPedArmour(ped, 100)
	GiveWeaponToPed(ped, GetHashKey(randomFirst[math.random(1, #randomFirst)]), 0, 0, 1)

	SetEntityProofs(ped, false, false, true, false, false, false, false, false)
	NetworkSetInSpectatorMode(false)
end

function BR:ToggleSpectatorMode(force)
	print(tostring(force))
	if force then
		self.Status = 2
		for k,v in pairs(self.Players) do
			if k ~= PlayerId() then
				NetworkSetInSpectatorMode(true, GetPlayerPed(k))
				break
			end
		end
	elseif NetworkIsInSpectatorMode() or force == false then
		DoScreenFadeOut(250)
		Citizen.Wait(250)
		DoScreenFadeIn(500)
		NetworkSetInSpectatorMode(false)
		self.Status = 0
	end
end

function BR.Spawn:SpawnPed()
	if IsEntityDead(GetPlayerPed(-1)) then
		NetworkResurrectLocalPlayer(GetEntityCoords(GetPlayerPed(-1)), 0.0)
	end

	local model = BR.Model or GetRandomModel()
	if model then
		RequestAndWaitModel(model)
		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(GetHashKey(model))
	end

	local ped = GetPlayerPed(-1)
	DoScreenFadeOut(0)
	DetachEntity(ped, 0, 1)
	FreezeEntityPosition(ped, false) -- fix
	SetEntityCoords(ped, spawnPos)
	FreezeEntityPosition(ped, true)
	while not HasCollisionLoadedAroundEntity(ped) do
		Citizen.Wait(100)
	end
	DoScreenFadeIn(1000)

	ped = GetPlayerPed(-1)

	SetEntityInvincible(ped, true)
	SetPedCanBeDraggedOut(ped, false)
	SetPedMute(ped, false)
	SetPedCanBeKnockedOffVehicle(ped, false)
	SetPedCanBeShotInVehicle(ped, false)
	SetPedDefaultComponentVariation(ped)
	SetPedCanBeTargetted(ped, false)
	SetEntityCollision(ped, true, true)
	SetPedSuffersCriticalHits(ped, false)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
	SetPedCanRagdollFromPlayerImpact(ped, false)
	SetEntityVisible(ped, true, true)
	ClearPedBloodDamage(ped)
	SetPlayerCanLeaveParachuteSmokeTrail(ped)
	SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
	FreezeEntityPosition(ped, false)
	SetPedCanRagdoll(ped, false)
	SetPedCanSwitchWeapon(ped, true)
	SetPedMaxHealth(ped, GetPedMaxHealth(ped))

	SetCanAttackFriendly(ped, false, false)
	NetworkSetFriendlyFireOption(false)
	SetEntityCollision(ped, true, true)

	BR:ToggleSpectatorMode(false)

	SetEntityProofs(ped, false, false, true, false, false, false, false, false)

	return ped
end

RegisterNetEvent("postJoin")
AddEventHandler("postJoin", function(_tbl)
	if not _tbl then return end

	if _tbl.model then
		BR.Model = _tbl.model
		BR.Spawn:SpawnPed()
	end
end)