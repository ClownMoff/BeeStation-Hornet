// MIXED MARTIAL ARTS. 3 DIFFERENT martial arts are defined here, should not be used separetaly so I'm adding all of them here

/obj/item/clothing/gloves/mma_gloves_tot
	name = "Blood Red Mma Gloves"
	desc = "Gloves for sanctioned fights inside a cage"
	icon_state = "mma_gloves_tot"
	item_state = "mma_gloves_tot"
	worn_icon_state = "mma_gloves_tot"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	bio = 90
	fire = 80
	acid = 50
	actions_types = list(
	var/datum/action/jiujitsu = new/datum/action/jiujitsu_toggle(),
	var/datum/action/kickboxing = new/datum/action/kickboxing_toggle(),
	var/datum/action/grappling = new/datum/action/grappling_toggle(),
	)

/datum/action/jiujitsu_toggle
	name = "Brazillian Jiu-Jitsu. Ground fighting. Submit people."
	icon_icon = 'icons/hud/actions/actions_items.dmi'
	button_icon_state = "jiu-jitsu"

	New(obj/item/clothing/gloves/mma_gloves_tot/gloves)
		gloves = gloves

	perform(mob/user)
		if(!gloves)
			return
		if(gloves.current_mode == "jiu-jitsu")
			gloves.current_mode = null
			user << "You exit the Jiu-Jitsu stance."
			user.remove_action(/datum/action/jiujitsu)
			if(user.mind)
				user.mind.remove_martialart(MARTIALART_JIUJITSU)
		else
			gloves.current_mode = "jiu-jitsu"
			user << "You enter a Jiu-Jitsu stance."
			user.add_action(new/datum/action/jiujitsu())
			if(user.mind)
				user.mind.add_martialart(MARTIALART_JIUJITSU)

/datum/action/kickboxing_toggle
	name = "Kickboxing. Stand-up striking. Light them up."
	icon_icon = 'icons/hud/actions/actions_items.dmi'
	button_icon_state = "kick-boxing"

/datum/action/grappling_toggle
	name = "Grappling. Projections. Toss them around"
	icon_icon = 'icons/hud/actions/actions_items.dmi'
	button_icon_state = "grappling"

/datum/martial_art/jiujitsu
	name = "Jiu-Jitsu"
	id = MARTIALART_JIUJITSU
	pacifist_style = FALSE

/datum/martial_art/jiujitsu/grab_act(mob/living/A, mob/living/D)
	if (D.body_position == LYING_DOWN)
		var/turf/initial_turf = get_turf(A)
		spawn(50)
			if (A.body_position == LYING_DOWN && get_turf(A) == initial_turf)
				A.visible_message(span_warning("[A] is passing [D]'s guard!"), \
								  span_userdanger("[A] is passing your guard!"), \
								  span_hear("You hear shuffling and grunts!"), null, D)
		if (!HAS_TRAIT(D, TRAIT_PACIFISM))
			to_chat(D, span_danger("[A] passes your guard and locks you into a restraining position!"))
			A.visible_message(span_warning("[A] locks [D] into a restraining position!"),
							  span_userdanger("You're locked into a restraining position by [A]!"),
							  span_hear("You hear shuffling and a muffled groan!"), null, D)
			A.add_trait(TRAIT_IMMOBILIZED, 10)
		else
			to_chat(A, span_warning("They need to be on the ground to submit them!"))
	return TRUE
