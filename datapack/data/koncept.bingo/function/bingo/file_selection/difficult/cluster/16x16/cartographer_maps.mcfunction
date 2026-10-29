# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..7

#file refinement

execute if score cree77 random_cluster matches 1 if score desert_village_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score desert_village_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:desert_village_map}

execute if score cree77 random_cluster matches 2 if score jungle_pyramid_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score jungle_pyramid_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:jungle_pyramid_map}

execute if score cree77 random_cluster matches 3 if score plains_village_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score plains_village_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:plains_village_map}

execute if score cree77 random_cluster matches 4 if score savanna_village_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score savanna_village_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:savanna_village_map}

execute if score cree77 random_cluster matches 5 if score snowy_village_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score snowy_village_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:snowy_village_map}

execute if score cree77 random_cluster matches 6 if score swamp_hut_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score swamp_hut_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:swamp_hut_map}

execute if score cree77 random_cluster matches 7 if score taiga_village_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score taiga_village_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:taiga_village_map}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}