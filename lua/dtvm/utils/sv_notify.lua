util.AddNetworkString("DTVM.NotifyUniversal")

--- Notify the player.
--- @param ply Player
--- @param string Reason.
function DTVM.Utils.NotifyPlayer(ply, reason)
    net.Start("DTVM.NotifyUniversal")
        net.WriteString(reason)
    net.Send(ply)
end