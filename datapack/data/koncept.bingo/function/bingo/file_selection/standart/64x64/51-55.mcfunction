# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 51 if score shield bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 51 if score shield bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:shield}

execute if score cree77 bingo.random matches 52 if score tinted_glass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 52 if score tinted_glass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tinted_glass}

execute if score cree77 bingo.random matches 53 if score loom bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 53 if score loom bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:loom}

execute if score cree77 bingo.random matches 54 if score grindstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 54 if score grindstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:grindstone}

execute if score cree77 bingo.random matches 55 if score honeycomb_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 55 if score honeycomb_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:honeycomb_block}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}