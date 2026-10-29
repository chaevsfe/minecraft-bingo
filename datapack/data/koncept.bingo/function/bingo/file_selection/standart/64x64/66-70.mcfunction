# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 66 if score wet_sponge bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 66 if score wet_sponge bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:wet_sponge}

execute if score cree77 bingo.random matches 67 if score composter bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 67 if score composter bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:composter}

execute if score cree77 bingo.random matches 68 if score chest bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 68 if score chest bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chest}

execute if score cree77 bingo.random matches 69 if score cactus bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 69 if score cactus bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cactus}

execute if score cree77 bingo.random matches 70 if score clay bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 70 if score clay bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:clay}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}