local PANEL = {}

function PANEL:Init()
    
end

do

    local function computeCamDist(ent)
        local mins,maxs = ent:GetModelBounds()
        local size = (mins - maxs):Length()
        return size * 1
    end

    local function findVehicleModelFromClass(class)
        local vehicles = list.Get( "Vehicles" )
        
        for k,v in pairs( vehicles ) do
            if k == class then
                return v.Model
            end
        end
    end

    function PANEL:SetVehicle(vehClass)
        if not vehClass then return end
        
        local mdl = findVehicleModelFromClass(vehClass)
        self:SetModel( mdl )
        
        local ent = self:GetEntity()
        self:SetFOV(50)

        if not self.ogPos then
            self.ogPos = self:GetCamPos()
        end

        local camOffset = computeCamDist(ent)
        self:SetCamPos( self.ogPos - Vector(camOffset, 0, -camOffset/2))
    end

end


vgui.Register("DTVM::Component::Vehicle", PANEL, "DModelPanel")
