# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..12

#file refinement

execute if score cree77 random_cluster matches 1 if score pink_tulip bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score pink_tulip bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pink_tulip}

execute if score cree77 random_cluster matches 2 if score poppy bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score poppy bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:poppy}

execute if score cree77 random_cluster matches 3 if score oxeye_daisy bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score oxeye_daisy bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:oxeye_daisy}

execute if score cree77 random_cluster matches 4 if score blue_orchid bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score blue_orchid bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:blue_orchid}

execute if score cree77 random_cluster matches 5 if score cornflower bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score cornflower bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:cornflower}

execute if score cree77 random_cluster matches 6 if score dandelion bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score dandelion bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:dandelion}

execute if score cree77 random_cluster matches 7 if score lily_of_the_valley bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score lily_of_the_valley bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:lily_of_the_valley}

execute if score cree77 random_cluster matches 8 if score white_tulip bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score white_tulip bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:white_tulip}

execute if score cree77 random_cluster matches 9 if score orange_tulip bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score orange_tulip bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:orange_tulip}

execute if score cree77 random_cluster matches 10 if score red_tulip bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score red_tulip bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:red_tulip}

execute if score cree77 random_cluster matches 11 if score azure_bluet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score azure_bluet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:azure_bluet}

execute if score cree77 random_cluster matches 12 if score allium bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score allium bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:allium}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}