#Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..15

#file refinement

execute if score cree77 random_cluster matches 1 if score copper_torch bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score copper_torch bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_torch}

execute if score cree77 random_cluster matches 2 if score copper_chain bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score copper_chain bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_chain}

execute if score cree77 random_cluster matches 3 if score copper_bars bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score copper_bars bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_bars}

execute if score cree77 random_cluster matches 4 if score copper_lantern bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score copper_lantern bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_lantern}

execute if score cree77 random_cluster matches 5 if score copper_sword bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score copper_sword bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_sword}

execute if score cree77 random_cluster matches 6 if score copper_pickaxe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score copper_pickaxe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_pickaxe}

execute if score cree77 random_cluster matches 7 if score copper_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score copper_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_axe}

execute if score cree77 random_cluster matches 8 if score copper_shovel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score copper_shovel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_shovel}

execute if score cree77 random_cluster matches 9 if score copper_hoe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score copper_hoe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_hoe}

execute if score cree77 random_cluster matches 10 if score copper_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score copper_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_helmet}

execute if score cree77 random_cluster matches 11 if score copper_chestplate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score copper_chestplate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_chestplate}

execute if score cree77 random_cluster matches 12 if score copper_leggings bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score copper_leggings bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_leggings}

execute if score cree77 random_cluster matches 13 if score copper_boots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score copper_boots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_boots}

execute if score cree77 random_cluster matches 14 if score copper_horse_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score copper_horse_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_horse_armor}

execute if score cree77 random_cluster matches 15 if score copper_nugget bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score copper_nugget bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:copper_nugget}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}