# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 56 if score lightning_rod bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 56 if score lightning_rod bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lightning_rod}

execute if score cree77 bingo.random matches 57 if score raw_copper_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 57 if score raw_copper_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:raw_copper_block}

execute if score cree77 bingo.random matches 58 if score moss_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 58 if score moss_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:moss_block}

execute if score cree77 bingo.random matches 59 if score glass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 59 if score glass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:glass}

execute if score cree77 bingo.random matches 60 if score gold_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 60 if score gold_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gold_block}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}