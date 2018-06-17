
func void b_assignschiffswachenguard(var C_NPC schiffswache)
{
	if((MIS_SHIPISFREE == TRUE) || (MIS_SCVISITSHIP == LOG_RUNNING))
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Obserwujemy ci�, wi�c lepiej o tym pami�taj.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Nie wpl�cz si� w jakie� k�opoty, b�d�c tutaj.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Nawet nie my�l o kradzie�y, jasne?
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
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//Przekl�ci orkowie najechali zamek Garonda. Natychmiast musimy co� zrobi�!
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//Je�li kiedy� dorwiemy drania, kt�ry otworzy� g��wn� bram�, nie b�dziemy z nim d�ugo rozmawia�. Zap�aci za sw� zdrad�.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//Nie mo�emy d�u�ej czeka�. Bez pomocy nasi ch�opcy ugn� si� pod naciskiem kolejnej fali orkowych wojsk.
		};
	}
	else
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Garond zwo�a� pospolite ruszenie. Wkr�tce wyruszamy do G�rniczej Doliny.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//Czas da� orkom ostateczn� nauczk�.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//Nie mog� si� doczeka�, by pokaza� orkom, co o nich my�l�. Wkr�tce zaczynamy.
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

