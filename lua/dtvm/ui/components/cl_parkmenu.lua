local PANEL = {}

surface.CreateFont("DTVM.VehicleSpawn", {
    font = "Montserrat",
    size = 24,
})


local bg = Color(65,65,65)
local white = Color(255,255,255)

function PANEL:Init()

    self.parkButton = self:Add("DTVM::Component::Button")
    self.parkButton:SetColor(Color(25,155,25))
    self.parkButton:SetName("Fahrzeug parken")

    function self.parkButton.DoClick()
        net.Start("DTVM::ParkVehicle")
        net.SendToServer()
        
        self:GetParent():GetParent():Close()
    end

end

function PANEL:SetVehicle(vehicle)
    self.curVehicle = vehicle
end

function PANEL:Paint(w,h)
    draw.RoundedBox(3,0,0,w,h,bg)
    draw.DrawText("Bringen Sie Ihr Fahrzeug zum Händler zurück,\ndamit Sie ein anderes hervorbringen können", "DTVM.VehicleSpawn", w/2,h*.45, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function PANEL:PerformLayout(w,h)

    local buttonPosH = h * .65

    local parkButtonWidth = w * .2
    local parkButtonHeight = h * .1

    local parkButtonStart = (w - parkButtonWidth) / 2 
    
    self.parkButton:SetPos(parkButtonStart, buttonPosH)
    self.parkButton:SetSize(parkButtonWidth, parkButtonHeight)


end

vgui.Register("DTVM::Component::Park", PANEL, "Panel")
