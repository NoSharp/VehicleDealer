surface.CreateFont("DTVM.CloseButton", {
    font = "Montserrat",
    size = 24,
})

local white = Color(255,255,255)
local closeButton = Color(155,54,54)
local PANEL = {}

function PANEL:Init()
    self:SetText("")
end

function PANEL:SetName(name)
    self.name = name
end

function PANEL:Paint(w,h)
    draw.RoundedBox(3, 0, 0, w, h, closeButton)
    draw.SimpleText("✕", "DTVM.CloseButton", w/2, h/2 - 12, white, TEXT_ALIGN_CENTER)
end

function PANEL:DoClick()
    self:GetParent():Close()
end

vgui.Register("DTVM::Component::CloseButton", PANEL, "DButton")