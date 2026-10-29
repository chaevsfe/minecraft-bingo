# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..11

#file refinement

execute if score cree77 random_cluster matches 1 if score bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:bucket}

execute if score cree77 random_cluster matches 2 if score water_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score water_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:water_bucket}

execute if score cree77 random_cluster matches 3 if score cod_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score cod_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cod_bucket}

execute if score cree77 random_cluster matches 4 if score salmon_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score salmon_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:salmon_bucket}

execute if score cree77 random_cluster matches 5 if score tropical_fish_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score tropical_fish_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tropical_fish_bucket}

execute if score cree77 random_cluster matches 6 if score pufferfish_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score pufferfish_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pufferfish_bucket}

execute if score cree77 random_cluster matches 7 if score axolotl_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score axolotl_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:axolotl_bucket}

execute if score cree77 random_cluster matches 8 if score tadpole_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score tadpole_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:tadpole_bucket}

execute if score cree77 random_cluster matches 9 if score lava_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score lava_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lava_bucket}

execute if score cree77 random_cluster matches 10 if score powder_snow_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score powder_snow_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:powder_snow_bucket}

execute if score cree77 random_cluster matches 11 if score milk_bucket bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score milk_bucket bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:milk_bucket}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}