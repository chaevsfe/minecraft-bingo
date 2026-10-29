# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 126 if score turtle_scute bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 126 if score turtle_scute bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:turtle_scute}

execute if score cree77 bingo.random matches 127 if score vine bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 127 if score vine bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:vine}

execute if score cree77 bingo.random matches 128 if score wheat bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 128 if score wheat bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wheat}

execute if score cree77 bingo.random matches 129 if score wheat_seeds bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 129 if score wheat_seeds bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wheat_seeds}

execute if score cree77 bingo.random matches 130 if score wolf_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 130 if score wolf_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:wolf_armor}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}