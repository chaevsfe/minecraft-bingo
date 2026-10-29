# Project created by the koncept

scoreboard players enable @s bingo.dynamic.advancement.enabled
scoreboard players enable @s bingo.dynamic.advancement.disabled

scoreboard players set @s bingo.dynamic.advancement 0

tellraw @s [{"translate":"bingo.dynamic.advancement.disabled","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.dynamic.advancement.disabled_hint","color":"white"}}},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.dynamic.advancement.disabled"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]
tellraw @s [{"translate":"bingo.dynamic.advancement.enabled","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.dynamic.advancement.enabled_hint","color":"white"}}},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.dynamic.advancement.enabled"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]