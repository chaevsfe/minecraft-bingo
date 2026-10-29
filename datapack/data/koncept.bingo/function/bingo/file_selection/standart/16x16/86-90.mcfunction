# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 86 if score lily_pad bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 86 if score lily_pad bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lily_pad}

execute if score cree77 bingo.random matches 87 if score map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 87 if score map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:map}

execute if score cree77 bingo.random matches 88 if score melon_seeds bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 88 if score melon_seeds bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:melon_seeds}

execute if score cree77 bingo.random matches 89 if score minecart bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 89 if score minecart bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:minecart}

execute if score cree77 bingo.random matches 90 if score painting bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 90 if score painting bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:painting}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}