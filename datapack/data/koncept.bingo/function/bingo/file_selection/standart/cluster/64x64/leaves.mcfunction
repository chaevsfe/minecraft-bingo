# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..12

#file refinement

execute if score cree77 random_cluster matches 1 if score oak_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score oak_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_leaves}

execute if score cree77 random_cluster matches 2 if score spruce_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score spruce_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_leaves}

execute if score cree77 random_cluster matches 3 if score birch_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score birch_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_leaves}

execute if score cree77 random_cluster matches 4 if score jungle_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score jungle_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:jungle_leaves}

execute if score cree77 random_cluster matches 5 if score acacia_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score acacia_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_leaves}

execute if score cree77 random_cluster matches 6 if score dark_oak_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score dark_oak_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dark_oak_leaves}

execute if score cree77 random_cluster matches 7 if score mangrove_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score mangrove_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mangrove_leaves}

execute if score cree77 random_cluster matches 8 if score azalea_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score azalea_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:azalea_leaves}

execute if score cree77 random_cluster matches 9 if score flowering_azalea_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score flowering_azalea_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:flowering_azalea_leaves}

execute if score cree77 random_cluster matches 10 if score orange_poplar_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score orange_poplar_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:orange_poplar_leaves}

execute if score cree77 random_cluster matches 11 if score red_poplar_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score red_poplar_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_poplar_leaves}

execute if score cree77 random_cluster matches 12 if score yellow_poplar_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score yellow_poplar_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:yellow_poplar_leaves}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}