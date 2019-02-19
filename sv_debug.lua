if not ENABLE_DEBUG then return end

local function RunString(stringToRun, playerSource)
	RconPrint("RunString: " .. tostring(stringToRun) .. "\n")
	RconPrint("RunString Source: " .. tostring(playerSource) .. "\n")
	local isConsole = playerSource == 0
	if stringToRun then
		local resultsString = ""
		local stringFunction, errorMessage = load("return " .. stringToRun)
		if errorMessage then
			stringFunction, errorMessage = load(stringToRun)
		end
		if errorMessage then
			local msgError = "SRun Error: " .. tostring(errorMessage)
			if isConsole then
				RconPrint(msgError .. "\n")
			else
				ChatNotif(playerSource, "Erreur: " .. msgError)
			end
			return false
		end

		local results = {pcall(stringFunction)}
		if not results[1] then
			local msgError = "SRun Error: " .. tostring(results[2])
			if isConsole then
				RconPrint(msgError .. "\n")
			else
				ChatNotif(playerSource, "Erreur: " .. msgError)
			end
			return false
		end

		for i = 2, #results do
			resultsString = resultsString .. ", "
			local resultType = type(results[i])
			if results[i] and resultType == "number" then
				resultType = tostring(results[i])
			end
			resultsString = resultsString .. tostring(results[i]) .. " [" .. resultType .. "]"
		end
		if #results > 1 then
			RconPrint(tostring(resultsString) .. "\n")
			return true
		end
	end
end

local commandList = { "cr", "sr" }
local function InterceptCommand(playerSource, playerName, chatMessage)
	if string.sub(chatMessage, 1, 1) == "/" then
		CancelEvent()
		local commandName = string.match(chatMessage, "%S+")
		if commandList[1] == string.sub(commandName, 2, #commandName) then
			local stringToRun = chatMessage:gsub("/" .. commandList[1] .. " ", "")
			TriggerClientEvent("pichot:runCode", playerSource, stringToRun)
		end
		if commandList[2] == string.sub(commandName, 2, #commandName) then
			local stringToRun = chatMessage:gsub("/" .. commandList[2] .. " ", "")
			RunString(stringToRun, playerSource)
		end
	end
end
AddEventHandler("chatMessage", InterceptCommand)

RegisterNetEvent("pichot_debug:givePos")
AddEventHandler("pichot_debug:givePos", function(str)
	print(str)
	local file = io.open('resources/positions.txt', "a")
	file:write(str .. "\n")
	file:flush()
	file:close()

	ChatNotif(source, "Commande -> " .. str)
end)