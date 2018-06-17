
func void b_assignschiffswachenguard(var C_NPC schiffswache)
{
	if((MIS_SHIPISFREE == TRUE) || (MIS_SCVISITSHIP == LOG_RUNNING))
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Obserwujemy ciê, wiêc lepiej o tym pamiêtaj.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Nie wpl¹cz siê w jakieœ k³opoty, bêd¹c tutaj.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Nawet nie myœl o kradzie¿y, jasne?
		};
		AI_StopProcessInfos(schiffswache);
		Npc_SetRefuseTalk(schiffswache,60);
		Npc_SetRefuseTalk(pal_220_schiffswache,60);
		Npc_SetRefuseTalk(pal_221_schiffswache,60);
		Npc_SetRefuseTalk(pal_222_schiffswache,60);
		Npc_SetRefuseTalk(pal_223_schiffswache,60);
		Npc_SetRefuseTalk(pal_224_schiffswache,60);
		Npc_SetRefuseTalk(pal_225_schiffswache,60);
		Npc_SetRefuseTalk(pal_226_schiffswache,60);
		Npc_SetRefuseTalk(pal_227_schiffswache,60);
		Npc_SetRefuseTalk(pal_228_schiffswache,60);
	}
	else
	{
		b_say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
		Npc_SetRefuseTalk(schiffswache,20);
		Npc_SetRefuseTalk(pal_220_schiffswache,20);
		Npc_SetRefuseTalk(pal_221_schiffswache,20);
		Npc_SetRefuseTalk(pal_222_schiffswache,20);
		Npc_SetRefuseTalk(pal_223_schiffswache,20);
		Npc_SetRefuseTalk(pal_224_schiffswache,20);
		Npc_SetRefuseTalk(pal_225_schiffswache,20);
		Npc_SetRefuseTalk(pal_226_schiffswache,20);
		Npc_SetRefuseTalk(pal_227_schiffswache,20);
		Npc_SetRefuseTalk(pal_228_schiffswache,20);
	};
};

func void b_assignschiffswacheninfos(var C_NPC schiffswache)
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//Przeklêci orkowie najechali zamek Garonda. Natychmiast musimy coœ zrobiæ!
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//Jeœli kiedyœ dorwiemy drania, który otworzy³ g³ówn¹ bramê, nie bêdziemy z nim d³ugo rozmawiaæ. Zap³aci za sw¹ zdradê.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//Nie mo¿emy d³u¿ej czekaæ. Bez pomocy nasi ch³opcy ugn¹ siê pod naciskiem kolejnej fali orkowych wojsk.
		};
	}
	else
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Garond zwo³a³ pospolite ruszenie. Wkrótce wyruszamy do Górniczej Doliny.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//Czas daæ orkom ostateczn¹ nauczkê.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//Nie mogê siê doczekaæ, by pokazaæ orkom, co o nich myœlê. Wkrótce zaczynamy.
		};
	};
	AI_StopProcessInfos(schiffswache);
};

func void b_assignschiffswachentalk(var C_NPC schiffswache)
{
	if(KAPITEL >= 5)
	{
		b_assignschiffswacheninfos(schiffswache);
	}
	else
	{
		b_assignschiffswachenguard(schiffswache);
	};
};

func int b_assignschiffswacheninfoconditions(var C_NPC schiffswache)
{
	if((KAPITEL < 5) && (Npc_RefuseTalk(self) == FALSE) && (MIS_SCVISITSHIP != LOG_RUNNING))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

