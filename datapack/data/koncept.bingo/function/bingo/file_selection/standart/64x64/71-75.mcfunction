# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 71 if score snow bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 71 if score snow bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:snow}

execute if score cree77 bingo.random matches 72 if score bookshelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 72 if score bookshelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bookshelf}

execute if score cree77 bingo.random matches 73 if score lectern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 73 if score lectern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lectern}

execute if score cree77 bingo.random matches 74 if score honey_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 74 if score honey_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:honey_block}

execute if score cree77 bingo.random matches 75 if score moss_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 75 if score moss_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:moss_carpet}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}