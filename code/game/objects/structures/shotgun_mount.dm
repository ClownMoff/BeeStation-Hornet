/obj/structure/shotgun_mount
	name = "Shotgun mount"
	desc = "Mount for showcasing your bar peacekeeper."
	icon = 'icons/obj/wallmounts.dmi'
	icon_state = "shotgun_mount"
	anchored = TRUE
	density = FALSE
	layer = ABOVE_WINDOW_LAYER
	var/locked = TRUE
	var/open = FALSE
	var/obj/item/gun/ballistic/shotgun/doublebarrel/shotgun

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/shotgun_mount, 32)

/obj/structure/shotgun_mount/Initialize(mapload)
	. = ..()
	shotgun = new
	update_appearance()

/obj/structure/shotgun_mount/Destroy()
	if(shotgun)
		QDEL_NULL(shotgun)
	return ..()

/obj/structure/shotgun_mount/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/gun/ballistic/shotgun/doublebarrel) && !shotgun)
		to_chat(user, span_notice("You place the shotgun back in the mount."))
		update_appearance()
	else
		to_chat(user, span_notice("That does not belong in the shotgun mount."))
		return ..()

/obj/structure/shotgun_mount/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(shotgun)
		user.put_in_hands(shotgun)
		shotgun = null
		to_chat(user, span_notice("You take the shotgun from the shotgun mount."))
		add_fingerprint(user)
		update_appearance()
		return

/obj/structure/shotgun_mount/attack_paw(mob/living/user)
	return attack_hand(user)

/obj/structure/shotgun_mount/update_icon()
	cut_overlays()
	if(shotgun)
		add_overlay("shotgun_mounted")
