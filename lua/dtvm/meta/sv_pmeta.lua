local PMETA = FindMetaTable("Player")

function PMETA:SetSpawnedVehicle(vehicle)
    self:SetNWEntity("VehicleSpawned", vehicle)
end

function PMETA:RemoveSpawnedVehicle()
    self:SetNWEntity("VehicleSpawned", nil)
end