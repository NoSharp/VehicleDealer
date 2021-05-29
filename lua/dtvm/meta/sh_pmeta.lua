local PMETA = FindMetaTable("Player")

function PMETA:GetSpawnedVehicle(vehicle)
    return self:GetNWEntity("VehicleSpawned")
end
