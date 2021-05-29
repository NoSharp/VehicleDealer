local PANEL = {}

local bg = Color(65,65,65)


function PANEL:Init()

    self.spawnButton = self:Add("DTVM::Component::Button")
    self.spawnButton:SetColor(Color(25,155,25))
    self.spawnButton:SetName("Spawn")

    self.nextButton = self:Add("DTVM::Component::Button")
    self.nextButton:SetColor(Color(45,45,45))
    self.nextButton:SetName(">")

    self.lastButton = self:Add("DTVM::Component::Button")
    self.lastButton:SetColor(Color(45,45,45))
    self.lastButton:SetName("<")
end

function PANEL:OnVehicleOffsetUpdate()

end

function PANEL:SetDealer(dealerName)
    self.dealerName = dealerName
    self.config = DTVM.Config.Delears[self.dealerName]

    self.vehicleMinBound = 1
    self.vehicleMaxBound = #self.config.Vehicles
    self.vehicleOffset = 1
end

function PANEL:AddConfigIndex(offset)
    local nextOffset = self.vehicleOffset + offset

    if nextOffset > self.vehicleMaxBound then 
        self.vehicleOffset = self.vehicleMinBound % self.vehicleMaxBound
    else
        self.vehicleOffset = nextOffset
    end

    self:OnVehicleOffsetUpdate()
end

function PANEL:Paint(w,h)
    draw.RoundedBox(3,0,0,w,h,bg)
end

function PANEL:PerformLayout(w,h)

    local buttonPosH = h * .85
    local spawnButtonWidth = w * .2
    local spawnButtonHeight = h * .1

    local spawnButtonStart = (w - spawnButtonWidth) / 2 
    local spawnButtonEnd  = (w - spawnButtonWidth) / 2  + spawnButtonWidth

    local padding = w * .025

    local incrButtonSize = h * .1

    self.spawnButton:SetPos(spawnButtonStart, buttonPosH)
    self.spawnButton:SetSize(spawnButtonWidth, spawnButtonHeight)

    self.nextButton:SetPos(spawnButtonEnd - padding + incrButtonSize, buttonPosH)
    self.nextButton:SetSize(incrButtonSize, incrButtonSize)

    self.lastButton:SetPos(spawnButtonStart - padding - incrButtonSize, buttonPosH)
    self.lastButton:SetSize(incrButtonSize, incrButtonSize)
end

vgui.Register("DTVM::Component::Spawner", PANEL, "Panel")
