# Project created by the koncept

scoreboard players reset @s bingo.dynamic.advancement

scoreboard players enable @s bingo.dynamic.locator.bar.enabled
scoreboard players enable @s bingo.dynamic.locator.bar.disabled

scoreboard players set @s bingo.dynamic.locator.bar 0

execute unless score mod bingo.companion matches 1 run tellraw @s [{"translate":"bingo.dynamic.locator.bar.disabled","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.dynamic.locator.bar.disabled_hint","color":"white"}}},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.dynamic.locator.bar.disabled"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]
execute unless score mod bingo.companion matches 1 run tellraw @s [{"translate":"bingo.dynamic.locator.bar.enabled","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.dynamic.locator.bar.enabled_hint","color":"white"}}},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.dynamic.locator.bar.enabled"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]