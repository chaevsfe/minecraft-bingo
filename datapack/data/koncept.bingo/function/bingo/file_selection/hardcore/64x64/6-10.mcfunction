# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 6 if score dragon_head bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 6 if score dragon_head bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dragon_head}

execute if score cree77 bingo.random matches 7 if score dragon_egg bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 7 if score dragon_egg bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dragon_egg}

execute if score cree77 bingo.random matches 8 if score heavy_core bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 8 if score heavy_core bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:heavy_core}

execute if score cree77 bingo.random matches 9 if score conduit bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 9 if score conduit bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:conduit}

execute if score cree77 bingo.random matches 10 if score end_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 10 if score end_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:end_rod}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}