# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 66 if score hanging_roots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 66 if score hanging_roots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:hanging_roots}

execute if score cree77 bingo.random matches 67 if score honey_bottle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 67 if score honey_bottle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:honey_bottle}

execute if score cree77 bingo.random matches 68 if score honeycomb bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 68 if score honeycomb bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:honeycomb}

execute if score cree77 bingo.random matches 69 if score hopper bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 69 if score hopper bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:hopper}

execute if score cree77 bingo.random matches 70 if score hopper_minecart bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 70 if score hopper_minecart bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:hopper_minecart}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}