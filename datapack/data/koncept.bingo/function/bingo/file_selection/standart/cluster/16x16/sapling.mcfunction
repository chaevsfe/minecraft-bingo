# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..8

#file refinement

execute if score cree77 random_cluster matches 1 if score spruce_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score spruce_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:spruce_sapling}

execute if score cree77 random_cluster matches 2 if score oak_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score oak_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:oak_sapling}

execute if score cree77 random_cluster matches 3 if score jungle_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score jungle_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:jungle_sapling}

execute if score cree77 random_cluster matches 4 if score birch_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score birch_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:birch_sapling}

execute if score cree77 random_cluster matches 5 if score dark_oak_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score dark_oak_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dark_oak_sapling}

execute if score cree77 random_cluster matches 6 if score acacia_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score acacia_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:acacia_sapling}

execute if score cree77 random_cluster matches 7 if score mangrove_propagule bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score mangrove_propagule bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:mangrove_propagule}

execute if score cree77 random_cluster matches 8 if score poplar_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score poplar_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:poplar_sapling}


scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}