# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 31 if score buried_treasure_map bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 31 if score buried_treasure_map bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:buried_treasure_map}

execute if score cree77 bingo.random matches 32 if score music_disc_bounce bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 32 if score music_disc_bounce bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:music_disc_bounce}

execute if score cree77 bingo.random matches 33 if score sulfur_cube_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 33 if score sulfur_cube_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sulfur_cube_bucket}

execute if score cree77 bingo.random matches 34 if score sulfur_spike bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 34 if score sulfur_spike bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sulfur_spike}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}