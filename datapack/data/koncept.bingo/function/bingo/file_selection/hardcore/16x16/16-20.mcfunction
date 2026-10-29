# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 16 if score sculk_vein bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 16 if score sculk_vein bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:sculk_vein}

execute if score cree77 bingo.random matches 17 if score heart_of_the_sea bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 17 if score heart_of_the_sea bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:heart_of_the_sea}

execute if score cree77 bingo.random matches 18 if score trident bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 18 if score trident bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:trident}

execute if score cree77 bingo.random matches 19 if score ghast_tear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 19 if score ghast_tear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ghast_tear}

execute if score cree77 bingo.random matches 20 if score totem_of_undying bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 20 if score totem_of_undying bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:totem_of_undying}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}