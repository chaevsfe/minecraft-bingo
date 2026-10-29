# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 116 if score snowball bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 116 if score snowball bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:snowball}

execute if score cree77 bingo.random matches 117 if score spider_eye bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 117 if score spider_eye bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:spider_eye}

execute if score cree77 bingo.random matches 118 if score stick bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 118 if score stick bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:stick}

execute if score cree77 bingo.random matches 119 if score string bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 119 if score string bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:string}

execute if score cree77 bingo.random matches 120 if score sugar bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 120 if score sugar bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sugar}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}