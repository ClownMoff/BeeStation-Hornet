//funny disk event

/mob/living/simple_animal/sentient_disk
	name = "nuclear authentication disk"
	desc = "Better keep this safe."
	icon = 'icons/mob/animal.dmi'
	icon_state = "sentient_nuclear_disk"
	icon_living = "sentient_nuclear_disk"
	mob_biotypes = list(MOB_INORGANIC)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "bops"
	response_disarm_simple = "bop"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	speak_emote = list("states")
	speak_language = /datum/language/metalanguage
	faction = list("neutral")
	see_in_dark = 10
	speed = 100
	held_state = "nucleardisk"
	can_be_held = TRUE
	chat_color = "#38952a"
	mobchatspan = "nuclear authentication disk"
