
--- Just players the notification sound.
---@param reason string The reason.
function DTVM.Utils.NotifyLocal(reason)
    notification.AddLegacy(reason, NOTIFY_GENERIC, 3)
    surface.PlaySound( "buttons/button15.wav" )
    print("NOTIFIACTION: " .. reason)
end


net.Receive("DTVM.NotifyUniversal", function(len,ply)
    local reason = net.ReadString()
    DTVM.Utils.NotifyLocal(reason)
end)