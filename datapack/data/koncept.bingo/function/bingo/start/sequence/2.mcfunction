# Project created by the koncept

scoreboard players set tp bingo.type.tp 0

scoreboard players enable @s bingo.tp_yes
scoreboard players enable @s bingo.tp_no

tellraw @s [{"translate":"bingo.settings.teleport_yes","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.settings.teleport_yes_hint","color":"white"}}},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.tp_yes"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]
tellraw @s [{"translate":"bingo.settings.teleport_no","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.settings.teleport_no_hint","color":"white"}}},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.tp_no"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]

scoreboard players reset @s bingo.start
