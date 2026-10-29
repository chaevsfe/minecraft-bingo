# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 16..20 if score dried_ghast bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 16..20 if score dried_ghast bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dried_ghast}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}