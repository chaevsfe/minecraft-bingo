# Project created by the koncept

$execute store result score number$(number)$(team) bingo.macro.number.adv run data get storage bingo:macro.adv number

$data modify storage bingo.macro $(team)_$(number) set value "\\u0002"

$execute as @a[team=$(team).bingo] at @s run function koncept.bingo:bingo/bossbar/start
schedule function koncept.bingo:bingo/win/macro/start 10t