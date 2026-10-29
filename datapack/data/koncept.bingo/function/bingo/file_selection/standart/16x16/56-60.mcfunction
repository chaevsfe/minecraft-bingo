# Project created by the koncept
#file refinement

execute if score cree77 bingo.random matches 56 if score glistering_melon_slice bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 56 if score glistering_melon_slice bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glistering_melon_slice}

execute if score cree77 bingo.random matches 57 if score glow_berries bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 57 if score glow_berries bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glow_berries}

execute if score cree77 bingo.random matches 58 if score glow_ink_sac bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 58 if score glow_ink_sac bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glow_ink_sac}

execute if score cree77 bingo.random matches 59 if score glow_item_frame bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 59 if score glow_item_frame bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glow_item_frame}

execute if score cree77 bingo.random matches 60 if score glow_lichen bingo.restart.replay matches 1 run scoreboard players set cree77 bingo.random_start 1
execute if score cree77 bingo.random matches 60 if score glow_lichen bingo.restart.replay matches 0 run function koncept.bingo:bingo/object/16x16 {object:glow_lichen}

scoreboard objectives remove bingo.random
scoreboard objectives add bingo.random dummy

execute if score cree77 bingo.random_start matches 1 run function koncept.bingo:bingo/random_start {sound:0}