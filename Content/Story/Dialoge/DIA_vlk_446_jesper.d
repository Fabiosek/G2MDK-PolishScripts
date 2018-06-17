
instance DIA_JESPER_EXIT(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 999;
	condition = dia_jesper_exit_condition;
	information = dia_jesper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jesper_exit_condition()
{
	return TRUE;
};

func void dia_jesper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JESPER_PICKPOCKET(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 900;
	condition = dia_jesper_pickpocket_condition;
	information = dia_jesper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_jesper_pickpocket_condition()
{
	return c_beklauen(80,180);
};

func void dia_jesper_pickpocket_info()
{
	Info_ClearChoices(dia_jesper_pickpocket);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_BACK,dia_jesper_pickpocket_back);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_PICKPOCKET,dia_jesper_pickpocket_doit);
};

func void dia_jesper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jesper_pickpocket);
};

func void dia_jesper_pickpocket_back()
{
	Info_ClearChoices(dia_jesper_pickpocket);
};


instance DIA_JESPER_HALLO(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_hallo_condition;
	information = dia_jesper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_hallo_condition()
{
	return TRUE;
};

func void dia_jesper_hallo_info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Co tu robisz? Nie masz tu czego szukaæ.
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//No dobra, co tu robisz?
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Zamierzam ciê zabiæ.",dia_jesper_hallo_kill);
	Info_AddChoice(dia_jesper_hallo,"Chcia³em trochê pozwiedzaæ.",dia_jesper_hallo_nurso);
	if(ATTILA_KEY == TRUE)
	{
		Info_AddChoice(dia_jesper_hallo,"Attila da³ mi klucz... ",dia_jesper_hallo_willkommen);
	}
	else
	{
		Info_AddChoice(dia_jesper_hallo,"Za³atwi³em Attilê...",dia_jesper_hallo_umgelegt);
	};
	DG_GEFUNDEN = TRUE;
};

func void dia_jesper_hallo_kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//Zamierzam ciê zabiæ.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//Có¿ za wspania³y pomys³. Sam na niego wpad³eœ, co? A co tam. Nie bêdê przed³u¿a³.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_attack(self,other,AR_NONE,1);
};

func void dia_jesper_hallo_nurso()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Chcia³em trochê pozwiedzaæ.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Nie ma siê na co gapiæ. Wkraczasz na grz¹ski grunt, jasne?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Wiêc nie ruszaj broni i powiedz mi, dlaczego tu jesteœ.
};

func void dia_jesper_hallo_willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Attila da³ mi klucz. Dlatego tu jestem. Wiêc czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//Chcia³byœ wiedzieæ? Spokojnie.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//IdŸ do Cassii. Czeka na ciebie.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_jesper_hallo_umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Za³atwi³em Attilê. Mia³ przy sobie klucz do kana³ów.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//Zabi³eœ Attilê? No i co z tego, to by³ nêdzny pies.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Powiem ci coœ. Jeœli mnie zaatakujesz, zabijê ciê.
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Co ty tu robisz...",dia_jesper_hallo_was);
	Info_AddChoice(dia_jesper_hallo,"Chcê siê zobaczyæ z twoim przywódc¹.",dia_jesper_hallo_anfuehrer);
};

func void dia_jesper_hallo_was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Co robisz w tej ciemnej, wilgotnej norze?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//Mieszkam tu. Jeszcze jedno g³upie pytanie, a wytnê ci na skórze wzorek.
};

func void dia_jesper_hallo_anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Chcê siê zobaczyæ z twoim przywódc¹.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//HA - moim przywódc¹? Jestem pewien, ¿e Cassia chêtnie z tob¹ porozmawia.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//IdŸ - i nie próbuj ¿adnych sztuczek.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_JESPER_BEZAHLEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_bezahlen_condition;
	information = dia_jesper_bezahlen_info;
	permanent = TRUE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_jesper_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (JESPER_TEACHSNEAK == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_bezahlen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Pewnie, poka¿ê ci, jak siê skradaæ - za darmo.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//Chcesz siê nauczyæ, jak siê bezszelestnie poruszaæ? To ciê bêdzie kosztowaæ 100 sztuk z³ota.
		b_say_gold(self,other,JESPER_COST);
		Info_ClearChoices(dia_jesper_bezahlen);
		Info_AddChoice(dia_jesper_bezahlen,"Mo¿e póŸniej... (POWRÓT)",dia_jesper_bezahlen_spaeter);
		Info_AddChoice(dia_jesper_bezahlen,"Chcê siê nauczyæ sztuki skradania (zap³aæ 100 sztuk z³ota).",dia_jesper_bezahlen_okay);
	};
};

func void dia_jesper_bezahlen_spaeter()
{
	Info_ClearChoices(dia_jesper_bezahlen);
};

func void dia_jesper_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//Dobra, chcê siê nauczyæ skradania.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//Oto z³oto.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//Daj mi znaæ, jak bêdziesz gotowy.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//Bez z³ota niczego siê nie nauczysz.
		Info_ClearChoices(dia_jesper_bezahlen);
	};
};


instance DIA_JESPER_SCHLEICHEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_schleichen_condition;
	information = dia_jesper_schleichen_info;
	permanent = TRUE;
	description = "Naucz mnie zasad skradania i ukrywania siê.";
};


var int dia_jesper_schleichen_permanent;

func int dia_jesper_schleichen_condition()
{
	if((JESPER_TEACHSNEAK == TRUE) && (DIA_JESPER_SCHLEICHEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_schleichen_info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Naucz mnie sztuki skradania siê.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Umiejêtnoœæ skradania siê jest niezwykle wa¿na dla ka¿dego z³odzieja. Przede wszystkim do poruszania siê po cudzych domach.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Nie tup tak. Wiêkszoœæ ludzi ma bardzo czujny sen.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Jeœli bêdziesz siê skrada³, nikt ciê nie us³yszy - wtedy bêdziesz móg³ pracowaæ bez przeszkód.
		DIA_JESPER_SCHLEICHEN_PERMANENT = TRUE;
	};
};


instance DIA_JESPER_KILLER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 2;
	condition = dia_jesper_killer_condition;
	information = dia_jesper_killer_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_killer_condition()
{
	if(Npc_IsDead(cassia) || Npc_IsDead(ramirez))
	{
		return TRUE;
	};
};

func void dia_jesper_killer_info()
{
	if(Npc_IsDead(cassia) && Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Zabi³eœ moich przyjació³. Dlaczego to zrobi³eœ, morderco?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Wyœlê ciê do królestwa Beliara.
	}
	else if(Npc_IsDead(cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Zabi³eœ Cassiê, ty parszywy morderco. Mnie jednak nie pokonasz!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else if(Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Wyœwiadczy³em Ramirezowi wiêcej przys³ug i zebra³em wiêcej gotówki, ni¿ kiedykolwiek widzia³eœ.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//A ty go zabi³eœ, wredny psie! Pora za to zap³aciæ!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_JESPER_BOGEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_bogen_condition;
	information = dia_jesper_bogen_info;
	permanent = FALSE;
	description = "Nie wiesz przypadkiem czegoœ o ³uku Bospera?";
};


func int dia_jesper_bogen_condition()
{
	if((Npc_HasItems(other,itrw_bow_l_03_mis) < 1) && (MIS_BOSPER_BOGEN == LOG_RUNNING) && (JOIN_THIEFS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jesper_bogen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Nie wiesz przypadkiem czegoœ o ³uku Bospera?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Chodzi ci o ten ³uk od ³uczarza? Taak, mam go gdzieœ w skrzyni.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Pe³no tam jednak szczurów. Mo¿esz go przynieœæ, jeœli siê nie boisz.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Och, oczywiœcie skrzynia jest zamkniêta. Bêdziesz musia³ siê w³amaæ. Na szczêœcie wci¹¿ masz wytrychy.
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_03");
};


instance DIA_JESPER_TUER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_tuer_condition;
	information = dia_jesper_tuer_info;
	permanent = FALSE;
	description = "Co jest za tymi zamkniêtymi drzwiami?";
};


func int dia_jesper_tuer_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_jesper_tuer_info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//Co jest za tymi zamkniêtymi drzwiami?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//Dalej jest skrzynia - wyzwanie przygotowane przez mistrza otwierania zamków.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Umieœci³ na niej tak skomplikowany zamek, ¿e do tej pory nikt nie móg³ go otworzyæ.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//Niestety, zosta³ z³apany - wyrzucili go za Barierê i pewnie tam umar³.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Jeœli jednak chcesz otworzyæ skrzyniê, to weŸ ten klucz od drzwi sali.
	b_giveinvitems(self,other,itke_fingers,1);
};


instance DIA_JESPER_TRUHE(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_truhe_condition;
	information = dia_jesper_truhe_info;
	permanent = FALSE;
	description = "Uda³o mi siê otworzyæ skrzyniê.";
};


func int dia_jesper_truhe_condition()
{
	if((Mob_HasItems("MOB_FINGERS",itmi_gold) < 300) || (Mob_HasItems("MOB_FINGERS",itmi_silvercup) < 5) || (Mob_HasItems("MOB_FINGERS",itmi_goldcup) < 1) || (Mob_HasItems("MOB_FINGERS",itam_strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",itpo_perm_dex) < 1))
	{
		return TRUE;
	};
};

func void dia_jesper_truhe_info()
{
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Uda³o mi siê otworzyæ skrzyniê.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//Niemo¿liwe! Wygl¹da na to, ¿e mamy nowego mistrza otwierania zamków.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//Gratulacje!
	b_giveplayerxp(XP_JESPERTRUHE);
};

