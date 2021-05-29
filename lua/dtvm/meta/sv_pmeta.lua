local PMETA = FindMetaTable("Player")

function PMETA:SetSpawnedVehicle(vehicle)
    self:SetNWString("VehicleSpawned", vehicle)
end

function PMETA:RemoveSpawnedVehicle()
    self:SetNWString("VehicleSpawned", nil)
end