include("shared.lua")
AddCSLuaFile("shared.lua")

function ENT:Initialize()
    self:SetModel("models/Humans/Group03m/Female_02.mdl")
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(bit.bor(CAP_ANIMATEDFACE, CAP_TURN_HEAD))
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	self:SetMaxYawSpeed(90)
end


function ENT:Use(ply)

	net.Start("DTVM::UI::Open")
		net.WriteString(self:GetDealerName())
	net.Send(ply)

end