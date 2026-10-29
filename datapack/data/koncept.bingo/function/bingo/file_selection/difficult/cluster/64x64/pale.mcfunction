# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..16

#file refinement

execute if score cree77 random_cluster matches 1 if score creaking_heart bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score creaking_heart bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:creaking_heart}

execute if score cree77 random_cluster matches 2 if score pale_oak_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score pale_oak_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_log}

execute if score cree77 random_cluster matches 3 if score pale_oak_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score pale_oak_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_wood}

execute if score cree77 random_cluster matches 4 if score stripped_pale_oak_log bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score stripped_pale_oak_log bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_pale_oak_log}

execute if score cree77 random_cluster matches 5 if score stripped_pale_oak_wood bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score stripped_pale_oak_wood bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:stripped_pale_oak_wood}

execute if score cree77 random_cluster matches 6 if score pale_oak_planks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score pale_oak_planks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_planks}

execute if score cree77 random_cluster matches 7 if score pale_oak_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score pale_oak_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_stairs}

execute if score cree77 random_cluster matches 8 if score pale_oak_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score pale_oak_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_slab}

execute if score cree77 random_cluster matches 9 if score pale_oak_fence bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score pale_oak_fence bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_fence}

execute if score cree77 random_cluster matches 10 if score pale_oak_fence_gate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score pale_oak_fence_gate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_fence_gate}

execute if score cree77 random_cluster matches 11 if score pale_oak_trapdoor bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score pale_oak_trapdoor bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_trapdoor}

execute if score cree77 random_cluster matches 12 if score pale_oak_pressure_plate bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score pale_oak_pressure_plate bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_pressure_plate}

execute if score cree77 random_cluster matches 13 if score pale_oak_button bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score pale_oak_button bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_button}

execute if score cree77 random_cluster matches 14 if score pale_moss_block bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score pale_moss_block bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_moss_block}

execute if score cree77 random_cluster matches 15 if score pale_oak_leaves bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score pale_oak_leaves bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_oak_leaves}

execute if score cree77 random_cluster matches 16 if score pale_moss_carpet bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score pale_moss_carpet bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:pale_moss_carpet}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}