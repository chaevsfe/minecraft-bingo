# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 36 if score crossbow_firework bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 36 if score crossbow_firework bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:crossbow_firework}

execute if score cree77 bingo.random matches 37 if score dead_bush bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 37 if score dead_bush bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_bush}

execute if score cree77 bingo.random matches 38 if score diamond bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 38 if score diamond bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:diamond}

execute if score cree77 bingo.random matches 39 if score dried_kelp bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 39 if score dried_kelp bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dried_kelp}

execute if score cree77 bingo.random matches 40 if score egg bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 40 if score egg bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:egg}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}