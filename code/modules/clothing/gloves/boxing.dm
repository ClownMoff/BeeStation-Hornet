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
