/datum/round_event_control/sentient_nuclear_disk
	name = "Spawn Sentient Disk"
	typepath = /datum/round_event/ghost_role/sentient_nuclear_disk
	weight = 9999
	max_occurrences = 1
	min_players = 35
	cannot_spawn_after_shuttlecall = FALSE

/datum/round_event/ghost_role/sentient_nuclear_disk/setup()
	minimum_required = 1
	role_name = ROLE_SENTIENT_NUCLEAR_DISK
	fakeable = FALSE

/datum/round_event/ghost_role/sentient_nuclear_disk/spawn_role()
	var/list/possible_spawns = list()
	for(var/turf/L in GLOB.clownloose_spawn)
		possible_spawns += L
	var/turf/landing_turf = pick(possible_spawns)
	var/list/mob/dead/observer/candidates
	candidates = get_candidates(ROLE_SENTIENT_NUCLEAR_DISK, null)
	var/result = spawn_clownloose(landing_turf, candidates, spawned_mobs)
	if(result != SUCCESSFUL_SPAWN)
		return result
	priority_announce("According to our data, the stations Nuclear Authentiaction Disk has developped sentience and the ability to move. Please locate it and ensure its safety.", "Security Alert", SSstation.announcer.get_rand_report_sound())
	return SUCCESSFUL_SPAWNoK
