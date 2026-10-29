# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..17

#file refinement

execute if score cree77 random_cluster matches 1 if score stone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score stone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone}

execute if score cree77 random_cluster matches 2 if score stone_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score stone_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_stairs}

execute if score cree77 random_cluster matches 3 if score stone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_slab}

execute if score cree77 random_cluster matches 4 if score stone_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stone_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_pressure_plate}

execute if score cree77 random_cluster matches 5 if score stone_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score stone_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_button}

execute if score cree77 random_cluster matches 6 if score cobblestone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score cobblestone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobblestone}

execute if score cree77 random_cluster matches 7 if score cobblestone_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score cobblestone_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobblestone_stairs}

execute if score cree77 random_cluster matches 8 if score cobblestone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score cobblestone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobblestone_slab}

execute if score cree77 random_cluster matches 9 if score cobblestone_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score cobblestone_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cobblestone_wall}

execute if score cree77 random_cluster matches 10 if score stone_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score stone_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_bricks}

execute if score cree77 random_cluster matches 11 if score cracked_stone_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cracked_stone_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cracked_stone_bricks}

execute if score cree77 random_cluster matches 12 if score stone_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score stone_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_brick_stairs}

execute if score cree77 random_cluster matches 13 if score stone_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score stone_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_brick_slab}

execute if score cree77 random_cluster matches 14 if score stone_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score stone_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stone_brick_wall}

execute if score cree77 random_cluster matches 15 if score chiseled_stone_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score chiseled_stone_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_stone_bricks}

execute if score cree77 random_cluster matches 16 if score smooth_stone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score smooth_stone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_stone}

execute if score cree77 random_cluster matches 17 if score smooth_stone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score smooth_stone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:smooth_stone_slab}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}