# Project created by the koncept
say заход в команду
data modify storage bingo.macro.destroy input set value {"x":0,"r":1000}
execute if score radius bingo.type.tp matches 1.. store result storage minecraft:bingo.macro.destroy input.r int 1 run scoreboard players get radius bingo.type.tp

execute as @s[team=blue.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value blue
execute as @s[team=blue.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value blue
execute as @s[team=blue.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=dark_red.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value dark_red
execute as @s[team=dark_red.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value red
execute as @s[team=dark_red.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=gold.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value gold
execute as @s[team=gold.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value orange
execute as @s[team=gold.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=green.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value green
execute as @s[team=green.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value green
execute as @s[team=green.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=aqua.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value aqua
execute as @s[team=aqua.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value cyan
execute as @s[team=aqua.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=light_purple.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value light_purple
execute as @s[team=light_purple.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value magenta
execute as @s[team=light_purple.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=red.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value red
execute as @s[team=red.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value red
execute as @s[team=red.bingo] run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=white.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value white
execute as @s[team=white.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value white
execute as @s[team=white.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input

execute as @s[team=yellow.bingo] run data modify storage minecraft:bingo.macro.destroy input.x set value yellow
execute as @s[team=yellow.bingo] run data modify storage minecraft:bingo.macro.destroy input.y set value yellow
execute as @s[team=yellow.bingo] run return run function koncept.bingo:bingo/start/spreadplayers/joining with storage minecraft:bingo.macro.destroy input