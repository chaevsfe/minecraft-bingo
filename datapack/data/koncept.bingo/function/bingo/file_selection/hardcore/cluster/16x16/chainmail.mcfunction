# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..4

#file refinement

execute if score cree77 random_cluster matches 1 if score chainmail_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score chainmail_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:chainmail_helmet}

execute if score cree77 random_cluster matches 2 if score chainmail_chestplate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score chainmail_chestplate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:chainmail_chestplate}

execute if score cree77 random_cluster matches 3 if score chainmail_leggings bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score chainmail_leggings bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:chainmail_leggings}

execute if score cree77 random_cluster matches 4 if score chainmail_boots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score chainmail_boots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:chainmail_boots}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}