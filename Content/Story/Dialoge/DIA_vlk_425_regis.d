
instance DIA_REGIS_EXIT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 999;
	condition = dia_regis_exit_condition;
	information = dia_regis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_regis_exit_condition()
{
	return TRUE;
};

func void dia_regis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGIS_PICKPOCKET(C_INFO)
{
	npc = vlk_425_regis;
	nr = 900;
	condition = dia_regis_pickpocket_condition;
	information = dia_regis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_regis_pickpocket_condition()
{
	return c_beklauen(40,35);
};

func void dia_regis_pickpocket_info()
{
	Info_ClearChoices(dia_regis_pickpocket);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_BACK,dia_regis_pickpocket_back);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_PICKPOCKET,dia_regis_pickpocket_doit);
};

func void dia_regis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_regis_pickpocket);
};

func void dia_regis_pickpocket_back()
{
	Info_ClearChoices(dia_regis_pickpocket);
};


instance DIA_REGIS_HALLO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 1;
	condition = dia_regis_hallo_condition;
	information = dia_regis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_regis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_regis_hallo_info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Hej, nowy w mieœcie, co?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Tak, ale co ci do tego?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//Niedawno przyby³em z kontynentu, teraz w³óczê siê bez celu. Z³oto niemal mi siê skoñczy³o, nie pozostanie mi wiêc chyba nic innego, jak tylko przy³¹czyæ siê do stra¿y.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//Nie chcê tego jednak. To ¿adna przyjemnoœæ zostaæ rozszarpanym przez orków, w imiê Króla.
};


instance DIA_REGIS_MILIZ(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_miliz_condition;
	information = dia_regis_miliz_info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ na temat stra¿y?";
};


func int dia_regis_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_hallo))
	{
		return TRUE;
	};
};

func void dia_regis_miliz_info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//Co mo¿esz mi powiedzieæ na temat stra¿y?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//Jeden z paladynów przej¹³ niedawno dowodzenie. Niejaki Lord Andre.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//Próbuje zmobilizowaæ po³owê miasta do walki przeciwko orkom.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//Jednak, ¿eby siê zaci¹gn¹æ, trzeba byæ obywatelem miasta.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//Z tego co wiem, to nie bêd¹c obywatelem, mo¿na trenowaæ, nie zostanie siê jednak oficjalnie przyjêtym.
};


instance DIA_REGIS_ANDRE(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_andre_condition;
	information = dia_regis_andre_info;
	permanent = FALSE;
	description = "Co jeszcze mo¿esz mi powiedzieæ o Lordzie Andre?";
};


func int dia_regis_andre_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_miliz))
	{
		return TRUE;
	};
};

func void dia_regis_andre_info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//Co jeszcze mo¿esz mi powiedzieæ o Lordzie Andre?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//Wiem, ¿e obj¹³ tak¿e funkcjê sêdziego.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//Jeœli wdasz siê w jakieœ k³opoty w mieœcie, bêdziesz musia³ przed nim odpowiadaæ.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//Zdarzy³o mi siê raz wdaæ w bójkê z jednym z obywateli.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//Ten pobieg³ z p³aczem do Lorda Andre i doniós³ na mnie.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//Ta drobnostka kosztowa³a mnie 50 sztuk z³ota.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//Ca³e szczêœcie, ¿e zajœcie mia³o miejsce w nocy i nie by³o œwiadków.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//Im wiêcej osób naskar¿y na ciebie w³adzom, tym wy¿sz¹ karê dostaniesz.
};


instance DIA_REGIS_VALENTINO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valentino_condition;
	information = dia_regis_valentino_info;
	permanent = FALSE;
	description = "Z kim siê pobi³eœ?";
};


func int dia_regis_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_andre))
	{
		return TRUE;
	};
};

func void dia_regis_valentino_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//Z kim siê pobi³eœ?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//Koleœ nazywa siê Valentino. Czêsto przesiaduje w knajpie, w pobli¿u œwi¹tyni.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//Na ogó³, nie uznajê przemocy. Ale TEN cz³owiek zas³u¿y³ na to, ¿eby przerobiæ mu trochê facjatê.
};


instance DIA_REGIS_VALDEFEAT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valdefeat_condition;
	information = dia_regis_valdefeat_info;
	permanent = FALSE;
	description = "Pozna³em Valentina.";
};


func int dia_regis_valdefeat_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_valentino) && (valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_regis_valdefeat_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//Pozna³em Valentina.
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//I?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//Sprawi³em mu têgie lanie...
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//Zas³ugiwa³ na to...
	if(!Npc_IsDead(valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Podczas naszej ma³ej sprzeczki znalaz³em przy nim ten pierœcieñ.
		b_giveinvitems(self,other,itri_valentinosring,1);
		REGIS_RING = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//Mo¿esz go przekazaæ nastêpnej osobie, która da mu w mordê...
	};
};


var int regis_bogendieb;

instance DIA_REGIS_PERM(C_INFO)
{
	npc = vlk_425_regis;
	nr = 200;
	condition = dia_regis_perm_condition;
	information = dia_regis_perm_info;
	permanent = TRUE;
	description = "Czy ostatnio wydarzy³o siê coœ ciekawego?";
};


func int dia_regis_perm_condition()
{
	return TRUE;
};

func void dia_regis_perm_info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Czy ostatnio wydarzy³o siê coœ ciekawego?
	if((REGIS_BOGENDIEB == FALSE) && (MIS_BOSPER_BOGEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//Mo¿na by tak powiedzieæ.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//Okradziono Bospera, miejscowego ³uczarza. Co za tupet.
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//Koleœ po prostu wszed³ do sklepu, w œrodku dnia, i zabra³ stamt¹d ³uk.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//Bosper wyskoczy³ za nim jak poparzony, krzycz¹c: 'Stój, zatrzymaj siê, draniu!' Z³odziej jednak by³ szybszy.
		MIS_BOSPER_BOGEN = LOG_RUNNING;
		REGIS_BOGENDIEB = TRUE;
	}
	else if((MIS_BOSPER_BOGEN == LOG_SUCCESS) && (REGIS_BOGENDIEB != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//Ostatnio jakiœ uczciwy znalazca odniós³ ³uk Bosperowi.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//To dziwne, mog³oby siê wydawaæ, ¿e ka¿dy chce dla siebie jak najwiêcej, a ten koleœ po prostu wraca i oddaje ³uk.
		REGIS_BOGENDIEB = 2;
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//Có¿, wszystko po staremu. Jeœli zaatakuj¹ nas orkowie, na pewno to zauwa¿ymy...
	}
	else if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//Okaza³o siê, ¿e najemnik by³ niewinny. Z tego co wiem, wypuszczono go na wolnoœæ.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Lord Hagen musi byæ zielony ze z³oœci.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//Ca³e miasto jest rozsierdzone. Pamiêtasz paladyna Lothara?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Byæ mo¿e.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Tak czy inaczej, nie ¿yje. Jak zwykle, obwiniaj¹ najemników.
	};
};


instance DIA_REGIS_CREW(C_INFO)
{
	npc = vlk_425_regis;
	nr = 51;
	condition = dia_regis_crew_condition;
	information = dia_regis_crew_info;
	permanent = FALSE;
	description = "Szukam za³ogi, która wyruszy³aby ze mn¹ na morze.";
};


func int dia_regis_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_regis_crew_info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//Szukam za³ogi, która wyruszy³aby ze mn¹ na morze.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//W tej kwestii nie mogê ci pomóc. Powinieneœ poszukaæ kogoœ w okolicach portu, mo¿e w okolicznych knajpach.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//Jeœli w mieœcie s¹ jeszcze jacyœ ¿eglarze, to pewnie tam w³aœnie ich znajdziesz.
};

