# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 1 if score ominous_trial_key bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 1 if score ominous_trial_key bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:ominous_trial_key}

execute if score cree77 bingo.random matches 2 if score trial_key bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 2 if score trial_key bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:trial_key}

execute if score cree77 bingo.random matches 3 if score turtle_egg bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 3 if score turtle_egg bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:turtle_egg}

execute if score cree77 bingo.random matches 4 if score turtle_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 4 if score turtle_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:turtle_helmet}

execute if score cree77 bingo.random matches 5 if score nautilus_shell bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 5 if score nautilus_shell bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:nautilus_shell}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}