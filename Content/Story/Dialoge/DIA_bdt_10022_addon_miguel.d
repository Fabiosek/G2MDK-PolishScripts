
instance DIA_ADDON_MIGUEL_EXIT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 999;
	condition = dia_addon_miguel_exit_condition;
	information = dia_addon_miguel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_miguel_exit_condition()
{
	return TRUE;
};

func void dia_addon_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIGUEL_PICKPOCKET(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 900;
	condition = dia_addon_miguel_pickpocket_condition;
	information = dia_addon_miguel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_miguel_pickpocket_condition()
{
	return c_beklauen(40,48);
};

func void dia_addon_miguel_pickpocket_info()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_BACK,dia_addon_miguel_pickpocket_back);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_PICKPOCKET,dia_addon_miguel_pickpocket_doit);
};

func void dia_addon_miguel_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};

func void dia_addon_miguel_pickpocket_back()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};


instance DIA_ADDON_MIGUEL_HI(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 1;
	condition = dia_addon_miguel_hi_condition;
	information = dia_addon_miguel_hi_info;
	permanent = FALSE;
	description = "Co tu robisz?";
};


func int dia_addon_miguel_hi_condition()
{
	return TRUE;
};

func void dia_addon_miguel_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tu robisz?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Szukasz czego�?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Ro�lin - szukam ro�lin.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Zwykle szukam ro�lin.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Wi�kszo�� tego, co tu ro�nie, mo�na wykorzysta�.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Wiele zi� ma w�a�ciwo�ci lecznicze, a bagienne ziele mo�na pali�.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Zanim umie�cili mnie za barier�, pracowa�em u alchemika.
};


instance DIA_ADDON_MIGUEL_STORY(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 2;
	condition = dia_addon_miguel_story_condition;
	information = dia_addon_miguel_story_info;
	permanent = FALSE;
	description = "Za co ci� zamkn�li za barier�?";
};


func int dia_addon_miguel_story_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_story_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//Za co ci� zamkn�li za barier�?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Eksperymentowa�em z r�nymi miksturami, kt�re wp�ywaj� na umys� i pozwalaj� nim manipulowa�.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Ignaz, m�j mistrz, wypi� kiedy� jeden z moich "eksperyment�w" zamiast wina.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//No... zacz�� si� zachowywa�... nieco irracjonalnie. Od tamtej pory jest... troszk� niezr�wnowa�ony.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//Magowie zes�ali mnie do kolonii karnej za "prowadzenie bada� w zakazanej dziedzinie".
};


instance DIA_ADDON_MIGUEL_LAGER(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 3;
	condition = dia_addon_miguel_lager_condition;
	information = dia_addon_miguel_lager_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� o obozowisku?";
};


func int dia_addon_miguel_lager_condition()
{
	return TRUE;
};

func void dia_addon_miguel_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Co mo�esz mi powiedzie� o obozowisku?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Niewiele. Nigdy tam nie by�em.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Tylko ludzie Kruka byli tam od pocz�tku. Wszyscy pozostali przyszli p�niej albo wci�� czekaj� na przyj�cie. Tak jak ja.
};


instance DIA_ADDON_MIGUEL_WHEREFROM(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_wherefrom_condition;
	information = dia_addon_miguel_wherefrom_info;
	permanent = FALSE;
	description = "Jak si� tu dosta�e�?";
};


func int dia_addon_miguel_wherefrom_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi) || Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_wherefrom_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Jak si� tu dosta�e�?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//My�l�, �e t� sam� drog� co ty. Z piratami przez morze.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//Ta dolina jest niedost�pna z wyspy. Mo�na si� do niej dosta� tylko morzem.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//Dok�adnie.
};


instance DIA_ADDON_MIGUEL_ANGEFORDERT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_angefordert_condition;
	information = dia_addon_miguel_angefordert_info;
	permanent = FALSE;
	description = "Kiedy zwykle potrzebuj� nowych ludzi?";
};


func int dia_addon_miguel_angefordert_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_angefordert_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kiedy zwykle potrzebuj� nowych ludzi?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//Gdy jest ich za ma�o...
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//Gdy kogo� zabije kopalniany pe�zacz, potrzebuj� drugiego na wymian�.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//No i czasem ch�opaki si� pozabijaj�. Ale ostatnio nie jest tak �le.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Kruk zdo�a� to jako� zorganizowa� i pilnuje, �eby w kopalni nie pracowali wszyscy naraz.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Nie mam poj�cia, jak to dok�adnie funkcjonuje. Nigdy tam nie by�em.
};


instance DIA_ADDON_MIGUEL_FORTUNO(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 6;
	condition = dia_addon_miguel_fortuno_condition;
	information = dia_addon_miguel_fortuno_info;
	permanent = FALSE;
	description = "Fortuno sprawia wra�enie ob��kanego.";
};


func int dia_addon_miguel_fortuno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_free))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_fortuno_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno sprawia wra�enie ob��kanego. My�l�, �e jaka� mikstura mo�e przywr�ci� mu pami��.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To jeden ze s�u��cych Kruka.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Teraz to tylko wrak. A wszystko z winy Kruka.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Kruk. Nigdy o nim wiele nie my�la�em. Hmm, dobra. Niestety, nie mog� warzy� mikstur tutaj, na bagnach.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//M�g�bym przyrz�dzi� mikstur�. W obozie jest odpowiedni st�. Gdybym tylko mia� przepis...
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Lepiej b�d� ostro�ny z tym przepisem. Warzenie mikstur to niebezpieczne zaj�cie.
	b_giveinvitems(self,other,itwr_addon_mcelixier_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Je�eli u�yjesz nieodpowiednich sk�adnik�w albo co� p�jdzie nie tak, mikstura b�dzie �mierteln� trucizn�.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//B�d� uwa�a�.
	b_logentry(TOPIC_ADDON_FORTUNO,"Miguel da� mi przepis na mikstur�, kt�ra ma pom�c Fortuna w odzyskaniu pami�ci. Powinienem przyrz�dzi� j� dopiero wtedy, gdy dobrze poznam dzia�anie wszystkich sk�adnik�w. Inaczej mo�e by� zab�jcza.");
};


instance DIA_ADDON_MIGUEL_BRAU(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 7;
	condition = dia_addon_miguel_brau_condition;
	information = dia_addon_miguel_brau_info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_addon_miguel_brau_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_story))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_brau_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nie mam na to czasu. Przyszed�em tu zdoby� troch� z�ota. Na razie, dop�ki nie wpuszcz� mnie do obozowiska, zarabiam na handlu zio�ami.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Mog� jednak zaopatrzy� ci� w mikstury.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Od Miguela mog� kupi� ro�liny i mikstury.");
};


instance DIA_ADDON_MIGUEL_TRADE(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 888;
	condition = dia_addon_miguel_trade_condition;
	information = dia_addon_miguel_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_miguel_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_brau))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_trade_info()
{
	b_say(other,self,"$TRADE_1");
	b_givetradeinv(self);
};

