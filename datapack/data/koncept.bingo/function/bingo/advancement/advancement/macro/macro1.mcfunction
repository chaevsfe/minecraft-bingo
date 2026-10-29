# Project created by the koncept

$execute store result storage bingo:macro.adv number int 1 run data get storage minecraft:bingo.macro data.id_$(object)

$data modify storage minecraft:bingo.macro team.$(team) append value $(object)
#$execute at @s[team=$(team).bingo] as @s run function koncept.bingo:bingo/advancement/green_cell/$(team)
$execute at @s[team=$(team).bingo] as @s run tellraw @a[team=$(team).bingo] [{"translate":"bingo.status.collected_item","color":"gold","with":[{"selector":"@s","color":"gold"},{"translate":"$(translate).minecraft.$(translate_object)","color":"#ffcc64"}]}]
$scoreboard players add $(team) bingo.count.object 1
scoreboard players add @s bingo.count.object 1
$execute at @s[team=$(team).bingo] as @s run playsound minecraft:block.note_block.xylophone master @a[team=$(team).bingo] ~ ~ ~ 9999999999 0.46
$execute at @s[team=$(team).bingo] as @s run tellraw @a[tag=bingo.game.player,team=!$(team).bingo] [{"translate":"bingo.status.collected_item_team","color":"white","with":[{"translate":"bingo.chat.color.$(team)","color":"$(team)"}]}]

execute store result score number bingo.macro.number.adv run data get storage bingo:macro.adv number

function koncept.bingo:bingo/advancement/advancement/macro/macro2 with storage bingo:macro.adv