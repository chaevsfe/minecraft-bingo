# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 96 if score furnace_minecart bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 96 if score furnace_minecart bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:furnace_minecart}

execute if score cree77 bingo.random matches 97 if score pufferfish bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 97 if score pufferfish bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pufferfish}

execute if score cree77 bingo.random matches 98 if score pumpkin_seeds bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 98 if score pumpkin_seeds bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pumpkin_seeds}

execute if score cree77 bingo.random matches 99 if score rabbit_foot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 99 if score rabbit_foot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:rabbit_foot}

execute if score cree77 bingo.random matches 100 if score rabbit_hide bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 100 if score rabbit_hide bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:rabbit_hide}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}