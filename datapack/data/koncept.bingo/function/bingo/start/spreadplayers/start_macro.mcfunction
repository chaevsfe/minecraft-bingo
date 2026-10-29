# Project created by the koncept

data modify storage bingo.macro.destroy input set value {"x":0}

execute if entity @a[team=blue.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value blue
execute if entity @a[team=blue.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value blue
execute if entity @a[team=blue.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=dark_red.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value dark_red
execute if entity @a[team=dark_red.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value red
execute if entity @a[team=dark_red.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=gold.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value gold
execute if entity @a[team=gold.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value orange
execute if entity @a[team=gold.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=green.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value green
execute if entity @a[team=green.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value green
execute if entity @a[team=green.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=aqua.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value aqua
execute if entity @a[team=aqua.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value cyan
execute if entity @a[team=aqua.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=light_purple.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value light_purple
execute if entity @a[team=light_purple.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value magenta
execute if entity @a[team=light_purple.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=red.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value red
execute if entity @a[team=red.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value red
execute if entity @a[team=red.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=white.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value white
execute if entity @a[team=white.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value white
execute if entity @a[team=white.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input

execute if entity @a[team=yellow.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value yellow
execute if entity @a[team=yellow.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value yellow
execute if entity @a[team=yellow.bingo] run function koncept.bingo:bingo/start/spreadplayers/all with storage minecraft:bingo.macro.destroy input