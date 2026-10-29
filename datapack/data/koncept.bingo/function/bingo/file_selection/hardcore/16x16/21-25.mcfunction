# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 21 if score experience_bottle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 21 if score experience_bottle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:experience_bottle}

execute if score cree77 bingo.random matches 22 if score ominous_bottle bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 22 if score ominous_bottle bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ominous_bottle}

execute if score cree77 bingo.random matches 23 if score recovery_compass bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 23 if score recovery_compass bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:recovery_compass}

execute if score cree77 bingo.random matches 24 if score dragon_breath bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 24 if score dragon_breath bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dragon_breath}

execute if score cree77 bingo.random matches 25 if score name_tag bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 25 if score name_tag bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:name_tag}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}