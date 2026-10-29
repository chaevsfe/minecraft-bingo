# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..12

#file refinement

execute if score cree77 random_cluster matches 1 if score netherite_sword bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score netherite_sword bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_sword}

execute if score cree77 random_cluster matches 2 if score netherite_shovel bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score netherite_shovel bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_shovel}

execute if score cree77 random_cluster matches 3 if score netherite_pickaxe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score netherite_pickaxe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_pickaxe}

execute if score cree77 random_cluster matches 4 if score netherite_axe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score netherite_axe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_axe}

execute if score cree77 random_cluster matches 5 if score netherite_hoe bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score netherite_hoe bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_hoe}

execute if score cree77 random_cluster matches 6 if score netherite_helmet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score netherite_helmet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_helmet}

execute if score cree77 random_cluster matches 7 if score netherite_chestplate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score netherite_chestplate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_chestplate}

execute if score cree77 random_cluster matches 8 if score netherite_leggings bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score netherite_leggings bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_leggings}

execute if score cree77 random_cluster matches 9 if score netherite_boots bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score netherite_boots bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_boots}

execute if score cree77 random_cluster matches 10 if score netherite_spear bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score netherite_spear bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_spear}

execute if score cree77 random_cluster matches 11 if score netherite_horse_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score netherite_horse_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_horse_armor}

execute if score cree77 random_cluster matches 12 if score netherite_nautilus_armor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score netherite_nautilus_armor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:netherite_nautilus_armor}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}