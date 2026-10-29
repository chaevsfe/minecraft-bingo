# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..13

#file refinement

execute if score cree77 random_cluster matches 1 if score cinnabar bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score cinnabar bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar}

execute if score cree77 random_cluster matches 2 if score cinnabar_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score cinnabar_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar_stairs}

execute if score cree77 random_cluster matches 3 if score cinnabar_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score cinnabar_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar_slab}

execute if score cree77 random_cluster matches 4 if score cinnabar_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score cinnabar_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar_wall}

execute if score cree77 random_cluster matches 5 if score chiseled_cinnabar bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score chiseled_cinnabar bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_cinnabar}

execute if score cree77 random_cluster matches 6 if score polished_cinnabar bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score polished_cinnabar bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_cinnabar}

execute if score cree77 random_cluster matches 7 if score polished_cinnabar_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score polished_cinnabar_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_cinnabar_stairs}

execute if score cree77 random_cluster matches 8 if score polished_cinnabar_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score polished_cinnabar_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_cinnabar_slab}

execute if score cree77 random_cluster matches 9 if score polished_cinnabar_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score polished_cinnabar_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_cinnabar_wall}

execute if score cree77 random_cluster matches 10 if score cinnabar_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score cinnabar_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar_bricks}

execute if score cree77 random_cluster matches 11 if score cinnabar_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score cinnabar_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar_brick_stairs}

execute if score cree77 random_cluster matches 12 if score cinnabar_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score cinnabar_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar_brick_slab}

execute if score cree77 random_cluster matches 13 if score cinnabar_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score cinnabar_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cinnabar_brick_wall}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}