# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..10

#file refinement

execute if score cree77 random_cluster matches 1 if score oak_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score oak_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:oak_hanging_sign}

execute if score cree77 random_cluster matches 2 if score spruce_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score spruce_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:spruce_hanging_sign}

execute if score cree77 random_cluster matches 3 if score birch_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score birch_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:birch_hanging_sign}

execute if score cree77 random_cluster matches 4 if score jungle_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score jungle_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:jungle_hanging_sign}

execute if score cree77 random_cluster matches 5 if score acacia_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score acacia_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:acacia_hanging_sign}

execute if score cree77 random_cluster matches 6 if score dark_oak_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score dark_oak_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dark_oak_hanging_sign}

execute if score cree77 random_cluster matches 7 if score mangrove_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score mangrove_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:mangrove_hanging_sign}

execute if score cree77 random_cluster matches 8 if score cherry_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score cherry_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cherry_hanging_sign}

execute if score cree77 random_cluster matches 9 if score bamboo_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score bamboo_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bamboo_hanging_sign}

execute if score cree77 random_cluster matches 10 if score poplar_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score poplar_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:poplar_hanging_sign}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}