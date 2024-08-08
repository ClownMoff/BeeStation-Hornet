/obj/effect/proc_holder/spell/self/mariachi
    name = "Perform!"
    desc = "Time to give the people the song of their lives! Requires all mariachi gondolas to be together."
    clothes_req = FALSE
    human_req = FALSE
    charge_max = 10
    action_icon = 'icons/obj/food/piecake.dmi'
    action_icon_state = "pie"

/obj/effect/proc_holder/spell/self/mariachi/cast(mob/living/user = usr)
    playsound(user.loc, 'sound/ambience/mariachi.ogg', 50, TRUE)
