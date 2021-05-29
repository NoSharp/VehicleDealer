local vh = function(y) return (ScrH() / 100) * y end 

surface.CreateFont("DTVM.Button", {
    font = "Montserrat Medium",
    size = vh(2.25),
})

local white = Color(255,255,255)

local PANEL = {}

function PANEL:Init()
    self:SetText("")
end

function PANEL:SetName(name)
    self.name = name
end

function PANEL:SetColor(col)
    self.color = col
end

function PANEL:Paint(w,h)
    draw.RoundedBox(8, 0, 0, w, h, self.color)
    draw.SimpleText(self.name, "DTVM.Button", w/2, h/2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function PANEL:DoClick()

end

vgui.Register("DTVM::Component::Button", PANEL, "DButton")