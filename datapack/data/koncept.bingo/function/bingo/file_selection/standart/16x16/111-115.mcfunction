# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 111 if score sea_pickle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 111 if score sea_pickle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sea_pickle}

execute if score cree77 bingo.random matches 112 if score seagrass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 112 if score seagrass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:seagrass}

execute if score cree77 bingo.random matches 113 if score shears bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 113 if score shears bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:shears}

execute if score cree77 bingo.random matches 114 if score short_grass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 114 if score short_grass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:short_grass}

execute if score cree77 bingo.random matches 115 if score slime_ball bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 115 if score slime_ball bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:slime_ball}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}