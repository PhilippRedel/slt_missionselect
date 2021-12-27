-- -1 = NONE
-- 0 = CUSTOM MISSION
-- 1 = DEATHMATCH
-- 2 = RACE
-- 3 = SURVIVAL
-- 4 = TEAM DEATHMATCH
-- 5 = NONE
-- 6 = GANG ATTACK
-- 7 = NONE
-- 8 = BASE JUMPING
-- 9 = VEHICLE DEATHMATCH
-- 10 = RACE LAND
-- 11 = RACE FOOT
-- 12 = RACE BICYCLE
-- 13 = RACE WATER
-- 14 = RACE AIR
-- 15 = LAST TEAM STANDING
-- 16 = CAPTURE THE FLAG
-- 17 = HEIST PREPARATION
-- 18 = HEIST
-- 19 = RACE STUNT

local scaleform_data = {
    ['left_title'] = "Vote on the next Job",
    ['right_title'] = "0 / 2 Votes",
    ['cards'] = {
        {
            ['title'] = "Zombie Hunt",
            ['description'] = 'Einer ist der Fänger, die anderen haben am Anfang Zeit, innerhalb des eingegrenzten Gebietes davonzufahren. Es gibt Gebiete mit Map- und Spielernamen-Einblendungen, als auch welche ohne. Ziel ist es, nicht vom Fänger gerammt zu werden. Wer erwischt wurde, wird selbst auch zu einem Fänger (Taste "Ich wurde erwischt" drücken), bis niemand mehr übrig ist.',
            ['txd'] = "cardimages",
            ['txn'] = "zombie_hunt",
            ['rp_multiplier'] = 0,
            ['cash_multiplier'] = 1500,
            ['icon'] = 9,
            ['icon_color'] = 4,
            ['ap_multiplier'] = 0,
            ['details'] = {
                {
                    ['type'] = 1,
                    ['left_text'] = "Rating",
                    ['right_text'] = "95%"
                },
                {
                    ['type'] = 3,
                    ['left_text'] = "Created by",
                    ['right_text'] = "SleepingTears"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Players",
                    ['right_text'] = "2-10"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Type",
                    ['right_text'] = "Vehicle Deathmatch"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Area",
                    ['right_text'] = "Palmer-Taylor Power Station"
                }
            }
        },
        {
            ['title'] = "Plane Race",
            ['description'] = "Random description for Card #2!\nCan use multiple lines (WOW)\n\nThis is nice!",
            ['txd'] = "cardimages",
            ['txn'] = "plane_race",
            ['rp_multiplier'] = 10,
            ['cash_multiplier'] = 1000,
            ['icon'] = 2,
            ['icon_color'] = 4,
            ['ap_multiplier'] = 2,
            ['details'] = {
                {
                    ['type'] = 1,
                    ['left_text'] = "Rating",
                    ['right_text'] = "55%"
                },
                {
                    ['type'] = 3,
                    ['left_text'] = "Created by",
                    ['right_text'] = "SleepingTears"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Players",
                    ['right_text'] = "2-10"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Type",
                    ['right_text'] = "Race"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Area",
                    ['right_text'] = "Great Ocean Highway"
                }
            }
        },
        {
            ['title'] = "Quad Wrestling",
            ['description'] = "Random description for Card #3!\nCan use multiple lines (WOW)\n\nThis is nice!",
            ['txd'] = "cardimages",
            ['txn'] = "quad_wrestling",
            ['rp_multiplier'] = 5,
            ['cash_multiplier'] = 2500,
            ['icon'] = 15,
            ['icon_color'] = 4,
            ['ap_multiplier'] = 0,
            ['details'] = {
                {
                    ['type'] = 1,
                    ['left_text'] = "Rating",
                    ['right_text'] = "84%"
                },
                {
                    ['type'] = 3,
                    ['left_text'] = "Created by",
                    ['right_text'] = "Philipp Redel"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Players",
                    ['right_text'] = "2-10"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Type",
                    ['right_text'] = "Stunt"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Area",
                    ['right_text'] = "Santa Monica Beach"
                }
            }
        },
        {
            ['title'] = "Quiz Run",
            ['description'] = "Random description for Card #4!\nCan use multiple lines (WOW)\n\nThis is nice!",
            ['txd'] = "cardimages",
            ['txn'] = "quiz_run",
            ['rp_multiplier'] = 10,
            ['cash_multiplier'] = 3,
            ['icon'] = 2,
            ['icon_color'] = 4,
            ['ap_multiplier'] = 8,
            ['details'] = {
                {
                    ['type'] = 1,
                    ['left_text'] = "Rating",
                    ['right_text'] = "95%"
                },
                {
                    ['type'] = 3,
                    ['left_text'] = "Created by",
                    ['right_text'] = "SleepingTears"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Players",
                    ['right_text'] = "2-10"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Type",
                    ['right_text'] = "Stuntrace"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Area",
                    ['right_text'] = "Downtown Vinewood"
                }
            }
        },
        {
            ['title'] = "Hitman",
            ['description'] = "Random description for Card #5!\nCan use multiple lines (WOW)\n\nThis is nice!",
            ['txd'] = "cardimages",
            ['txn'] = "hitman",
            ['rp_multiplier'] = 10,
            ['cash_multiplier'] = 3,
            ['icon'] = 3,
            ['icon_color'] = 4,
            ['ap_multiplier'] = 8,
            ['details'] = {
                {
                    ['type'] = 1,
                    ['left_text'] = "Rating",
                    ['right_text'] = "95%"
                },
                {
                    ['type'] = 3,
                    ['left_text'] = "Created by",
                    ['right_text'] = "SleepingTears"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Players",
                    ['right_text'] = "2-10"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Type",
                    ['right_text'] = "Stuntrace"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Area",
                    ['right_text'] = "Downtown Vinewood"
                }
            }
        },
        {
            ['title'] = "Car stacking",
            ['description'] = "Random description for Card #6!\nCan use multiple lines (WOW)\n\nThis is nice!",
            ['txd'] = "cardimages",
            ['txn'] = "car_stacking",
            ['rp_multiplier'] = 10,
            ['cash_multiplier'] = 3,
            ['icon'] = 19,
            ['icon_color'] = 4,
            ['ap_multiplier'] = 8,
            ['details'] = {
                {
                    ['type'] = 1,
                    ['left_text'] = "Rating",
                    ['right_text'] = "95%"
                },
                {
                    ['type'] = 3,
                    ['left_text'] = "Created by",
                    ['right_text'] = "SleepingTears"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Players",
                    ['right_text'] = "2-10"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Type",
                    ['right_text'] = "Stuntrace"
                },
                {
                    ['type'] = 1,
                    ['left_text'] = "Area",
                    ['right_text'] = "Downtown Vinewood"
                }
            }
        }
    },
    ['buttons'] = {
        {
            ['title'] = "Replay",
            ['action'] = ""
        },
        {
            ['title'] = "Refresh",
            ['action'] = ""
        },
        {
            ['title'] = "Freemode",
            ['action'] = ""
        }
    }
}

TriggerEvent('slt_missionselect:CreateMenu', scaleform_data)