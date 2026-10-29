# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 81 if score lapis_lazuli bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 81 if score lapis_lazuli bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lapis_lazuli}

execute if score cree77 bingo.random matches 82 if score lead bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 82 if score lead bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lead}

execute if score cree77 bingo.random matches 83 if score leather bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 83 if score leather bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:leather}

execute if score cree77 bingo.random matches 84 if score lever bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 84 if score lever bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lever}

execute if score cree77 bingo.random matches 85 if score lilac bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 85 if score lilac bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lilac}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}