
instance DIA_ADDON_FRANCIS_EXIT(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 999;
	condition = dia_addon_francis_exit_condition;
	information = dia_addon_francis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_francis_exit_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_francis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCIS_FIRST(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 1;
	condition = dia_addon_francis_first_condition;
	information = dia_addon_francis_first_info;
	permanent = FALSE;
	description = "To twoja chata?";
};


func int dia_addon_francis_first_condition()
{
	if((KNOWS_GREGSHUT == FALSE) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_first_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//To twoja chata?
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//Nie, nale¿y do Grega.
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_FRANCIS_LETMEIN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 2;
	condition = dia_addon_francis_letmein_condition;
	information = dia_addon_francis_letmein_info;
	permanent = FALSE;
	description = "Muszê siê dostaæ do chaty Grega.";
};


func int dia_addon_francis_letmein_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_francis_first) || (KNOWS_GREGSHUT == TRUE)) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_letmein_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//Muszê siê dostaæ do chaty Grega.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//Nie ma mowy!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//Grega nie ma, a ja zamkn¹³em drzwi, ¿eby nikt nie wpad³ na pomys³ zabrania sobie czegoœ.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//Wiêc lepiej sp³ywaj, albo porachujê ci koœci.
};


instance DIA_ADDON_FRANCIS_ABOUTGREG(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 3;
	condition = dia_addon_francis_aboutgreg_condition;
	information = dia_addon_francis_aboutgreg_info;
	permanent = FALSE;
	description = "Greg jest waszym szefem?";
};


func int dia_addon_francis_aboutgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && (FRANCIS_AUSGESCHISSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aboutgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//Greg jest waszym szefem?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//Te¿ mi coœ!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//Ka¿dy ¿eglarz i ka¿dy szczur l¹dowy na tej wyspie s³ysza³ o straszliwym kapitanie Gregu!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//I w³aœnie on powierzy³ mi komendê nad reszt¹ ludzi!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//Mam zadbaæ, ¿eby ca³a ta banda nie rozpuœci³a siê do reszty pod jego nieobecnoœæ.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//Niektórzy myœl¹, ¿e mog¹ robiæ, co im siê ¿ywnie podoba, tylko dlatego ¿e kapitana Grega nie ma w pobli¿u.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//Ale siê zdziwi¹, kiedy Greg wróci.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//Opowiem mu wszystko, s³yszysz?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//Tak¿e to, ¿e ktoœ próbowa³ myszkowaæ w jego chacie!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//Odsuñ siê wiêc, albo popadniesz w nieliche k³opoty.
};


var int francis_bezahlt;

instance DIA_ADDON_FRANCIS_KEY(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 4;
	condition = dia_addon_francis_key_condition;
	information = dia_addon_francis_key_info;
	permanent = TRUE;
	description = "Daj mi klucz do chaty Grega!";
};


func int dia_addon_francis_key_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_key_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//Daj mi klucz do chaty Grega!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//Chyba ¿artujesz!
	Info_ClearChoices(dia_addon_francis_key);
	Info_AddChoice(dia_addon_francis_key,"Bêdê musia³ o tym pomyœleæ...",dia_addon_francis_key_back);
	Info_AddChoice(dia_addon_francis_key,"Co powiesz na 2000 sztuk z³ota?",dia_addon_francis_key_2000gold);
	Info_AddChoice(dia_addon_francis_key,"Dam ci za to 1000 sztuk z³ota!",dia_addon_francis_key_1000gold);
};

func void dia_addon_francis_key_back()
{
	Info_ClearChoices(dia_addon_francis_key);
};

func void dia_addon_francis_key_1000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//Dam ci za to 1000 sztuk z³ota!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//To trochê ma³o, zwa¿ywszy, ¿e nak³aniasz mnie do zdrady mego kapitana!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//Lepiej uwa¿aj, co mówisz, albo bêdê musia³ przetrzepaæ ci skórê!
};

func void dia_addon_francis_key_2000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//Co powiesz na 2000 sztuk z³ota?
	if(Npc_HasItems(other,itmi_gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//Ch³opcze, czy¿byœ chcia³ mnie nak³oniæ do zdrady?
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//Chocia¿ z drugiej strony...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//Czego siê boisz? Przecie¿ nikt siê nie dowie.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Dobra, oto klucz.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//Tylko pospiesz siê, bo Greg mo¿e przyjœæ w ka¿dej chwili. I ani s³owa innym, jasne?
		b_giveinvitems(other,self,itmi_gold,2000);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		FRANCIS_BEZAHLT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//Nie masz przy sobie takiej sumy!
	};
	Info_ClearChoices(dia_addon_francis_key);
};


instance DIA_ADDON_FRANCIS_AUFSMAUL(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_aufsmaul_condition;
	information = dia_addon_francis_aufsmaul_info;
	permanent = TRUE;
	description = "No to zobaczymy, co potrafisz. Stawaj!";
};


func int dia_addon_francis_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//No to zobaczymy, co potrafisz. Stawaj!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//Co? Jestem tu kapitanem!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//Nauczê ciê szacunku, ty szczurze l¹dowy!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_FRANCIS_BUCH(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_buch_condition;
	information = dia_addon_francis_buch_info;
	permanent = TRUE;
	description = "Znalaz³em twoj¹ kryjówkê i skarb. To twój dziennik, prawda?";
};


func int dia_addon_francis_buch_condition()
{
	if(Npc_HasItems(other,itwr_addon_francisabrechnung_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_buch_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//Znalaz³em twoj¹ kryjówkê i skarb. To twój dziennik, prawda?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//Eeee... Nigdy wczeœniej go nie widzia³em...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//Hmm... Jeœli to nawet by³by mój dziennik...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//To chyba nie s¹dzisz, ¿e moi ch³opcy uwierz¹ ci tylko dlatego, ¿e masz przy sobie jakieœ po¿ó³k³e notatki?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//Wykiwa³eœ ich przy podziale ³upu.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Ej... Poczekaj...
	if(Npc_HasItems(self,itke_greg_addon_mis))
	{
		if(Npc_KnowsInfo(other,dia_addon_francis_letmein))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//Nie chcia³eœ przypadkiem klucza do chaty Grega?
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//Dam ci klucz do chaty kapitana!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//Tam jest naprawdê du¿o cennych przedmiotów...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//Ale teraz dawaj notatnik i trzymaj gêbê na k³ódkê. Umowa stoi?
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//Tylko nie zrób czegoœ g³upiego!
		if((FRANCIS_BEZAHLT == TRUE) && (Npc_HasItems(self,itmi_gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//Oto twoje 2000 sztuk z³ota!
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//I jeszcze 500, ¿ebyœ nie mówi³, ¿e na sk¹pca trafi³eœ.
			b_giveinvitems(self,other,itmi_gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//Oto 500 sztuk z³ota!
			b_giveinvitems(self,other,itmi_gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//A teraz dawaj ten cholerny...
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_FRANCIS_PICKPOCKET(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_pickpocket_condition;
	information = dia_francis_pickpocket_info;
	permanent = TRUE;
	description = "(£atwo by³oby ukraœæ ten klucz)";
};


func int dia_francis_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_greg_addon_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_francis_pickpocket_info()
{
	Info_ClearChoices(dia_francis_pickpocket);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_BACK,dia_francis_pickpocket_back);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_PICKPOCKET,dia_francis_pickpocket_doit);
};

func void dia_francis_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_francis_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
	Info_ClearChoices(dia_francis_pickpocket);
};

func void dia_francis_pickpocket_back()
{
	Info_ClearChoices(dia_francis_pickpocket);
};


instance DIA_FRANCIS_AUSGESCHISSEN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_ausgeschissen_condition;
	information = dia_francis_ausgeschissen_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_francis_ausgeschissen_condition()
{
	if((FRANCIS_AUSGESCHISSEN == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_francis_ausgeschissen_info()
{
	if(!Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//Przez ciebie Greg kaza³ mi pi³owaæ deski, a¿ nie wykorzystam do tego wszystkich drzew na ca³ej wyspie.
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//IdŸ sobie!
	AI_StopProcessInfos(self);
};

