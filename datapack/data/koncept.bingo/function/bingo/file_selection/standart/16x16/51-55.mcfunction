# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 51 if score flint_and_steel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 51 if score flint_and_steel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:flint_and_steel}

execute if score cree77 bingo.random matches 52 if score flower_banner_pattern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 52 if score flower_banner_pattern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:flower_banner_pattern}

execute if score cree77 bingo.random matches 53 if score flower_pot bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 53 if score flower_pot bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:flower_pot}

execute if score cree77 bingo.random matches 54 if score potion_water bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 54 if score potion_water bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:potion_water}

execute if score cree77 bingo.random matches 55 if score glass_bottle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 55 if score glass_bottle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glass_bottle}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}