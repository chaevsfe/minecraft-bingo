# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..12

#file refinement

execute if score cree77 random_cluster matches 1 if score oak_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score oak_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_log}

execute if score cree77 random_cluster matches 2 if score oak_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score oak_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_wood}

execute if score cree77 random_cluster matches 3 if score stripped_oak_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stripped_oak_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_oak_log}

execute if score cree77 random_cluster matches 4 if score stripped_oak_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stripped_oak_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_oak_wood}

execute if score cree77 random_cluster matches 5 if score oak_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score oak_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_planks}

execute if score cree77 random_cluster matches 6 if score oak_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score oak_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_stairs}

execute if score cree77 random_cluster matches 7 if score oak_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score oak_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_slab}

execute if score cree77 random_cluster matches 8 if score oak_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score oak_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_fence}

execute if score cree77 random_cluster matches 9 if score oak_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score oak_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_fence_gate}

execute if score cree77 random_cluster matches 10 if score oak_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score oak_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_trapdoor}

execute if score cree77 random_cluster matches 11 if score oak_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score oak_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_pressure_plate}

execute if score cree77 random_cluster matches 12 if score oak_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score oak_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:oak_button}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}