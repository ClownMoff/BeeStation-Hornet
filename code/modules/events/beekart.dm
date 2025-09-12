//I have no idea what I'm doing.

/datum/round_event_control/beekart
	name = "Spess Kart 64"
	typepath = /datum/round_event/beekart
	min_players = 15 //this does not matter since it's player triggered
	max_occurrences = 5 //this also does not matter since it's player triggered
	can_malf_fake_alert = FALSE

/datum/round_event/beekart/start()
	var/racetrack = /area/beekart
	var/list/mobs_to_iterate = mobs_in_area_type(list(racetrack))
	for(var/area/A in world)
		if(istype(A, racetrack))
			for(var/mob/living/L as() in mobs_to_iterate)
				ADD_TRAIT(L, TRAIT_RACER, TRAIT_GENERIC)
				L.checkpoint_count = 0
				L.lap = 1

/datum/round_event/beekart/announce()
    priority_announce("SPESS KART 64 has been summmoned.", ANNOUNCEMENT_TYPE_SYNDICATE, has_important_message = TRUE, title = "Lakitu")

/obj/structure/trap/race_checkpoint
	name = "Race Checkpoint"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "race_checkpoint"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	alpha = 255
	var/required_checkpoint = 0
	var/set_checkpoint = 1

/obj/structure/trap/race_checkpoint/trap_effect(mob/living/L)
	if(!HAS_TRAIT(L, TRAIT_RACER))
		if(L.checkpoint_count != required_checkpoint)
			L.visible_message(
				span_userdanger("Don't try to cheat! Follow the race!"))
	else
		if(L.checkpoint_count == set_checkpoint)
			L.checkpoint_count = set_checkpoint
	return

/obj/structure/trap/race_checkpoint/second
	name = "Race Checkpoint 2"
	required_checkpoint = 1
	set_checkpoint = 2

/obj/structure/trap/race_checkpoint/third
	name = "Race Checkpoint 3"
	required_checkpoint = 2
	set_checkpoint = 3

/obj/structure/trap/finish_line
	name = "Finish Line"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "race_checkpoint"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	alpha = 255
	var/required_checkpoint = 0
	var/set_checkpoint = 1

/obj/structure/trap/finish_line/trap_effect(mob/living/L)
	if(!HAS_TRAIT(L, TRAIT_RACER))
		if ((L.checkpoint_count == 3) && (L.lap == 1))
			L.lap = 2
			L.checkpoint_count = 0
			to_chat(L, "<span class='notice'>You have started Lap 2!</span>")
			return
		if ((L.checkpoint_count == 3) && (L.lap == 2))
			L.lap = 3
			L.checkpoint_count = 0
			to_chat(L, "<span class='notice'>You have started Lap 3!</span>")
			return
		if ((L.checkpoint_count == 3) && (L.lap == 3))
			to_chat(L, "<span class='notice'>You have finished the race!</span>")
			return
