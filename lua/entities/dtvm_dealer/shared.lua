ENT.Type = "ai"
ENT.Base = "base_ai"

ENT.PrintName = "Vehicle Dealer NPC"
ENT.Category = "Vehicle Dealear"
ENT.Author = "nosharp"
ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("String", 0, "DealerName")
end