# Project created by the koncept

scoreboard players enable @s bingo.items_top
scoreboard players enable @s bingo.items_bottom

scoreboard players enable @s bingo.timer.game.yes
scoreboard players enable @s bingo.timer.game.no

scoreboard players enable @s bingo.settings.icon.size_1
scoreboard players enable @s bingo.settings.icon.size_2

scoreboard players enable @s bingo.adjustment_1
scoreboard players enable @s bingo.adjustment_2
scoreboard players enable @s bingo.adjustment_3
scoreboard players enable @s bingo.adjustment_4
scoreboard players enable @s bingo.adjustment_5
scoreboard players enable @s bingo.adjustment_6

scoreboard players enable @s bingo.items_bottom_1
scoreboard players enable @s bingo.items_bottom_2
scoreboard players enable @s bingo.items_bottom_3
scoreboard players enable @s bingo.items_bottom_4
scoreboard players enable @s bingo.items_bottom_5
scoreboard players enable @s bingo.items_bottom_6

scoreboard players enable @s bingo.name.check.list.object_start

scoreboard players enable @s bingo.reset.settings
scoreboard players enable @s bingo.leave.game.yes

tag @s add bingo.game.player.training

tellraw @s ["",{"text":"      "},{"translate":"bingo.settings.title","color":"#54beea"}]

tellraw @s ["",{"translate":"bingo.timer.visibility","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.timer.visibility_hint"}}},{"text":" "},{"text":"[","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.timer.game.yes"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.timer.visibility_yes","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.timer.game.yes"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.timer.game.yes"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":" "},{"text":"[","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.timer.game.no"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.timer.visibility_no","color":"red",click_event:{action:'run_command',command:"/trigger bingo.timer.game.no"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.timer.game.no"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]

tellraw @s ["",{"translate":"bingo.list.check.question","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.list.check.description"}}},{"text":" "},{"text":"[","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.name.check.list.object_start"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.list.check.action","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.name.check.list.object_start"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.name.check.list.object_start"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]

#######################
tellraw @s [{"translate":"bingo.list.position","color":"#f68524",hover_event:{action:'show_text',value:{"translate":"bingo.list.position_hint"}}}]

tellraw @s [{"translate":"bingo.list.position.vertical","color":"#8c51ea",hover_event:{action:'show_text',value:{"translate":"bingo.list.position.vertical_hint"}}},{"text":"  "},{"text":"[Reset]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.items_top"}},{"text":"  "},{"text":"[\u2191 10]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.items_bottom_1"}},{"text":" "},{"text":"[\u2191 1]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.items_bottom_2"}},{"text":" "},{"text":"[\u2193 1]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.items_bottom_3"}},{"text":" "},{"text":"[\u2193 10]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.items_bottom_4"}}]

tellraw @s [{"translate":"bingo.list.position.horizontal","color":"#8c51ea",hover_event:{action:'show_text',value:{"translate":"bingo.list.position.horizontal_hint"}}},{"text":"  "},{"text":"[Reset]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.adjustment_3"}},{"text":"  "},{"text":"[\u2190 10]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.adjustment_1"}},{"text":" "},{"text":"[\u2190 1]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.adjustment_2"}},{"text":" "},{"text":"[\u2192 1]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.adjustment_4"}},{"text":" "},{"text":"[\u2192 10]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.adjustment_5"}}]

tellraw @s [{"translate":"bingo.list.scale","color":"#8c51ea",hover_event:{action:'show_text',value:{"translate":"bingo.list.scale_hint"}}},{"text":"  "},{"text":"[Reset]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.settings.icon.size_1"}},{"text":"  "},{"text":"[-]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.adjustment_6"}},{"text":" "},{"text":"[+]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.settings.icon.size_2"}}]







tellraw @s ["",{"translate":"bingo.list.reset","color":"#ffcc64",hover_event:{action:'show_text',value:{"translate":"bingo.list.reset_hint"}}},{"text":"  "},{"text":"[","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.reset.settings"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"translate":"bingo.list.reset_button","color":"#8CF657",click_event:{action:'run_command',command:"/trigger bingo.reset.settings"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"]","color":"#ffcc64",click_event:{action:'run_command',command:"/trigger bingo.reset.settings"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}},{"text":"  "},{"translate":"bingo.quit.title","color":"#ffcc64"},{"text":" [✔]","color":"#8CF657",click_event:{action:'run_command',command:"/trigger .bingo.leave.game"},hover_event:{action:'show_text',value:{"text":"\u0001","font":"koncept:unicode","color":"white"}}}]

scoreboard players reset @s .bingo.settings

