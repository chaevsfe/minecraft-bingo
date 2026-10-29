# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..7

#file refinement

execute if score cree77 random_cluster matches 1 if score diorite bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score diorite bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:diorite}

execute if score cree77 random_cluster matches 2 if score diorite_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score diorite_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:diorite_stairs}

execute if score cree77 random_cluster matches 3 if score diorite_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score diorite_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:diorite_slab}

execute if score cree77 random_cluster matches 4 if score diorite_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score diorite_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:diorite_wall}

execute if score cree77 random_cluster matches 5 if score polished_diorite bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score polished_diorite bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_diorite}

execute if score cree77 random_cluster matches 6 if score polished_diorite_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score polished_diorite_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_diorite_stairs}

execute if score cree77 random_cluster matches 7 if score polished_diorite_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score polished_diorite_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_diorite_slab}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}