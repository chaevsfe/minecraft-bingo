# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 91 if score paper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 91 if score paper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:paper}

execute if score cree77 bingo.random matches 92 if score peony bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 92 if score peony bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:peony}

execute if score cree77 bingo.random matches 93 if score pink_petals bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 93 if score pink_petals bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_petals}

execute if score cree77 bingo.random matches 94 if score pointed_dripstone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 94 if score pointed_dripstone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pointed_dripstone}

execute if score cree77 bingo.random matches 95 if score poisonous_potato bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 95 if score poisonous_potato bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:poisonous_potato}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}