// MIXED MARTIAL ARTS. 3 DIFFERENT martial arts are defined here, should not be used separetaly so I'm adding all of them here
var/datum/martial_art/jiujitsu/jiujitsustyle = new
//var/datum/martial_art/kickboxing/kickboxingstyle = new
//var/datum/martial_art/grappling/grapplingstyle = new
var/turf/initial_turf = get_turf
var/mmagloves = new/obj/item/clothing/gloves/mma_gloves_tot

/datum/martial_art/jiujitsu
	name = "Jiu-Jitsu"
	id = MARTIALART_JIUJITSU
	pacifist_style = FALSE

/datum/martial_art/jiujitsu/grab_act(mob/living/grabber, mob/living/grabbed)
	if (grabbed.body_position == LYING_DOWN)
		initial_turf = get_turf(grabber)
		spawn(50)
		if (grabber.body_position == LYING_DOWN && get_turf(grabber) == initial_turf)
			grabber.visible_message(span_warning("[grabber] is passing [grabbed]'s guard!"), \
				span_userdanger("[grabber] is passing your guard!"), \
				span_hear("You hear shuffling and grunts!"), null, grabbed)
				ADD_TRAIT(grabbed, TRAIT_IMMOBILIZED, 10)
			else
				to_chat(grabber, span_warning("They need to be on the ground to submit them!"))
		return TRUE
	initial_turf = get_turf(grabber)
	if (HAS_TRAIT(grabbed, TRAIT_IMMOBILIZED) && get_turf(grabber) == initial_turf)
		return TRUE
	spawn(50)
	if(grabbed.is_zone_selected(BODY_ZONE_HEAD))
		to_chat(grabbed, span_danger("[grabber] puts you in a Rear Naked Choke!"))
		grabber.visible_message(span_warning("[grabber] locks [grabbed] into a Rear Naked Choke!"),
			span_userdanger("You're locked into a rear naked choke position by [grabber]! You are gonna go to sleep!"),
			span_hear("You hear shuffling and a muffled groan!"), null, grabbed)
		to_chat(grabbed, "<span class='danger'>You put [grabber] into a rear naked choke!</span>")

/obj/item/clothing/gloves/mma_gloves_tot
	name = "Blood Red Mma Gloves"
	desc = "Gloves for sanctioned fights inside a cage"
	icon_state = "mma_gloves_syndicate"
	item_state = "mma_gloves_syndicate"
	worn_icon_state = "mma_gloves_syndicate"
	clothing_flags = MMA_GLOVES
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	actions_types = list(
		/datum/action/item_action/jiujitsu_toggle,
		/datum/action/item_action/kickboxing_toggle,
		/datum/action/item_action/grappling_toggle,
	)

/datum/action/item_action/jiujitsu_toggle
	name = "Brazillian Jiu-Jitsu. Ground fighting. Submit people."
	icon_icon = 'icons/hud/actions/actions_items.dmi'
	button_icon_state = "jiu-jitsu"
	name = "Jiu-Jitsu stance"

/datum/action/item_action/on_activate(user, target)
	var/mob/living/carbon/human/mmafighter = user
	if(mmafighter.gloves?.clothing_flags & MMA_GLOVES)
		jiujitsustyle.teach(src, TRUE)

/datum/action/item_action/kickboxing_toggle
	name = "Kickboxing. Stand-up striking. Light them up."
	icon_icon = 'icons/hud/actions/actions_items.dmi'
	button_icon_state = "kick-boxing"

/datum/action/item_action/grappling_toggle
	name = "Grappling. Projections. Toss them around"
	icon_icon = 'icons/hud/actions/actions_items.dmi'
	button_icon_state = "grappling"
