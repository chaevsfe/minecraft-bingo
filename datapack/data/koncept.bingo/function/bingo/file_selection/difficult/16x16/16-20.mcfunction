# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 16 if score quartz bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 16 if score quartz bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:quartz}

execute if score cree77 bingo.random matches 17 if score twisting_vines bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 17 if score twisting_vines bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:twisting_vines}

execute if score cree77 bingo.random matches 18 if score soul_campfire bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 18 if score soul_campfire bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:soul_campfire}

execute if score cree77 bingo.random matches 19 if score soul_lantern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 19 if score soul_lantern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:soul_lantern}

execute if score cree77 bingo.random matches 20 if score soul_torch bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 20 if score soul_torch bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:soul_torch}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}