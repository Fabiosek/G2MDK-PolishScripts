
instance DIA_ADDON_FORTUNO_EXIT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 999;
	condition = dia_addon_fortuno_exit_condition;
	information = dia_addon_fortuno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fortuno_exit_condition()
{
	return TRUE;
};

func void dia_addon_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FORTUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 900;
	condition = dia_addon_fortuno_pickpocket_condition;
	information = dia_addon_fortuno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_fortuno_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_addon_fortuno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_BACK,dia_addon_fortuno_pickpocket_back);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_PICKPOCKET,dia_addon_fortuno_pickpocket_doit);
};

func void dia_addon_fortuno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};

func void dia_addon_fortuno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};


instance DIA_ADDON_FORTUNO_HI(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_hi_condition;
	information = dia_addon_fortuno_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_fortuno_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (FORTUNO_GEHEILT_01 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_hi_info()
{
	if(FORTUNO_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//Czarna chmura nad domem... ON nadchodzi....
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//Krwi�... Przyzywa�em go... ON, kt�ry mnie obserwuje... Och, nie, odejd�, zostaw mnie...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Dobrze si� czujesz?
		FORTUNO_EINMAL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_FORTUNO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno postrada� zmys�y. Szuka 'zielonego nowicjusza'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Zielony... Zielony nowicjusz... Nie mog� go znale��...
	Info_ClearChoices(dia_addon_fortuno_hi);
	Info_AddChoice(dia_addon_fortuno_hi,"Wr�c� p�niej... (KONIEC)",dia_addon_fortuno_hi_back);
	Info_AddChoice(dia_addon_fortuno_hi,"Jak mog� ci pom�c?",dia_addon_fortuno_hi_hilfe);
	if(Npc_HasItems(other,itmi_joint) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Masz, we� to bagienne ziele.",dia_addon_fortuno_hi_joint);
	};
	if(Npc_HasItems(other,itmi_addon_joint_01) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Dobrze, spr�buj tego zielonego nowicjusza.",dia_addon_fortuno_hi_green);
	};
};

func void dia_addon_fortuno_hi_back()
{
	Info_ClearChoices(dia_addon_fortuno_hi);
	AI_StopProcessInfos(self);
};

func void dia_addon_fortuno_hi_hilfe()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//Jak mog� ci pom�c?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//Zielony... Zielony nowicjusz pomaga nowicjuszowi...
};

func void dia_addon_fortuno_hi_joint()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Masz, we� to bagienne ziele.
	if(b_giveinvitems(other,self,itmi_joint,1))
	{
		AI_UseItem(self,itmi_joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Nie zielony ani nie silny, nie zielony, nie silny...
};

func void dia_addon_fortuno_hi_green()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Dobrze, spr�buj tego zielonego nowicjusza.
	if(b_giveinvitems(other,self,itmi_addon_joint_01,1))
	{
		AI_UseItem(self,itmi_addon_joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//AAACH...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//Moja g�owa... Kim... Jestem... Fortuno... Co... Co si� dzieje?
	Info_ClearChoices(dia_addon_fortuno_hi);
	FORTUNO_GEHEILT_01 = TRUE;
	b_giveplayerxp(XP_ADDON_FORTUNO_01);
	b_logentry(TOPIC_ADDON_FORTUNO,"Zielony nowicjusz przywr�ci� zmys�y Fortuna.");
};


instance DIA_ADDON_FORTUNO_WER(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_wer_condition;
	information = dia_addon_fortuno_wer_info;
	permanent = FALSE;
	description = "Dobrze, a teraz powiedz mi, co z tob�.";
};


func int dia_addon_fortuno_wer_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//Dobrze, a teraz powiedz mi, co z tob�.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//By�em kiedy� cz�onkiem Bractwa �ni�cego. Wtedy wszystko by�o jeszcze w porz�dku.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Tak, wszyscy byli�my skazanymi przest�pcami, ale �ycie dla nas - nowicjuszy - nie by�o takie z�e...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hej, ja te� by�em wi�niem w G�rniczej Dolinie. Powiedz mi co�, czego nie wiem.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//Ja... Nic nie pami�tam. Ciemno�� przes�ania m�j umys�.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//Spr�buj si� skoncentrowa�. Co si� sta�o? Jak odzyska�e� �wiadomo��?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Kruk... Pami�tam tylko Kruka i... ciemne pomieszczenia.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//O co chodzi z Krukiem? Co on ci zrobi�?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//Przepraszam. Czuj� si�, jakby m�j umys� nie by� wolny... Sam tego nie rozumiem...
};


instance DIA_ADDON_FORTUNO_FREE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 5;
	condition = dia_addon_fortuno_free_condition;
	information = dia_addon_fortuno_free_info;
	permanent = FALSE;
	description = "Musi by� jaki� spos�b, �eby przywr�ci� ci wspomnienia.";
};


func int dia_addon_fortuno_free_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_wer))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_free_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//Musi by� jaki� spos�b, �eby przywr�ci� ci wspomnienia.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Hmm... Mo�e jest spos�b.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//Guru znali sztuk� koncentracji i manipulacji umys�em.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//A TY wiesz co� o tych rzeczach?
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//Nie, obawiam si�, �e ta wiedza zagin�a...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Cholera. Je�eli jest jaki� spos�b na uwolnienie twojego umys�u, to go znajd�.
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno wr�ci� do zmys��w, ale niczego nie pami�ta.");
};


instance DIA_ADDON_FORTUNO_HERB(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 99;
	condition = dia_addon_fortuno_herb_condition;
	information = dia_addon_fortuno_herb_info;
	permanent = FALSE;
	description = "Potrzebujesz wi�cej bagiennego ziela?";
};


func int dia_addon_fortuno_herb_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_herb_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Potrzebujesz wi�cej bagiennego ziela?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//Taaak, potrzebuj� tyle ziela, ile tylko zdo�asz przynie��.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//Zap�ac� ci lepiej ni� Fisk.
};

func void b_fortuno_infomanager()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
	Info_AddChoice(dia_addon_fortuno_trade,DIALOG_BACK,dia_addon_fortuno_trade_back);
	if(Npc_HasItems(other,itpl_swampherb) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_trade,"(Oddaj ca�e bagienne ziele)",dia_addon_fortuno_trade_all);
		Info_AddChoice(dia_addon_fortuno_trade,"(Oddaj 1 bagienne ziele)",dia_addon_fortuno_trade_1);
	};
};


instance DIA_ADDON_FORTUNO_TRADE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 100;
	condition = dia_addon_fortuno_trade_condition;
	information = dia_addon_fortuno_trade_info;
	permanent = TRUE;
	description = "Mam dla ciebie bagienne ziele...";
};


func int dia_addon_fortuno_trade_condition()
{
	if((Npc_HasItems(other,itpl_swampherb) >= 1) && Npc_KnowsInfo(other,dia_addon_fortuno_herb))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//Mam dla ciebie bagienne ziele...
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_back()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
};

func void dia_addon_fortuno_trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,itpl_swampherb);
	if(b_giveinvitems(other,self,itpl_swampherb,amount))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,amount * VALUE_SWAMPHERB);
	b_giveplayerxp(amount * 10);
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_1()
{
	if(b_giveinvitems(other,self,itpl_swampherb,1))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,VALUE_SWAMPHERB);
	b_giveplayerxp(10);
	b_fortuno_infomanager();
};


instance DIA_ADDON_FORTUNO_TRANK(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 3;
	condition = dia_addon_fortuno_trank_condition;
	information = dia_addon_fortuno_trank_info;
	permanent = FALSE;
	description = "Mam dla ciebie mikstur�. Powinna pom�c ci odzyska� pami��.";
};


func int dia_addon_fortuno_trank_condition()
{
	if((FORTUNO_GEHEILT_01 == TRUE) && Npc_KnowsInfo(other,dia_addon_fortuno_free) && ((Npc_HasItems(other,itpo_addon_geist_01) >= 1) || (Npc_HasItems(other,itpo_addon_geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trank_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//Mam dla ciebie mikstur�. Powinna pom�c ci odzyska� pami��.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//Ufam ci.
	if(Npc_HasItems(other,itpo_addon_geist_02) >= 1)
	{
		if(b_giveinvitems(other,self,itpo_addon_geist_02,1))
		{
			AI_UseItem(self,itpo_addon_geist_02);
		};
		b_giveplayerxp(XP_ADDON_FORTUNO_02);
	}
	else if(b_giveinvitems(other,self,itpo_addon_geist_01,1))
	{
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem(self,itpo_addon_geist_01);
	};
};


instance DIA_ADDON_FORTUNO_MORE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_more_condition;
	information = dia_addon_fortuno_more_info;
	permanent = FALSE;
	description = "No i jak?";
};


func int dia_addon_fortuno_more_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_more_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//No i jak?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//Ach! Teraz... Teraz pami�tam... Adanosie, pom�... Co ja uczyni�em?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Tak, co zrobi�e�? A co wa�niejsze, co zrobi� Kruk?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//Pomog�em mu... nawi�za� kontakt. Z NIM. Potrzebowa� wielu eliksir�w... Uwarzy�em je dla niego.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//Pr�bowa� otworzy� portal, aby dosta� si� do �wi�tyni.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Po co? Czego on chce ze �wi�tyni?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//Jest tam pot�ny artefakt... Pogrzebany wraz ze swym ostatnim w�a�cicielem. Pot�nym wojownikiem, kt�ry wykonywa� JEGO wol�...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//Co dalej?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//Nie uda�o nam si� otworzy� portalu.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//Kruk jednak dowiedzia� si�, �e ZDO�A go otworzy�, je�li odkopie krypt� kap�ana.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//Dlatego �ci�gn�� tu tych wszystkich niewolnik�w. Ofiary, kt�re zmusi� do kopania w miejscu, gdzie odpoczywaj� si�y czasu.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Krypt� kap�ana?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//Grobowiec kap�ana Adanosa znajduje si� w kopalni.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//Przypominam sobie te� kamienne tabliczki. Kruk wierzy�, �e wska�� mu drog�.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//Gdy tylko zdo�a� odcyfrowa� inskrypcje, sta�em si� zb�dny.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//Rzuci� na mnie zakl�cie, kt�re sprawi�o, �e wszystko zapomnia�em. A ty mnie uwolni�e�.
	SC_KNOWSFORTUNOINFOS = TRUE;
	b_logentry(TOPIC_ADDON_RAVENKDW,"Kruk chce wydoby� pot�ny artefakt ze �wi�tyni Adanosa.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"Z jakiego� powodu Kruk rozkopa� w kopalni z�ota gr�b jednego z kap�an�w prastarej kultury.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"Kruk s�dzi, �e w realizacji jego planu pomog� jakie� kamienne tablice.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_ADDON_FORTUNO_03);
};


instance DIA_ADDON_FORTUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 9;
	condition = dia_addon_fortuno_attentat_condition;
	information = dia_addon_fortuno_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fortuno_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Pr�ba zab�jstwa? Wybacz, przez jaki� czas mnie... nie by�o. Nie wiem nic na ten temat.
};

