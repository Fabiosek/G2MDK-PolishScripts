
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 999;
	condition = dia_bdt_1013_bandit_firstexit_condition;
	information = dia_bdt_1013_bandit_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1013_bandit_firstexit_condition()
{
	return TRUE;
};

func void dia_bdt_1013_bandit_firstexit_info()
{
	if((BDT13_FRIEND == TRUE) && !Npc_IsDead(ambusher_1014) && !Npc_IsDead(ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//Na twoim miejscu trzyma³bym siê z dala od jaskini tam, na górze. Moi kumple mog¹ ci nieŸle osmaliæ ty³ek. A wierz mi, na bitce to oni siê znaj¹.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 999;
	condition = dia_bdt_1013_bandit_exit_condition;
	information = dia_bdt_1013_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1013_bandit_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void dia_bdt_1013_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_WHERE(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_bdt_1013_bandit_where_condition;
	information = dia_bdt_1013_bandit_where_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bdt_1013_bandit_where_condition()
{
	return TRUE;
};

func void dia_bdt_1013_bandit_where_info()
{
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Hej - sk¹d siê tu wzi¹³eœ, co?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Przybywam z gór.",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Przysy³a mnie Xardas...",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//Przybywam z gór.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//No w³aœnie, przybywasz z gór. To Ÿle.
	b_usefakescroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Bardzo Ÿle.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//Szukaj¹ ciê - ca³a zgraja naprawdê z³ych ludzi.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//Jest tu ktoœ, z kim musisz natychmiast porozmawiaæ. ChodŸ za mn¹!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo¿e póŸniej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Komu tak bardzo na mnie zale¿y?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz¹dku, prowadŸ.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//Przysy³a mnie Xardas...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//Stary czarodziej? Nazywa siê Xardas... Braga z pewnoœci¹ to zainteresuje.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//W porz¹dku, prowadŸ.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//No dobra, chodŸ za mn¹. Jaskinia jest niedaleko.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Komu tak bardzo na mnie zale¿y?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//Po³owa Khorinis siê za tob¹ ugania, nie powiesz mi chyba, ¿e nie masz o tym zielonego pojêcia?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//Ach! Rozumiem! Nie chcesz o tym gadaæ, co? W porz¹dku - twoja sprawa.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//To jak, idziesz czy nie?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo¿e póŸniej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Z kim powinienem porozmawiaæ?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz¹dku, prowadŸ.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//Z kim powinienem porozmawiaæ?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//Z moim szefem. Nazywa siê Brago. On wyjaœni ci wszystko o wiele lepiej ni¿ ja.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//No wiêc jak - idziemy?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo¿e póŸniej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Sk¹d mam wiedzieæ, ¿e to nie jest pu³apka?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz¹dku, prowadŸ.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//Sk¹d mam wiedzieæ, ¿e to nie jest pu³apka?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//Wiesz, zaczynasz mnie ju¿ mêczyæ. Jeœli nie chcesz pomocy, to idŸ do miasta, niech ciê zapuszkuj¹!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//Albo NATYCHMIAST ze mn¹ pójdziesz, albo zejdŸ mi z oczu, ³apiesz?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo¿e póŸniej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Ktoœ ju¿ próbowa³ mnie wyko³owaæ...",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz¹dku, prowadŸ.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Spokojnie, przyjacielu! Ktoœ ju¿ próbowa³ mnie wyko³owaæ...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//Czy¿by?
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//Pewien cz³owiek chcia³, ¿ebyœmy odzyskali razem amulet, a zyskami podzielili siê po po³owie.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//Kiedy ju¿ wykonaliœmy zadanie, on i banda jego kole¿ków zaatakowali mnie.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//Wygl¹da na to, ¿eœ trafi³ na nieuczciwych ludzi - gdzie to siê wydarzy³o?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"To nie ma znaczenia.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"By³em skazañcem w kolonii górniczej.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//By³em skazañcem w kolonii górniczej.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//Ej... Przychodzisz spoza Bariery? Cz³owieku! Byliœmy tam razem!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//Nie pamiêtam ciê...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//By³em kopaczem w Starym Obozie. Trzyma³em siê z dala od k³opotów.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//Ale teraz najwa¿niejsze jest to, ¿e wpakowa³eœ siê w porz¹dne tarapaty!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//Ktoœ wyznaczy³ za twoj¹ g³owê ca³kiem spor¹ nagrodê. Pojawi³y siê te¿ listy goñcze z twoj¹ facjat¹!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//Na twoim miejscu bardzo bym na siebie uwa¿a³. S¹ wœród nas ludzie, którzy dla z³ota pozabijaliby w³asne matki.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//Ale my, ch³opcy z kolonii karnej, powinniœmy siê trzymaæ razem!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Powinienem ci chyba podziêkowaæ...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//Nie ma za co. Próbujê po prostu utrzymaæ siê przy ¿yciu.
	BDT13_FRIEND = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	self.npctype = NPCTYPE_FRIEND;
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//To nie ma znaczenia.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Jak tam sobie chcesz. To co? Idziemy?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Mo¿e póŸniej...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"W porz¹dku, prowadŸ.",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Mo¿e póŸniej...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//Nie bêdzie ¿adnego póŸniej, kole¿ko!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_ambush_condition;
	information = dia_1013_bandit_ambush_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1013_bandit_ambush_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (BDT13_FRIEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_ambush_info()
{
	if(Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//G³upio zrobi³eœ, œledz¹c mnie...
		b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Hej, ludzie, patrzcie, kogo tu mamy...
		AI_StopProcessInfos(self);
	};
};


instance DIA_1013_BANDIT_NAME(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_name_condition;
	information = dia_1013_bandit_name_info;
	permanent = FALSE;
	description = "Kto wyznaczy³ tê nagrodê?";
};


func int dia_1013_bandit_name_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_name_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Kto wyznaczy³ tê nagrodê?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//Tego nie wiem. Tylko jeden z nas go zna.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//A kto to taki?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Hej, stary, no naprawdê nie mogê ci tego powiedzieæ. Wiesz, jak jest...
	Log_CreateTopic(TOPIC_BANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BANDITS,LOG_RUNNING);
	b_logentry(TOPIC_BANDITS,"Œcigaj¹ mnie bandyci. Maj¹ list goñczy z moj¹ podobizn¹. Zastanawiam siê, kto lub co siê za tym kryje.");
	MIS_STECKBRIEFE = LOG_RUNNING;
};


instance DIA_1013_BANDIT_DEXTER(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_dexter_condition;
	information = dia_1013_bandit_dexter_info;
	permanent = TRUE;
	description = "10 sztuk z³ota za imiê tego goœcia!";
};


func int dia_1013_bandit_dexter_condition()
{
	if((BDT13_FRIEND == TRUE) && (BDT13_DEXTER_VERRATEN == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_dexter_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 sztuk z³ota za imiê tego goœcia!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Och, stary, naprawdê nie mogê tego zrobiæ...
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//No, wykrztuœ to w koñcu!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//Och, stary! No dobra. Nazywa siê Dexter. Ko³o du¿ego gospodarstwa jest stroma ska³a.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//Na niej jest wie¿a stra¿nicza, a obok kilka kopalni. Gdzieœ w pobli¿u jest jego kryjówka.
	b_logentry(TOPIC_BANDITS,"Przywódc¹ bandytów jest Dexter. Ukrywa siê w kopalni w pobli¿u farmy w³aœciciela ziemskiego.");
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//Widzisz, to nie by³o takie trudne. Tu jest twoje z³oto.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//Eee... W³aœnie przypomnia³em sobie, ¿e nie mam dziesiêciu sztuk z³ota.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//Co?! Ja... Och, niewa¿ne. To moja wina. Mog³em nic ci nie mówiæ, zanim nie zobaczy³em z³ota...
	};
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//Tylko nie mów im, kto ci to powiedzia³.
	BDT13_DEXTER_VERRATEN = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 2;
	condition = dia_1013_bandit_pic_condition;
	information = dia_1013_bandit_pic_info;
	permanent = FALSE;
	description = "Dasz mi ten portret?";
};


func int dia_1013_bandit_pic_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_pic_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//Dasz mi ten portret?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Jasne. Przecie¿ to TWOJA gêba.
	b_giveinvitems(self,other,itwr_poster_mis,1);
};


instance DIA_1013_BANDIT_FROMMALETH(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_1013_bandit_frommaleth_condition;
	information = dia_1013_bandit_frommaleth_info;
	permanent = FALSE;
	description = "Przys³a³ mnie jeden z ch³opów spoza miasta...";
};


func int dia_1013_bandit_frommaleth_condition()
{
	if((BDT13_FRIEND == TRUE) && ((MIS_MALETH_BANDITS == LOG_RUNNING) || (MIS_MALETH_BANDITS == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_frommaleth_info()
{
	var C_NPC b14;
	var C_NPC b15;
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//Przys³a³ mnie jeden z ch³opów spoza miasta...
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//Co? Wieœniacy wiedz¹ o kryjówce?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//Zauwa¿yli brak owiec.
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//O cholera! Có¿, wiêc muszê siê st¹d wynieœæ. Jeœli znajd¹ pust¹ kryjówkê, to mo¿e przestan¹ mnie szukaæ.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//On chce, ¿ebyœcie wszyscy zginêli...
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Zaraz - chyba mnie nie wkopiesz? Nie po tym, jak ci pomog³em?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//No to idŸ i porozbijaj ³by pozosta³ym, skoro tak pragniesz rozlewu krwi - ja w to nie wchodzê!
	};
	BDT_1013_AWAY = TRUE;
	b_giveplayerxp(XP_BANDITWEG);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_1013_BANDIT_FROMCAVALORN(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_1013_bandit_fromcavalorn_condition;
	information = dia_1013_bandit_fromcavalorn_info;
	permanent = FALSE;
	description = "Wkrótce rozpêta siê tu prawdziwe piek³o!";
};


func int dia_1013_bandit_fromcavalorn_condition()
{
	if((BDT13_FRIEND == TRUE) && (MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_fromcavalorn_info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//Wkrótce rozpêta siê tu prawdziwe piek³o!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Co?!
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//Idzie tu po ciebie niejaki Cavalorn!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//Cholera! Muszê siê st¹d wynieœæ.
	BDT_1013_AWAY = TRUE;
	b_giveplayerxp(XP_BANDITWEG);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_gossip_wildnis;

instance DIA_1013_BANDIT_PERM(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 4;
	condition = dia_1013_bandit_perm_condition;
	information = dia_1013_bandit_perm_info;
	permanent = TRUE;
	description = "Wiesz coœ jeszcze, co mog³oby mnie zainteresowaæ?";
};


func int dia_1013_bandit_perm_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_perm_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Wiesz coœ jeszcze, co mog³oby mnie zainteresowaæ?
	if(BDT13_GOSSIP_WILDNIS == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//Chodzi ci o tutejsz¹ okolicê? Jeœli chcesz prze¿yæ, trzymaj siê œcie¿ek.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//Im dalej zapuœcisz siê w dzicz, tym wiêksze grozi ci niebezpieczeñstwo.
		BDT13_GOSSIP_WILDNIS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//Powiedzia³em ci wszystko, co wiem.
	};
};

