# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..12

#file refinement

execute if score cree77 random_cluster matches 1 if score acacia_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score acacia_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_log}

execute if score cree77 random_cluster matches 2 if score acacia_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score acacia_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_wood}

execute if score cree77 random_cluster matches 3 if score stripped_acacia_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stripped_acacia_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_acacia_log}

execute if score cree77 random_cluster matches 4 if score stripped_acacia_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stripped_acacia_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_acacia_wood}

execute if score cree77 random_cluster matches 5 if score acacia_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score acacia_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_planks}

execute if score cree77 random_cluster matches 6 if score acacia_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score acacia_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_stairs}

execute if score cree77 random_cluster matches 7 if score acacia_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score acacia_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_slab}

execute if score cree77 random_cluster matches 8 if score acacia_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score acacia_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_fence}

execute if score cree77 random_cluster matches 9 if score acacia_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score acacia_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_fence_gate}

execute if score cree77 random_cluster matches 10 if score acacia_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score acacia_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_trapdoor}

execute if score cree77 random_cluster matches 11 if score acacia_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score acacia_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_pressure_plate}

execute if score cree77 random_cluster matches 12 if score acacia_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score acacia_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:acacia_button}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}