
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
	description = "Co s³ychaæ?";
};


func int dia_addon_lucia_hi_condition()
{
	return TRUE;
};

func void dia_addon_lucia_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//S³uchaj, jak bêdziesz g³odny, idŸ do Snafa. A jak chcesz siê napiæ, to rozmawiasz z odpowiedni¹ osob¹.
};


instance DIA_ADDON_LUCIA_WAS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_was_condition;
	information = dia_addon_lucia_was_info;
	permanent = FALSE;
	description = "Co mo¿esz mi zaproponowaæ?";
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
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//Co mo¿esz mi zaproponowaæ?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//Niestety, nie mamy piwa. Mamy tylko to, co przywieŸli paladyni.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//No có¿, przynajmniej do czegoœ siê przydali...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//A poza tym mamy mocniejsze trunki pêdzone na miejscu: grog i bia³y rum.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//Hmm... Powinieneœ spróbowaæ TEGO. Dosta³am przepis od Samuela. Ten stary pijak wie, jak mieszaæ trunki.
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
	description = "Hej, czy ty przypadkiem nie jesteœ z Khorinis?";
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
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Hej, czy ty przypadkiem nie jesteœ z Khorinis?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Nie przypominaj mi o tym miejscu! Mia³am tam straszne ¿ycie.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//Gdy przyp³ywa³y nowe statki ze skazanymi, miasto têtni³o ¿yciem.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//Ale pozostali... Nie, dziêkujê. Mo¿e to dlatego, ¿e jesteœmy na wyspie. No có¿, tamte czasy to ju¿ przesz³oœæ.
	if((MIS_LUCIASLETTER != 0) || (SC_KNOWSLUCIACAUGHTBYBANDITS != 0) || (NADJA_GAVELUCIAINFO != 0))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//Zerwa³am ju¿ z Elvrichem!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Dlaczego?
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//Bo to tchórz. Gdy bandyci mnie porwali, nic nie zrobi³.
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
	description = "I co zamierzasz teraz robiæ?";
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
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//I co zamierzasz teraz robiæ?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//Zobaczymy. Na razie dobrze mi tu, razem ze Snafem, Fiskiem i innymi.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Rozmawia³eœ ju¿ z Thorusem? O Innosie, ale kawa³ ch³opa!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//Przepraszam... A wracaj¹c do twojego pytania... Nie mam okreœlonego celu, biorê, co daje mi los.
};


instance DIA_ADDON_LUCIA_PALADINE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_paladine_condition;
	information = dia_addon_lucia_paladine_info;
	permanent = FALSE;
	description = "Nie lubisz paladynów, prawda?";
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
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//Nie lubisz paladynów, prawda?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//Tych fanatyków morduj¹cych dla zakonu Magów Ognia? Nie.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//Lord Hagen i jego oprychy zajêli miasto i wszyscy ich teraz s³uchaj¹.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//A to mi siê nie spodoba³o. Nie chcia³am czekaæ, a¿ przyjd¹ do Czerwonej Latarni mnie aresztowaæ.
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(dia_addon_lucia_paladine);
		Info_AddChoice(dia_addon_lucia_paladine,"Zakoñcz rozmowê.",dia_addon_lucia_paladine_back);
		Info_AddChoice(dia_addon_lucia_paladine,"Paladyni nie walcz¹ w imieniu Innosa. On sam wybiera sobie wojowników.",dia_addon_lucia_paladine_wahl);
		Info_AddChoice(dia_addon_lucia_paladine,"Paladyni s¹ wojownikami Innosa. Nie s¹ mordercami.",dia_addon_lucia_paladine_murder);
	};
};

func void dia_addon_lucia_paladine_back()
{
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_wahl()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//Paladyni nie walcz¹ w imieniu Innosa. On sam wybiera sobie wojowników.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//Naprawdê? Uwa¿am, ¿e ludzie sami decyduj¹ o swoim przeznaczeniu.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//Ale twoje s³owa mnie zastanawiaj¹. Mówisz niemal jak jeden z nich.
	Info_AddChoice(dia_addon_lucia_paladine,"Zabi³aœ ju¿ kiedyœ kogoœ?",dia_addon_lucia_paladine_kill);
};

func void dia_addon_lucia_paladine_kill()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//Zabi³aœ ju¿ kiedyœ kogoœ?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//Nie, i bardzo mnie to cieszy.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//Proszê, nie rozmawiajmy ju¿ o powa¿nych sprawach.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Pijmy i cieszmy siê ka¿d¹ chwil¹ podarowan¹ nam przez bogów.
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_weib()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Chcesz splugawiæ imiê Innosa, kobieto?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//Jak mog³abym to zrobiæ? To mê¿czyŸni czyni¹ z³o w jego imiê.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//Ja nie w¹tpiê w boskie pochodzenie Innosa.
};

func void dia_addon_lucia_paladine_murder()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//Paladyni s¹ wojownikami Innosa. Nie s¹ mordercami.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//Naprawdê? Ich broñ jest równie skrwawiona, jak broñ bandytów i piratów.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//Jedyna ró¿nica polega na tym, ¿e oni postêpuj¹ w imiê Innosa, a nie dlatego ¿e chc¹ przetrwaæ.
	Info_AddChoice(dia_addon_lucia_paladine,"Chcesz splugawiæ imiê Innosa, kobieto?",dia_addon_lucia_paladine_weib);
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
	description = "Chcê siê czegoœ napiæ.";
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
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Chcê siê czegoœ napiæ.
	b_givetradeinv(self);
};


instance DIA_ADDON_LUCIA_LERNEN(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 19;
	condition = dia_addon_lucia_lernen_condition;
	information = dia_addon_lucia_lernen_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//Oczywiœcie. Mogê ci pomóc w rozwiniêciu ZRÊCZNOŒCI!
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Lucia mo¿e mi pomóc poprawiæ moj¹ zrêcznoœæ.");
};


instance DIA_ADDON_LUCIA_TEACH(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 101;
	condition = dia_addon_lucia_teach_condition;
	information = dia_addon_lucia_teach_info;
	permanent = TRUE;
	description = "Chcê siê staæ bardziej zrêczny.";
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
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//Chcê siê staæ bardziej zrêczny.
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

