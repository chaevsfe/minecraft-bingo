# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 16 if score brown_mushroom bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 16 if score brown_mushroom bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brown_mushroom}

execute if score cree77 bingo.random matches 17 if score brush bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 17 if score brush bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brush}

execute if score cree77 bingo.random matches 18 if score cake bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 18 if score cake bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cake}

execute if score cree77 bingo.random matches 19 if score campfire bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 19 if score campfire bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:campfire}

execute if score cree77 bingo.random matches 20 if score carrot_on_a_stick bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 20 if score carrot_on_a_stick bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:carrot_on_a_stick}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}