# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 86 if score carved_pumpkin bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 86 if score carved_pumpkin bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:carved_pumpkin}

execute if score cree77 bingo.random matches 87 if score small_dripleaf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 87 if score small_dripleaf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:small_dripleaf}

execute if score cree77 bingo.random matches 88 if score copper_chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 88 if score copper_chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:copper_chest}

execute if score cree77 bingo.random matches 89 if score copper_golem_statue bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 89 if score copper_golem_statue bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:copper_golem_statue}

execute if score cree77 bingo.random matches 90 if score shelf_mushroom bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 90 if score shelf_mushroom bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:shelf_mushroom}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}