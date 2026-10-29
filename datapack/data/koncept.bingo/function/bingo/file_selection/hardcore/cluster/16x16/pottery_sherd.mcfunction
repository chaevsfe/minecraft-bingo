# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..23

#file refinement

execute if score cree77 random_cluster matches 1 if score angler_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score angler_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:angler_pottery_sherd}

execute if score cree77 random_cluster matches 2 if score archer_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score archer_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:archer_pottery_sherd}

execute if score cree77 random_cluster matches 3 if score arms_up_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score arms_up_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:arms_up_pottery_sherd}

execute if score cree77 random_cluster matches 4 if score blade_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score blade_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blade_pottery_sherd}

execute if score cree77 random_cluster matches 5 if score brewer_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score brewer_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brewer_pottery_sherd}

execute if score cree77 random_cluster matches 6 if score burn_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score burn_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:burn_pottery_sherd}

execute if score cree77 random_cluster matches 7 if score danger_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score danger_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:danger_pottery_sherd}

execute if score cree77 random_cluster matches 8 if score explorer_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score explorer_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:explorer_pottery_sherd}

execute if score cree77 random_cluster matches 9 if score flow_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score flow_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:flow_pottery_sherd}

execute if score cree77 random_cluster matches 10 if score friend_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score friend_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:friend_pottery_sherd}

execute if score cree77 random_cluster matches 11 if score guster_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score guster_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:guster_pottery_sherd}

execute if score cree77 random_cluster matches 12 if score heart_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score heart_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:heart_pottery_sherd}

execute if score cree77 random_cluster matches 13 if score heartbreak_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score heartbreak_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:heartbreak_pottery_sherd}

execute if score cree77 random_cluster matches 14 if score howl_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score howl_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:howl_pottery_sherd}

execute if score cree77 random_cluster matches 15 if score miner_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score miner_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:miner_pottery_sherd}

execute if score cree77 random_cluster matches 16 if score mourner_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score mourner_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:mourner_pottery_sherd}

execute if score cree77 random_cluster matches 17 if score plenty_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score plenty_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:plenty_pottery_sherd}

execute if score cree77 random_cluster matches 18 if score prize_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score prize_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:prize_pottery_sherd}

execute if score cree77 random_cluster matches 19 if score scrape_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score scrape_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:scrape_pottery_sherd}

execute if score cree77 random_cluster matches 20 if score sheaf_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 20 if score sheaf_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sheaf_pottery_sherd}

execute if score cree77 random_cluster matches 21 if score shelter_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 21 if score shelter_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:shelter_pottery_sherd}

execute if score cree77 random_cluster matches 22 if score skull_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 22 if score skull_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:skull_pottery_sherd}

execute if score cree77 random_cluster matches 23 if score snort_pottery_sherd bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 23 if score snort_pottery_sherd bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:snort_pottery_sherd}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}