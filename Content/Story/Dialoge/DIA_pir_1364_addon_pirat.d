
instance DIA_ADDON_ROASTPIRATE_EXIT(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 999;
	condition = dia_addon_roastpirate_exit_condition;
	information = dia_addon_roastpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_roastpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_roastpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


var int pir_1364_grog;

instance DIA_ADDON_ROASTPIRATE_GIMMEGROG(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 1;
	condition = dia_addon_roastpirate_gimmegrog_condition;
	information = dia_addon_roastpirate_gimmegrog_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_roastpirate_gimmegrog_condition()
{
	if((Npc_IsInState(self,zs_talk) == TRUE) && (Npc_WasInState(self,zs_roast_scavenger) == TRUE) && (PIR_1364_GROG == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_gimmegrog_info()
{
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_00");	//Ech, w gardle mi zasch�o od tego �aru.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_01");	//Ej, ty! Masz dla mnie troch� grogu?
	Log_CreateTopic(TOPIC_ADDON_ROASTGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ROASTGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ROASTGROG,"Pirat przy ognisku pilnie potrzebuje grogu.");
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	Info_AddChoice(dia_addon_roastpirate_gimmegrog,"Nie, nie mam.",dia_addon_roastpirate_gimmegrog_donthaveany);
	if(Npc_HasItems(other,itfo_addon_grog) >= 1)
	{
		Info_AddChoice(dia_addon_roastpirate_gimmegrog,"Masz, poci�gnij sobie.",dia_addon_roastpirate_gimmegrog_hereisgrog);
	};
};

func void dia_addon_roastpirate_gimmegrog_donthaveany()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//Nie, nie mam.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00");	//Diabli nadali! Umr� tu z pragnienia.
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	AI_StopProcessInfos(self);
};

func void dia_addon_roastpirate_gimmegrog_hereisgrog()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00");	//Masz, poci�gnij sobie.
	b_giveinvitems(other,self,itfo_addon_grog,1);
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01");	//Dzi�ki, ch�opie.
	b_useitem(self,itfo_addon_grog);
	PIR_1364_GROG = TRUE;
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	b_logentry(TOPIC_ADDON_ROASTGROG,"Grog uratowa� go chyba przed �mierci� z pragnienia.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_ROASTPIRATE_SEICHTESWASSER(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 2;
	condition = dia_addon_roastpirate_seichteswasser_condition;
	information = dia_addon_roastpirate_seichteswasser_info;
	description = "Jak leci?";
};


func int dia_addon_roastpirate_seichteswasser_condition()
{
	return TRUE;
};

func void dia_addon_roastpirate_seichteswasser_info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_SeichtesWasser_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_01");	//Musz� us�ugiwa� tej �ar�ocznej za�odze.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_02");	//Dlatego stoj� dzie� i noc przy ro�nie, piek�c wilki.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_03");	//Wola�bym rzuci� to w diab�y i po�azi� troch� po pla�y w poszukiwaniu czego�, co morze wyrzuci�o na brzeg.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_04");	//Tydzie� temu na rafach rozbi� si� statek kupiecki.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_05");	//I ca�y jego �adunek fale wyrzuci�y na brzeg.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_06");	//Mam nadziej�, �e nied�ugo b�d� m�g� si� st�d ruszy�.
};


instance DIA_ADDON_ROASTPIRATE_FRANCIS(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 3;
	condition = dia_addon_roastpirate_francis_condition;
	information = dia_addon_roastpirate_francis_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� o Francisie?";
};


func int dia_addon_roastpirate_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_roastpirate_francis_info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_FRANCIS_15_00");	//Co mo�esz mi powiedzie� o Francisie?
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_01");	//Francis? Rz�dzi si�, jakby by� tu kapitanem. Na szcz�cie to si� sko�czy, gdy tylko Greg wr�ci.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_02");	//Wtedy schowa si� jak krab pustelnik do skorupy.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_04");	//Wydaje mi si�, �e on nas nie�le kantuje. Cz�� naszej forsy l�duje u niego w kieszeni.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_05");	//Jakby co�, to ja tego nie powiedzia�em. I dop�ki nie znajdzie si� jaki� dow�d, lepiej zatrzymaj t� wiadomo�� dla siebie, jasne?
};


instance DIA_ADDON_ROASTPIRATE_PERM(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 99;
	condition = dia_addon_roastpirate_perm_condition;
	information = dia_addon_roastpirate_perm_info;
	permanent = TRUE;
	description = "A w przeciwnym razie?";
};


func int dia_addon_roastpirate_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_roastpirate_seichteswasser))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_perm_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Matt_Job_15_00");	//A w przeciwnym razie?
	randy = Hlp_Random(3);
	if(GREGISBACK == TRUE)
	{
		if((randy == 0) && !Npc_IsDead(francis))
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_02");	//Na miejscu Grega pos�a�bym Francisa na bagna.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_03");	//Kiedy Greg do nas wr�ci�, przesta�em si� obawia� napadu bandyt�w.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_01");	//Jasne, przy kapitanie nie b�dzie mo�na si� miga� od roboty, ale przynajmniej dostaniemy za ni� konkretne pieni�dze.
		};
	}
	else if((randy == 0) && !Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_06");	//Francis du�o gada i niczego nie robi. Od czasu, gdy zosta� tu szefem, wszystko si� sypie.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_05");	//Niech bandyci nas zaatakuj�. Czeka ich przykra niespodzianka.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_04");	//Miejmy nadziej�, �e Greg szybko wr�ci. Nie mog� si� doczeka� ponownego wyj�cia w morze.
	};
};


instance DIA_ADDON_ROASTPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 11;
	condition = dia_addon_roastpirate_anheuern_condition;
	information = dia_addon_roastpirate_anheuern_info;
	permanent = FALSE;
	description = "Powiniene� mi pom�c.";
};


func int dia_addon_roastpirate_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_01");	//Powiniene� mi pom�c.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//To rozkaz Grega.
	b_say(self,other,"$ABS_GOOD");
};


instance DIA_ADDON_ROASTPIRATE_COMEON(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 12;
	condition = dia_addon_roastpirate_comeon_condition;
	information = dia_addon_roastpirate_comeon_info;
	permanent = TRUE;
	description = "Chod� ze mn�.";
};


func int dia_addon_roastpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_roastpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_ComeOn_15_00");	//Chod� ze mn�.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_ROASTPIRATE_GOHOME(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 13;
	condition = dia_addon_roastpirate_gohome_condition;
	information = dia_addon_roastpirate_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebuj� ju� twojej pomocy.";
};


func int dia_addon_roastpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_GoHome_15_00");	//Nie potrzebuj� ju� twojej pomocy.
	b_say(self,other,"$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_ROASTPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 14;
	condition = dia_addon_roastpirate_toofar_condition;
	information = dia_addon_roastpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_roastpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_toofar_info()
{
	b_say(self,other,"$RUNAWAY");
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

