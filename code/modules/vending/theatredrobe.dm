/obj/machinery/vending/theatredrobe
	name = "TheatreDrobe"
	desc = "A machine for all the honkers and the mimers."
	icon_state = "theatredrobe"
	product_ads = "Put on a show!"
	vend_reply = "Honk!"
	products = list(/obj/item/clothing/mask/gas/clown_hat = 3,
					/obj/item/clothing/under/rank/civilian/clown = 2,
					/obj/item/clothing/shoes/clown_shoes = 2,
					/obj/item/clothing/under/rank/civilian/clown/blue = 2,
					/obj/item/clothing/under/rank/civilian/clown/green = 2,
					/obj/item/clothing/under/rank/civilian/clown/yellow = 2,
					/obj/item/clothing/under/rank/civilian/clown/orange = 2,
					/obj/item/clothing/under/rank/civilian/clown/purple = 2,
					/obj/item/clothing/under/rank/civilian/clown/rainbow = 2,
					/obj/item/clothing/under/rank/civilian/clown/sexy = 2,
					/obj/item/clothing/under/rank/civilian/clown/jester = 2,
					/obj/item/clothing/head/costume/jester = 2,
					/obj/item/clothing/mask/gas/joker = 2,
					/obj/item/clothing/under/costume/joker = 2,
					/obj/item/clothing/suit/costume/joker,
					/obj/item/clothing/mask/gas/chaos = 2,
					/obj/item/clothing/mask/gas/lunatic = 2,
					/obj/item/clothing/mask/gas/mime = 3,
					/obj/item/clothing/under/rank/civilian/mime = 2,
					/obj/item/clothing/suit/suspenders = 2,
					/obj/item/clothing/under/rank/civilian/mime/sexy = 2,
					/obj/item/clothing/under/rank/civilian/mime/skirt = 2,
					/obj/item/clothing/mask/gas/pierrot = 2,
					/obj/item/clothing/suit/costume/pierrot = 2,
					/obj/item/clothing/shoes/pierrot = 2)

	refill_canister = /obj/item/vending_refill/wardrobe/theatredrobe
	extra_price = 350
	dept_req_for_free = ACCOUNT_SRV_BITFLAG

/obj/item/vending_refill/wardrobe/theatredrobe
	machine_name = "TheatreDrobe"
