# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..10

#file refinement

execute if score cree77 random_cluster matches 1 if score prismarine bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score prismarine bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:prismarine}

execute if score cree77 random_cluster matches 2 if score prismarine_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score prismarine_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:prismarine_stairs}

execute if score cree77 random_cluster matches 3 if score prismarine_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score prismarine_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:prismarine_slab}

execute if score cree77 random_cluster matches 4 if score prismarine_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score prismarine_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:prismarine_wall}

execute if score cree77 random_cluster matches 5 if score prismarine_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score prismarine_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:prismarine_bricks}

execute if score cree77 random_cluster matches 6 if score prismarine_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score prismarine_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:prismarine_brick_stairs}

execute if score cree77 random_cluster matches 7 if score prismarine_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score prismarine_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:prismarine_brick_slab}

execute if score cree77 random_cluster matches 8 if score dark_prismarine bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score dark_prismarine bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dark_prismarine}

execute if score cree77 random_cluster matches 9 if score dark_prismarine_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score dark_prismarine_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dark_prismarine_stairs}

execute if score cree77 random_cluster matches 10 if score dark_prismarine_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score dark_prismarine_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dark_prismarine_slab}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}