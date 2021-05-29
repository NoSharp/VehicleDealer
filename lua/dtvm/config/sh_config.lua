DTVM.Config.Delears = {
    ["Some Dealer"] = {
        --- Wo der NPC spawnt
        NpcPosition = Vector( 231.377609, -2975.062500, -12735.968750),
        --- Wo das Fahrzeug spawnt
        SpawnPosition = Vector(82.772003, -3229.089844, -12735.968750),
        --- Die Ränge, die Fahrzeuge spawnen können
        RanksAllowed = {
            ["Commander"] = true
        },
        --- Die Fraktionen, die Fahrzeuge spawnen können
        FactionsAllowed = {
            ["Clones"] = true
        }, 
        --- Die Fahrzeuge, die es spawnen kann
        Vehicles = {
            "Airboat",
            "Jeep",
            "Pod"
        }
    }
}