# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..8

#file refinement

execute if score cree77 random_cluster matches 1 if score grass_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score grass_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:grass_block}

execute if score cree77 random_cluster matches 2 if score mushroom_stem bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score mushroom_stem bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mushroom_stem}

execute if score cree77 random_cluster matches 3 if score brown_mushroom_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score brown_mushroom_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:brown_mushroom_block}

execute if score cree77 random_cluster matches 4 if score red_mushroom_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score red_mushroom_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:red_mushroom_block}

execute if score cree77 random_cluster matches 5 if score mycelium bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score mycelium bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mycelium}

execute if score cree77 random_cluster matches 6 if score podzol bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score podzol bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:podzol}

execute if score cree77 random_cluster matches 7 if score crimson_nylium bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score crimson_nylium bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crimson_nylium}

execute if score cree77 random_cluster matches 8 if score warped_nylium bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score warped_nylium bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:warped_nylium}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}