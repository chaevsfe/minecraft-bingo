# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 26..30 if score music_disc_tears bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 26..30 if score music_disc_tears bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_tears}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}