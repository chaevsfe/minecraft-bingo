# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..4

#file refinement

execute if score cree77 random_cluster matches 1 if score purpur_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score purpur_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purpur_block}

execute if score cree77 random_cluster matches 2 if score purpur_pillar bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score purpur_pillar bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purpur_pillar}

execute if score cree77 random_cluster matches 3 if score purpur_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score purpur_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purpur_stairs}

execute if score cree77 random_cluster matches 4 if score purpur_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score purpur_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:purpur_slab}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}