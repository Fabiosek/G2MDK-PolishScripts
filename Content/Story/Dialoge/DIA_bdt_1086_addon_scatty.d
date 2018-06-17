
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
	description = "Jak ci id¹ interesy?";
};


func int dia_addon_scatty_hi_condition()
{
	return TRUE;
};

func void dia_addon_scatty_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Jak ci id¹ interesy?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//Od otwarcia krypty coraz gorzej....
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Kruk nie potrzebuje ju¿ niewolników. Teraz kopi¹ z³oto, bo tak kaza³ im Bloodwyn.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//A kopacze maj¹ wolne. Odpoczywaj¹cy kopacze nie wró¿¹ dobrze moim interesom.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Scatty handluje ró¿nymi towarami.");
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
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Kontroluje kopalniê, ale rzadko do niej zagl¹da. Wiêkszoœæ czasu spêdza z Krukiem w œwi¹tyni.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//Co dok³adnie oznacza "rzadko"?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Ostatnio widzia³em go, gdy wychodzi³ z krypty...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//Nie, czekaj! To chyba by³o wtedy, gdy wys³a³ niewolników, aby wydobywali z³oto.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Bardzo je lubi... inaczej ni¿ Kruk.
};


instance DIA_ADDON_SCATTY_GRUFT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruft_condition;
	information = dia_addon_scatty_gruft_info;
	permanent = FALSE;
	description = "O jakiej krypcie mówisz?";
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
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//O jakiej krypcie mówisz?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//To przeklêta krypta! Jej stra¿nicy zabili wielu ludzi!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Stra¿nicy? Mówisz o tych kamiennych stworach? O p³askich twarzach i okr¹g³ych g³owach?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//Tak! Ze ska³ wysz³y ich ca³e tuziny!
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//Od pocz¹tku wiedzia³em, ¿e otwieranie krypty to nie jest dobry pomys³.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Kruk mia³ obsesjê na punkcie tych wykopalisk. Gdy tylko krypta zosta³a ods³oniêta, on i jego stra¿nicy weszli do œrodka.
};


instance DIA_ADDON_SCATTY_GRUFTAGAIN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruftagain_condition;
	information = dia_addon_scatty_gruftagain_info;
	permanent = FALSE;
	description = "Dlaczego Kruk tak chcia³ wejœæ do tej krypty?";
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
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Dlaczego Kruk tak chcia³ wejœæ do tej krypty?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//Hmm. Jesteœ doœæ wœcibski. Przypominasz mi goœcia, którego kiedyœ zna³em.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//By³ równie wœcibski. A pewnego dnia sprowadzi³o to na niego zgubê.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Przestañ be³kotaæ. Co siê sta³o w krypcie?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//No có¿... Ee, zasch³o mi w ustach. Napi³bym siê czegoœ.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hej, Scatt, NIE TERAZ. To wa¿ne. Co Kruk robi³ na dole?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Dobrze... On... przywo³a³ coœ, u¿ywaj¹c s³ów jakiegoœ dziwnego jêzyka.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Ze œrodka krypty przesi¹ka³o lœni¹ce œwiat³o, potem us³ysza³em krzyk. Wstrz¹saj¹cy, demoniczny wrzask.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//Co sta³o siê potem?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//To wszystko, co widzia³em. Z krypty wyszed³ Bloodwyn i kaza³ mi siê wynosiæ. Tak zreszt¹ zrobi³em.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Krótko potem Kruk i jego ludzie opuœcili œwi¹tyniê. Od tamtej pory nie by³o go tu na dole.
};


instance DIA_ADDON_SCATTY_TRINKEN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trinken_condition;
	information = dia_addon_scatty_trinken_info;
	permanent = FALSE;
	description = "Napijesz siê czegoœ?";
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
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Napijesz siê czegoœ?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Napi³bym siê piwa. Trudno je dostaæ w tym obozie.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Mo¿e Lucia ma jeszcze gdzieœ butelkê.
};


instance DIA_ADDON_SCATTY_BIER(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_bier_condition;
	information = dia_addon_scatty_bier_info;
	permanent = FALSE;
	description = "Zdrówko! (Daj piwo)";
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
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Zdrówko!
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		AI_UseItem(self,itfo_beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Och, ale dobre. Dziêki, jesteœ moim bohaterem.
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
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Bierzesz kilof i walisz w kawa³ z³ota... Ka¿dy to potrafi.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Jeœli jednak bêdziesz tak robiæ, z³oto rozpadnie siê na drobne bry³ki. Dlatego w³aœnie kopaæ powinni ludzie z doœwiadczeniem.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//Je¿eli masz trochê doœwiadczenia, to mogê ci powiedzieæ jeszcze parê rzeczy.
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
	description = "Naucz siê wydobywania z³ota. (Koszt: 2 PN/10 procent)";
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
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Powiedz mi coœ o kopaniu z³ota.
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Musisz pamiêtaæ, ¿e z³oto nie przypomina rudy. Jest miêkkie jak mas³o. Jak uderzysz zbyt mocno, rozpadnie siê na drobne kawa³eczki.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Ka¿dy z kopaczy zna sztuczki, dziêki którym wydobywa ze ska³y ³adne bry³ki.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//To w³aœnie pomaga rozró¿niæ dobrego kopacza od z³ego.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//No i praktyka te¿ robi swoje. Jak trochê popracujesz, bêdzie ci sz³o lepiej.
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
	description = "Bloodwyn nie ¿yje.";
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
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn nie ¿yje.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hmm, taka wiadomoœæ nie powinna mnie ucieszyæ. Ale Bloodwyn jest kolesiem, którego wolê widzieæ martwym.
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

