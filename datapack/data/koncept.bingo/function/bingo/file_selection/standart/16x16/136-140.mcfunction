# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 136 if score leaf_litter bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 136 if score leaf_litter bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:leaf_litter}

execute if score cree77 bingo.random matches 137 if score blue_egg bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 137 if score blue_egg bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_egg}

execute if score cree77 bingo.random matches 138 if score cactus_flower bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 138 if score cactus_flower bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cactus_flower}

execute if score cree77 bingo.random matches 139 if score brown_egg bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 139 if score brown_egg bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_egg}

execute if score cree77 bingo.random matches 140 if score bush bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 140 if score bush bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bush}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}