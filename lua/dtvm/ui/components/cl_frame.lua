local vh = function(y) return (ScrH() / 100) * y end 

surface.CreateFont("DTVM.Frame.Title", {
    font = "Montserrat Medium",
    size = vh(2.5),
})

surface.CreateFont("DTVM.Frame.SubHeader", {
    font = "Montserrat Medium",
    size = vh(3),
})

local bg = Color(35,35,35)
local white = Color(255,255,255)

local PANEL = {}

function PANEL:Init()
    
    self.navBar = self:Add("DPanel")
    self.navBar.Paint = function(s,w,h) end
    
    self.mainDock = self:Add("DPanel")
    self.mainDock.Paint = function(s,w,h) end

    self.closeButton = self:Add("DTVM::Component::CloseButton")

    self:SetTitle("")
    self:ShowCloseButton(false)
    self:SetDraggable(false)
    self:MakePopup()
end

function PANEL:Center()
    local w,h = self:GetSize()
    local scrW,scrH = ScrW(), ScrH()
    self:SetPos((scrW - w) / 2, (scrH - h) /2 )
end

function PANEL:SetName(name)
    self.name = name
end

function PANEL:SetColor(col)
    self.color = col
end

function PANEL:SetSubHeader(subHeader)
    self.subHeader = subHeader
end

function PANEL:AddBody(pnl)
    pnl:SetParent(self.mainDock)
    pnl:SetDealer("Some Dealer")
    pnl:Dock(FILL)
end

function PANEL:PerformLayout(w,h)

    -- self.topBar:Dock(TOP)
    -- self.topBar:SetTall(h*0.15)

    self.navBar:Dock(FILL)
    self.navBar:SetTall(h*0.85)
    self.navBar:SetWide(w*0.15)
    
    self.mainDock:Dock(FILL)
    self.mainDock:SetTall(h*0.75)
    self.mainDock:SetWide(w*0.85)

    self.closeButton:SetPos(w - 28,0)
    self.closeButton:SetSize(28,28)
    
end

function PANEL:Paint(w,h)
    draw.RoundedBox(4,0,0,w,h,bg)
    draw.SimpleText("Fahrzeug-Händler", "DTVM.Frame.Title", w/2, 13, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 
end

vgui.Register("DTVM::Component::Frame", PANEL, "DFrame")

local vh = function(y)
    return (ScrH() / 100) * y
end

concommand.Add("DTVM.Demo", function()
    local b = vgui.Create("DTVM::Component::Frame")
    b:SetSize(vh(75), vh(50))
    b:Center()
    b:SetSubHeader("Spawner")
    b:AddBody(vgui.Create("DTVM::Component::Spawner"))
end)