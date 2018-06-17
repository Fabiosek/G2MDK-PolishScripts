
func void b_makerangerreadyformeeting(var C_NPC ranger)
{
	CreateInvItems(ranger,itar_fake_ranger,1);
	AI_UnequipArmor(ranger);
	AI_EquipArmor(ranger,itar_fake_ranger);
	ranger.npctype = NPCTYPE_FRIEND;
};

func void b_makerangerreadytoleavemeeting(var C_NPC ranger)
{
	AI_UnequipArmor(ranger);
	Npc_RemoveInvItems(ranger,itar_ranger_addon,Npc_HasItems(ranger,itar_ranger_addon));
	Npc_RemoveInvItems(ranger,itar_fake_ranger,Npc_HasItems(ranger,itar_fake_ranger));
	AI_EquipBestArmor(ranger);
};

func void b_makerangerreadyformeetingall()
{
	b_makerangerreadyformeeting(martin);
	b_makerangerreadyformeeting(lares);
	b_makerangerreadyformeeting(cord);
	b_makerangerreadyformeeting(gaan);
	b_makerangerreadyformeeting(orlan);
	b_makerangerreadyformeeting(cavalorn);
};

func void b_makerangerreadytoleavemeetingall()
{
	b_makerangerreadytoleavemeeting(martin);
	b_makerangerreadytoleavemeeting(lares);
	b_makerangerreadytoleavemeeting(cord);
	b_makerangerreadytoleavemeeting(gaan);
	b_makerangerreadytoleavemeeting(orlan);
	b_makerangerreadytoleavemeeting(cavalorn);
};

func void b_addon_orlan_rangersreadyforcoming()
{
	if(MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL != 0)
	{
		b_startotherroutine(cavalorn,"PreRangerMeeting");
	};
	b_startotherroutine(martin,"PreRangerMeeting");
	b_startotherroutine(lares,"PreRangerMeeting");
	b_startotherroutine(cord,"PreRangerMeeting");
	b_startotherroutine(gaan,"PreRangerMeeting");
};

func void b_addon_orlan_comingranger()
{
	if(MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL != 0)
	{
		b_startotherroutine(cavalorn,"RangerMeeting");
	};
	b_startotherroutine(martin,"RangerMeeting");
	b_startotherroutine(lares,"RangerMeeting");
	b_startotherroutine(cord,"RangerMeeting");
	b_startotherroutine(gaan,"RangerMeeting");
	b_startotherroutine(orlan,"RangerMeeting");
	RANGERMEETINGRUNNING = LOG_RUNNING;
};

func void b_rangermeetingparking()
{
	if(MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL != 0)
	{
		b_startotherroutine(cavalorn,"Stadt");
	};
	b_startotherroutine(orlan,"START");
	LARES_HALTSMAUL = TRUE;
	b_startotherroutine(lares,"Parking");
	b_startotherroutine(cord,"Parking");
	if(gaan.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		b_startotherroutine(gaan,"Parking");
	}
	else
	{
		b_startotherroutine(gaan,"Parking");
	};
	if(MIS_ADDON_MARTIN_GETRANGAR == 0)
	{
		b_startotherroutine(martin,"Parking");
	}
	else
	{
		b_startotherroutine(martin,"Parking");
	};
};

func void b_schlussmitrangermeeting()
{
	if(MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL != 0)
	{
		b_startotherroutine(cavalorn,"Stadt");
	};
	b_startotherroutine(lares,"Start");
	b_startotherroutine(cord,"Start");
	if(gaan.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		b_startotherroutine(gaan,"PreStart");
	}
	else
	{
		b_startotherroutine(gaan,"Start");
	};
	if(MIS_ADDON_MARTIN_GETRANGAR == 0)
	{
		b_startotherroutine(martin,"PreStart");
	}
	else
	{
		b_startotherroutine(martin,"Start");
	};
	b_startotherroutine(orlan,"Start");
	LARES_HALTSMAUL = LOG_OBSOLETE;
};

