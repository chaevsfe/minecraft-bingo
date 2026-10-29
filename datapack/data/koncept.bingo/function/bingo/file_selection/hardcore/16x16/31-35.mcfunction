# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 31 if score enchanted_golden_apple bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 31 if score enchanted_golden_apple bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:enchanted_golden_apple}

execute if score cree77 bingo.random matches 32 if score music_disc_lava_chicken bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 32 if score music_disc_lava_chicken bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_lava_chicken}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}