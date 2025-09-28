
/// Wanted statuses
#define WANTED_ARREST "Arrest"
#define WANTED_DISCHARGED "Discharged"
#define WANTED_NONE "None"
#define WANTED_PAROLE "Parole"
#define WANTED_PRISONER "Incarcerated"
#define WANTED_SUSPECT "Suspected"
#define WANTED_HR_MEETING "HR Meeting"
#define WANTED_DEMOTION "Demotion"
#define WANTED_DEMOTED "Demoted"

/// List of available wanted statuses
#define WANTED_STATUSES(...) list(\
	WANTED_NONE, \
	WANTED_SUSPECT, \
	WANTED_ARREST, \
	WANTED_PRISONER, \
	WANTED_PAROLE, \
	WANTED_DISCHARGED, \
	WANTED_HR_MEETING, \
	WANTED_DEMOTION, \
	WANTED_DEMOTED, \
)
