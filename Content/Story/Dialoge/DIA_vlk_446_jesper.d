
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
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Co tu robisz? Nie masz tu czego szuka�.
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//No dobra, co tu robisz?
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Zamierzam ci� zabi�.",dia_jesper_hallo_kill);
	Info_AddChoice(dia_jesper_hallo,"Chcia�em troch� pozwiedza�.",dia_jesper_hallo_nurso);
	if(ATTILA_KEY == TRUE)
	{
		Info_AddChoice(dia_jesper_hallo,"Attila da� mi klucz... ",dia_jesper_hallo_willkommen);
	}
	else
	{
		Info_AddChoice(dia_jesper_hallo,"Za�atwi�em Attil�...",dia_jesper_hallo_umgelegt);
	};
	DG_GEFUNDEN = TRUE;
};

func void dia_jesper_hallo_kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//Zamierzam ci� zabi�.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//C� za wspania�y pomys�. Sam na niego wpad�e�, co? A co tam. Nie b�d� przed�u�a�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_attack(self,other,AR_NONE,1);
};

func void dia_jesper_hallo_nurso()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Chcia�em troch� pozwiedza�.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Nie ma si� na co gapi�. Wkraczasz na grz�ski grunt, jasne?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Wi�c nie ruszaj broni i powiedz mi, dlaczego tu jeste�.
};

func void dia_jesper_hallo_willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Attila da� mi klucz. Dlatego tu jestem. Wi�c czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//Chcia�by� wiedzie�? Spokojnie.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//Id� do Cassii. Czeka na ciebie.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_jesper_hallo_umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Za�atwi�em Attil�. Mia� przy sobie klucz do kana��w.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//Zabi�e� Attil�? No i co z tego, to by� n�dzny pies.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Powiem ci co�. Je�li mnie zaatakujesz, zabij� ci�.
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"Co ty tu robisz...",dia_jesper_hallo_was);
	Info_AddChoice(dia_jesper_hallo,"Chc� si� zobaczy� z twoim przyw�dc�.",dia_jesper_hallo_anfuehrer);
};

func void dia_jesper_hallo_was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Co robisz w tej ciemnej, wilgotnej norze?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//Mieszkam tu. Jeszcze jedno g�upie pytanie, a wytn� ci na sk�rze wzorek.
};

func void dia_jesper_hallo_anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Chc� si� zobaczy� z twoim przyw�dc�.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//HA - moim przyw�dc�? Jestem pewien, �e Cassia ch�tnie z tob� porozmawia.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Id� - i nie pr�buj �adnych sztuczek.
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Mo�esz mnie czego� nauczy�?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Pewnie, poka�� ci, jak si� skrada� - za darmo.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//Chcesz si� nauczy�, jak si� bezszelestnie porusza�? To ci� b�dzie kosztowa� 100 sztuk z�ota.
		b_say_gold(self,other,JESPER_COST);
		Info_ClearChoices(dia_jesper_bezahlen);
		Info_AddChoice(dia_jesper_bezahlen,"Mo�e p�niej... (POWR�T)",dia_jesper_bezahlen_spaeter);
		Info_AddChoice(dia_jesper_bezahlen,"Chc� si� nauczy� sztuki skradania (zap�a� 100 sztuk z�ota).",dia_jesper_bezahlen_okay);
	};
};

func void dia_jesper_bezahlen_spaeter()
{
	Info_ClearChoices(dia_jesper_bezahlen);
};

func void dia_jesper_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//Dobra, chc� si� nauczy� skradania.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//Oto z�oto.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//Daj mi zna�, jak b�dziesz gotowy.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//Bez z�ota niczego si� nie nauczysz.
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
	description = "Naucz mnie zasad skradania i ukrywania si�.";
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
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Naucz mnie sztuki skradania si�.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Umiej�tno�� skradania si� jest niezwykle wa�na dla ka�dego z�odzieja. Przede wszystkim do poruszania si� po cudzych domach.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Nie tup tak. Wi�kszo�� ludzi ma bardzo czujny sen.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Je�li b�dziesz si� skrada�, nikt ci� nie us�yszy - wtedy b�dziesz m�g� pracowa� bez przeszk�d.
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
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Zabi�e� moich przyjaci�. Dlaczego to zrobi�e�, morderco?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Wy�l� ci� do kr�lestwa Beliara.
	}
	else if(Npc_IsDead(cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Zabi�e� Cassi�, ty parszywy morderco. Mnie jednak nie pokonasz!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else if(Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Wy�wiadczy�em Ramirezowi wi�cej przys�ug i zebra�em wi�cej got�wki, ni� kiedykolwiek widzia�e�.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//A ty go zabi�e�, wredny psie! Pora za to zap�aci�!
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
	description = "Nie wiesz przypadkiem czego� o �uku Bospera?";
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
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Nie wiesz przypadkiem czego� o �uku Bospera?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Chodzi ci o ten �uk od �uczarza? Taak, mam go gdzie� w skrzyni.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Pe�no tam jednak szczur�w. Mo�esz go przynie��, je�li si� nie boisz.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Och, oczywi�cie skrzynia jest zamkni�ta. B�dziesz musia� si� w�ama�. Na szcz�cie wci�� masz wytrychy.
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
	description = "Co jest za tymi zamkni�tymi drzwiami?";
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
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//Co jest za tymi zamkni�tymi drzwiami?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//Dalej jest skrzynia - wyzwanie przygotowane przez mistrza otwierania zamk�w.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Umie�ci� na niej tak skomplikowany zamek, �e do tej pory nikt nie m�g� go otworzy�.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//Niestety, zosta� z�apany - wyrzucili go za Barier� i pewnie tam umar�.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Je�li jednak chcesz otworzy� skrzyni�, to we� ten klucz od drzwi sali.
	b_giveinvitems(self,other,itke_fingers,1);
};


instance DIA_JESPER_TRUHE(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_truhe_condition;
	information = dia_jesper_truhe_info;
	permanent = FALSE;
	description = "Uda�o mi si� otworzy� skrzyni�.";
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
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Uda�o mi si� otworzy� skrzyni�.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//Niemo�liwe! Wygl�da na to, �e mamy nowego mistrza otwierania zamk�w.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//Gratulacje!
	b_giveplayerxp(XP_JESPERTRUHE);
};

