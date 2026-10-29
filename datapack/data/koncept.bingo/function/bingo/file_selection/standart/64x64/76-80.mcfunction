# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 76 if score tnt bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 76 if score tnt bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tnt}

execute if score cree77 bingo.random matches 77 if score crafter bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 77 if score crafter bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:crafter}

execute if score cree77 bingo.random matches 78 if score lodestone bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 78 if score lodestone bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lodestone}

execute if score cree77 bingo.random matches 79 if score daylight_detector bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 79 if score daylight_detector bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:daylight_detector}

execute if score cree77 bingo.random matches 80 if score jack_o_lantern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 80 if score jack_o_lantern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:jack_o_lantern}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}