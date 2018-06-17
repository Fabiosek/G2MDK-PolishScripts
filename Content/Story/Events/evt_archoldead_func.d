
var int evt_archoldead_func_onetime;

func void evt_archoldead_func()
{
	if(Npc_IsDead(skeleton_lord_archol))
	{
		skeleton_archol1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol5.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol6.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(evt_archoldead_func_onetime == FALSE)
	{
		b_logentry(TOPIC_HALLENVONIRDORATH,"Odkry³em tutaj œwi¹tyniê, w której pe³no jest o¿ywieñców. Dziwnie przypomina mi orkow¹ œwi¹tyniê Œni¹cego. Tym razem jednak nie zawiodê. Nie tym razem!");
		evt_archoldead_func_onetime = TRUE;
	};
};

