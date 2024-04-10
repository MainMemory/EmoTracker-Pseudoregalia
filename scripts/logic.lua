local spawns = {
    --Prison starts
    gameStart = "EarlyPrison",
    --dungeonlowestSave = "LatePrison",
    dungeonWestSave = "LatePrison",
    dungeonSaveNearBoss = "StrongEyes",
    dungeonWest = "PEntryUnderBelly",
    dungeonNorth = "PEntryTheatre",
    dungeon_lower1 = "PEntryCastle",
    --Castle Starts
    dungeon1 = "CsPrisonEntry",
    lowerWestSave = "CsMain",
    lowerWest = "CsTheatreEntryNearPrison",
    lowerSouthHigh = "CsKeepEntryMain",
    startGazebo = "CsMain",
    lowerNorth = "CsKeepEntryRamp",
    exterior1 = "CsBaileyEntry",
    lowerMiddle = "CsKeepClimbEntrance",
    lowerEastSave = "CsMain",
    lowerNorthWestTheatre = "CsOldSoftlockRoom",
    lowerEast = "CsLibraryEntry",
    lowerNorthNorthWest = "CsTheatreEntrance",
    -- Library starts
    libraryWest = "MainLibrary",
    librarySave = "MainLibrary",
    saveLibraryWest = "LibSaveNearGreaves",
    -- Sansa Keep Starts
    upperSouth = "SkCastleMainEntry",
    saveUpperMid = "SansaKeep",
    upperMiddle = "SkCastleClimbEntry",
    upperNorthSave = "SansaKeep",
    upperNorth = "SkCastleRampEntry",
    upperNorthEast = "SkUnderbellyEntry",
    upperSouthWest = "SkTheatreEntry",
    -- Empty Bailey Starts
    bailey_lower1 = "EbEntryCastle",
    exteriorWest = "EbEntryTheatre",
    exteriorSouthSave = "EmptyBailey",
    exteriorSouthEast = "EbEntryRuins",
    exteriorEast = "EbEntryUnderBelly",
    -- Underbelly starts
    cavesSouth = "BaileyHole",
    dungeonWest = "PrisonHole",
    cavesWestSave = "VAscendantLight",
    postLightSave = "VAscendantLight",
    cavesSouthSave = "BaileyHole",
    cavesBigMiddleStart = "MainUnderbelly",
    cavesEast = "SansaHole",
    cavesWest = "PrisonHole",
    cavesBigSideStart = "HpSave",
    -- Theatre saves
    theatreEast = "ThCastleEntryMain", -- Main Entrance / up and over
    theatreNorthEastUpper = "ThKeepEntry", -- From Keep
    theatreSouthEast = "ThCastleEntryPillar", -- From Castle / pillar
    theatreNorthEastLower = "ThDungeonEntry", -- From Dungeon
    theatreSaveMain = "MainTheatre",   -- Save Crystal
    theatreSouthWest = "ThBaileyEntry", -- From Bailey
}

local locations = {
EarlyPrison = {
locRefs = { "StrongEyes", "LatePrison", "CsMain" },
logic = function()
return All(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))), Any(All(Any(Key(), All(Powerup("Sunsetter"), Powerup("DreamBreaker"), Trick("Knowledge", 1))), Loc("StrongEyes")), Loc("LatePrison"), Loc("CsMain")))
end
},
LatePrison = {
locRefs = { "CsMain", "PEntryUnderBelly", "EarlyPrison" },
logic = function()
return All(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))), Any(Loc("CsMain"), Loc("PEntryUnderBelly"), Loc("EarlyPrison")))
end
},
StrongEyes = {
locRefs = { "LatePrison", "CsMain" },
logic = function()
return Any(All(Powerup("Slide"), Loc("LatePrison")), All(Any(Key(), All(Powerup("Sunsetter"), Powerup("DreamBreaker"), Trick("Knowledge", 1))), Loc("CsMain")))
end
},
PEntryCastle = {
locRefs = { "StrongEyes", "EarlyPrison", "CsPrisonEntry" },
logic = function()
return Any(All(Key(), Loc("StrongEyes")), All(Powerup("SolarWind"), Powerup("HeliacalPower", 4), Powerup("Sunsetter"), Powerup("ClingGem", 6), Trick("ClingAbuse", 3), Trick("Movement", 3), Trick("Momentum", 2), Loc("EarlyPrison")), Loc("CsPrisonEntry"))
end
},
PEntryUnderBelly = {
locRefs = { "LatePrison", "PrisonHole" },
logic = function()
return Any(All(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 3))), Loc("LatePrison")), All(Powerup("AscendantLight"), Loc("PrisonHole")))
end
},
PEntryTheatre = {
locRefs = { "LatePrison", "ThDungeonEntry" },
logic = function()
return Any(All(Any(Powerup("ClingGem", 6), Powerup("HeliacalPower", 3), Powerup("AscendantLight")), Loc("LatePrison")), Loc("ThDungeonEntry"))
end
},
CsOldSoftlockRoom = {
locRefs = { "CsMain", "CsTheatreEntrance" },
logic = function()
return Any(All(Powerup("ClingGem", 2), Loc("CsMain")), All(Any(All(Powerup("SolarWind"), Powerup("HeliacalPower"), Trick("Movement", 1)), All(Powerup("Slide"), Powerup("ClingGem", 2), Trick("Movement", 2))), Loc("CsTheatreEntrance")))
end
},
CsKeepClimbEntrance = {
locRefs = { "CsMain" },
logic = function()
return All(Key(), Loc("CsMain"))
end
},
CsMain = {
locRefs = { "CsOldSoftlockRoom", "CsKeepClimbEntrance", "CsLibraryEntry", "CsPrisonEntry", "CsBaileyEntry", "CsTheatreEntryNearPrison" },
logic = function()
return Any(All(Any(Powerup("ClingGem", 4), All(Powerup("HeliacalPower", 3), Trick("Movement", 3), Trick("OneWall", 2)), All(Powerup("HeliacalPower", 4), Trick("Movement", 2), Trick("OneWall", 2))), Loc("CsOldSoftlockRoom")), All(Powerup("DreamBreaker"), Any(All(Key(), Loc("CsKeepClimbEntrance")), Loc("CsLibraryEntry"))), Loc("CsPrisonEntry"), Loc("CsBaileyEntry"), Loc("CsTheatreEntryNearPrison"))
end
},
CsTheatreEntrance = {
locRefs = { "CsOldSoftlockRoom", "ThCastleEntryMain" },
logic = function()
return Any(All(Powerup("Sunsetter"), Powerup("ClingGem", 4), Powerup("HeliacalPower"), Loc("CsOldSoftlockRoom")), All(Powerup("SolarWind"), Powerup("HeliacalPower", 3), Trick("Movement", 2)), All(Powerup("ClingGem", 2), Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Trick("OneWall", 2), Trick("Movement", 2)), Loc("ThCastleEntryMain"))
end
},
CsPrisonEntry = {
locRefs = { "CsMain", "PEntryCastle" },
logic = function()
return Any(Loc("CsMain"), Loc("PEntryCastle"))
end
},
CsLibraryEntry = {
locRefs = { "CsMain", "MainLibrary" },
logic = function()
return Any(All(Powerup("DreamBreaker"), Loc("CsMain")), Loc("MainLibrary"))
end
},
CsTheatreEntryNearPrison = {
locRefs = { "CsMain", "PillarRoom" },
logic = function()
return Any(All(Any(All(Powerup("Slide"), Trick("Movement", 2), Trick("Momentum", 2)), All(Powerup("Sunsetter"), Powerup("HeliacalPower", 3)), All(Powerup("HeliacalPower"), Powerup("SolarWind")), All(Powerup("HeliacalPower", 3), Trick("Movement", 1)), All(Powerup("Sunsetter"), Trick("Movement", 2)), All(Powerup("ClingGem", 4), Trick("ClingAbuse", 1)), All(Powerup("Slide"), Powerup("SolarWind"), Trick("Movement", 1))), Loc("CsMain")), Loc("PillarRoom"))
end
},
CsKeepEntryMain = {
locRefs = { "CsMain", "SansaKeep" },
logic = function()
return Any(Loc("CsMain"), Loc("SansaKeep"))
end
},
CsKeepEntryRamp = {
locRefs = { "CsMain", "SansaKeep" },
logic = function()
return Any(All(Any(Powerup("DreamBreaker"), Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Trick("Movement", 1)), Loc("CsMain")), Loc("SansaKeep"))
end
},
CsBaileyEntry = {
locRefs = { "CsMain", "EbEntryCastle" },
logic = function()
return Any(Loc("CsMain"), Loc("EbEntryCastle"))
end
},
MainLibrary = {
locRefs = { "CsMain", "LibSaveNearGreaves" },
logic = function()
return Any(All(Powerup("DreamBreaker"), Loc("CsMain")), All(Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 2), All(Powerup("DreamBreaker"), Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("SolarWind"), Powerup("HeliacalPower"), Trick("Movement", 1))), Loc("LibSaveNearGreaves")))
end
},
Restricted = {
locRefs = { "MainLibrary" },
logic = function()
return All(Key(), Loc("MainLibrary"))
end
},
LibSaveNearGreaves = {
locRefs = { "MainLibrary" },
logic = function()
return All(Any(All(Powerup("DreamBreaker"), Powerup("Slide")), All(Powerup("HeliacalPower", 3), Trick("Movement", 2)), All(Powerup("ClingGem", 2), Trick("Movement", 3), Any(Powerup("Sunsetter"), Powerup("HeliacalPower"))), All(Powerup("SolarWind"), Powerup("HeliacalPower"), Trick("Movement", 2))), Loc("MainLibrary"))
end
},
SkCastleRampEntry = {
locRefs = { "SansaKeep", "CsKeepEntryRamp" },
logic = function()
return Any(All(Any(Powerup("ClingGem", 2), Powerup("HeliacalPower", 3), Powerup("Slide"), All(Powerup("HeliacalPower"), Trick("Movement", 1), Trick("OneWall", 1))), Loc("SansaKeep")), Loc("CsKeepEntryRamp"))
end
},
SkCastleMainEntry = {
locRefs = { "SansaKeep", "CsKeepEntryMain" },
logic = function()
return Any(Loc("SansaKeep"), Loc("CsKeepEntryMain"))
end
},
SkCastleClimbEntry = {
locRefs = { "CsKeepClimbEntrance" },
logic = function()
return Loc("CsKeepClimbEntrance")
end
},
SkUnderbellyEntry = {
locRefs = { "SansaKeep", "SansaHole" },
logic = function()
return Any(All(Any(Powerup("Sunsetter"), Powerup("HeliacalPower"), Powerup("SolarWind")), Loc("SansaKeep")), Loc("SansaHole"))
end
},
SkTheatreEntry = {
locRefs = { "SansaKeep", "ThKeepEntry" },
logic = function()
return Any(All(Any(Powerup("HeliacalPower", 3), Powerup("SolarWind"), Powerup("ClingGem", 2), All(Powerup("HeliacalPower"), Trick("Movement", 2))), Loc("SansaKeep")), Loc("ThKeepEntry"))
end
},
SansaKeep = {
locRefs = { "SkTheatreEntry", "SkUnderbellyEntry", "SkCastleRampEntry", "SkCastleMainEntry" },
logic = function()
return Any(All(Any(Powerup("ClingGem", 2), Powerup("SolarWind"), Powerup("HeliacalPower", 3), All(Powerup("HeliacalPower"), Trick("Movement", 2))), Loc("SkTheatreEntry")), All(Any(Powerup("Sunsetter"), Powerup("HeliacalPower"), Powerup("SolarWind"), Trick("Movement", 1)), Loc("SkUnderbellyEntry")), Loc("SkCastleRampEntry"), Loc("SkCastleMainEntry"))
end
},
Sunsetter = {
locRefs = { "SansaKeep" },
logic = function()
return All(Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 2), Powerup("Sunsetter"), Trick("Movement", 2), Key()), Loc("SansaKeep"))
end
},
EmptyBailey = {
locRefs = { "EbEntryRuins", "EbEntryCastle", "EbEntryUnderBelly", "EbEntryTheatre" },
logic = function()
return Any(All(Any(Powerup("HeliacalPower", 3), Powerup("SolarWind"), All(Powerup("Sunsetter"), Trick("SunsetterAbuse", 2)), All(Powerup("ClingGem", 2), Powerup("HeliacalPower"))), Loc("EbEntryRuins")), Loc("EbEntryCastle"), Loc("EbEntryUnderBelly"), Loc("EbEntryTheatre"))
end
},
EbEntryUnderBelly = {
locRefs = { "EmptyBailey", "BaileyHole" },
logic = function()
return Any(All(Any(Powerup("Sunsetter"), Powerup("HeliacalPower"), Powerup("SolarWind")), Loc("EmptyBailey")), Loc("BaileyHole"))
end
},
EbEntryRuins = {
locRefs = { "TowerRuinsEntrance", "EmptyBailey" },
logic = function()
return All(Any(Loc("TowerRuinsEntrance"), Loc("EmptyBailey")), Any(Powerup("HeliacalPower", 3), Powerup("SolarWind"), All(Powerup("Sunsetter"), Trick("SunsetterAbuse", 2)), All(Powerup("ClingGem", 2), Powerup("HeliacalPower"))))
end
},
EbEntryTheatre = {
locRefs = { "EmptyBailey", "PillarRoom" },
logic = function()
return Any(Loc("EmptyBailey"), Loc("PillarRoom"))
end
},
EbEntryCastle = {
locRefs = { "CsBaileyEntry", "EmptyBailey" },
logic = function()
return Any(Loc("CsBaileyEntry"), Loc("EmptyBailey"))
end
},
TowerRuinsEntrance = {
locRefs = { "EbEntryRuins", "TowerRuinsKeep" },
logic = function()
return Any(All(Any(Powerup("HeliacalPower", 3), Powerup("SolarWind"), All(Powerup("Sunsetter"), Trick("SunsetterAbuse", 2)), All(Powerup("ClingGem", 2), Powerup("HeliacalPower"))), Loc("EbEntryRuins")), Loc("TowerRuinsKeep"))
end
},
TowerRuinsKeep = {
locRefs = { "TowerRuinsEntrance", "FinalBoss" },
logic = function()
return Any(All(Any(All(Powerup("HeliacalPower", 3), Trick("Movement", 3)), All(Powerup("SolarWind"), Powerup("AscendantLight"), Trick("Movement", 1)), All(Powerup("Sunsetter"), Powerup("HeliacalPower"), Powerup("ClingGem", 2), Trick("Movement", 3), Trick("ClingAbuse", 2)), All(Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("Sunsetter"))), Loc("TowerRuinsEntrance")), Loc("FinalBoss"))
end
},
SansaHole = {
locRefs = { "HpSave", "BaileyHole", "MainUnderbelly", "SkUnderbellyEntry" },
logic = function()
return Any(All(Powerup("Sunsetter"), Any(All(Powerup("Slide"), Loc("HpSave")), Loc("BaileyHole"), Loc("MainUnderbelly"))), Loc("SkUnderbellyEntry"))
end
},
BaileyHole = {
locRefs = { "EbEntryUnderBelly", "SansaHole", "MainUnderbelly" },
logic = function()
return Any(All(Powerup("Sunsetter"), Any(Loc("EbEntryUnderBelly"), Loc("SansaHole"))), Loc("MainUnderbelly"))
end
},
PrisonHole = {
locRefs = { "PEntryUnderBelly", "MainUnderbelly" },
logic = function()
return Any(All(Powerup("DreamBreaker"), Loc("PEntryUnderBelly")), All(Any(Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Powerup("SolarWind")), Loc("MainUnderbelly")))
end
},
MainUnderbelly = {
locRefs = { "BaileyHole", "HpSave", "SansaHole", "PrisonHole" },
logic = function()
return Any(All(Powerup("HeliacalPower", 4), Powerup("Sunsetter"), Trick("Movement", 2), Trick("OneWall", 2), Loc("BaileyHole")), All(Any(Powerup("DreamBreaker"), All(Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 2))), Loc("HpSave")), All(Powerup("Sunsetter"), Powerup("Slide"), Loc("SansaHole")), Loc("PrisonHole"))
end
},
VAscendantLight = {
locRefs = { "PrisonHole" },
logic = function()
return All(Powerup("DreamBreaker"), Loc("PrisonHole"))
end
},
HpSave = {
locRefs = { "BaileyHole", "MainUnderbelly" },
logic = function()
return Any(All(Powerup("Slide"), Any(Powerup("Sunsetter"), All(Powerup("HeliacalPower"), Trick("Movement", 1))), Loc("BaileyHole")), All(Powerup("DreamBreaker"), Any(All(Powerup("HeliacalPower"), Any(Powerup("HeliacalPower", 3), Powerup("SolarWind"))), All(Powerup("ClingGem", 2), Powerup("Sunsetter"))), Loc("MainUnderbelly")))
end
},
ThCastleEntryPillar = {
locRefs = { "PillarRoom", "CsTheatreEntryNearPrison" },
logic = function()
return Any(All(Any(Powerup("HeliacalPower"), Powerup("ClingGem", 2), Powerup("Sunsetter")), Loc("PillarRoom")), Loc("CsTheatreEntryNearPrison"))
end
},
ThCastleEntryMain = {
locRefs = { "CsTheatreEntrance", "TheatreEntrance" },
logic = function()
return Any(Loc("CsTheatreEntrance"), Loc("TheatreEntrance"))
end
},
ThBaileyEntry = {
locRefs = { "PillarRoom", "EbEntryTheatre" },
logic = function()
return Any(All(Any(Powerup("HeliacalPower"), Powerup("ClingGem", 2), Powerup("Sunsetter")), Loc("PillarRoom")), Loc("EbEntryTheatre"))
end
},
ThKeepEntry = {
locRefs = { "OtherTheatrePath", "SkTheatreEntry" },
logic = function()
return Any(All(Any(Powerup("AscendantLight"), Powerup("HeliacalPower"), Powerup("ClingGem", 2)), Loc("OtherTheatrePath")), Loc("SkTheatreEntry"))
end
},
ThDungeonEntry = {
locRefs = { "OtherTheatrePath", "PEntryTheatre" },
logic = function()
return Any(All(Any(Powerup("AscendantLight"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 2), All(Powerup("Sunsetter"), Powerup("HeliacalPower"))), Loc("OtherTheatrePath")), Loc("PEntryTheatre"))
end
},
PillarRoom = {
locRefs = { "ThCastleEntryPillar", "ThBaileyEntry" },
logic = function()
return All(Any(Loc("ThCastleEntryPillar"), Loc("ThBaileyEntry")), Any(Powerup("HeliacalPower"), Powerup("ClingGem", 2), Powerup("Sunsetter")))
end
},
TheatreEntrance = {
locRefs = { "MainTheatre", "ThCastleEntryMain" },
logic = function()
return Any(All(Any(Powerup("ClingGem"), Powerup("HeliacalPower"), Powerup("SolarWind")), Loc("MainTheatre")), All(Any(Powerup("ClingGem", 2), All(Powerup("Slide"), Powerup("SolarWind"), Powerup("HeliacalPower", 3)), All(Powerup("HeliacalPower"), Powerup("Sunsetter"))), Loc("ThCastleEntryMain")))
end
},
OtherTheatrePath = {
locRefs = { "ThKeepEntry", "ThDungeonEntry" },
logic = function()
return Any(All(Any(Loc("ThKeepEntry"), Loc("ThDungeonEntry")), Any(Powerup("ClingGem", 2), Powerup("AscendantLight"))), All(Powerup("HeliacalPower"), Loc("ThKeepEntry")), All(Any(Powerup("HeliacalPower", 3), All(Powerup("Sunsetter"), Powerup("HeliacalPower"))), Loc("ThDungeonEntry")))
end
},
MainTheatre = {
locRefs = { "TheatreEntrance", "PillarRoom", "OtherTheatrePath" },
logic = function()
return Any(All(Any(Powerup("ClingGem", 2), Powerup("HeliacalPower", 3), All(Powerup("Sunsetter"), Powerup("HeliacalPower"))), Loc("TheatreEntrance")), All(Powerup("Sunsetter"), Any(Powerup("ClingGem", 2), All(Powerup("HeliacalPower", 4))), Loc("PillarRoom")), All(Powerup("ClingGem", 2), Any(Powerup("HeliacalPower"), All(Powerup("Slide"), Powerup("SolarWind"))), Loc("OtherTheatrePath")))
end
},
FinalBoss = {
locRefs = { "TowerRuinsKeep" },
logic = function()
return Any(Ending(), All(Powerup("ClingGem", 2), Any(Powerup("HeliacalPower", 3), All(Powerup("HeliacalPower"), Powerup("Sunsetter"))), Loc("TowerRuinsKeep")))
end
}
}

local selectedSpawn = nil

function Any(...)
    local result = math.max(...)
    --print(string.format("Any(...) = %d", result))
    return result
end

function All(...)
    local result = math.min(...)
    --print(string.format("All(...) = %d", result))
    return result
end

function Loc(name)
    local result = locations[name].access
    --print(string.format("Loc(%s) = %d", name, result))
    return result
end

function Powerup(name, count)
    count = count or 1
    local result = 0
    if Tracker:ProviderCountForCode(name) >= count then
        result = 2
    end
    --print(string.format("Powerup(%s, %d) = %d", name, count, result))
    return result
end

function Trick(name, difficulty)
    local result = 1
    if Tracker:ProviderCountForCode(name) >= difficulty then
        result = 2
    end
    --print(string.format("Trick(%s, %d) = %d", name, difficulty, result))
    return result
end

function Key()
    local result = 0
    if Tracker:ProviderCountForCode("smallkeys") > 0 then
        result = Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1)))
    end
    --print(string.format("Key() = %d", result))
    return result
end

function Ending()
    if Tracker:ProviderCountForCode("bigkeys") == 5 then
        return 2
    end
    return 0
end

function checkLock(access)
    if access == 2 then
        return 1
    elseif access == 1 then
        return 1, AccessibilityLevel.SequenceBreak
    end
    return 1, AccessibilityLevel.Inspect
end

function checkLockNoInspect(access)
    if access == 2 then
        return 1
    elseif access == 1 then
        return 1, AccessibilityLevel.SequenceBreak
    end
    return 0
end

-- the time trial in the starting room
function Ability0()
    return checkLockNoInspect(All(Powerup("DreamBreaker"), Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), Powerup("Sunsetter")))
end

-- where dream breaker normally is
function Ability1()
    return checkLock(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 3)), All(Powerup("HeliacalPower", 3), Trick("Movement", 3), Trick("OneWall", 2)), All(Powerup("HeliacalPower", 3), Powerup("SolarWind"), Trick("Movement", 2), Trick("OneWall", 2))))
end

-- where the first health piece is
function Health0()
    return checkLock(Any(Any(Powerup("Sunsetter"), Powerup("AscendantLight"), Powerup("HeliacalPower"), All(Powerup("SolarWind"), Trick("Movement", 1)), All(Powerup("ClingGem", 4), Trick("ClingAbuse", 1))), Loc("CsMain")))
end

-- where slide normally is
function Ability2()
    return checkLock(Any(Powerup("Slide"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 2), All(Powerup("Sunsetter"), Powerup("HeliacalPower")), All(Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("Sunsetter"), Trick("Movement", 2))))
end

-- black hole parkour off the beaten path
function Ability3()
    return checkLock(Any(Powerup("ClingGem", 6), All(Powerup("AscendantLight"), Powerup("HeliacalPower", 3)), All(Powerup("HeliacalPower", 3), Powerup("SolarWind"), Trick("Movement", 2), Trick("OneWall", 2))))
end

-- up in the rafters
function SmallKey0()
    return checkLock(Any(All(Powerup("HeliacalPower", 3), Any(Powerup("Sunsetter"), Powerup("SolarWind"))), All(Powerup("ClingGem", 4), Trick("ClingAbuse", 2))))
end

-- missable high walled room
function Health1()
    return checkLock(All(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))), Any(Powerup("ClingGem", 4), All(Powerup("HeliacalPower", 3)))))
end

-- strong eyes' lair
function SmallKey1()
    return checkLock(Powerup("DreamBreaker"))
end

-- chillin' on a ledge by the window
function SmallKey2()
    return checkLock(Any(Powerup("Sunsetter"), Powerup("SolarWind"), All(Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("ClingGem", 2), Trick("ClingAbuse", 1))))
end

-- the time trial behind a locked door
function Ability6()
    return checkLockNoInspect(Key())
end

-- tucked deep in a corner in the bouncer room
function Health2()
    return checkLockNoInspect(Any(Powerup("ClingGem", 6), All(Powerup("HeliacalPower", 3), Powerup("HeliacalPower"), Trick("Movement", 2))))
end

-- the extremely slappable wheel guy room
function Health3()
    return checkLock(Any(Powerup("AscendantLight"), Powerup("ClingGem", 2), All(Powerup("HeliacalPower", 3), Trick("OneWall", 1))))
end

-- the old softlock room
function Health4()
    return checkLock(Any(All(Powerup("ClingGem", 6), Trick("ClingAbuse", 3), Trick("Movement", 2)), All(Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("HeliacalPower"), Powerup("AscendantLight")), All(Powerup("SolarWind"), Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Trick("OneWall", 2), Trick("SunsetterAbuse", 2))))
end

-- the goatling about to jump into the haze
function Goatling4()
    return checkLockNoInspect(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))))
end

-- cool moon room
function Ability7()
    return checkLockNoInspect(Any(All(Powerup("ClingGem", 6), Trick("ClingAbuse", 1)), All(Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("Sunsetter"), Powerup("ClingGem", 4), Trick("ClingAbuse", 1)), All(Powerup("Sunsetter"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 2)), All(Powerup("SolarWind"), Powerup("ClingGem", 2), Powerup("HeliacalPower", 3))))
end

-- through the wallkick tunnel
function SmallKey3()
    return checkLock(All(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1)), All(Powerup("HeliacalPower", 3), Powerup("HeliacalPower"), Trick("OneWall", 1)), All(Powerup("SolarWind"), Powerup("HeliacalPower"), Trick("Movement", 1)), All(Powerup("SolarWind"), Trick("Movement", 2))), Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), All(Powerup("HeliacalPower", 3), Powerup("SolarWind"), Trick("Movement", 1), Trick("OneWall", 1)), All(Powerup("ClingGem", 2), Powerup("SolarWind")), All(Powerup("ClingGem", 2), Powerup("HeliacalPower", 3)), All(Powerup("ClingGem", 2), Powerup("HeliacalPower"), Trick("Movement", 2), Trick("OneWall", 1)))))
end

-- in the pit next to the dungeon entrance
function Health5()
    return checkLock(Any(Powerup("ClingGem", 4), Powerup("HeliacalPower")))
end

-- the goatling that calls you bubble girl
function Goatling5()
    return checkLock(Any(Powerup("HeliacalPower"), Powerup("ClingGem", 4)))
end

-- on the ledge above the bailey entrance
function Health6()
    return checkLock(Any(Powerup("ClingGem", 4), All(Powerup("HeliacalPower", 3), Powerup("HeliacalPower"), Trick("Movement", 1)), All(Powerup("SolarWind"), Powerup("HeliacalPower"))))
end

-- next to a bouncer in the massive room
function Ability8()
    return checkLock(Any(All(Powerup("AscendantLight"), Trick("Movement", 1), Any(Powerup("HeliacalPower", 3), Powerup("SolarWind"))), All(Powerup("HeliacalPower", 3), Powerup("HeliacalPower"), Trick("OneWall", 2)), All(Powerup("ClingGem", 6), Any(Powerup("HeliacalPower"), Powerup("Sunsetter"), Powerup("SolarWind"), Powerup("AscendantLight")))))
end

-- in the room with two other ones to each side
function Ability9()
    return checkLock(Any(Powerup("HeliacalPower", 3), All(Powerup("ClingGem", 6), Any(Powerup("Sunsetter"), Powerup("HeliacalPower"), Trick("ClingAbuse", 1))), All(Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("SolarWind"), Trick("Movement", 1))))
end

-- the time trial amidst the books
function Ability10()
    return checkLockNoInspect(All(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))), Any(All(Powerup("Sunsetter"), Trick("Movement", 2)), All(Powerup("HeliacalPower", 3), Trick("Movement", 1)), All(Powerup("SolarWind"), Trick("Movement", 1)), All(Powerup("ClingGem", 6), Trick("Movement", 2), Trick("ClingAbuse", 1)), All(Powerup("Sunsetter"), Powerup("HeliacalPower"), Powerup("SolarWind")))))
end

-- where sun greaves normally is
function Ability11()
    return checkLock(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 2))))
end

-- the note next to the egg nest
function Note0()
    return checkLock(Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 4), Powerup("SolarWind")))
end

-- in the buttress room
function Health7()
    return checkLock(Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 4)))
end

-- in the hay behind the locked door
function Ability12()
    return checkLock(Any(Powerup("SolarWind"), Powerup("ClingGem", 4), All(Powerup("HeliacalPower"), Trick("Movement", 3))))
end

-- tucked deep behind the locked door
function Health8()
    return checkLock(Any(Powerup("SolarWind"), Powerup("ClingGem", 4), All(Powerup("HeliacalPower"), Trick("Movement", 3))))
end

-- where strikebreak normally is
function Ability13()
    return checkLockNoInspect(All(Powerup("Strikebreak"), Any(Powerup("ClingGem", 4), Powerup("SolarWind"), All(Powerup("HeliacalPower"), Trick("Movement", 2)))))
end

-- where sunsetter normally is
function Ability14()
    return checkLock(All(Powerup("DreamBreaker"), Any(Powerup("Sunsetter"), All(Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("ClingGem", 2), Trick("ClingAbuse", 1)))))
end

-- in an alcove next to the locked door
function Health9()
    return checkLock(Any(Powerup("Sunsetter"), Powerup("HeliacalPower", 3), Powerup("SolarWind"), Trick("Movement", 1)))
end

-- in the room with a lever on each side
function SmallKey4()
    return checkLock(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))))
end

-- tucked near the theatre entrance
function Ability15()
    return checkLockNoInspect(Any(Powerup("Sunsetter"), Powerup("HeliacalPower"), Powerup("ClingGem", 4)))
end

-- at the end of the parkour
function BigKey0()
    return checkLockNoInspect(Any(All(Powerup("AscendantLight"), Any(All(Powerup("ClingGem", 4), Any(Powerup("Sunsetter"), Powerup("HeliacalPower", 3))), All(Powerup("Sunsetter"), Powerup("HeliacalPower", 3)))), All(Powerup("DreamBreaker"), Powerup("Slide"), Powerup("SolarWind"), Powerup("Sunsetter"), Powerup("ClingGem", 2), Powerup("HeliacalPower", 3))))
end

-- the time trial at the end of the parkour
function Ability16()
    return checkLockNoInspect(All(Powerup("DreamBreaker"), Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), Powerup("Sunsetter"), Powerup("AscendantLight")))
end

-- the chair in the middle of the parkour
function Chair8()
    return checkLockNoInspect(Any(All(Powerup("AscendantLight"), Any(All(Powerup("ClingGem", 4), Any(Powerup("Sunsetter"), Powerup("HeliacalPower", 3))), All(Powerup("Sunsetter"), Powerup("HeliacalPower", 3)))), All(Powerup("DreamBreaker"), Powerup("Slide"), Powerup("SolarWind"), Powerup("Sunsetter"), Powerup("ClingGem", 2), Powerup("HeliacalPower", 3))))
end

-- guarded by the hand and soldier
function BigKey1()
    return checkLock(Any(Powerup("Sunsetter"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 4), Powerup("SolarWind"), All(Trick("Movement", 2), Loc("EbEntryUnderBelly"))))
end

-- where solar wind normally is
function Ability17()
    return checkLockNoInspect(All(Powerup("Slide"), Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))), Any(Powerup("SolarWind"), All(Powerup("HeliacalPower"), Trick("Movement", 2)))))
end

-- in the tower in the middle
function Health10()
    return checkLock(Any(Powerup("Sunsetter"), All(Powerup("HeliacalPower"), Trick("ReverseKick", 2)), All(Powerup("HeliacalPower", 3), Trick("OneWall", 1)), All(Powerup("SolarWind"), Any(Powerup("ClingGem", 6), All(Powerup("Sunsetter"), Powerup("HeliacalPower"), Trick("Movement", 2)), All(Powerup("Sunsetter"), Powerup("HeliacalPower", 3), Trick("Movement", 2)), All(Powerup("ClingGem", 4), Powerup("Sunsetter"), Powerup("HeliacalPower", 3))))))
end

-- under the cheese bell
function Ability18()
    return checkLock(Any(All(Powerup("SolarWind"), Any(Powerup("ClingGem", 6), All(Powerup("Sunsetter"), Powerup("HeliacalPower"), Trick("Movement", 2)))), All(Powerup("Sunsetter"), Powerup("HeliacalPower", 3), Trick("Movement", 2)), All(Powerup("ClingGem", 4), Powerup("Sunsetter"), Powerup("HeliacalPower", 3))))
end

-- the locked up time trial
function Ability19()
    return checkLockNoInspect(All(Powerup("DreamBreaker"), Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), Powerup("Sunsetter")))
end

-- near the entrance from sansa keep
function Health11()
    return checkLock(Any(Powerup("HeliacalPower", 3), All(Powerup("Sunsetter"), Powerup("HeliacalPower"))))
end

-- the soul cutter lever room
function BigKey2()
    return checkLock(All(Powerup("DreamBreaker"), Powerup("Sunsetter"), Any(All(Powerup("SoulCutter"), Any(Powerup("AscendantLight"), Powerup("ClingGem", 6))), All(Powerup("HeliacalPower", 3), Powerup("SolarWind")))))
end

-- where ascendant light normally is
function Ability20()
    return checkLock(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 3))))
end

-- in an alcove behind some pillars
function Health12()
    return checkLock(Any(Powerup("DreamBreaker"), All(Powerup("Sunsetter"), Trick("Knowledge", 1))))
end

-- on a missable ledge in the centre
function SmallKey6()
    return checkLock(Any(Powerup("Sunsetter"), Powerup("SolarWind")))
end

-- the note on a high ledge in the big room
function Note1()
    return checkLock(All(Powerup("HeliacalPower"), Powerup("Sunsetter"), Any(Powerup("ClingGem", 6), Powerup("HeliacalPower", 3), Powerup("SolarWind"))))
end

-- black hole parkour behind strikebreak wall
function Ability21()
    return checkLockNoInspect(All(Powerup("Strikebreak"), Powerup("AscendantLight"), Any(Powerup("HeliacalPower"), Powerup("Sunsetter"), Powerup("SolarWind"), Powerup("ClingGem", 2))))
end

-- the locked up time trial
function Ability22()
    return checkLockNoInspect(All(Powerup("DreamBreaker"), Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), Powerup("Sunsetter")))
end

-- behind the locked door
function Ability23()
    return checkLockNoInspect(Key())
end

-- the note behind the locked door
function Note2()
    return checkLockNoInspect(Key())
end

-- the note near the empty bailey entrance
function Note3()
    return checkLock(Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), Powerup("AscendantLight"), Powerup("SolarWind"), All(Powerup("HeliacalPower"), Powerup("Sunsetter")), All(Powerup("HeliacalPower"), Trick("ReverseKick", 1)), All(Powerup("Sunsetter"), Trick("Movement", 1))))
end

-- on top of the big building
function Health13()
    return checkLockNoInspect(Any(Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Powerup("SolarWind")))
end

-- where cling gem normally is
function Ability24()
    return checkLock(Any(Powerup("ClingGem", 6), Powerup("HeliacalPower", 3), All(Powerup("HeliacalPower"), Powerup("Sunsetter"), Trick("Movement", 1))))
end

-- atop the tower
function BigKey3()
    return checkLock(Any(All(Powerup("ClingGem", 2), Any(Powerup("HeliacalPower", 3), All(Powerup("HeliacalPower"), Powerup("Sunsetter")))), All(Powerup("HeliacalPower", 3), Powerup("SolarWind"), Trick("Movement", 3), Trick("OneWall", 2))))
end

-- the time trial at the tower entrance
function Ability25()
    return checkLockNoInspect(All(Powerup("DreamBreaker"), Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), Powerup("Sunsetter")))
end

-- on a beam in the corner
function Ability26()
    return checkLock(Any(All(Powerup("HeliacalPower", 3), Any(Powerup("ClingGem", 2), Powerup("SolarWind"), Powerup("Sunsetter"))), All(Powerup("SolarWind"), Powerup("ClingGem", 2)), All(Powerup("Sunsetter"), Powerup("HeliacalPower", 3), Trick("SunsetterAbuse", 1), Trick("Movement", 2), Trick("OneWall", 1))))
end

-- the locked up time trial
function Ability27()
    return checkLockNoInspect(All(Powerup("DreamBreaker"), Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), Powerup("Sunsetter")))
end

-- the goatling that will kill again
function Goatling14()
    return checkLock(Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 6), All(Powerup("SolarWind"), Powerup("HeliacalPower"))))
end

-- the chair near the courtyard
function Chair13()
    return checkLock(Any(Powerup("ClingGem", 4), All(Powerup("SolarWind"), Powerup("HeliacalPower"), Powerup("HeliacalPower", 3))))
end

-- the chair in the soul cutter zone
function Chair14()
    return checkLock(All(Powerup("Strikebreak"), Powerup("ClingGem", 6), Any(All(Powerup("Strikebreak"), Powerup("SolarWind"), Powerup("HeliacalPower"), Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Trick("ClingAbuse", 3), Trick("OneWall", 3), Trick("Movement", 4), Trick("Momentum", 3)), All(Powerup("SoulCutter"), Any(Powerup("HeliacalPower"), Powerup("SolarWind"))))))
end

-- behind three maximum security cages
function BigKey4()
    return checkLock(All(Powerup("Strikebreak"), Powerup("ClingGem", 6), Any(All(Powerup("Strikebreak"), Powerup("SolarWind"), Powerup("HeliacalPower"), Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Trick("ClingAbuse", 3), Trick("OneWall", 3), Trick("Movement", 4), Trick("Momentum", 3)), All(Powerup("SoulCutter"), Any(Powerup("HeliacalPower"), Powerup("SolarWind"))))))
end

-- where soul cutter normally is
function Ability28()
    return checkLock(All(Powerup("Strikebreak"), Any(All(Powerup("SolarWind"), Powerup("HeliacalPower", 3), Powerup("HeliacalPower"), Powerup("ClingGem", 6), Powerup("Sunsetter"), Trick("Movement", 3), Trick("OneWall", 3), Trick("Knowledge", 2)), All(Powerup("Strikebreak"), Powerup("SolarWind"), Powerup("HeliacalPower"), Powerup("HeliacalPower", 3), Powerup("Sunsetter"), Trick("ClingAbuse", 3), Trick("OneWall", 3), Trick("Movement", 4), Trick("Momentum", 3)), All(Powerup("SoulCutter"), Any(Powerup("HeliacalPower"), Powerup("SolarWind"))))))
end

-- in the back on a pillar
function Health15()
    return checkLock(Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 6)))
end

-- behind the locked door
function Ability29()
    return checkLockNoInspect(All(Key(), Any(Powerup("HeliacalPower", 3), Powerup("ClingGem", 2))))
end

local locOrder = {
    "VDreamBreaker",
    "EarlyPrison",
    "LatePrison",
    "StrongEyes",
    "PEntryCastle",
    "PEntryUnderBelly",
    "PEntryTheatre",
    "CsOldSoftlockRoom",
    "CsKeepClimbEntrance",
    "CsMain",
    "CsTheatreEntrance",
    "CsPrisonEntry",
    "CsLibraryEntry",
    "CsTheatreEntryNearPrison",
    "CsKeepEntryMain",
    "CsKeepEntryRamp",
    "CsBaileyEntry",
    "MainLibrary",
    "Restricted",
    "LibSaveNearGreaves",
    "SkCastleRampEntry",
    "SkCastleMainEntry",
    "SkCastleClimbEntry",
    "SkUnderbellyEntry",
    "SkTheatreEntry",
    "SansaKeep",
    "Sunsetter",
    "EmptyBailey",
    "EbEntryUnderBelly",
    "EbEntryRuins",
    "EbEntryTheatre",
    "EbEntryCastle",
    "TowerRuinsEntrance",
    "TowerRuinsKeep",
    "SansaHole",
    "BaileyHole",
    "PrisonHole",
    "MainUnderbelly",
    "VAscendantLight",
    "HpSave",
    "ThCastleEntryPillar",
    "ThCastleEntryMain",
    "ThBaileyEntry",
    "ThKeepEntry",
    "ThDungeonEntry",
    "PillarRoom",
    "TheatreEntrance",
    "OtherTheatrePath",
    "MainTheatre",
    "FinalBoss"
}

function tracker_on_accessibility_updating()
    if selectedSpawn == nil then
        for item in pairs(spawns) do
            if Tracker:ProviderCountForCode(item) > 0 then
                selectedSpawn = item
                break
            end
        end
    end
    if selectedSpawn ~= nil then
        for i,v in pairs(locations) do
            v.access = -1
        end
        locations[spawns[selectedSpawn]].access = 2
        local loop = true
        while loop do
            loop = false
            for i in ipairs(locOrder) do
                local v = locations[locOrder[i]]
                if v.access < 2 then
                    local chk = false
                    for j,w in pairs(v.locRefs) do
                        if locations[w].access > -1 then
                            chk = true
                            break
                        end
                    end
                    if chk then
                        v.access = v.logic()
                    end
                    if v.access == -1 then
                        loop = true
                    end
                end
            end
        end
    end
end

function startNotSet()
    if selectedSpawn == nil then
        return 1
    else
        return 0
    end
end

function locAccess(name)
    local access = locations[name].access
    if access == 2 then
        return 1
    elseif access == 1 then
        return 1, AccessibilityLevel.SequenceBreak
    end
    return 0
end