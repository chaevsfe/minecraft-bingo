# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..12

#file refinement

execute if score cree77 random_cluster matches 1 if score birch_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score birch_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_log}

execute if score cree77 random_cluster matches 2 if score birch_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score birch_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_wood}

execute if score cree77 random_cluster matches 3 if score stripped_birch_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stripped_birch_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_birch_log}

execute if score cree77 random_cluster matches 4 if score stripped_birch_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stripped_birch_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_birch_wood}

execute if score cree77 random_cluster matches 5 if score birch_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score birch_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_planks}

execute if score cree77 random_cluster matches 6 if score birch_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score birch_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_stairs}

execute if score cree77 random_cluster matches 7 if score birch_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score birch_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_slab}

execute if score cree77 random_cluster matches 8 if score birch_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score birch_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_fence}

execute if score cree77 random_cluster matches 9 if score birch_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score birch_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_fence_gate}

execute if score cree77 random_cluster matches 10 if score birch_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score birch_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_trapdoor}

execute if score cree77 random_cluster matches 11 if score birch_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score birch_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_pressure_plate}

execute if score cree77 random_cluster matches 12 if score birch_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score birch_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:birch_button}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}