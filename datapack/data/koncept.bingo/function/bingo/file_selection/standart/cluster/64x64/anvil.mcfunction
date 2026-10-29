# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..3

#file refinement

execute if score cree77 random_cluster matches 1 if score anvil bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score anvil bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:anvil}

execute if score cree77 random_cluster matches 2 if score chipped_anvil bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score chipped_anvil bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chipped_anvil}

execute if score cree77 random_cluster matches 3 if score damaged_anvil bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score damaged_anvil bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:damaged_anvil}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}