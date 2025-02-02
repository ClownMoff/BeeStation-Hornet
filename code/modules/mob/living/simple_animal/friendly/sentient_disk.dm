//funny disk event

/mob/living/simple_animal/sentient_disk
	name = "nuclear authentication disk"
	desc = "Better keep this safe."
	icon = 'icons/mob/animal.dmi'
	icon_state = "sentient_nuclear_disk"
	icon_living = "sentient_nuclear_disk"
	held_state = "nucleardisk"
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "bops"
	response_disarm_simple = "bop"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	speak_emote = list("states")
	speak_language = /datum/language/metalanguage
	faction = list("neutral")
	health = 5000
	see_in_dark = 10
	turns_per_move = 10
	speed = 0.25
	chat_color = "#38952a"
	mobchatspan = "nuclear authentication disk"
	can_be_held = TRUE
	mob_biotypes = list(MOB_INORGANIC)
	ventcrawler = VENTCRAWLER_NONE
	spacewalk = TRUE

/mob/living/simple_animal/sentient_disk/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SHOCKIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_RESISTHEAT, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_RESISTCOLD, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_RESISTHIGHPRESSURE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_NORADDAMAGE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_RESISTLOWPRESSURE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_RESISTCOLD, INNATE_TRAIT)
