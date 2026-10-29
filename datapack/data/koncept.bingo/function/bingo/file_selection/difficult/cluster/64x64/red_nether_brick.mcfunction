# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..4

#file refinement

execute if score cree77 random_cluster matches 1 if score red_nether_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score red_nether_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_nether_bricks}

execute if score cree77 random_cluster matches 2 if score red_nether_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score red_nether_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_nether_brick_stairs}

execute if score cree77 random_cluster matches 3 if score red_nether_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score red_nether_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_nether_brick_slab}

execute if score cree77 random_cluster matches 4 if score red_nether_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score red_nether_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_nether_brick_wall}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}