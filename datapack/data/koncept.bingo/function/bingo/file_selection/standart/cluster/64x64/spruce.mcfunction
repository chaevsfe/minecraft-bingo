# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..12

#file refinement

execute if score cree77 random_cluster matches 1 if score spruce_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score spruce_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_log}

execute if score cree77 random_cluster matches 2 if score spruce_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score spruce_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_wood}

execute if score cree77 random_cluster matches 3 if score stripped_spruce_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score stripped_spruce_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_spruce_log}

execute if score cree77 random_cluster matches 4 if score stripped_spruce_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stripped_spruce_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_spruce_wood}

execute if score cree77 random_cluster matches 5 if score spruce_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score spruce_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_planks}

execute if score cree77 random_cluster matches 6 if score spruce_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score spruce_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_stairs}

execute if score cree77 random_cluster matches 7 if score spruce_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score spruce_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_slab}

execute if score cree77 random_cluster matches 8 if score spruce_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score spruce_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_fence}

execute if score cree77 random_cluster matches 9 if score spruce_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score spruce_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_fence_gate}

execute if score cree77 random_cluster matches 10 if score spruce_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score spruce_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_trapdoor}

execute if score cree77 random_cluster matches 11 if score spruce_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score spruce_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_pressure_plate}

execute if score cree77 random_cluster matches 12 if score spruce_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score spruce_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:spruce_button}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}