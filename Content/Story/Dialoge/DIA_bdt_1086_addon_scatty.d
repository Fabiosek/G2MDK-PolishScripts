
var int scatty_start;

instance DIA_ADDON_SCATTY_EXIT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 999;
	condition = dia_addon_scatty_exit_condition;
	information = dia_addon_scatty_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_scatty_exit_condition()
{
	return TRUE;
};

func void dia_addon_scatty_exit_info()
{
	AI_StopProcessInfos(self);
	if(SCATTY_START == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		SCATTY_START = TRUE;
	};
};


instance DIA_ADDON_SCATTY_PICKPOCKET(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 900;
	condition = dia_addon_scatty_pickpocket_condition;
	information = dia_addon_scatty_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_scatty_pickpocket_condition()
{
	return c_beklauen(60,90);
};

func void dia_addon_scatty_pickpocket_info()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_BACK,dia_addon_scatty_pickpocket_back);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_PICKPOCKET,dia_addon_scatty_pickpocket_doit);
};

func void dia_addon_scatty_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};

func void dia_addon_scatty_pickpocket_back()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};


instance DIA_ADDON_SCATTY_HI(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_hi_condition;
	information = dia_addon_scatty_hi_info;
	permanent = FALSE;
	description = "Jak ci id� interesy?";
};


func int dia_addon_scatty_hi_condition()
{
	return TRUE;
};

func void dia_addon_scatty_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Jak ci id� interesy?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//Od otwarcia krypty coraz gorzej....
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Kruk nie potrzebuje ju� niewolnik�w. Teraz kopi� z�oto, bo tak kaza� im Bloodwyn.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//A kopacze maj� wolne. Odpoczywaj�cy kopacze nie wr� dobrze moim interesom.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Scatty handluje r�nymi towarami.");
};


instance DIA_ADDON_SCATTY_LAST(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_last_condition;
	information = dia_addon_scatty_last_info;
	permanent = FALSE;
	description = "Bloodwyn? To on tu jest szefem?";
};


func int dia_addon_scatty_last_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_last_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Bloodwyn? To on tu jest szefem?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Kontroluje kopalni�, ale rzadko do niej zagl�da. Wi�kszo�� czasu sp�dza z Krukiem w �wi�tyni.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//Co dok�adnie oznacza "rzadko"?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Ostatnio widzia�em go, gdy wychodzi� z krypty...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//Nie, czekaj! To chyba by�o wtedy, gdy wys�a� niewolnik�w, aby wydobywali z�oto.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Bardzo je lubi... inaczej ni� Kruk.
};


instance DIA_ADDON_SCATTY_GRUFT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruft_condition;
	information = dia_addon_scatty_gruft_info;
	permanent = FALSE;
	description = "O jakiej krypcie m�wisz?";
};


func int dia_addon_scatty_gruft_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//O jakiej krypcie m�wisz?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//To przekl�ta krypta! Jej stra�nicy zabili wielu ludzi!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Stra�nicy? M�wisz o tych kamiennych stworach? O p�askich twarzach i okr�g�ych g�owach?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//Tak! Ze ska� wysz�y ich ca�e tuziny!
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//Od pocz�tku wiedzia�em, �e otwieranie krypty to nie jest dobry pomys�.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Kruk mia� obsesj� na punkcie tych wykopalisk. Gdy tylko krypta zosta�a ods�oni�ta, on i jego stra�nicy weszli do �rodka.
};


instance DIA_ADDON_SCATTY_GRUFTAGAIN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruftagain_condition;
	information = dia_addon_scatty_gruftagain_info;
	permanent = FALSE;
	description = "Dlaczego Kruk tak chcia� wej�� do tej krypty?";
};


func int dia_addon_scatty_gruftagain_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruft))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruftagain_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Dlaczego Kruk tak chcia� wej�� do tej krypty?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//Hmm. Jeste� do�� w�cibski. Przypominasz mi go�cia, kt�rego kiedy� zna�em.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//By� r�wnie w�cibski. A pewnego dnia sprowadzi�o to na niego zgub�.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Przesta� be�kota�. Co si� sta�o w krypcie?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//No c�... Ee, zasch�o mi w ustach. Napi�bym si� czego�.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hej, Scatt, NIE TERAZ. To wa�ne. Co Kruk robi� na dole?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Dobrze... On... przywo�a� co�, u�ywaj�c s��w jakiego� dziwnego j�zyka.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Ze �rodka krypty przesi�ka�o l�ni�ce �wiat�o, potem us�ysza�em krzyk. Wstrz�saj�cy, demoniczny wrzask.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//Co sta�o si� potem?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//To wszystko, co widzia�em. Z krypty wyszed� Bloodwyn i kaza� mi si� wynosi�. Tak zreszt� zrobi�em.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Kr�tko potem Kruk i jego ludzie opu�cili �wi�tyni�. Od tamtej pory nie by�o go tu na dole.
};


instance DIA_ADDON_SCATTY_TRINKEN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trinken_condition;
	information = dia_addon_scatty_trinken_info;
	permanent = FALSE;
	description = "Napijesz si� czego�?";
};


func int dia_addon_scatty_trinken_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruftagain))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trinken_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Napijesz si� czego�?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Napi�bym si� piwa. Trudno je dosta� w tym obozie.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Mo�e Lucia ma jeszcze gdzie� butelk�.
};


instance DIA_ADDON_SCATTY_BIER(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_bier_condition;
	information = dia_addon_scatty_bier_info;
	permanent = FALSE;
	description = "Zdr�wko! (Daj piwo)";
};


func int dia_addon_scatty_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_trinken) && Npc_HasItems(other,itfo_beer))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_bier_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Zdr�wko!
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		AI_UseItem(self,itfo_beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Och, ale dobre. Dzi�ki, jeste� moim bohaterem.
	b_giveplayerxp(XP_AMBIENT * 5);
};


instance DIA_ADDON_SCATTY_GOLD(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gold_condition;
	information = dia_addon_scatty_gold_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_scatty_gold_condition()
{
	return TRUE;
};

func void dia_addon_scatty_gold_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Bierzesz kilof i walisz w kawa� z�ota... Ka�dy to potrafi.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Je�li jednak b�dziesz tak robi�, z�oto rozpadnie si� na drobne bry�ki. Dlatego w�a�nie kopa� powinni ludzie z do�wiadczeniem.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//Je�eli masz troch� do�wiadczenia, to mog� ci powiedzie� jeszcze par� rzeczy.
	b_upgrade_hero_hackchance(5);
};


var int scatty_teach_perm;

instance DIA_ADDON_SCATTY_TEACH(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_teach_condition;
	information = dia_addon_scatty_teach_info;
	permanent = TRUE;
	description = "Naucz si� wydobywania z�ota. (Koszt: 2 PN/10 procent)";
};


func int dia_addon_scatty_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gold) && (SCATTY_TEACH_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Powiedz mi co� o kopaniu z�ota.
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Musisz pami�ta�, �e z�oto nie przypomina rudy. Jest mi�kkie jak mas�o. Jak uderzysz zbyt mocno, rozpadnie si� na drobne kawa�eczki.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Ka�dy z kopaczy zna sztuczki, dzi�ki kt�rym wydobywa ze ska�y �adne bry�ki.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//To w�a�nie pomaga rozr�ni� dobrego kopacza od z�ego.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//No i praktyka te� robi swoje. Jak troch� popracujesz, b�dzie ci sz�o lepiej.
		other.lp = other.lp - 1;
		b_upgrade_hero_hackchance(10);
		SCATTY_TEACH_PERM = TRUE;
	}
	else
	{
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_ADDON_SCATTY_TOT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_tot_condition;
	information = dia_addon_scatty_tot_info;
	permanent = FALSE;
	description = "Bloodwyn nie �yje.";
};


func int dia_addon_scatty_tot_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_tot_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn nie �yje.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hmm, taka wiadomo�� nie powinna mnie ucieszy�. Ale Bloodwyn jest kolesiem, kt�rego wol� widzie� martwym.
};


instance DIA_ADDON_SCATTY_TRADE(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trade_condition;
	information = dia_addon_scatty_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_scatty_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_1");
};

