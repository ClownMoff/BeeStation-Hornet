/obj/effect/proc_holder/spell/targeted/mariachi
	name = "Perform!"
	desc = "Time to give the people the song of their lives! Requires all mariachi gondolas to be together."
	include_user = 1
	range = -1
	charge_max = 5
	cooldown_min = 5
	action_icon = 'icons/obj/food/piecake.dmi'
	action_icon_state = "pie"
	playsound(target, 'sound/ambience/mariachi.ogg', 50, 1)
