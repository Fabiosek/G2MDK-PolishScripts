
instance DIA_ADDON_BDT_10014_THORUS_EXIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 999;
	condition = dia_addon_thorus_exit_condition;
	information = dia_addon_thorus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_thorus_exit_condition()
{
	return TRUE;
};

func void dia_addon_thorus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10014_THORUS_HI(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 2;
	condition = dia_addon_thorus_hi_condition;
	information = dia_addon_thorus_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_hi_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Znasz zasad�. Bez czerwonego kamienia nikt nie wejdzie do kopalni.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Zapomnij o kopalni. Musz� si� dosta� do Kruka.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//Pewnie, ale zasady dotycz� wszystkich. Nawet ciebie.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Id� z powrotem. Je�eli spr�bujesz wej�� na g�r� bez pozwolenia, stra�nicy ci� zabij�. Takie s� zasady.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Jak ci si� co� nie podoba, to id� porozmawia� z Estebanem. On jest odpowiedzialny za ob�z.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BDT_10014_THORUS_RAVEN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 3;
	condition = dia_addon_thorus_raven_condition;
	information = dia_addon_thorus_raven_info;
	permanent = FALSE;
	description = "To naprawd� wa�ne, abym dosta� si� do Kruka...";
};


func int dia_addon_thorus_raven_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raven_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//To naprawd� wa�ne, �ebym dosta� si� do Kruka...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//No i co z tego? Naprawd� s�dzisz, �e zdo�asz do niego dotrze�?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Jego stra�nik ma rozkaz NIKOGO nie wpuszcza�. B�dziesz martwy, zanim zdo�asz go zobaczy�.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Tak wi�c wybij to sobie z g�owy.
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Kruk jest przyw�dc� bandyt�w. B�d� musia� oczy�ci� sobie drog�, aby do niego dotrze�.");
};


instance DIA_ADDON_BDT_10014_THORUS_ZEIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_zeit_condition;
	information = dia_addon_thorus_zeit_info;
	permanent = FALSE;
	description = "Nie pami�tasz mnie? Ze Starego Obozu?";
};


func int dia_addon_thorus_zeit_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_zeit_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Nie pami�tasz mnie? Ze Starego Obozu?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Jeste� jednym z wi�ni�w? A mo�e by�e� jednym z moich stra�nik�w. Co z tego? Wydaje ci si�, �e teraz jeste�my sojusznikami?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Nie, nie wydaje mi si�.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Mo�e to ty obali�e� barier�... mo�e to ty zabi�e� moich kumpli.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//No i co z tego?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Te dni ju� min�y.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Chcesz wej��? To zdob�d� czerwony kamie� i nie marnuj mojego czasu.
	};
};


var int thorus_goodoldperm;

instance DIA_ADDON_BDT_10014_THORUS_GOODOLDPERM(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_goodoldperm_condition;
	information = dia_addon_thorus_goodoldperm_info;
	permanent = TRUE;
	description = "Daj spok�j, wpu�� mnie. Przez wzgl�d na stare, dobre czasy.";
};


func int dia_addon_thorus_goodoldperm_condition()
{
	if((MIS_SEND_BUDDLER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_bdt_10014_thorus_zeit) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_goodoldperm_info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//Daj spok�j, wpu�� mnie. Przez wzgl�d na stare, dobre czasy.
	if(THORUS_GOODOLDPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Pozw�l, �e ci co� wyja�ni�. Wiesz, dlaczego wci�� �yj�?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Bo zawsze by�em lojalny wzgl�dem moich ludzi.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Nie musi mi si� podoba� to, co robi Kruk. Ale mimo to b�d� przestrzega� zasad.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//I ty tak�e!
		THORUS_GOODOLDPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//Nie!
	};
};

func int c_playerhaswrongtoken()
{
	if((c_schasmagicstoneplate() == TRUE) || (Npc_HasItems(hero,itwr_stoneplatecommon_addon) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_02) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_03) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_04) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_05) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_ADDON_BDT_10014_THORUS_STEIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_stein_condition;
	information = dia_addon_thorus_stein_info;
	permanent = TRUE;
	description = "Mam dla ciebie kamienn� tabliczk�.";
};


func int dia_addon_thorus_stein_condition()
{
	if((c_playerhaswrongtoken() == TRUE) && (RAVENISDEAD == FALSE) && (MIS_SEND_BUDDLER != LOG_RUNNING) && (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//Mam dla ciebie kamienn� tabliczk�.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//To nie ta. Licz� si� tylko czerwone.
};


instance DIA_ADDON_BDT_10014_THORUS_REIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_rein_condition;
	information = dia_addon_thorus_rein_info;
	permanent = FALSE;
	description = "Mam tabliczk� z czerwonego kamienia...";
};


func int dia_addon_thorus_rein_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_rein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//Mam tabliczk� z czerwonego kamienia...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//W porz�dku.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Wyko�czy�e� Estebana - a to oznacza, �e teraz TY b�dziesz wykonywa� jego prac�.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//W kopalni s� problemy z pe�zaczami.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//Znikn�o ju� trzech kopaczy. Twoim zadaniem jest zdoby� nowych.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//A wtedy b�d� m�g� w ko�cu wej�� do tej piekielnej kopalni?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Wykonaj swoje zadanie - potem r�b, co tylko zechcesz.
	MIS_SEND_BUDDLER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BUDDLER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BUDDLER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BUDDLER,"Poniewa� teraz przej��em obowi�zki Estebana, powinienem wys�a� trzech kopaczy do kopalni.");
};


instance DIA_ADDON_BDT_10014_THORUS_SENT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_sent_condition;
	information = dia_addon_thorus_sent_info;
	permanent = FALSE;
	description = "Przys�a�em trzech ludzi.";
};


func int dia_addon_thorus_sent_condition()
{
	if((PLAYER_SENTBUDDLER >= 3) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_sent_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Przys�a�em trzech ludzi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//W porz�dku. Je�li o mnie chodzi, mo�esz wej��.
	MIS_SEND_BUDDLER = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BDT_10014_THORUS_ARMOR(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_armor_condition;
	information = dia_addon_thorus_armor_info;
	permanent = FALSE;
	description = "Hej, a co z pancerzem? Gdzie go dostan�?";
};


func int dia_addon_thorus_armor_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_armor_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Hej, a co z pancerzem? Gdzie go dostan�?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Nigdzie. Takie pancerze s� zarezerwowane dla stra�y Kruka.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Nie mog� uwierzy�, �e przeprowadza si� rekrutacj�, ale koniec ko�c�w decyzja nie nale�y do mnie, a do Kruka.
};


instance DIA_ADDON_THORUS_GEFANGENE(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 88;
	condition = dia_addon_thorus_gefangene_condition;
	information = dia_addon_thorus_gefangene_info;
	permanent = FALSE;
	description = "Co si� dzieje z wi�niami?";
};


func int dia_addon_thorus_gefangene_condition()
{
	if(!Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_gefangene_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//Co si� dzieje z wi�niami?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Hmm, ich zadanie zosta�o wykonane. Z tego, co wiem, powinni teraz wydobywa� z�oto.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//A je�eli spr�buj� uciec?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//...Bloodwyn wys�a�by za nimi swych stra�nik�w. Nie s�dz� jednak, by byli a� tak szaleni, �eby pr�bowa� ucieczki.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Chyba �e..
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Chyba �e co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//...kto� by im pom�g�. Nie znam jednak nikogo dostatecznie g�upiego, �eby si� na to powa�y�... Przynajmniej tak d�ugo, jak Bloodwyn tu jest.
	b_say(other,self,"$VERSTEHE");
};


instance DIA_ADDON_THORUS_SPEECH(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_speech_condition;
	information = dia_addon_thorus_speech_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_speech_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_speech_info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Co zamierzasz zrobi�?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//S�ucham?!
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Bloodwyn nie stoi ci ju� na drodze. Zastanawiam si�, kto b�dzie nast�pny. Kruk? A mo�e ja?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Boisz si�?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Nie boj� si� walki. Jedynie konsekwencji twoich czyn�w.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Ten ob�z to wszystko, co mamy.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Nie uda�o si� tak, aby wszyscy byli zadowoleni, ale ZADZIA�A�O.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//A ka�dy kolejny zabity oznacza coraz wi�kszy roz�am.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Jeste�my bandytami, pariasami, pogardzanymi wyrzutkami.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Dok�dkolwiek p�jdziemy, b�d� nas �ciga�, zamyka� w wi�zieniach i zabija�.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Nie ma dla nas ani lepszego miejsca, ani lepszego czasu.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Czego wi�c chcesz?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Ci ludzie potrzebuj� kogo�, kto ich poprowadzi. Kto ma to zrobi�? Ty? Kto�, kto nie potrafi usiedzie� na miejscu?
};


instance DIA_ADDON_THORUS_ANSWER(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_answer_condition;
	information = dia_addon_thorus_answer_info;
	permanent = FALSE;
	description = "Dlaczego wi�c nie zostaniesz przyw�dc� obozu?";
};


func int dia_addon_thorus_answer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_thorus_speech))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_answer_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Dlaczego wi�c nie zostaniesz przyw�dc� obozu?
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Dobrze, ale co z Krukiem?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//Kruk nied�ugo b�dzie mia� inne k�opoty. Ja ju� o to zadbam.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//Upewnij si�, �e wi�niowie mog� swobodnie opu�ci� ob�z.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Dobrze. Zajm� si� wszystkimi stra�nikami na zewn�trz.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Bloodwyn nie �yje, a Thorus postara si�, aby niewolnicy mogli opu�ci� ob�z.");
	if(!Npc_IsDead(prisonguard))
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Teraz ponownie porozmawiam ze stra�nikami niewolnik�w, a wtedy Patrick i jego ch�opaki wreszcie zabior� si� do roboty.");
	}
	else
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Stra� niewolnik�w nie b�dzie ju� sprawia�a k�opot�w, wi�c Patrick i jego ch�opaki wreszcie mog� zabra� si� do roboty.");
	};
};


instance DIA_ADDON_THORUS_RAVENTOT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_raventot_condition;
	information = dia_addon_thorus_raventot_info;
	permanent = FALSE;
	description = "Uda�o mi si�. Kruka ju� nie ma.";
};


func int dia_addon_thorus_raventot_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raventot_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_00");	//Uda�o mi si�. Kruka ju� nie ma.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_01");	//To b�dzie nauczka dla Beliara.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//Ruszasz dalej?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_03");	//Moje zadanie w dolinie zosta�o wykonane. Odpoczn� kilka dni.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//Tak, ci�gle w drodze, co? Bezpiecznej podr�y.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Kto wie, mo�e jeszcze kiedy� si� spotkamy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Kto wie... Spotkasz na swojej drodze jeszcze wiele bram i �uk�w. A przy jednym z nich znajdziesz mnie...
	AI_StopProcessInfos(self);
};

