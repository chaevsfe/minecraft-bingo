# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..7

#file refinement

execute if score cree77 random_cluster matches 1 if score buried_ancient_city_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score buried_ancient_city_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:buried_ancient_city_map}

execute if score cree77 random_cluster matches 2 if score buried_mineshaft_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score buried_mineshaft_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:buried_mineshaft_map}

execute if score cree77 random_cluster matches 3 if score buried_trial_chambers_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score buried_trial_chambers_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:buried_trial_chambers_map}

execute if score cree77 random_cluster matches 4 if score desert_pyramid_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score desert_pyramid_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:desert_pyramid_map}

execute if score cree77 random_cluster matches 5 if score ocean_monument_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score ocean_monument_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ocean_monument_map}

execute if score cree77 random_cluster matches 6 if score warm_ocean_ruins_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score warm_ocean_ruins_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:warm_ocean_ruins_map}

execute if score cree77 random_cluster matches 7 if score woodland_mansion_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score woodland_mansion_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:woodland_mansion_map}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}