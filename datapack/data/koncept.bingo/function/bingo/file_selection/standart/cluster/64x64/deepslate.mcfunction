# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..20

#file refinement

execute if score cree77 random_cluster matches 1 if score deepslate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score deepslate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate}

execute if score cree77 random_cluster matches 2 if score cobbled_deepslate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score cobbled_deepslate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobbled_deepslate}

execute if score cree77 random_cluster matches 3 if score cobbled_deepslate_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score cobbled_deepslate_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobbled_deepslate_stairs}

execute if score cree77 random_cluster matches 4 if score cobbled_deepslate_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score cobbled_deepslate_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobbled_deepslate_slab}

execute if score cree77 random_cluster matches 5 if score cobbled_deepslate_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score cobbled_deepslate_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobbled_deepslate_wall}

execute if score cree77 random_cluster matches 6 if score chiseled_deepslate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score chiseled_deepslate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_deepslate}

execute if score cree77 random_cluster matches 7 if score polished_deepslate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score polished_deepslate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_deepslate}

execute if score cree77 random_cluster matches 8 if score polished_deepslate_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score polished_deepslate_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_deepslate_stairs}

execute if score cree77 random_cluster matches 9 if score polished_deepslate_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score polished_deepslate_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_deepslate_slab}

execute if score cree77 random_cluster matches 10 if score polished_deepslate_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score polished_deepslate_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_deepslate_wall}

execute if score cree77 random_cluster matches 11 if score deepslate_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score deepslate_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_bricks}

execute if score cree77 random_cluster matches 12 if score cracked_deepslate_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score cracked_deepslate_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cracked_deepslate_bricks}

execute if score cree77 random_cluster matches 13 if score deepslate_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score deepslate_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_brick_stairs}

execute if score cree77 random_cluster matches 14 if score deepslate_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score deepslate_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_brick_slab}

execute if score cree77 random_cluster matches 15 if score deepslate_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score deepslate_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_brick_wall}

execute if score cree77 random_cluster matches 16 if score deepslate_tiles bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score deepslate_tiles bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_tiles}

execute if score cree77 random_cluster matches 17 if score cracked_deepslate_tiles bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score cracked_deepslate_tiles bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cracked_deepslate_tiles}

execute if score cree77 random_cluster matches 18 if score deepslate_tile_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score deepslate_tile_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_tile_stairs}

execute if score cree77 random_cluster matches 19 if score deepslate_tile_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score deepslate_tile_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_tile_slab}

execute if score cree77 random_cluster matches 20 if score deepslate_tile_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 20 if score deepslate_tile_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_tile_wall}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}