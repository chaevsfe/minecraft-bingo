# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..8

#file refinement

execute if score cree77 random_cluster matches 1 if score mossy_cobblestone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score mossy_cobblestone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_cobblestone}

execute if score cree77 random_cluster matches 2 if score mossy_cobblestone_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score mossy_cobblestone_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_cobblestone_stairs}

execute if score cree77 random_cluster matches 3 if score mossy_cobblestone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score mossy_cobblestone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_cobblestone_slab}

execute if score cree77 random_cluster matches 4 if score mossy_cobblestone_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score mossy_cobblestone_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_cobblestone_wall}

execute if score cree77 random_cluster matches 5 if score mossy_stone_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score mossy_stone_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_stone_bricks}

execute if score cree77 random_cluster matches 6 if score mossy_stone_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score mossy_stone_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_stone_brick_stairs}

execute if score cree77 random_cluster matches 7 if score mossy_stone_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score mossy_stone_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_stone_brick_slab}

execute if score cree77 random_cluster matches 8 if score mossy_stone_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score mossy_stone_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mossy_stone_brick_wall}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}