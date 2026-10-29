# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 21 if score warped_fungus bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 21 if score warped_fungus bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:warped_fungus}

execute if score cree77 bingo.random matches 22 if score warped_fungus_on_a_stick bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 22 if score warped_fungus_on_a_stick bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:warped_fungus_on_a_stick}

execute if score cree77 bingo.random matches 23 if score warped_roots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 23 if score warped_roots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:warped_roots}

execute if score cree77 bingo.random matches 24 if score resin_brick bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 24 if score resin_brick bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:resin_brick}

execute if score cree77 bingo.random matches 25 if score resin_clump bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 25 if score resin_clump bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:resin_clump}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}