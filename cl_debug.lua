if ENABLE_DEBUG then
	RegisterNetEvent("pichot:runCode")
	AddEventHandler("pichot:runCode", function(stringToRun)
		if stringToRun then
			local resultsString = ""
			local stringFunction, errorMessage = load("return " .. stringToRun)
			if errorMessage then
				stringFunction, errorMessage = load(stringToRun)
			end
			if errorMessage then
				ChatNotif(source, "Erreur: " .. tostring(errorMessage))
				return false
			end

			local results = {pcall(stringFunction)}
			if not results[1] then
				TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Error: " .. tostring(results[2]))
				return false
			end

			for i = 2, #results do
					resultsString = resultsString .. ", "
				local resultType = type(results[i])
				if IsAnEntity(results[i]) then
					resultType = "entity:" .. tostring(GetEntityType(results[i]))
				end
				resultsString = resultsString .. tostring(results[i]) .. " [" .. resultType .. "]"
			end
			if #results > 1 then
				TriggerEvent("chatMessage", "[SS-RunCode]", {187, 0, 0}, "CRun Command Result: " .. tostring(resultsString))
				return true
			end
		end
	end)

	RegisterCommand("getpos", function(src, args)
		local ped = GetPlayerPed(-1)
		local pos, heading = GetEntityCoords(ped), GetEntityHeading(ped)

		local str = args[1] and "vector3(" .. round(pos.x, 2) .. ", " .. round(pos.y, 2) .. ", " .. round(pos.z, 2) .. ")," or "{ x = " .. round(pos.x, 2) ..", y = " .. round(pos.y, 2) .. ", z = " .. round(pos.z, 2) .. ", a = " .. round(heading, 2) .. " },"
		TriggerServerEvent("pichot_debug:givePos", str)
	end)

	function table.GetKeys( tab )
		local keys = {}
		local id = 1

		for k, v in pairs( tab ) do
			keys[ id ] = k
			id = id + 1
		end
		return keys
	end

	function PrintTable( t, indent, done )
		done = done or {}
		indent = indent or 0
		local keys = table.GetKeys( t )

		table.sort( keys, function( a, b )
			if ( type( a ) == "number" and type( b ) == "number" ) then return a < b end
			return tostring( a ) < tostring( b )
		end )

		done[ t ] = true

		for i = 1, #keys do
			local key = keys[ i ]
			local value = t[ key ]
			Citizen.Trace( string.rep( "\t", indent ) )

			if  ( type( value ) == "table" and not done[ value ] ) then
				done[ value ] = true
				Citizen.Trace( tostring( key ) .. ":" .. "\n" )
				PrintTable ( value, indent + 2, done )
				done[ value ] = nil
			else
				Citizen.Trace( tostring( key ) .. "\t=\t" .. tostring( value ) .. "\n" )
			end
		end
	end
end

function drawCenterText(msg, time)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(msg)
	DrawSubtitleTimed(time, 1)
end

local function AddLongString(txt)
	for i = 100, string.len(txt), 99 do
		local sub = string.sub(txt, i, i + 99)
		AddTextComponentString(sub)
	end
end

function ShowAboveRadarMessage(message, back)
	if back then Citizen.InvokeNative(0x92F0DA1E27DB96DC, back) end
	SetNotificationTextEntry("jamyfafi")
	AddTextComponentString(message)
	if string.len(message) > 99 and AddLongString then AddLongString(message) end
	return DrawNotification(0, 1)
end

local function GetPedHeashot(ped)
	local handle, startTime = RegisterPedheadshot(ped), GetGameTimer()
	while not IsPedheadshotReady(handle) and startTime + 10000 > GetGameTimer() do
		Citizen.Wait(100)
	end

	return IsPedheadshotReady(handle) and GetPedheadshotTxdString(handle)
end

function ShowAboveRadarMessageIcon(icon, intType, sender, title, text, back)
	if type(icon) == "number" then
		local ped = GetPlayerPed(icon)
		if ped then icon = GetPedHeashot(ped) end
	end

	if back then Citizen.InvokeNative(0x92F0DA1E27DB96DC, back) end
	SetNotificationTextEntry("jamyfafi")
	AddTextComponentString(text)
	if string.len(text) > 99 and AddLongString then AddLongString(text) end

	SetNotificationMessage(icon, icon, true, intType, sender, title)
	return DrawNotification(0, 1)
end

function ShowHelp(txt, beep)
	SetTextComponentFormat("jamyfafi")
	AddTextComponentString(txt)
	if string.len(txt) > 99 and AddLongString then AddLongString(txt) end
	DisplayHelpTextFromStringLabel(0, 0, beep, -1)
end

function RequestAndWaitDict(dictName)
	if DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
		RequestAnimDict(dictName)
		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
	end
end

function GetDistanceBetweenCoords(a, b, c, d, e, f)
	local v1, v2 = type(a) == "vector3" and a or vector3(a, b, c), type(b) == "vector3" and b or type(a) == "vector3" and vector3(b, c, d) or type(d) == "vector3" and d or vector3(d, e, f)
	return round(math.sqrt((v2.x - v1.x) * (v2.x - v1.x) + (v2.y - v1.y) * (v2.y - v1.y) + (v2.z - v1.z) * (v2.z - v1.z)), 3)
end

function RequestAndWaitModel(model)
	if IsModelInCdimage(model) and not HasModelLoaded(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		return true
	end
end

local function MeasureStringWidth(str, font, scale)
	BeginTextCommandWidth("STRING")
	AddTextComponentSubstringPlayerName(str)
	SetTextFont(font or 0)
	SetTextScale(1.0, scale or 0)
	return EndTextCommandGetWidth(true)
end

function DrawHUDRect(posX, posY, textA, textB, Justification)
	local width, width2 = MeasureStringWidth(textA, 4, 0.85) * 1.1, MeasureStringWidth(textB, 4, 0.85) * 1.1

	DrawRect(posX - width / 2, posY, width, 0.05, 220, 220, 220, 100)
	DrawRect(posX - width - width2 / 2, posY, width2, 0.05, 0, 0, 0, 100)
	DrawNiceText(posX - width / 2, posY - 0.0275, 0.85, textA, 4, 2, 1)
	DrawNiceText(posX - width - width2 / 2, posY - 0.0275, 0.85, textB, 4, 1, 1)

	return width + width2
end

function DrawNiceText(x, y, scale, text, f, c, n, color)
	color = color or { 255, 255, 255 }
	SetTextFont(f or 4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(color[1], color[2], color[3], color[4] or 255)
	SetTextCentre(c)
	if not n then
		SetTextDropShadow()
		SetTextOutline()
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(2, 0, 0, 0, 255)
	end
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

-- unfortunately not that fast with pickups :(
AddEventHandler("gameEventTriggered", function(name, Arguments)
	name = name:gsub("CEventNetwork", "")
	if BR[name] then
		BR[name](BR, table.unpack(Arguments))
	end
end)

function createCBlip(vector3Pos, intSprite, intColor, stringText, boolRoad, floatScale, intDisplay, intAlpha)
	local blip = AddBlipForCoord(vector3Pos.x, vector3Pos.y, vector3Pos.z)
	SetBlipSprite(blip, intSprite)
	SetBlipAsShortRange(blip, true)
	if intColor then SetBlipColour(blip, intColor) end
	if floatScale then SetBlipScale(blip, floatScale) end
	if boolRoad then SetBlipRoute(blip, boolRoad) end
	if intDisplay then SetBlipDisplay(blip, intDisplay) end
	if intAlpha then SetBlipAlpha(blip, intAlpha) end
	if stringText and (not intDisplay or intDisplay ~= 8) then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(stringText)
		EndTextCommandSetBlipName(blip)
	end
	return blip
end

function forceAnim(animName, flag, args)
	flag, args = flag and tonumber(flag) or false, args or {}
	local ped, time, clearTasks, animPos, animRot, animTime = args.ped or GetPlayerPed(-1), args.time, args.clearTasks, args.pos, args.ang

	if IsPedInAnyVehicle(ped) and (not flag or flag < 40) then return end

	if not clearTasks then ClearPedTasks(ped) end

	if animName[2] then
		RequestAndWaitDict(animName[1])
	end

	if not animName[2] then
		ClearAreaOfObjects(GetEntityCoords(ped), 1.0)
		TaskStartScenarioInPlace(ped, animName[1], -1, not tableHasValue(animBug, animName[1]))
	else
		if not animPos then
			TaskPlayAnim(ped, animName[1], animName[2], 8.0, -8.0, -1, flag or 44, 0, 0, 0, 0, 0)
		else
			TaskPlayAnimAdvanced(ped, animName[1], animName[2], animPos.x, animPos.y, animPos.z, animRot.x, animRot.y, animRot.z, 8.0, -8.0, -1, flag or 44, animTime or -1, 0, 0)
		end
	end

	if time and type(time) == "number" then
		Citizen.Wait(time)
		ClearPedTasks(ped)
	end

	if not args.dict then RemoveAnimDict(animName[1]) end
end