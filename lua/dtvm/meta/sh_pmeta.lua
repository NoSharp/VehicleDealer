local PMETA = FindMetaTable("Player")

function PMETA:GetSpawnedVehicle(vehicle)
    return self:GetNWString("VehicleSpawned")
end
