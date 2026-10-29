# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..6

#file refinement

execute if score cree77 random_cluster matches 1 if score resin_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score resin_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:resin_block}

execute if score cree77 random_cluster matches 2 if score resin_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score resin_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:resin_bricks}

execute if score cree77 random_cluster matches 3 if score resin_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score resin_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:resin_brick_stairs}

execute if score cree77 random_cluster matches 4 if score resin_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score resin_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:resin_brick_slab}

execute if score cree77 random_cluster matches 5 if score resin_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score resin_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:resin_brick_wall}

execute if score cree77 random_cluster matches 6 if score chiseled_resin_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score chiseled_resin_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_resin_bricks}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}