//Note: Everything in modules/clothing/spacesuits should have the entire suit grouped together.
//      Meaning the the suit is defined directly after the corrisponding helmet. Just like below!
/obj/item/clothing/head/helmet/space
	name = "space helmet"
	icon_state = "spaceold"
	desc = "A special helmet with solar UV shielding to protect your eyes from harmful rays."
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | HEADINTERNALS
	item_state = "spaceold"
	permeability_coefficient = 0.01
	armor = list(MELEE = 0,  BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 80, ACID = 70, STAMINA = 10)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	flash_protect = 2
	strip_delay = 50
	equip_delay_other = 50
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = NONE
	dog_fashion = null

/obj/item/clothing/head/helmet/space/examine(mob/user)
	. = ..()
	. += ("<span class='notice'(You can start constructing a critter sized mecha with a cyborg leg./<span>")

/obj/item/clothing/head/helmet/space/attackby(obj/item/attacked_with, mob/user, params)
	. = ..()
	if(.)
		return
	if(!istype(attacked_with, /obj/item/bodypart/l_leg/robot) && !istype(attacked_with, /obj/item/bodypart/r_leg/robot))
		return
	if(ismob(loc))
		user.balloon_alert(user, "drop the helmet first!")
		return
	user.balloon_alert(user, "leg attached")
	new /obj/item/bot_assembly/vim(loc)
	qdel(attacked_with)
	qdel(src)

/obj/item/clothing/suit/space
	name = "space suit"
	desc = "A suit that protects against low pressure environments. Has a big 13 on the back."
	icon_state = "spaceold"
	item_state = "s_suit"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	clothing_flags = NOTCONSUMABLE | STOPSPRESSUREDAMAGE | THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals)
	slowdown = 1
	armor = list(MELEE = 0,  BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, RAD = 50, FIRE = 80, ACID = 70, STAMINA = 10)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	strip_delay = 80
	equip_delay_other = 80
	resistance_flags = NONE
