# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..20

#file refinement

execute if score cree77 random_cluster matches 1 if score tube_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score tube_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tube_coral}

execute if score cree77 random_cluster matches 2 if score brain_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score brain_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brain_coral}

execute if score cree77 random_cluster matches 3 if score bubble_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score bubble_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bubble_coral}

execute if score cree77 random_cluster matches 4 if score fire_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score fire_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:fire_coral}

execute if score cree77 random_cluster matches 5 if score horn_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score horn_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:horn_coral}

execute if score cree77 random_cluster matches 6 if score dead_tube_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score dead_tube_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_tube_coral}

execute if score cree77 random_cluster matches 7 if score dead_brain_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score dead_brain_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_brain_coral}

execute if score cree77 random_cluster matches 8 if score dead_bubble_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score dead_bubble_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_bubble_coral}

execute if score cree77 random_cluster matches 9 if score dead_fire_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score dead_fire_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_fire_coral}

execute if score cree77 random_cluster matches 10 if score dead_horn_coral bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score dead_horn_coral bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_horn_coral}

execute if score cree77 random_cluster matches 11 if score tube_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score tube_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tube_coral_fan}

execute if score cree77 random_cluster matches 12 if score brain_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score brain_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:brain_coral_fan}

execute if score cree77 random_cluster matches 13 if score bubble_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score bubble_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bubble_coral_fan}

execute if score cree77 random_cluster matches 14 if score fire_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score fire_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:fire_coral_fan}

execute if score cree77 random_cluster matches 15 if score horn_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score horn_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:horn_coral_fan}

execute if score cree77 random_cluster matches 16 if score dead_tube_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score dead_tube_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_tube_coral_fan}

execute if score cree77 random_cluster matches 17 if score dead_brain_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score dead_brain_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_brain_coral_fan}

execute if score cree77 random_cluster matches 18 if score dead_bubble_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score dead_bubble_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_bubble_coral_fan}

execute if score cree77 random_cluster matches 19 if score dead_fire_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 19 if score dead_fire_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_fire_coral_fan}

execute if score cree77 random_cluster matches 20 if score dead_horn_coral_fan bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 20 if score dead_horn_coral_fan bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dead_horn_coral_fan}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}