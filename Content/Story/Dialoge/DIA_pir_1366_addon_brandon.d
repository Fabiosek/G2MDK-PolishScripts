
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
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Patrzcie pa�stwo... Nowy!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//I do tego szczur l�dowy!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//Nie jeste� aby za mi�kki na pirata?
};


instance DIA_ADDON_BRANDON_ANYNEWS(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 99;
	condition = dia_addon_brandon_anynews_condition;
	information = dia_addon_brandon_anynews_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int dia_addon_brandon_anynews_condition()
{
	return TRUE;
};

func void dia_addon_brandon_anynews_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//Jakie� wie�ci?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//Oberwa�em do�� mocno. Mo�esz mi odst�pi� jak�� mikstur� uzdrawiaj�c�?
		}
		else if(c_allcanyonrazordead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//A co potem? Wyko�czymy te bestie?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//Dobre pytanie. Na moje oko w kanionie nie ma ju� ani jednego �ywego brzytwiaka.
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg) && (MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//Nie, ale po powrocie Grega wiele si� zmieni.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//Poczekaj chwil�...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//Nie, nie mog� powiedzie�, by cokolwiek si� tu zmieni�o. Wszystko po staremu!
	};
};


instance DIA_ADDON_BRANDON_WANNALEARN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_wannalearn_condition;
	information = dia_addon_brandon_wannalearn_info;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_addon_brandon_wannalearn_condition()
{
	return TRUE;
};

func void dia_addon_brandon_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Ciebie? Jasna sprawa! Mog� ci pokaza�, jak �wiczy� si�� i gibko�� cia�a.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//Ale z drugiej strony, czemu mia�bym to robi�?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Bo postawi� ci flaszk� rumu?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//Nie�le, ch�opcze! Wiesz, o co chodzi w tym fachu!
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//Tylko nie przyno� mi jakiego� taniego bimbru!
	MIS_BRANDON_BRINGHERING = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_BRANDONTEACH);
	Log_CreateTopic(TOPIC_ADDON_BRANDONBOOZE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRANDONBOOZE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_BRANDONBOOZE,"Musz� kupi� Brandonowi drinka. Dopiero wtedy b�dzie mnie uczy�.");
};


instance DIA_ADDON_BRANDON_HOLEGROG(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_holegrog_condition;
	information = dia_addon_brandon_holegrog_info;
	description = "Zorganizuj� grog.";
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
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//Zorganizuj� grog.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Chcesz mnie otru�?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//Chcesz mnie zabi�?! Czy ty w og�le masz poj�cie, z czego robi si� grog?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Stary Samuel p�dzi dobry trunek! Postaraj si� o niego.
	if(PLAYER_KNOWSSCHNELLERHERING == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//Masz na my�li "Szybkiego �ledzia"?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Tak w�a�nie!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//Kosztowa�e� kiedy� specja�u Samuela?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Nie mia�em okazji.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//A wi�c musisz go spr�bowa�!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//Diablo dobry. Uwielbiam go!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Grog nie zadowala Brandona. Pirat chce Szybkiego �ledzia. Tylko Samuel ma taki trunek.");
};


instance DIA_ADDON_BRANDON_SCHNELLERHERING(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 13;
	condition = dia_addon_brandon_schnellerhering_condition;
	information = dia_addon_brandon_schnellerhering_info;
	description = "Spr�buj tego.";
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
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Spr�buj tego.
	b_giveinvitems(other,self,itfo_addon_schnellerhering,1);
	b_useitem(self,itfo_addon_schnellerhering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Aaach! Smakuje jak p�ynny ogie�!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Da�em Brandonowi te paskudne pomyje. Teraz jest zadowolony i b�dzie mnie uczy�.");
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
	description = "Naucz mnie czego�.";
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
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Naucz mnie czego�.
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
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//Mia�e� przynie�� mi co� dobrego, ch�opcze!
	};
};

func void dia_addon_brandon_teachplayer_back()
{
	if(other.attribute[ATR_STRENGTH] > BRANDON_MERKE_STR)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//Dobrze. Widz�, �e zyska�e� troch� krzepy.
	};
	if(other.attribute[ATR_DEXTERITY] > BRANDON_MERKE_DEX)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//Im jeste� zr�czniejszy, tym �atwiej b�dzie ci trafi� cel w walce.
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
	description = "Powiniene� mi pom�c.";
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
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//Powiniene� mi pom�c.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//To co� nowego. A niby kto mi ka�e?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Sam kapitan Greg. M�wi, �e powinni�my zapolowa� na brzytwiaki w kanionie.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//No, najwy�szy czas rozprostowa� ko�ci.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Im szybciej si� z nimi rozprawimy, tym szybciej b�dziemy mogli wr�ci�.
};


instance DIA_ADDON_BRANDON_COMEON(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_comeon_condition;
	information = dia_addon_brandon_comeon_info;
	permanent = TRUE;
	description = "Chod� ze mn�.";
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
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//Chod� ze mn�.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Najpierw p�jdziemy kawa�ek w kierunku obozu.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//Id�!
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
	description = "Nie potrzebuj� ju� twojej pomocy.";
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
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//Nie potrzebuj� ju� twojej pomocy.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//W porz�dku, nie ma sprawy.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Mo�e kiedy� spotkamy si� przy kufelku.
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
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Chcesz wybi� wszystko, co �yje na tej wyspie?
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

