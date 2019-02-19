-- Sound
local soundList = {
	["PUBG"] = "pubg",
	["TEST"] = "test",
}

function PlayAudio(soundName, args)
	local sound = soundList[soundName]
	if not sound then return end

	SendNUIMessage({
		soundName = sound,
		soundArgs = args
	})
end

function StopAudio(soundName)
	SendNUIMessage({
		stopSound = true,
		targetSound = soundName
	})
end