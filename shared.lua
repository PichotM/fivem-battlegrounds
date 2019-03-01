local IS_SERVER = IsDuplicityVersion()

BR = BR or {}

ENABLE_DEBUG = true
if not IS_SERVER then
	BR.Blips = {}
	BR.FormerZone = false
	BR.JumpTime = 60
	BR.ShowBlips = true
else
	BR.StartZone = 120
	BR.IntervalZone = 120
end

--[[
	0 -> WAITING GAME START.
	1 -> IN PLANE.
	2 -> CAN LEAVE PLANE.
]]--

BR.Status = 0
BR.StartTime = 0
BR.PlaneNet = 0
BR.Players = {}
BR.Host = 0
BR.Zone = false
BR.ZoneRadius = 0.0
BR.Map = false
BR.Maps = {}

BR.WarmUP = 30
BR.GameTime = 60 * 18
BR.MinPlayers = 2


function ChatNotif(a, b, c, color)
	if IS_SERVER then
		TriggerClientEvent('chatMessage', a, c or 'GTALife', d or {18, 197, 101}, b or '')
	else
		TriggerEvent('chatMessage', b or 'GTALife', c or {18, 197, 101}, a or '.')
	end
end

function VectorToTable(vec)
	return { x = vec.x, y = vec.y, z = vec.z }
end

local function Vmag(vector)
	return math.sqrt(vector.x * vector.x + vector.y * vector.y + vector.z * vector.z)
end

local function Lerp(a, b, t)
	return a + (b - a) * t
end

function VecLerp(pos1, pos2, l, clamp)
	if clamp then
		if l < 0.0 then l = 0.0 end
		if l > 1.0 then l = 1.0 end
	end
	local x = Lerp(pos1.x, pos2.x, l)
	local y = Lerp(pos1.y, pos2.y, l)
	local z = Lerp(pos1.z, pos2.z, l)
	return vector3(x, y, z)
end

function GenerateCenterPoint(distance, notDIVIDED)
	local vec = vector3(0.0, 0.0, 0.0)

	local radius = math.floor(distance / 6)
	while Vmag(vec) < distance do
		vec = vec + vector3(math.random(-radius, radius), math.random(-radius, radius), 0.0)
		Citizen.Wait(0)
	end

	return notDIVIDED and vec or vec - vec / 2
end

function tableHasValue(tbl, value, k)
	if not tbl or not value or type(tbl) ~= "table" then return end
	for _,v in pairs(tbl) do
		if k and v[k] == value or v == value then return true, _ end
	end
end

function round(num, numDecimalPlaces)
	if numDecimalPlaces and numDecimalPlaces > 0 then
		local mult = 10 ^ numDecimalPlaces
		return math.floor(num * mult + 0.5) / mult
	end
	return math.floor(num + 0.5)
end

function tableCount(tbl, checkCount)
	if not tbl or type(tbl) ~= "table" then return 0 end
	local n = 0
	for k,v in pairs(tbl) do
		n = n + 1
		if checkCount and n >= checkCount then return true end
	end
	return n
end