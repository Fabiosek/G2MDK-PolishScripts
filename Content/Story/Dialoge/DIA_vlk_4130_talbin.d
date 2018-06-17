
instance DIA_TALBIN_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_talbin_exit_info()
{
	AI_StopProcessInfos(self);
};


var int talbin_runs;

instance DIA_TALBIN_HALLO(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 5;
	condition = dia_talbin_hallo_condition;
	information = dia_talbin_hallo_info;
	important = TRUE;
};


func int dia_talbin_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_talbin_hallo_info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//Stój! Ani kroku dalej!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Nie ma sprawy!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//Czy¿by? No proszê, kolejna zagubiona owieczka, co? Z pocz¹tku wzi¹³em ciê za jednego z drani poluj¹cych w tym rejonie.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//Widzê jednak, ¿e nie jesteœ jednym z nich. Wygl¹dasz raczej niegroŸnie!
};


instance DIA_TALBIN_WASMACHTIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 6;
	condition = dia_talbin_wasmachtihr_condition;
	information = dia_talbin_wasmachtihr_info;
	description = "Wygl¹dasz na myœliwego, ale chyba nie wiesz, co zrobiæ z wolnym czasem.";
};


func int dia_talbin_wasmachtihr_condition()
{
	if(TALBIN_RUNS == FALSE)
	{
		return TRUE;
	};
};

func void dia_talbin_wasmachtihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//Wygl¹dasz na myœliwego, ale chyba nie wiesz za bardzo, co zrobiæ z wolnym czasem.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ha, Ha! Taa - tu siê z tob¹ zgadzam. Ale có¿ mogê zrobiæ, skoro nie mogê przedostaæ siê przez prze³êcz.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//Czekam wiêc tutaj i staram siê robiæ to, co umiem najlepiej.
	if(Npc_IsDead(engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//Jednak ¿al mi mojego kolegi, Engroma.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//PodejdŸ bli¿ej ognia, ogrzej siê trochê.
	Info_ClearChoices(dia_talbin_wasmachtihr);
	Info_AddChoice(dia_talbin_wasmachtihr,DIALOG_BACK,dia_talbin_wasmachtihr_back);
	Info_AddChoice(dia_talbin_wasmachtihr,"Mimo to wydaje siê, ¿e jakoœ sobie radzisz.",dia_talbin_wasmachtihr_gut);
	Info_AddChoice(dia_talbin_wasmachtihr,"Jesteœ by³ym wiêŸniem zza Bariery?",dia_talbin_wasmachtihr_strf);
};

func void dia_talbin_wasmachtihr_back()
{
	Info_ClearChoices(dia_talbin_wasmachtihr);
};

func void dia_talbin_wasmachtihr_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Jesteœ by³ym wiêŸniem zza Bariery?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//Nie, nie! Sk¹d ten pomys³? Przyby³em tu tylko po to, ¿eby siê szybko wzbogaciæ.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//Ktoœ z tych okolic powiedzia³ mi, ¿e te ziemie to œwietny teren ³owiecki.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//Sporo zwierzyny, jeœli wiesz, co mam na myœli.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//Ostatnio zaœ jedyn¹ rzecz¹, o jak¹ tu naprawdê ³atwo, jest mo¿liwoœæ oberwania od orków, jeœli zapuœcisz siê zbyt daleko.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//A ja jeszcze pozwoli³em siê tym durniom zastraszyæ.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//Znam tych ¿artownisiów.
};

func void dia_talbin_wasmachtihr_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//Mimo to wydaje siê, ¿e jakoœ sobie radzisz.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//Có¿! Nie mogê narzekaæ. Mimo tych zafajdanych orków, tereny na obrze¿ach rzeki nale¿¹ do stosunkowo bezpiecznych.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//Wydaje mi siê, ¿e nie lubi¹ zbli¿aæ siê do wody. Choæ mo¿e to tylko zbieg okolicznoœci.
};


instance DIA_TALBIN_SORRYFORENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 7;
	condition = dia_talbin_sorryforengrom_condition;
	information = dia_talbin_sorryforengrom_info;
	description = "Dlaczego jest ci ¿al Engroma?";
};


func int dia_talbin_sorryforengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_sorryforengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Dlaczego jest ci ¿al Engroma?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Poniewa¿ œlepo za mn¹ pod¹¿a, o nic nawet nie pyta.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//Przez to wpakowaliœmy siê w k³opoty. Chciwoœæ, jak widaæ, nie pop³aca.
};


instance DIA_TALBIN_WASJAGDIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 8;
	condition = dia_talbin_wasjagdihr_condition;
	information = dia_talbin_wasjagdihr_info;
	description = "Na co polujesz nad rzek¹?";
};


func int dia_talbin_wasjagdihr_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_wasjagdihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//Na co polujesz nad rzek¹?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//Co to za pytanie? PrzejdŸ siê tylko brzegiem, a szybko siê domyœlisz. Oczywiœcie na topielce!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Nie³atwo z³apaæ te bestie, ale za to smakuj¹ wyœmienicie.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Od czasu do czasu natykam siê te¿ na œcierwojady, ale nimi te¿ nie pogardzam.
};


instance DIA_TALBIN_ENGROMANGRY(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 9;
	condition = dia_talbin_engromangry_condition;
	information = dia_talbin_engromangry_info;
	description = "Twój kumpel jest chyba nieco zestresowany!";
};


func int dia_talbin_engromangry_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving) && Npc_KnowsInfo(other,dia_talbin_sorryforengrom) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_engromangry_info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//Twój kumpel jest chyba nieco zestresowany!
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Przestañ! Nie prowokuj go wiêcej, bo urwie mi ³eb. W tej chwili nic nie poradzê na to, ¿e musimy tu siedzieæ.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//Kiedyœ sobie za to odbijê!
};


instance DIA_TALBIN_ASKTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 10;
	condition = dia_talbin_askteacher_condition;
	information = dia_talbin_askteacher_info;
	description = "Mo¿esz nauczyæ mnie czegoœ o polowaniu?";
};


func int dia_talbin_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasjagdihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_askteacher_info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//Czy móg³byœ nauczyæ mnie czegoœ o polowaniach?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//Rozumiem! Nagle ci siê spodoba³y. W porz¹dku, ale nie ma nic za darmo.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//Czego ¿¹dasz?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//Nie masz przypadkiem czegoœ do jedzenia, czegoœ innego ni¿ miêso topielca? Powiedzmy, kawa³ek sera. Tak, ser... Odda³bym ¿ycie za kawa³ek sera.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//Zobaczê, co da siê zrobiæ.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Talbin mo¿e mnie nauczyæ, jak sporz¹dzaæ trofea.");
};


instance DIA_TALBIN_PAYTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 11;
	condition = dia_talbin_payteacher_condition;
	information = dia_talbin_payteacher_info;
	permanent = TRUE;
	description = "Oto twój ser. Czy teraz bêdziesz mnie uczy³?";
};


var int dia_talbin_payteacher_noperm;

func int dia_talbin_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_askteacher) && (DIA_TALBIN_PAYTEACHER_NOPERM == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_payteacher_info()
{
	if(b_giveinvitems(other,self,itfo_cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Oto twój ser. Czy teraz bêdziesz mnie uczy³?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//Naprawdê uda³o ci siê go zdobyæ? Od wieków nie jad³em czegoœ tak wspania³ego. Dziêkujê. Er, a co powiesz na... o tak. Jasne!
		TALBIN_TEACHANIMALTROPHY = TRUE;
		DIA_TALBIN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//W tej chwili nie mam przy sobie sera.
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//To zbyt piêkne, by mog³o byæ prawdziwe. Daj mi znaæ jak go zdobêdziesz.
	};
};


instance DIA_TALBIN_TEACHHUNTING(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 12;
	condition = dia_talbin_teachhunting_condition;
	information = dia_talbin_teachhunting_info;
	permanent = TRUE;
	description = "Czego mo¿esz mnie nauczyæ?";
};


func int dia_talbin_teachhunting_condition()
{
	if((TALBIN_TEACHANIMALTROPHY == TRUE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_teachhunting_info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//Czego mo¿esz mnie nauczyæ?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//A co chcesz wiedzieæ?
		Info_AddChoice(dia_talbin_teachhunting,DIALOG_BACK,dia_talbin_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Usuñ pazury",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_talbin_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Obedrzyj ze skóry",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_talbin_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Róg cieniostwora",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_talbin_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Usuñ serce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_talbin_teachhunting_heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//Muszê ciê rozczarowaæ. Wiesz ju¿ wszystko, czego móg³bym ciê nauczyæ. Jeszcze raz, dziêki za ser!
	};
};

func void dia_talbin_teachhunting_back()
{
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Odr¹bywanie pazurów jest stosunkowo ³atwe. £apiesz pazur na wysokoœci stawu i przyciskasz mocno do ziemi.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//Potem bierzesz nó¿ i ostro¿ne odcinasz pazur.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//Naj³atwiejszy sposób na oskórowanie topielca to rozci¹æ skórê wzd³u¿ brzucha...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//...potem szarpn¹æ mocno za tylne ³apy, i œci¹gn¹æ skórê w jednym kawa³ku.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Rogi cieniostwora s¹ bardzo twarde, tote¿ u¿ywa siê ich do robienia figurek i narzêdzi.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Bardzo trudne do zdobycia s¹ serca magicznych stworzeñ. Jeœli zechcesz dostaæ jedno z nich, musisz bardzo uwa¿aæ, szczególnie w przypadku golemów.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};


instance DIA_TALBIN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap3_exit_condition;
	information = dia_talbin_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_talbin_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap4_exit_condition;
	information = dia_talbin_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_WASNEUES(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 13;
	condition = dia_talbin_kap4_wasneues_condition;
	information = dia_talbin_kap4_wasneues_info;
	description = "Czy ktoœ têdy przechodzi³?";
};


func int dia_talbin_kap4_wasneues_condition()
{
	if((KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_wasneues_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Czy ktoœ têdy przechodzi³?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Tak. Niedawno widzia³em tutaj grupkê œmiesznych goœci! Paradowali w swoich wyglansowanych zbrojach i udawali bardzo wa¿nych.
};


instance DIA_TALBIN_KAP4_WASWOLLTENDJG(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 14;
	condition = dia_talbin_kap4_waswolltendjg_condition;
	information = dia_talbin_kap4_waswolltendjg_info;
	description = "Czego tu chcieli ci 'œmieszni goœcie'?";
};


func int dia_talbin_kap4_waswolltendjg_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_kap4_wasneues) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_waswolltendjg_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//Czego tu chcieli ci 'œmieszni goœcie'?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//Pytali o zapasy i sprzêt. Cz³owieku, ja sam ledwo ci¹gnê!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//Ci¹gle gadali coœ o zabijaniu smoków. Bogowie jedni wiedz¹, sk¹d przysz³a ta banda, nie wzbudzili jednak mojego zaufania.
	if(KAPITEL == 4)
	{
		b_logentry(TOPIC_DRAGONHUNTER,"Grupa ³owców smoków zatrzyma³a siê obok siedziby myœliwego Talbina.");
	};
};


instance DIA_TALBIN_WOENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_woengrom_condition;
	information = dia_talbin_woengrom_info;
	description = "Jesteœ sam?";
};


func int dia_talbin_woengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (ENGROMISGONE == TRUE) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_woengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Jesteœ sam?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Tak. Mój kompan, Engrom, po prostu wsta³ wczoraj i poszed³ sobie. Powiedzia³, ¿e mia³ wizjê, w której s³ysza³ jakiœ ³agodny g³os.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//Ja tam nic nie s³ysza³em. Pomyœla³em sobie, ¿e pewnie do koñca mu ju¿ odbi³o.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//...chwilê potem ju¿ go nie by³o.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//Jeœli spotkasz gdzieœ Engroma, przypomnij sukinkotowi, ¿e wci¹¿ mi jest winny skórê topielca.
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//Myœla³em, ¿e nie chcia³ odejœæ, bo ba³ siê orków. Czeka³, a¿ znikn¹.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Jak ju¿ mówi³em - ca³kowicie mu odbi³o.
	};
	MIS_TABIN_LOOKFORENGROM = LOG_RUNNING;
};


instance DIA_TALBIN_FOUNDENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 16;
	condition = dia_talbin_foundengrom_condition;
	information = dia_talbin_foundengrom_info;
	description = "Znalaz³em twojego kompana, Engroma.";
};


func int dia_talbin_foundengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_woengrom) && ((NPCOBSESSEDBYDMT_ENGROM == TRUE) || Npc_HasItems(other,itat_talbinslurkerskin)) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_foundengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//Znalaz³em twojego kompana, Engroma.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Tak? Gdzie jest?
	if(Npc_IsDead(engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Nie ¿yje.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//Ju¿ wiêcej go chyba nie ujrzysz.
	};
	if(b_giveinvitems(other,self,itat_talbinslurkerskin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Proszê, znalaz³em przy nim skórê topielca.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//Poszukiwacze go opêtali.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//Poszukiwacze, a któ¿ to taki?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//To s³udzy Z³a. Prawdziwi przywódcy orków.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//Na Innosa, muszê siê st¹d wydostaæ, nawet nara¿aj¹c ¿ycie. Teraz albo nigdy!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_TALBIN_RUNS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALBIN_RUNS,LOG_RUNNING);
	b_logentry(TOPIC_TALBIN_RUNS,"Talbin, myœliwy z Górniczej Doliny, pobieg³ w stronê prze³êczy, jakby œciga³y go ca³e chmary krwiopijców. S¹dzê, ¿e skieruje siê do Khorinis.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(snapper,"START");
	TALBIN_RUNS = TRUE;
};


instance DIA_TALBIN_WOHIN(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 17;
	condition = dia_talbin_wohin_condition;
	information = dia_talbin_wohin_info;
	permanent = TRUE;
	description = "Dok¹d siê udasz?";
};


func int dia_talbin_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_foundengrom) && (TALBIN_FOLLOWSTHROUGHPASS == 0))
	{
		return TRUE;
	};
};

func void dia_talbin_wohin_info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Dok¹d pójdziesz?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Zabierz mnie za prze³êcz, proszê.
		Info_ClearChoices(dia_talbin_wohin);
		Info_AddChoice(dia_talbin_wohin,"Nie mam dla ciebie czasu.",dia_talbin_wohin_);
		Info_AddChoice(dia_talbin_wohin,"IdŸ po prostu przed siebie.",dia_talbin_wohin_durch);
		Info_AddChoice(dia_talbin_wohin,"W porz¹dku.",dia_talbin_wohin_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//Muszê siê st¹d wynosiæ, dotrzeæ za prze³êcz. Z drogi!
		AI_StopProcessInfos(self);
	};
};

func void dia_talbin_wohin_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//W porz¹dku.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//Dziêkujê. Po prostu pójdê za tob¹.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	TALBIN_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void dia_talbin_wohin_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//IdŸ po prostu przed siebie.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//Tak ciemno... Nie wejdê tam za ¿adne skarby.
};

func void dia_talbin_wohin_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//Nie mam dla ciebie czasu.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Chcesz mnie tu zostawiæ, bym zgni³. Sp³oniesz za to w piekle!
	TALBIN_FOLLOWSTHROUGHPASS = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_VERSCHWINDE(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_verschwinde_condition;
	information = dia_talbin_verschwinde_info;
	permanent = TRUE;
	description = "Hej!";
};


func int dia_talbin_verschwinde_condition()
{
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_talbin_verschwinde_info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Hej!
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Won. Poradzê sobie bez ciebie, szumowino.
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap5_exit_condition;
	information = dia_talbin_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_talbin_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap6_exit_condition;
	information = dia_talbin_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_talbin_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_PICKPOCKET(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 900;
	condition = dia_talbin_pickpocket_condition;
	information = dia_talbin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_talbin_pickpocket_condition()
{
	return c_beklauen(40,25);
};

func void dia_talbin_pickpocket_info()
{
	Info_ClearChoices(dia_talbin_pickpocket);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_BACK,dia_talbin_pickpocket_back);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_PICKPOCKET,dia_talbin_pickpocket_doit);
};

func void dia_talbin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_talbin_pickpocket);
};

func void dia_talbin_pickpocket_back()
{
	Info_ClearChoices(dia_talbin_pickpocket);
};

