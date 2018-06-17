
instance DIA_ADDON_BRANDON_EXIT(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 999;
	condition = dia_addon_brandon_exit_condition;
	information = dia_addon_brandon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_brandon_exit_condition()
{
	return TRUE;
};

func void dia_addon_brandon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BRANDON_HELLO(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 1;
	condition = dia_addon_brandon_hello_condition;
	information = dia_addon_brandon_hello_info;
	important = TRUE;
};


func int dia_addon_brandon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Patrzcie pañstwo... Nowy!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//I do tego szczur l¹dowy!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//Nie jesteœ aby za miêkki na pirata?
};


instance DIA_ADDON_BRANDON_ANYNEWS(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 99;
	condition = dia_addon_brandon_anynews_condition;
	information = dia_addon_brandon_anynews_info;
	permanent = TRUE;
	description = "Jakieœ wieœci?";
};


func int dia_addon_brandon_anynews_condition()
{
	return TRUE;
};

func void dia_addon_brandon_anynews_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//Jakieœ wieœci?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//Oberwa³em doœæ mocno. Mo¿esz mi odst¹piæ jak¹œ miksturê uzdrawiaj¹c¹?
		}
		else if(c_allcanyonrazordead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//A co potem? Wykoñczymy te bestie?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//Dobre pytanie. Na moje oko w kanionie nie ma ju¿ ani jednego ¿ywego brzytwiaka.
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg) && (MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//Nie, ale po powrocie Grega wiele siê zmieni.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//Poczekaj chwilê...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//Nie, nie mogê powiedzieæ, by cokolwiek siê tu zmieni³o. Wszystko po staremu!
	};
};


instance DIA_ADDON_BRANDON_WANNALEARN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_wannalearn_condition;
	information = dia_addon_brandon_wannalearn_info;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_addon_brandon_wannalearn_condition()
{
	return TRUE;
};

func void dia_addon_brandon_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Ciebie? Jasna sprawa! Mogê ci pokazaæ, jak æwiczyæ si³ê i gibkoœæ cia³a.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//Ale z drugiej strony, czemu mia³bym to robiæ?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Bo postawiê ci flaszkê rumu?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//NieŸle, ch³opcze! Wiesz, o co chodzi w tym fachu!
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//Tylko nie przynoœ mi jakiegoœ taniego bimbru!
	MIS_BRANDON_BRINGHERING = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_BRANDONTEACH);
	Log_CreateTopic(TOPIC_ADDON_BRANDONBOOZE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRANDONBOOZE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_BRANDONBOOZE,"Muszê kupiæ Brandonowi drinka. Dopiero wtedy bêdzie mnie uczy³.");
};


instance DIA_ADDON_BRANDON_HOLEGROG(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_holegrog_condition;
	information = dia_addon_brandon_holegrog_info;
	description = "Zorganizujê grog.";
};


func int dia_addon_brandon_holegrog_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_holegrog_info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//Zorganizujê grog.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Chcesz mnie otruæ?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//Chcesz mnie zabiæ?! Czy ty w ogóle masz pojêcie, z czego robi siê grog?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Stary Samuel pêdzi dobry trunek! Postaraj siê o niego.
	if(PLAYER_KNOWSSCHNELLERHERING == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//Masz na myœli "Szybkiego œledzia"?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Tak w³aœnie!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//Kosztowa³eœ kiedyœ specja³u Samuela?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Nie mia³em okazji.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//A wiêc musisz go spróbowaæ!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//Diablo dobry. Uwielbiam go!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Grog nie zadowala Brandona. Pirat chce Szybkiego œledzia. Tylko Samuel ma taki trunek.");
};


instance DIA_ADDON_BRANDON_SCHNELLERHERING(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 13;
	condition = dia_addon_brandon_schnellerhering_condition;
	information = dia_addon_brandon_schnellerhering_info;
	description = "Spróbuj tego.";
};


func int dia_addon_brandon_schnellerhering_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn) && (Npc_HasItems(other,itfo_addon_schnellerhering) > 0))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_schnellerhering_info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Spróbuj tego.
	b_giveinvitems(other,self,itfo_addon_schnellerhering,1);
	b_useitem(self,itfo_addon_schnellerhering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Aaach! Smakuje jak p³ynny ogieñ!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Da³em Brandonowi te paskudne pomyje. Teraz jest zadowolony i bêdzie mnie uczy³.");
	MIS_BRANDON_BRINGHERING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


var int brandon_merke_str;
var int brandon_merke_dex;

instance DIA_ADDON_BRANDON_TEACHPLAYER(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 777;
	condition = dia_addon_brandon_teachplayer_condition;
	information = dia_addon_brandon_teachplayer_info;
	permanent = TRUE;
	description = "Naucz mnie czegoœ.";
};


func int dia_addon_brandon_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Naucz mnie czegoœ.
	BRANDON_MERKE_STR = other.attribute[ATR_STRENGTH];
	BRANDON_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	if(MIS_BRANDON_BRINGHERING == LOG_SUCCESS)
	{
		Info_ClearChoices(dia_addon_brandon_teachplayer);
		Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//Mia³eœ przynieœæ mi coœ dobrego, ch³opcze!
	};
};

func void dia_addon_brandon_teachplayer_back()
{
	if(other.attribute[ATR_STRENGTH] > BRANDON_MERKE_STR)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//Dobrze. Widzê, ¿e zyska³eœ trochê krzepy.
	};
	if(other.attribute[ATR_DEXTERITY] > BRANDON_MERKE_DEX)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//Im jesteœ zrêczniejszy, tym ³atwiej bêdzie ci trafiæ cel w walce.
	};
	Info_ClearChoices(dia_addon_brandon_teachplayer);
};

func void dia_addon_brandon_teachplayer_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_addon_brandon_teachplayer_str_5);
};


instance DIA_ADDON_BRANDON_ANHEUERN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_anheuern_condition;
	information = dia_addon_brandon_anheuern_info;
	permanent = FALSE;
	description = "Powinieneœ mi pomóc.";
};


func int dia_addon_brandon_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_brandon_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//Powinieneœ mi pomóc.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//To coœ nowego. A niby kto mi ka¿e?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Sam kapitan Greg. Mówi, ¿e powinniœmy zapolowaæ na brzytwiaki w kanionie.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//No, najwy¿szy czas rozprostowaæ koœci.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Im szybciej siê z nimi rozprawimy, tym szybciej bêdziemy mogli wróciæ.
};


instance DIA_ADDON_BRANDON_COMEON(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_comeon_condition;
	information = dia_addon_brandon_comeon_info;
	permanent = TRUE;
	description = "ChodŸ ze mn¹.";
};


func int dia_addon_brandon_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_brandon_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//ChodŸ ze mn¹.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Najpierw pójdziemy kawa³ek w kierunku obozu.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//Idê!
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_BRANDON_GOHOME(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 13;
	condition = dia_addon_brandon_gohome_condition;
	information = dia_addon_brandon_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};


func int dia_addon_brandon_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_brandon_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//W porz¹dku, nie ma sprawy.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Mo¿e kiedyœ spotkamy siê przy kufelku.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BRANDON_TOOFAR(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 14;
	condition = dia_addon_brandon_toofar_condition;
	information = dia_addon_brandon_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_brandon_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Chcesz wybiæ wszystko, co ¿yje na tej wyspie?
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//Wracamy do obozu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//Wracam do obozu.
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

