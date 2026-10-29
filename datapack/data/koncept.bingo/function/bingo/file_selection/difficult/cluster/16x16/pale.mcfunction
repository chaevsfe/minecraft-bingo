# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..9

#file refinement

execute if score cree77 random_cluster matches 1 if score closed_eyeblossom bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score closed_eyeblossom bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:closed_eyeblossom}

execute if score cree77 random_cluster matches 2 if score open_eyeblossom bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score open_eyeblossom bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:open_eyeblossom}

execute if score cree77 random_cluster matches 3 if score pale_hanging_moss bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score pale_hanging_moss bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pale_hanging_moss}

execute if score cree77 random_cluster matches 4 if score pale_oak_boat bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score pale_oak_boat bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pale_oak_boat}

execute if score cree77 random_cluster matches 5 if score pale_oak_chest_boat bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score pale_oak_chest_boat bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pale_oak_chest_boat}

execute if score cree77 random_cluster matches 6 if score pale_oak_door bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score pale_oak_door bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pale_oak_door}

execute if score cree77 random_cluster matches 7 if score pale_oak_hanging_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score pale_oak_hanging_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pale_oak_hanging_sign}

execute if score cree77 random_cluster matches 8 if score pale_oak_sapling bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score pale_oak_sapling bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pale_oak_sapling}

execute if score cree77 random_cluster matches 9 if score pale_oak_sign bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score pale_oak_sign bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:pale_oak_sign}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}