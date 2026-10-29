# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 26 if score clay_ball bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 26 if score clay_ball bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:clay_ball}

execute if score cree77 bingo.random matches 27 if score clock bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 27 if score clock bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:clock}

execute if score cree77 bingo.random matches 28 if score coal bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 28 if score coal bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:coal}

execute if score cree77 bingo.random matches 29 if score cobweb bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 29 if score cobweb bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cobweb}

execute if score cree77 bingo.random matches 30 if score cocoa_beans bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 30 if score cocoa_beans bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cocoa_beans}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}