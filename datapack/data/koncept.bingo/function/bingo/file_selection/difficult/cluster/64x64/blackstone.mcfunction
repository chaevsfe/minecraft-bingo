# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..16

#file refinement

execute if score cree77 random_cluster matches 1 if score blackstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score blackstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blackstone}

execute if score cree77 random_cluster matches 2 if score blackstone_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score blackstone_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blackstone_stairs}

execute if score cree77 random_cluster matches 3 if score blackstone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score blackstone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blackstone_slab}

execute if score cree77 random_cluster matches 4 if score blackstone_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score blackstone_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:blackstone_wall}

execute if score cree77 random_cluster matches 5 if score chiseled_polished_blackstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score chiseled_polished_blackstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_polished_blackstone}

execute if score cree77 random_cluster matches 6 if score polished_blackstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score polished_blackstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone}

execute if score cree77 random_cluster matches 7 if score polished_blackstone_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score polished_blackstone_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_stairs}

execute if score cree77 random_cluster matches 8 if score polished_blackstone_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score polished_blackstone_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_slab}

execute if score cree77 random_cluster matches 9 if score polished_blackstone_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score polished_blackstone_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_wall}

execute if score cree77 random_cluster matches 10 if score polished_blackstone_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score polished_blackstone_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_pressure_plate}

execute if score cree77 random_cluster matches 11 if score polished_blackstone_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score polished_blackstone_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_button}

execute if score cree77 random_cluster matches 12 if score polished_blackstone_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score polished_blackstone_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_bricks}

execute if score cree77 random_cluster matches 13 if score cracked_polished_blackstone_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score cracked_polished_blackstone_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cracked_polished_blackstone_bricks}

execute if score cree77 random_cluster matches 14 if score polished_blackstone_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score polished_blackstone_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_brick_stairs}

execute if score cree77 random_cluster matches 15 if score polished_blackstone_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score polished_blackstone_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_brick_slab}

execute if score cree77 random_cluster matches 16 if score polished_blackstone_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score polished_blackstone_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_blackstone_brick_wall}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}