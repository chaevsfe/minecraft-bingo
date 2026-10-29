# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..14

#file refinement

execute if score cree77 random_cluster matches 1 if score sulfur bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score sulfur bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur}

execute if score cree77 random_cluster matches 2 if score sulfur_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score sulfur_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur_stairs}

execute if score cree77 random_cluster matches 3 if score sulfur_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score sulfur_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur_slab}

execute if score cree77 random_cluster matches 4 if score sulfur_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score sulfur_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur_wall}

execute if score cree77 random_cluster matches 5 if score chiseled_sulfur bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score chiseled_sulfur bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_sulfur}

execute if score cree77 random_cluster matches 6 if score polished_sulfur bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score polished_sulfur bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_sulfur}

execute if score cree77 random_cluster matches 7 if score polished_sulfur_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score polished_sulfur_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_sulfur_stairs}

execute if score cree77 random_cluster matches 8 if score polished_sulfur_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score polished_sulfur_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_sulfur_slab}

execute if score cree77 random_cluster matches 9 if score polished_sulfur_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score polished_sulfur_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_sulfur_wall}

execute if score cree77 random_cluster matches 10 if score sulfur_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score sulfur_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur_bricks}

execute if score cree77 random_cluster matches 11 if score sulfur_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score sulfur_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur_brick_stairs}

execute if score cree77 random_cluster matches 12 if score sulfur_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score sulfur_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur_brick_slab}

execute if score cree77 random_cluster matches 13 if score sulfur_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score sulfur_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:sulfur_brick_wall}

execute if score cree77 random_cluster matches 14 if score potent_sulfur bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score potent_sulfur bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:potent_sulfur}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}