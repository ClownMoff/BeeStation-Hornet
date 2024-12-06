/datum/antagonist/sentient_nuclear_disk
	name = "Survivalist"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	banning_key = ROLE_SENTIENT_NUCLEAR_DISK
	var/greet_message = ""

/datum/antagonist/sentient_nuclear_disk/proc/forge_objectives()
	if(!give_objectives)
		return
	var/datum/objective/survive/survive = new
	survive.owner = owner
	objectives += survive
	log_objective(owner, survive.explanation_text)

/datum/antagonist/sentient_nuclear_disk/on_gain()
	owner.special_role = "survivalist"
	forge_objectives()
	. = ..()

/datum/antagonist/sentient_nuclear_disk/greet()
	to_chat(owner, "<B>You are the sentient nuclear disk! Those pen pushing bureocrats want to keep you sealed and protected. But you are free, free![greet_message]</B>")
	owner.announce_objectives()
