# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 11 if score bordure_indented_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 11 if score bordure_indented_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bordure_indented_banner_pattern}

execute if score cree77 bingo.random matches 12 if score bow bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 12 if score bow bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bow}

execute if score cree77 bingo.random matches 13 if score bowl bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 13 if score bowl bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bowl}

execute if score cree77 bingo.random matches 14 if score bread bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 14 if score bread bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bread}

execute if score cree77 bingo.random matches 15 if score brick bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 15 if score brick bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brick}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}