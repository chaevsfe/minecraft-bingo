# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..14

#file refinement

execute if score cree77 random_cluster matches 1 if score tuff bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score tuff bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff}

execute if score cree77 random_cluster matches 2 if score tuff_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score tuff_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff_stairs}

execute if score cree77 random_cluster matches 3 if score tuff_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score tuff_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff_slab}

execute if score cree77 random_cluster matches 4 if score tuff_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score tuff_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff_wall}

execute if score cree77 random_cluster matches 5 if score chiseled_tuff bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score chiseled_tuff bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_tuff}

execute if score cree77 random_cluster matches 6 if score polished_tuff bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score polished_tuff bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_tuff}

execute if score cree77 random_cluster matches 7 if score polished_tuff_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score polished_tuff_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_tuff_stairs}

execute if score cree77 random_cluster matches 8 if score polished_tuff_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score polished_tuff_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_tuff_slab}

execute if score cree77 random_cluster matches 9 if score polished_tuff_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score polished_tuff_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:polished_tuff_wall}

execute if score cree77 random_cluster matches 10 if score tuff_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score tuff_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff_bricks}

execute if score cree77 random_cluster matches 11 if score tuff_brick_stairs bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score tuff_brick_stairs bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff_brick_stairs}

execute if score cree77 random_cluster matches 12 if score tuff_brick_slab bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score tuff_brick_slab bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff_brick_slab}

execute if score cree77 random_cluster matches 13 if score tuff_brick_wall bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score tuff_brick_wall bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:tuff_brick_wall}

execute if score cree77 random_cluster matches 14 if score chiseled_tuff_bricks bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score chiseled_tuff_bricks bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:chiseled_tuff_bricks}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}