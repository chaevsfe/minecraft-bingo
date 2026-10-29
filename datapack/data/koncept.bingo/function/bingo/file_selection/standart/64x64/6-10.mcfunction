# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 6 if score hay_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 6 if score hay_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:hay_block}

execute if score cree77 bingo.random matches 7 if score light_weighted_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 7 if score light_weighted_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:light_weighted_pressure_plate}

execute if score cree77 bingo.random matches 8 if score dirt bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 8 if score dirt bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dirt}

execute if score cree77 bingo.random matches 9 if score dried_kelp_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 9 if score dried_kelp_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dried_kelp_block}

execute if score cree77 bingo.random matches 10 if score pumpkin bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 10 if score pumpkin bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pumpkin}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}