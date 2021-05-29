local vh = function(y) return (ScrH() / 100) * y end 



net.Receive("DTVM::UI::Open", function(len,ply)
    local dealerName = net.ReadString()

    DTVM.ACTIVE_FRAME = vgui.Create("DTVM::Component::Frame")
    DTVM.ACTIVE_FRAME:SetSize(vh(75), vh(50))
    DTVM.ACTIVE_FRAME:Center()

    local bodyPnl
    local spawnedVeh = LocalPlayer():GetSpawnedVehicle()
    if spawnedVeh and IsValid(spawnedVeh) then
        bodyPnl = vgui.Create("DTVM::Component::Park")
        bodyPnl:SetVehicle(spawnedVeh)
    else 
        bodyPnl = vgui.Create("DTVM::Component::Spawner")
        bodyPnl:SetDealer(dealerName)
    end

    DTVM.ACTIVE_FRAME:AddBody(bodyPnl)
end)