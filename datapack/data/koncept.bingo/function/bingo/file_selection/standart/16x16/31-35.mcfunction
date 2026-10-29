# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 31 if score comparator bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 31 if score comparator bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:comparator}

execute if score cree77 bingo.random matches 32 if score compass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 32 if score compass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:compass}

execute if score cree77 bingo.random matches 33 if score copper_ingot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 33 if score copper_ingot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_ingot}

execute if score cree77 bingo.random matches 34 if score crossbow bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 34 if score crossbow bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:crossbow}

execute if score cree77 bingo.random matches 35 if score crossbow_arrow bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 35 if score crossbow_arrow bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:crossbow_arrow}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}