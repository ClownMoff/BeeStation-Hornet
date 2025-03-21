/obj/item/clothing/gloves/boxing
	name = "boxing gloves"
	desc = "Because you really needed another excuse to punch your crewmates."
	icon_state = "boxing"
	item_state = "boxing"
	worn_icon_state = "boxing"
	equip_delay_other = 60
	species_exception = list(/datum/species/golem) // now you too can be a golem boxing champion

/obj/item/clothing/gloves/boxing/green
	icon_state = "boxinggreen"
	item_state = "boxinggreen"
	worn_icon_state = "boxinggreen"

/obj/item/clothing/gloves/boxing/blue
	icon_state = "boxingblue"
	item_state = "boxingblue"
	worn_icon_state = "boxingblue"

/obj/item/clothing/gloves/boxing/yellow
	icon_state = "boxingyellow"
	item_state = "boxingyellow"
	worn_icon_state = "boxingyellow"

/obj/item/clothing/gloves/boxing/yellow/insulated
	name = "budget boxing gloves"
	desc = "Standard boxing gloves coated in a makeshift insulating coat. This can't possibly go wrong at all."
	icon_state = "boxingyellow"
	item_state = "boxingyellow"
	worn_icon_state = "boxingyellow"
	siemens_coefficient = 1	//Set to a default of 1, gets overridden in Initialize()

/obj/item/clothing/gloves/boxing/yellow/insulated/Initialize(mapload)
	. = ..()
	siemens_coefficient = pick(0,0,0,0,0.25,2)

/obj/item/clothing/gloves/boxing/mmagloves_red
	icon_state = "mmagloves_red"
	item_state = "mmagloves_red"
	worn_icon_state = "mmagloves_red"

/obj/item/clothing/gloves/boxing/mmagloves_blue
	icon_state = "mmagloves_blue"
	item_state = "mmagloves_blue"
	worn_icon_state = "mmagloves_blue"

/obj/item/clothing/gloves/boxing/mmagloves_red_championship
	icon_state = "mmagloves_red_championship"
	item_state = "mmagloves_red_championship"
	worn_icon_state = "mmagloves_red_championship"

/obj/item/clothing/gloves/boxing/mmagloves_blue_championship
	icon_state = "mmagloves_blue_championship"
	item_state = "mmagloves_blue_championship"
	worn_icon_state = "mmagloves_blue_championship"

/obj/item/clothing/gloves/boxing/mmagloves_tot
	icon_state = "mmagloves_red"
	item_state = "mmagloves_red"
	worn_icon_state = "mmagloves_red"

/obj/item/clothing/gloves/boxing/mmagloves_tot
    icon_state = "mmagloves_red"
    item_state = "mmagloves_red"
    worn_icon_state = "mmagloves_red"


/obj/item/clothing/gloves/boxing/mmagloves_tot/grab_act(mob/living/A, mob/living/D)
	..()
	if (!A || !istype(A, /mob/living/carbon/human))
		return

	if (A.body_position == LYING_DOWN)
		var/turf/initial_turf = get_turf(A)
		spawn(50)
			if (A.body_position == LYING_DOWN && get_turf(A) == initial_turf)
				A.visible_message(span_warning("[D] is passing [A]'s guard!"), \
								  span_userdanger("[D] is passing your guard!"), \
								  span_hear("You hear shuffling and grunts!"), null, D)
				if (!HAS_TRAIT(D, TRAIT_PACIFISM))
					to_chat(D, span_danger("You pass [A]'s guard and lock them into a restraining position!"))
					A.visible_message(span_warning("[D] locks [A] into a restraining position!"), \
									  span_userdanger("You're locked into a restraining position by [D]!"), \
									  span_hear("You hear shuffling and a muffled groan!"), null, D)
					A.add_trait(TRAIT_IMMOBILIZED, 10 SECONDS)


/obj/item/clothing/gloves/boxing/mmagloves_tot/grab_act(mob/living/A, mob/living/D,target_zone)
	..()
	if (A.HAS_TRAIT TRAIT_IMMOBILIZED)

	switch(target_zone)
		if (BODY_ZONE_L_LEG)
			to_chat(D, span_danger("You target [A]'s leg, locking in a Knee Bar!"))
			var/turf/initial_turf = get_turf(A)
			var/initial_time = world.time
			spawn(50)
				if (A && get_turf(A) == initial_turf && world.time - initial_time >= 50)
					to_chat(D, span_danger("[A]'s leg snaps!"))
					A.adjustBruteLoss(100, BODY_ZONE_L_LEG) // Deal brute damage to the left leg

		else
			to_chat(D, span_danger("You target [A]'s leg, locking in a COCK TWISTER!"))
		return

			// Add logic for targeting the left leg here

		//if ("head")
			//to_chat(user, span_danger("You target [target]'s head, lock in in a Triangle Choke!"))

		//if ("chest")
			//to_chat(user, span_danger("You target [target]'s chest, preparing to lock in a Rear Naked Choke!"))

		//if ("l_arm", "r_arm")
			//to_chat(user, span_danger("You target [target]'s arm, preparing to execute an Arm Bar!"))

		//else
			//to_chat(user, span_warning("You can't do a Jiu Jitsu move here!"))
