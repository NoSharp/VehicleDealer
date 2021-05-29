do

    local function findVehicleFromClass(class)
        
        local vehicles = list.Get( "Vehicles" )
        
        for name, veh in pairs( vehicles ) do
            if name == class then
                return veh
            end
        end

    end

    function DTVM.Utils.SpawnVehicle(vehClass, spawner, dealer)

        local foundVehicle = findVehicleFromClass(vehClass)

        local vehicle = ents.Create(foundVehicle.Class)
        vehicle:SetModel(foundVehicle.Model)
        vehicle:SetPos(DTVM.Config.Delears[dealer].SpawnPosition)
        vehicle:Spawn()

        return vehicle
    end

end
