
instance DIA_KEROLOTH_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_exit_condition;
	information = dia_keroloth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 2;
	condition = dia_keroloth_hello_condition;
	information = dia_keroloth_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_keroloth_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_keroloth_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_HELLO_15_00");	//Szkolisz ludzi?
	AI_Output(self,other,"DIA_Keroloth_HELLO_07_01");	//Tak. Jeœli bêdziemy musieli odeprzeæ atak orków lub nawet gorzej, smoków, to przyda siê ka¿da pomoc.
};


instance DIA_KEROLOTH_WANTTEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 3;
	condition = dia_keroloth_wantteach_condition;
	information = dia_keroloth_wantteach_info;
	permanent = FALSE;
	description = "Mo¿esz mnie te¿ czegoœ nauczyæ?";
};


func int dia_keroloth_wantteach_condition()
{
	if(KEROLOTHS_BEUTELLEER == FALSE)
	{
		return TRUE;
	};
};

func void dia_keroloth_wantteach_info()
{
	AI_Output(other,self,"DIA_Keroloth_WantTeach_15_00");	//Mo¿esz mnie te¿ czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_01");	//Pewnie. Wyszkolê ka¿dego dobrego cz³owieka.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_02");	//Jeœli chcesz tu przetrwaæ, to poza talentem bêdziesz potrzebowa³ dobrej broni.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_03");	//Zapytaj rycerza Tandora. On siê tob¹ zajmie.
	KEROLOTH_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Keroloth udziela na zamku lekcji walki mieczem.");
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Tandor handluje na zamku broni¹.");
};


instance DIA_KEROLOTH_TEACHER(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 6;
	condition = dia_keroloth_teacher_condition;
	information = dia_keroloth_teacher_info;
	permanent = TRUE;
	description = "(Nauka walki broni¹ jednorêczn¹)";
};


func int dia_keroloth_teacher_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_teacher_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chcê siê szkoliæ!
	Info_ClearChoices(dia_keroloth_teacher);
	Info_AddChoice(dia_keroloth_teacher,DIALOG_BACK,dia_keroloth_teacher_back);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_keroloth_teacher_1h_1);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_keroloth_teacher_1h_5);
};

func void dia_keroloth_teacher_back()
{
	Info_ClearChoices(dia_keroloth_teacher);
};

func void b_keroloth_teachnomore1()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//Jesteœ bardzo dobry. Niczego ju¿ ciê nie mogê nauczyæ.
};

func void b_keroloth_teachnomore2()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//Teraz mo¿e ci pomóc tylko wyszkolony mistrz miecza.
};

func void dia_keroloth_teacher_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_keroloth_teacher_1h_1);
};

func void dia_keroloth_teacher_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_keroloth_teacher_1h_5);
};


instance DIA_KEROLOTH_TEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 100;
	condition = dia_keroloth_teach_condition;
	information = dia_keroloth_teach_info;
	permanent = TRUE;
	description = "(Nauka walki broni¹ dwurêczn¹)";
};


var int dia_keroloth_teach_permanent;

func int dia_keroloth_teach_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE) && (DIA_KEROLOTH_TEACH_PERMANENT == FALSE) && (other.hitchance[NPC_TALENT_2H] < 60))
	{
		return TRUE;
	};
};

func void dia_keroloth_teach_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teach_15_00");	//Zaczynajmy.
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 60)
	{
		b_keroloth_teachnomore1();
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_keroloth_teach);
};

func void dia_keroloth_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_keroloth_teach_2h_5);
};


instance DIA_KEROLOTH_UDAR(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 4;
	condition = dia_keroloth_udar_condition;
	information = dia_keroloth_udar_info;
	permanent = FALSE;
	description = "A co z walk¹ na dystans?";
};


func int dia_keroloth_udar_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_udar_info()
{
	AI_Output(other,self,"DIA_Keroloth_Udar_15_00");	//A co z walk¹ na dystans?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_01");	//O co chodzi?
	AI_Output(other,self,"DIA_Keroloth_Udar_15_02");	//Czy tego te¿ mo¿esz mnie nauczyæ?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_03");	//Nie, ale mo¿esz zapytaæ Udara, to dobry - nie, to NAJLEPSZY kusznik, jakiego znam.
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"Udar, mieszkaniec zamku w Górniczej Dolinie, wie wszystko na temat pos³ugiwania siê kusz¹.");
};


instance DIA_KEROLOTH_KAP3_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap3_exit_condition;
	information = dia_keroloth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap4_exit_condition;
	information = dia_keroloth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 40;
	condition = dia_keroloth_kap4_hello_condition;
	information = dia_keroloth_kap4_hello_info;
	description = "Masz strasznie zmartwion¹ minê.";
};


func int dia_keroloth_kap4_hello_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_15_00");	//Masz strasznie zmartwion¹ minê.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_01");	//Niech to diabli. Mówiê ci, ¿e musisz byæ czujny jak jastrz¹b.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_02");	//Wystarczy, ¿e odwrócisz siê na moment i wszystkie twoje rzeczy znikaj¹. Przeklête bydlaki!
	Info_AddChoice(dia_keroloth_kap4_hello,DIALOG_BACK,dia_keroloth_kap4_hello_ende);
	Info_AddChoice(dia_keroloth_kap4_hello,"Paladyn nie powinien traciæ panowania nad sob¹.",dia_keroloth_kap4_hello_ruhig);
	Info_AddChoice(dia_keroloth_kap4_hello,"Ktoœ ciê okrad³?",dia_keroloth_kap4_hello_bestohlen);
	Info_AddChoice(dia_keroloth_kap4_hello,"Ale o kim mowa?",dia_keroloth_kap4_hello_pack);
};

func void dia_keroloth_kap4_hello_ende()
{
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_bestohlen()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_15_00");	//Ktoœ ciê okrad³?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_01");	//Nie. Podrzucili mi do kieszeni 20 sztuk z³ota. Oczywiœcie, ¿e coœ ukradli, idioto!
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_02");	//Mówiê, ci, niech tylko dorwê tê œwiniê...
	Info_AddChoice(dia_keroloth_kap4_hello,"A wiêc co straci³eœ?",dia_keroloth_kap4_hello_bestohlen_wasfehlt);
};

func void dia_keroloth_kap4_hello_bestohlen_wasfehlt()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00");	//A wiêc co straci³eœ?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01");	//Moj¹ sakiewkê ze wszystkimi oszczêdnoœciami.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02");	//A teraz jej nie ma!
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03");	//Znajdzie siê gdzieœ.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//Niech no tylko go dorwê...
	Log_CreateTopic(TOPIC_KEROLOTHSGELDBEUTEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KEROLOTHSGELDBEUTEL,LOG_RUNNING);
	b_logentry(TOPIC_KEROLOTHSGELDBEUTEL,"Paladyn Keroloth straci³ swoj¹ sakiewkê. Twierdzi, ¿e ukradli mu j¹ ³owcy smoków.");
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_pack()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_pack_15_00");	//Ale o kim mowa?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_01");	//O was, obdartych ³owcach smoków, oczywiœcie. A o kim innym?
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_02");	//O tych obdartych ³owcach smoków, oczywiœcie. A myœla³eœ, ¿e o kim mówiê?
	};
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_03");	//Musisz uwa¿aæ, mówiê ci.
};

func void dia_keroloth_kap4_hello_ruhig()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_ruhig_15_00");	//Uspokój siê! Paladyn nie powinien traciæ panowania nad sob¹.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//Nie chcê siê uspokoiæ. To by³o wszystko co mia³em, niech to cholera!
};


instance DIA_KEROLOTH_KAP4_GELDGEFUNDEN(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 42;
	condition = dia_keroloth_kap4_geldgefunden_condition;
	information = dia_keroloth_kap4_geldgefunden_info;
	description = "Chyba znalaz³em twoj¹ sakiewkê.";
};


func int dia_keroloth_kap4_geldgefunden_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_hello) && (Npc_HasItems(other,itmi_kerolothsgeldbeutel_mis) || Npc_HasItems(other,itmi_kerolothsgeldbeutelleer_mis)))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_geldgefunden_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00");	//Chyba znalaz³em twoj¹ sakiewkê.
	TOPIC_END_KEROLOTHSGELDBEUTEL = TRUE;
	b_giveplayerxp(XP_KEROLOTHSGELDBEUTEL);
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutelleer_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01");	//Sakiewka jest pusta. Co za œwinia to zrobi³a?
		KEROLOTHS_BEUTELLEER = TRUE;
	};
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutel_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02");	//Co? Gdzie? Co za bydlak to zrobi³?
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Chwileczkê. A co z nagrod¹?",dia_keroloth_kap4_geldgefunden_lohn);
	};
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Le¿a³a tam, obok kuŸni.",dia_keroloth_kap4_geldgefunden_schmiede);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Podejrzewam jednego z ³owców smoków.",dia_keroloth_kap4_geldgefunden_djg);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Sk¹d mam wiedzieæ?",dia_keroloth_kap4_geldgefunden_keineahnung);
};

func void dia_keroloth_kap4_geldgefunden_keineahnung()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00");	//Sk¹d mam wiedzieæ?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01");	//¯arty sobie ze mnie stroisz? To by³eœ ty, przyznaj siê.
		Info_ClearChoices(dia_keroloth_kap4_geldgefunden);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Podejrzewam jednego z ³owców smoków.",dia_keroloth_kap4_geldgefunden_djg);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"Poca³uj mnie w dupê.",dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02");	//Dowiem siê prawdy ju¿ niebawem.
		AI_StopProcessInfos(self);
	};
};

func void dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_kannstmich_15_00");	//Poca³uj mnie w dupê.
	AI_Output(self,other,"DIA_Keroloth_KAP4_kannstmich_07_01");	//Oduczê ciê okradaæ przyzwoitych ludzi.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_keroloth_kap4_geldgefunden_djg()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00");	//Podejrzewam jednego z ³owców smoków.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01");	//Wiedzia³em.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02");	//Nigdy nie powinni byli wpuszczaæ takiego œmiecia do zamku.
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03");	//Tylko poczekaj, ju¿ ja dam tym œwiniom.
	};
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	if((Npc_IsDead(ferros) == FALSE) && (Npc_GetDistToNpc(self,ferros) <= 2000))
	{
		b_attack(self,ferros,AR_NONE,1);
	}
	else if((Npc_IsDead(jan) == FALSE) && (Npc_GetDistToNpc(self,jan) <= 2000))
	{
		b_attack(self,jan,AR_NONE,1);
	}
	else if((Npc_IsDead(rethon) == FALSE) && (Npc_GetDistToNpc(self,rethon) <= 2000))
	{
		b_attack(self,rethon,AR_NONE,1);
	};
};

func void dia_keroloth_kap4_geldgefunden_schmiede()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00");	//Ehm. Le¿a³a tam, obok kuŸni.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01");	//Gdzie? Ko³o kuŸni? Musia³a tam wypaœæ z kieszeni ³owcy smoków. Nie mów, ¿e by³o inaczej.
};

func void dia_keroloth_kap4_geldgefunden_lohn()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00");	//Chwileczkê. A co z nagrod¹?
	if(KEROLOTHS_BEUTELLEER == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01");	//To twoja ostatnia deska ratunku. Ju¿ dawno nie dosta³eœ po zêbach, co?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02");	//Argh. Dobra. Masz tu parê monet. A teraz gadaj, kto to zrobi³?
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_BELOHNUNG(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 43;
	condition = dia_keroloth_kap4_belohnung_condition;
	information = dia_keroloth_kap4_belohnung_info;
	permanent = TRUE;
	description = "Chcê moje znaleŸne za sakiewkê.";
};


func int dia_keroloth_kap4_belohnung_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KEROLOTH_HASPAYED == FALSE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_belohnung_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_BELOHNUNG_15_00");	//Chcê moje znaleŸne za sakiewkê.
	if((KEROLOTHS_BEUTELLEER == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_01");	//Mo¿esz dostaæ w szczêkê!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_02");	//To twoje najwiêksze zmartwienie? Masz tu parê monet i spadaj.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_ENTSPANNDICH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 44;
	condition = dia_keroloth_kap4_entspanndich_condition;
	information = dia_keroloth_kap4_entspanndich_info;
	permanent = TRUE;
	description = "Spokojnie.";
};


func int dia_keroloth_kap4_entspanndich_condition()
{
	if((Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KAPITEL >= 4)) || (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_entspanndich_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_00");	//Spokojnie.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_01");	//Tak Mistrzu. Postaram siê.
	}
	else if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_02");	//Nie mogê tego udowodniæ, ale uwa¿am, ¿e ty jesteœ zdrajc¹, który otworzy³ wrota.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_03");	//Teraz za to zap³acisz.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_04");	//Odzyska³eœ przecie¿ swoj¹ sakiewkê, prawda?
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_05");	//Nie prowokuj mnie, ch³opcze! Zmiataj st¹d!
		AI_StopProcessInfos(self);
	};
};


instance DIA_KEROLOTH_KAP5_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap5_exit_condition;
	information = dia_keroloth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP6_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap6_exit_condition;
	information = dia_keroloth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_PICKPOCKET(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 900;
	condition = dia_keroloth_pickpocket_condition;
	information = dia_keroloth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_keroloth_pickpocket_condition()
{
	return c_beklauen(25,45);
};

func void dia_keroloth_pickpocket_info()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_BACK,dia_keroloth_pickpocket_back);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_PICKPOCKET,dia_keroloth_pickpocket_doit);
};

func void dia_keroloth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_keroloth_pickpocket);
};

func void dia_keroloth_pickpocket_back()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
};

