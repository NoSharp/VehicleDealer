local PANEL = {}

surface.CreateFont("DTVM.VehicleSpawn", {
    font = "Montserrat",
    size = 24,
})


local bg = Color(65,65,65)
local white = Color(255,255,255)

function PANEL:Init()

    self.spawnButton = self:Add("DTVM::Component::Button")
    self.spawnButton:SetColor(Color(25,155,25))
    self.spawnButton:SetName("Spawn")

    function self.spawnButton.DoClick()
        print("got here?")
        net.Start("DTVM::SpawnVehicle")
            net.WriteString(self.dealerName)
            net.WriteString(self.curVehicle)
        net.SendToServer()
    end

    self.nextButton = self:Add("DTVM::Component::Button")
    self.nextButton:SetColor(Color(45,45,45))
    self.nextButton:SetName(">")

    function self.nextButton.DoClick()
        self:AddConfigIndex(1)
    end

    self.lastButton = self:Add("DTVM::Component::Button")
    self.lastButton:SetColor(Color(45,45,45))
    self.lastButton:SetName("<")

    function self.lastButton.DoClick()
        self:AddConfigIndex(-1)
    end

    self.model = self:Add("DTVM::Component::Vehicle")

end

function PANEL:OnVehicleOffsetUpdate()
    self:SetVehicle(self.config.Vehicles[self.vehicleOffset])
end

function PANEL:SetVehicle(veh)
    self.model:SetVehicle(veh)
    self.curVehicle = veh
end

function PANEL:SetDealer(dealerName)
    self.dealerName = dealerName
    self.config = DTVM.Config.Delears[self.dealerName]

    self.vehicleMinBound = 1
    self.vehicleMaxBound = #self.config.Vehicles
    self.vehicleOffset = 1

    self:OnVehicleOffsetUpdate()
end

function PANEL:AddConfigIndex(offset)
    local nextOffset = self.vehicleOffset + offset
    print(nextOffset)
    if nextOffset > self.vehicleMaxBound then 
        self.vehicleOffset = 1
    elseif nextOffset <= 0 then 
        self.vehicleOffset = self.vehicleMaxBound
    else
        self.vehicleOffset = nextOffset
    end

    self:OnVehicleOffsetUpdate()
end

function PANEL:Paint(w,h)
    draw.RoundedBox(3,0,0,w,h,bg)
    draw.SimpleText(self.curVehicle, "DTVM.VehicleSpawn", w/2,h*.8, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function PANEL:PerformLayout(w,h)

    local buttonPosH = h * .85

    local spawnButtonWidth = w * .2
    local spawnButtonHeight = h * .1

    local spawnButtonStart = (w - spawnButtonWidth) / 2 
    local spawnButtonEnd  = (w - spawnButtonWidth) / 2  + spawnButtonWidth

    local padding = w * .025

    local incrButtonSize = h * .1

    local modelW = w * .65
    local modelH = h * .65

    self.spawnButton:SetPos(spawnButtonStart, buttonPosH)
    self.spawnButton:SetSize(spawnButtonWidth, spawnButtonHeight)

    self.nextButton:SetPos(spawnButtonEnd + padding , buttonPosH)
    self.nextButton:SetSize(incrButtonSize, incrButtonSize)

    self.lastButton:SetPos(spawnButtonStart - padding - incrButtonSize, buttonPosH)
    self.lastButton:SetSize(incrButtonSize, incrButtonSize)

    self.model:SetPos((w - modelW) / 2, (h - modelH) * .35)
    self.model:SetSize(modelW, modelH)

end

vgui.Register("DTVM::Component::Spawner", PANEL, "Panel")
