util.AddNetworkString("DTVM::UI::Open")
util.AddNetworkString("DTVM::SpawnVehicle")
util.AddNetworkString("DTVM::ParkVehicle")

do 
    local function doesVehicleExist(configObj, vehClass)

        for _,vehicle in pairs(configObj.Vehicles) do
            if vehicle == vehClass then 
                return true 
            end
        end

        return false

    end

    local function isNearSpawner(ply)
        for k,v in pairs(ents.FindInSphere(ply:GetPos(), 500)) do
            if v:GetClass() == "dtvm_dealer" then
                return true
            end
        end
        return false
    end

    net.Receive("DTVM::SpawnVehicle", function(len,ply)

        if ply.__dtvm_cooldown and ply.__dtvm_cooldown > CurTime() then return end 

        local vehClass = net.ReadString()

        local dealerNPC = ply:GetEyeTrace().Entity
        if not dealerNPC or not IsValid(dealerNPC) then return end
        if dealerNPC:GetClass() ~= "dtvm_dealer" then return end

        local dealer = dealerNPC:GetDealerName()

        local spawnedEnt = ply:GetSpawnedVehicle()
        if spawnedEnt ~= nil and IsValid(ply:GetSpawnedVehicle()) then return end
    
        local config = DTVM.Config.Delears[dealer]
        if not config then return end
        if not doesVehicleExist(config, vehClass) then return end
        local spawned = DTVM.Utils.SpawnVehicle(vehClass, ply, dealer)
        
        ply:SetSpawnedVehicle(spawned)
        ply.__dtvm_cooldown = CurTime() + 10
        DTVM.Utils.NotifyPlayer(ply, "Ihr Fahrzeug hat gebrannt!")
    end)

end

net.Receive("DTVM::ParkVehicle", function(len,ply)
    local spawnedEnt = ply:GetSpawnedVehicle()
    if ply.__dtvm_cooldown and ply.__dtvm_cooldown > CurTime() then return end 
    if spawnedEnt == nil or not IsValid(spawnedEnt) then return end
    
    local dealerNPC = ply:GetEyeTrace().Entity
    if not dealerNPC or not IsValid(dealerNPC) then return end

    if dealerNPC:GetClass() ~= "dtvm_dealer" then return end

    if spawnedEnt:GetPos():DistToSqr(ply:GetPos()) > 250 * 250 then
        DTVM.Utils.NotifyPlayer(ply, "Ihr Fahrzeug ist zu weit entfernt!")
        return
    end

    spawnedEnt:Remove()
    ply:RemoveSpawnedVehicle()
    ply.__dtvm_cooldown = CurTime() + 10
    DTVM.Utils.NotifyPlayer(ply, "Ihr Fahrzeug geparkt!")
end)

for name, dealer in pairs(DTVM.Config.Delears) do
    local dealerEnt = ents.Create("dtvm_dealer")
    dealerEnt:SetPos(dealer.NpcPosition)
    dealerEnt:Spawn()
    dealerEnt:SetDealerName(name)
end
