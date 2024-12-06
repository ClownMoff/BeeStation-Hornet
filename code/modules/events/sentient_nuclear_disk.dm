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
	for(var/turf/L in GLOB.sentient_nuclear_disk_spawn)
		possible_spawns += L
	var/obj/item/disk/nuclear/N = locate() in GLOB.poi_list
	var/list/mob/dead/observer/candidates
	candidates = get_candidates(ROLE_SENTIENT_NUCLEAR_DISK, null)
	var/result = spawn_sentient_nuclear_disk(landing_turf, candidates, spawned_mobs)
	if(result != SUCCESSFUL_SPAWN)
		return result
	priority_announce("According to our data, the stations Nuclear Authentiaction Disk has developped sentience and the ability to move. Please locate it and ensure its safety.", "Security Alert", SSstation.announcer.get_rand_report_sound())
	return SUCCESSFUL_SPAWN

/proc/spawn_sentient_nuclear_disk(turf/landing_turf, list/candidates, list/spawned_mobs)
	var/job_check = 0
	for (var/mob/H in SSticker.mode.current_players[CURRENT_LIVING_PLAYERS])
		if(H.mind)
			var/datum/mind/M = H.mind
			if (M.assigned_role == JOB_NAME_CAPTAIN || M.assigned_role == JOB_NAME_HEADOFPERSONNEL || M.assigned_role == JOB_NAME_HEADOFSECURITY || M.assigned_role == JOB_NAME_RESEARCHDIRECTOR|| M.assigned_role == JOB_NAME_CHIEFENGINEERM.assigned_role == JOB_NAME_CHIEFENGINEER)
				job_check += 1

	var/member_size = rand(1, round(job_check/2) + 1)
	for(var/i in 1 to member_size)
		var/mob/dead/selected = pick_n_take(candidates)
		if(!selected)
			continue
		spawned_mobs += S

	return SUCCESSFUL_SPAWN
