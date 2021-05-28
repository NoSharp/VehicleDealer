DTVM.Config.Delears = {
    ["Some Dealer"] = {
        --- Wo der NPC spawnt
        NpcPosition = Vector(1250,0,0),
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
            "myvehicle.mdl"
        }
    }
}