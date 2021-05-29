DTVM.Config.Delears = {
    ["Some Dealer"] = {
        --- Wo der NPC spawnt
        NpcPosition = Vector(-717.810059, 342.741577, -12223),
        --- Wo das Fahrzeug spawnt
        SpawnPosition = Vector(500,0,0),
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