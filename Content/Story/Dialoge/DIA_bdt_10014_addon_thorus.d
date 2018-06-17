
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
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Znasz zasadê. Bez czerwonego kamienia nikt nie wejdzie do kopalni.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Zapomnij o kopalni. Muszê siê dostaæ do Kruka.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//Pewnie, ale zasady dotycz¹ wszystkich. Nawet ciebie.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//IdŸ z powrotem. Je¿eli spróbujesz wejœæ na górê bez pozwolenia, stra¿nicy ciê zabij¹. Takie s¹ zasady.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Jak ci siê coœ nie podoba, to idŸ porozmawiaæ z Estebanem. On jest odpowiedzialny za obóz.
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
	description = "To naprawdê wa¿ne, abym dosta³ siê do Kruka...";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//To naprawdê wa¿ne, ¿ebym dosta³ siê do Kruka...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//No i co z tego? Naprawdê s¹dzisz, ¿e zdo³asz do niego dotrzeæ?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Jego stra¿nik ma rozkaz NIKOGO nie wpuszczaæ. Bêdziesz martwy, zanim zdo³asz go zobaczyæ.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Tak wiêc wybij to sobie z g³owy.
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Kruk jest przywódc¹ bandytów. Bêdê musia³ oczyœciæ sobie drogê, aby do niego dotrzeæ.");
};


instance DIA_ADDON_BDT_10014_THORUS_ZEIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_zeit_condition;
	information = dia_addon_thorus_zeit_info;
	permanent = FALSE;
	description = "Nie pamiêtasz mnie? Ze Starego Obozu?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Nie pamiêtasz mnie? Ze Starego Obozu?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Jesteœ jednym z wiêŸniów? A mo¿e by³eœ jednym z moich stra¿ników. Co z tego? Wydaje ci siê, ¿e teraz jesteœmy sojusznikami?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Nie, nie wydaje mi siê.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Mo¿e to ty obali³eœ barierê... mo¿e to ty zabi³eœ moich kumpli.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//No i co z tego?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Te dni ju¿ minê³y.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Chcesz wejœæ? To zdob¹dŸ czerwony kamieñ i nie marnuj mojego czasu.
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
	description = "Daj spokój, wpuœæ mnie. Przez wzgl¹d na stare, dobre czasy.";
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
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//Daj spokój, wpuœæ mnie. Przez wzgl¹d na stare, dobre czasy.
	if(THORUS_GOODOLDPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Pozwól, ¿e ci coœ wyjaœniê. Wiesz, dlaczego wci¹¿ ¿yjê?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Bo zawsze by³em lojalny wzglêdem moich ludzi.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Nie musi mi siê podobaæ to, co robi Kruk. Ale mimo to bêdê przestrzegaæ zasad.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//I ty tak¿e!
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
	description = "Mam dla ciebie kamienn¹ tabliczkê.";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//Mam dla ciebie kamienn¹ tabliczkê.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//To nie ta. Licz¹ siê tylko czerwone.
};


instance DIA_ADDON_BDT_10014_THORUS_REIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_rein_condition;
	information = dia_addon_thorus_rein_info;
	permanent = FALSE;
	description = "Mam tabliczkê z czerwonego kamienia...";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//Mam tabliczkê z czerwonego kamienia...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//W porz¹dku.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Wykoñczy³eœ Estebana - a to oznacza, ¿e teraz TY bêdziesz wykonywa³ jego pracê.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//W kopalni s¹ problemy z pe³zaczami.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//Zniknê³o ju¿ trzech kopaczy. Twoim zadaniem jest zdobyæ nowych.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//A wtedy bêdê móg³ w koñcu wejœæ do tej piekielnej kopalni?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Wykonaj swoje zadanie - potem rób, co tylko zechcesz.
	MIS_SEND_BUDDLER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BUDDLER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BUDDLER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BUDDLER,"Poniewa¿ teraz przej¹³em obowi¹zki Estebana, powinienem wys³aæ trzech kopaczy do kopalni.");
};


instance DIA_ADDON_BDT_10014_THORUS_SENT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_sent_condition;
	information = dia_addon_thorus_sent_info;
	permanent = FALSE;
	description = "Przys³a³em trzech ludzi.";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Przys³a³em trzech ludzi.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//W porz¹dku. Jeœli o mnie chodzi, mo¿esz wejœæ.
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
	description = "Hej, a co z pancerzem? Gdzie go dostanê?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Hej, a co z pancerzem? Gdzie go dostanê?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Nigdzie. Takie pancerze s¹ zarezerwowane dla stra¿y Kruka.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Nie mogê uwierzyæ, ¿e przeprowadza siê rekrutacjê, ale koniec koñców decyzja nie nale¿y do mnie, a do Kruka.
};


instance DIA_ADDON_THORUS_GEFANGENE(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 88;
	condition = dia_addon_thorus_gefangene_condition;
	information = dia_addon_thorus_gefangene_info;
	permanent = FALSE;
	description = "Co siê dzieje z wiêŸniami?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//Co siê dzieje z wiêŸniami?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Hmm, ich zadanie zosta³o wykonane. Z tego, co wiem, powinni teraz wydobywaæ z³oto.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//A je¿eli spróbuj¹ uciec?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//...Bloodwyn wys³a³by za nimi swych stra¿ników. Nie s¹dzê jednak, by byli a¿ tak szaleni, ¿eby próbowaæ ucieczki.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Chyba ¿e..
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Chyba ¿e co?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//...ktoœ by im pomóg³. Nie znam jednak nikogo dostatecznie g³upiego, ¿eby siê na to powa¿y³... Przynajmniej tak d³ugo, jak Bloodwyn tu jest.
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
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Co zamierzasz zrobiæ?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//S³ucham?!
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Bloodwyn nie stoi ci ju¿ na drodze. Zastanawiam siê, kto bêdzie nastêpny. Kruk? A mo¿e ja?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Boisz siê?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Nie bojê siê walki. Jedynie konsekwencji twoich czynów.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Ten obóz to wszystko, co mamy.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Nie uda³o siê tak, aby wszyscy byli zadowoleni, ale ZADZIA£A£O.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//A ka¿dy kolejny zabity oznacza coraz wiêkszy roz³am.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Jesteœmy bandytami, pariasami, pogardzanymi wyrzutkami.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Dok¹dkolwiek pójdziemy, bêd¹ nas œcigaæ, zamykaæ w wiêzieniach i zabijaæ.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Nie ma dla nas ani lepszego miejsca, ani lepszego czasu.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Czego wiêc chcesz?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Ci ludzie potrzebuj¹ kogoœ, kto ich poprowadzi. Kto ma to zrobiæ? Ty? Ktoœ, kto nie potrafi usiedzieæ na miejscu?
};


instance DIA_ADDON_THORUS_ANSWER(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_answer_condition;
	information = dia_addon_thorus_answer_info;
	permanent = FALSE;
	description = "Dlaczego wiêc nie zostaniesz przywódc¹ obozu?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Dlaczego wiêc nie zostaniesz przywódc¹ obozu?
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Dobrze, ale co z Krukiem?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//Kruk nied³ugo bêdzie mia³ inne k³opoty. Ja ju¿ o to zadbam.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//Upewnij siê, ¿e wiêŸniowie mog¹ swobodnie opuœciæ obóz.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Dobrze. Zajmê siê wszystkimi stra¿nikami na zewn¹trz.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Bloodwyn nie ¿yje, a Thorus postara siê, aby niewolnicy mogli opuœciæ obóz.");
	if(!Npc_IsDead(prisonguard))
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Teraz ponownie porozmawiam ze stra¿nikami niewolników, a wtedy Patrick i jego ch³opaki wreszcie zabior¹ siê do roboty.");
	}
	else
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Stra¿ niewolników nie bêdzie ju¿ sprawia³a k³opotów, wiêc Patrick i jego ch³opaki wreszcie mog¹ zabraæ siê do roboty.");
	};
};


instance DIA_ADDON_THORUS_RAVENTOT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_raventot_condition;
	information = dia_addon_thorus_raventot_info;
	permanent = FALSE;
	description = "Uda³o mi siê. Kruka ju¿ nie ma.";
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
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_00");	//Uda³o mi siê. Kruka ju¿ nie ma.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_01");	//To bêdzie nauczka dla Beliara.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//Ruszasz dalej?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_03");	//Moje zadanie w dolinie zosta³o wykonane. Odpocznê kilka dni.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//Tak, ci¹gle w drodze, co? Bezpiecznej podró¿y.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Kto wie, mo¿e jeszcze kiedyœ siê spotkamy.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Kto wie... Spotkasz na swojej drodze jeszcze wiele bram i ³uków. A przy jednym z nich znajdziesz mnie...
	AI_StopProcessInfos(self);
};

