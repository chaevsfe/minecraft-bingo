# Project created by the koncept

scoreboard players reset @s bingo.no.timer.visibility

tag @s add bingo.no.timer.visibility

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

$title @s actionbar [{"translate":"bingo.list.check.result","color":"#ffcc64"},{"translate":"$(id_24)","color":"#ffcc64"}]

scoreboard players reset @s bingo.name.check.list.object_24
scoreboard players enable @s bingo.name.check.list.object_24