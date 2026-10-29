# Project created by the koncept

#Random selection
scoreboard objectives add random_cluster dummy

execute store result score cree77 random_cluster run random value 1..18

#file refinement

execute if score cree77 random_cluster matches 1 if score coal_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 1 if score coal_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:coal_ore}

execute if score cree77 random_cluster matches 2 if score deepslate_coal_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 2 if score deepslate_coal_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_coal_ore}

execute if score cree77 random_cluster matches 3 if score iron_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 3 if score iron_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:iron_ore}

execute if score cree77 random_cluster matches 4 if score deepslate_iron_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 4 if score deepslate_iron_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_iron_ore}

execute if score cree77 random_cluster matches 5 if score copper_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 5 if score copper_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:copper_ore}

execute if score cree77 random_cluster matches 6 if score deepslate_copper_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 6 if score deepslate_copper_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_copper_ore}

execute if score cree77 random_cluster matches 7 if score gold_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 7 if score gold_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:gold_ore}

execute if score cree77 random_cluster matches 8 if score deepslate_gold_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 8 if score deepslate_gold_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_gold_ore}

execute if score cree77 random_cluster matches 9 if score redstone_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 9 if score redstone_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:redstone_ore}

execute if score cree77 random_cluster matches 10 if score deepslate_redstone_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 10 if score deepslate_redstone_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_redstone_ore}

execute if score cree77 random_cluster matches 11 if score emerald_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 11 if score emerald_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:emerald_ore}

execute if score cree77 random_cluster matches 12 if score deepslate_emerald_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 12 if score deepslate_emerald_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_emerald_ore}

execute if score cree77 random_cluster matches 13 if score lapis_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 13 if score lapis_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:lapis_ore}

execute if score cree77 random_cluster matches 14 if score deepslate_lapis_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 14 if score deepslate_lapis_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_lapis_ore}

execute if score cree77 random_cluster matches 15 if score diamond_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 15 if score diamond_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:diamond_ore}

execute if score cree77 random_cluster matches 16 if score deepslate_diamond_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 16 if score deepslate_diamond_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:deepslate_diamond_ore}

execute if score cree77 random_cluster matches 17 if score nether_gold_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 17 if score nether_gold_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:nether_gold_ore}

execute if score cree77 random_cluster matches 18 if score nether_quartz_ore bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 random_cluster matches 18 if score nether_quartz_ore bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/64x64 {object:nether_quartz_ore}

scoreboard objectives remove random_cluster

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}