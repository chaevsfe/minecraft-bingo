#Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..11

#file refinement

execute if score cree77 random_cluster matches 1 if score oak_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score oak_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_shelf}

execute if score cree77 random_cluster matches 2 if score spruce_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score spruce_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_shelf}

execute if score cree77 random_cluster matches 3 if score birch_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score birch_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_shelf}

execute if score cree77 random_cluster matches 4 if score jungle_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score jungle_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:jungle_shelf}

execute if score cree77 random_cluster matches 5 if score acacia_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score acacia_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_shelf}

execute if score cree77 random_cluster matches 6 if score dark_oak_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score dark_oak_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:dark_oak_shelf}

execute if score cree77 random_cluster matches 7 if score mangrove_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score mangrove_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:mangrove_shelf}

execute if score cree77 random_cluster matches 8 if score cherry_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score cherry_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:cherry_shelf}

execute if score cree77 random_cluster matches 9 if score pale_oak_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score pale_oak_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_shelf}

execute if score cree77 random_cluster matches 10 if score bamboo_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score bamboo_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:bamboo_shelf}

execute if score cree77 random_cluster matches 11 if score poplar_shelf bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score poplar_shelf bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:poplar_shelf}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}