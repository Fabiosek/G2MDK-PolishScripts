
instance DIA_ADDON_LUCIA_EXIT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 999;
	condition = dia_addon_lucia_exit_condition;
	information = dia_addon_lucia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_lucia_exit_condition()
{
	return TRUE;
};

func void dia_addon_lucia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LUCIA_PICKPOCKET(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 900;
	condition = dia_addon_lucia_pickpocket_condition;
	information = dia_addon_lucia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80_FEMALE;
};


func int dia_addon_lucia_pickpocket_condition()
{
	return c_beklauen(80,100);
};

func void dia_addon_lucia_pickpocket_info()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_BACK,dia_addon_lucia_pickpocket_back);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_PICKPOCKET,dia_addon_lucia_pickpocket_doit);
};

func void dia_addon_lucia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};

func void dia_addon_lucia_pickpocket_back()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};


instance DIA_ADDON_LUCIA_HI(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_hi_condition;
	information = dia_addon_lucia_hi_info;
	permanent = FALSE;
	description = "Co s�ycha�?";
};


func int dia_addon_lucia_hi_condition()
{
	return TRUE;
};

func void dia_addon_lucia_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//Co s�ycha�?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//S�uchaj, jak b�dziesz g�odny, id� do Snafa. A jak chcesz si� napi�, to rozmawiasz z odpowiedni� osob�.
};


instance DIA_ADDON_LUCIA_WAS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_was_condition;
	information = dia_addon_lucia_was_info;
	permanent = FALSE;
	description = "Co mo�esz mi zaproponowa�?";
};


func int dia_addon_lucia_was_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_was_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//Co mo�esz mi zaproponowa�?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//Niestety, nie mamy piwa. Mamy tylko to, co przywie�li paladyni.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//No c�, przynajmniej do czego� si� przydali...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//A poza tym mamy mocniejsze trunki p�dzone na miejscu: grog i bia�y rum.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//Hmm... Powiniene� spr�bowa� TEGO. Dosta�am przepis od Samuela. Ten stary pijak wie, jak miesza� trunki.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Lucia handluje alkoholem.");
};


instance DIA_ADDON_LUCIA_KHORINIS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_khorinis_condition;
	information = dia_addon_lucia_khorinis_info;
	permanent = FALSE;
	description = "Hej, czy ty przypadkiem nie jeste� z Khorinis?";
};


func int dia_addon_lucia_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bromor_lucia) || (NADJA_GAVELUCIAINFO == TRUE) || Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Hej, czy ty przypadkiem nie jeste� z Khorinis?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Nie przypominaj mi o tym miejscu! Mia�am tam straszne �ycie.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//Gdy przyp�ywa�y nowe statki ze skazanymi, miasto t�tni�o �yciem.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//Ale pozostali... Nie, dzi�kuj�. Mo�e to dlatego, �e jeste�my na wyspie. No c�, tamte czasy to ju� przesz�o��.
	if((MIS_LUCIASLETTER != 0) || (SC_KNOWSLUCIACAUGHTBYBANDITS != 0) || (NADJA_GAVELUCIAINFO != 0))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//Zerwa�am ju� z Elvrichem!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Dlaczego?
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//Bo to tch�rz. Gdy bandyci mnie porwali, nic nie zrobi�.
		TOPIC_END_LUCIA = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	};
	TOPIC_END_LUCIA = TRUE;
};


instance DIA_ADDON_LUCIA_JETZT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_jetzt_condition;
	information = dia_addon_lucia_jetzt_info;
	permanent = FALSE;
	description = "I co zamierzasz teraz robi�?";
};


func int dia_addon_lucia_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//I co zamierzasz teraz robi�?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//Zobaczymy. Na razie dobrze mi tu, razem ze Snafem, Fiskiem i innymi.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Rozmawia�e� ju� z Thorusem? O Innosie, ale kawa� ch�opa!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//Przepraszam... A wracaj�c do twojego pytania... Nie mam okre�lonego celu, bior�, co daje mi los.
};


instance DIA_ADDON_LUCIA_PALADINE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_paladine_condition;
	information = dia_addon_lucia_paladine_info;
	permanent = FALSE;
	description = "Nie lubisz paladyn�w, prawda?";
};


func int dia_addon_lucia_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_paladine_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//Nie lubisz paladyn�w, prawda?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//Tych fanatyk�w morduj�cych dla zakonu Mag�w Ognia? Nie.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//Lord Hagen i jego oprychy zaj�li miasto i wszyscy ich teraz s�uchaj�.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//A to mi si� nie spodoba�o. Nie chcia�am czeka�, a� przyjd� do Czerwonej Latarni mnie aresztowa�.
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(dia_addon_lucia_paladine);
		Info_AddChoice(dia_addon_lucia_paladine,"Zako�cz rozmow�.",dia_addon_lucia_paladine_back);
		Info_AddChoice(dia_addon_lucia_paladine,"Paladyni nie walcz� w imieniu Innosa. On sam wybiera sobie wojownik�w.",dia_addon_lucia_paladine_wahl);
		Info_AddChoice(dia_addon_lucia_paladine,"Paladyni s� wojownikami Innosa. Nie s� mordercami.",dia_addon_lucia_paladine_murder);
	};
};

func void dia_addon_lucia_paladine_back()
{
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_wahl()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//Paladyni nie walcz� w imieniu Innosa. On sam wybiera sobie wojownik�w.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//Naprawd�? Uwa�am, �e ludzie sami decyduj� o swoim przeznaczeniu.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//Ale twoje s�owa mnie zastanawiaj�. M�wisz niemal jak jeden z nich.
	Info_AddChoice(dia_addon_lucia_paladine,"Zabi�a� ju� kiedy� kogo�?",dia_addon_lucia_paladine_kill);
};

func void dia_addon_lucia_paladine_kill()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//Zabi�a� ju� kiedy� kogo�?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//Nie, i bardzo mnie to cieszy.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//Prosz�, nie rozmawiajmy ju� o powa�nych sprawach.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Pijmy i cieszmy si� ka�d� chwil� podarowan� nam przez bog�w.
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_weib()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Chcesz splugawi� imi� Innosa, kobieto?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//Jak mog�abym to zrobi�? To m�czy�ni czyni� z�o w jego imi�.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//Ja nie w�tpi� w boskie pochodzenie Innosa.
};

func void dia_addon_lucia_paladine_murder()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//Paladyni s� wojownikami Innosa. Nie s� mordercami.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//Naprawd�? Ich bro� jest r�wnie skrwawiona, jak bro� bandyt�w i pirat�w.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//Jedyna r�nica polega na tym, �e oni post�puj� w imi� Innosa, a nie dlatego �e chc� przetrwa�.
	Info_AddChoice(dia_addon_lucia_paladine,"Chcesz splugawi� imi� Innosa, kobieto?",dia_addon_lucia_paladine_weib);
};


instance DIA_ADDON_LUCIA_ATTENTAT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 9;
	condition = dia_addon_lucia_attentat_condition;
	information = dia_addon_lucia_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_lucia_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lucia_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Nic.
};


instance DIA_ADDON_LUCIA_TRADE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 99;
	condition = dia_addon_lucia_trade_condition;
	information = dia_addon_lucia_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Chc� si� czego� napi�.";
};


func int dia_addon_lucia_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Chc� si� czego� napi�.
	b_givetradeinv(self);
};


instance DIA_ADDON_LUCIA_LERNEN(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 19;
	condition = dia_addon_lucia_lernen_condition;
	information = dia_addon_lucia_lernen_info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_addon_lucia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_lernen_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//Oczywi�cie. Mog� ci pom�c w rozwini�ciu ZR�CZNO�CI!
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Lucia mo�e mi pom�c poprawi� moj� zr�czno��.");
};


instance DIA_ADDON_LUCIA_TEACH(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 101;
	condition = dia_addon_lucia_teach_condition;
	information = dia_addon_lucia_teach_info;
	permanent = TRUE;
	description = "Chc� si� sta� bardziej zr�czny.";
};


func int dia_addon_lucia_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_lernen))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//Chc� si� sta� bardziej zr�czny.
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_back()
{
	Info_ClearChoices(dia_addon_lucia_teach);
};

func void dia_addon_lucia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_lucia_teach_5);
};

