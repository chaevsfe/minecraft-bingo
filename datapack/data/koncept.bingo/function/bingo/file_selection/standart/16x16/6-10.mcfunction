# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 6 if score beetroot_seeds bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 6 if score beetroot_seeds bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:beetroot_seeds}

execute if score cree77 bingo.random matches 7 if score bell bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 7 if score bell bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bell}

execute if score cree77 bingo.random matches 8 if score bone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 8 if score bone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bone}

execute if score cree77 bingo.random matches 9 if score bone_meal bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 9 if score bone_meal bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bone_meal}

execute if score cree77 bingo.random matches 10 if score book bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 10 if score book bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:book}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}