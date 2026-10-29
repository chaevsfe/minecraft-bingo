# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 146 if score abandoned_camp_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 146 if score abandoned_camp_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:abandoned_camp_map}

execute if score cree77 bingo.random matches 147 if score red_shrub bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 147 if score red_shrub bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_shrub}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}