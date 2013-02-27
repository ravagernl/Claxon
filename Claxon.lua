local AddOnName, ns = ...

local mediaPath = [[Interface\AddOns\Claxon\media\]]

local print = function(...)
	print(AddOnName, ': ', ...)
end

local name = UnitName'player'

local evtsounds = {
	["CHAT_MSG_GUILD"] = "Kachink",
	["CHAT_MSG_OFFICER"] = "Link",
	["CHAT_MSG_PARTY"] = "pop1",
	["CHAT_MSG_PARTY_LEADER"] = "pop2",
	["CHAT_MSG_RAID"] = "Text2",
	["CHAT_MSG_WHISPER"] = "Heart",
	["CHAT_MSG_GMWHISPER"] = "gasp",
	["CHAT_MSG_RAID_LEADER"] = "Choo",
	["CHAT_MSG_BATTLEGROUND"] = "switchy",
	["CHAT_MSG_BATTLEGROUND_LEADER"] = "doublehit",
}

local f = CreateFrame'Frame'
f:SetScript('OnEvent', function(self, event, ...)
	local msg, author, lang, channel = ...
	if author == name then return end

	local sound = mediaPath..evtsounds[event]..'.mp3'
	PlaySoundFile(sound)
end)

for event, sound in pairs(evtsounds) do
	f:RegisterEvent(event)
end