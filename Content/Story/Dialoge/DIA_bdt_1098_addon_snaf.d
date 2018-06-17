
instance DIA_ADDON_SNAF_EXIT(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 999;
	condition = dia_addon_snaf_exit_condition;
	information = dia_addon_snaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_snaf_exit_condition()
{
	return TRUE;
};

func void dia_addon_snaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SNAF_PICKPOCKET(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 900;
	condition = dia_addon_snaf_pickpocket_condition;
	information = dia_addon_snaf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_snaf_pickpocket_condition()
{
	return c_beklauen(49,56);
};

func void dia_addon_snaf_pickpocket_info()
{
	Info_ClearChoices(dia_addon_snaf_pickpocket);
	Info_AddChoice(dia_addon_snaf_pickpocket,DIALOG_BACK,dia_addon_snaf_pickpocket_back);
	Info_AddChoice(dia_addon_snaf_pickpocket,DIALOG_PICKPOCKET,dia_addon_snaf_pickpocket_doit);
};

func void dia_addon_snaf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_snaf_pickpocket);
};

func void dia_addon_snaf_pickpocket_back()
{
	Info_ClearChoices(dia_addon_snaf_pickpocket);
};


instance DIA_ADDON_SNAF_HI(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 1;
	condition = dia_addon_snaf_hi_condition;
	information = dia_addon_snaf_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_snaf_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Chcesz piÊ czy gadaÊ? Czego potrzebujesz?
};


instance DIA_ADDON_SNAF_COOK(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 2;
	condition = dia_addon_snaf_cook_condition;
	information = dia_addon_snaf_cook_info;
	permanent = FALSE;
	description = "Masz coú dobrego do jedzenia?";
};


func int dia_addon_snaf_cook_condition()
{
	return TRUE;
};

func void dia_addon_snaf_cook_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//Masz coú dobrego do jedzenia?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//ChcÍ sprawdziÊ nowy przepis ñ Ognisty gulasz w mocnym sosie.
	Info_ClearChoices(dia_addon_snaf_cook);
	Info_AddChoice(dia_addon_snaf_cook,"Ognisty gulasz?",dia_addon_snaf_cook_feuer);
	Info_AddChoice(dia_addon_snaf_cook,"Mocny sos?",dia_addon_snaf_cook_hammer);
};

func void dia_addon_snaf_cook_feuer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Ognisty gulasz?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//Chrupiπce, delikatne, pieczone miÍso w otoczce z ognistej kapusty.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Spokojnie ñ mam juø przygotowane sk≥adniki.
};

func void dia_addon_snaf_cook_hammer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Mocny sos?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Sos z bardzo mocnego bimbru. Dosta≥em ten przepis od niejakiego Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Zdobπdü sk≥adniki i przygotuj bimber w laboratorium, a ja zrobiÍ sos. Co ty na to?
	Info_AddChoice(dia_addon_snaf_cook,"Nie mam na to czasu.",dia_addon_snaf_cook_no);
	Info_AddChoice(dia_addon_snaf_cook,"Dobrze, zrobiÍ to.",dia_addon_snaf_cook_yes);
};

func void dia_addon_snaf_cook_no()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Nie mam na to czasu.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Dobra, niewaøne.
	MIS_SNAFHAMMER = LOG_OBSOLETE;
	Info_ClearChoices(dia_addon_snaf_cook);
};

func void dia_addon_snaf_cook_yes()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Dobrze, zrobiÍ to.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Super. Oto przepis.
	b_giveinvitems(self,other,itwr_addon_lou_rezept,1);
	MIS_SNAFHAMMER = LOG_RUNNING;
	Info_ClearChoices(dia_addon_snaf_cook);
	Log_CreateTopic(TOPIC_ADDON_HAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HAMMER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HAMMER,"Snaf potrzebuje trochÍ gorza≥ki do swojego sosu. Da≥ mi przepis na mocnπ nalewkÍ, ktÛrπ mam przyrzπdziÊ przy stole laboratoryjnym. ");
};


var int snaf_tip_kosten;

instance DIA_ADDON_SNAF_BOOZE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 3;
	condition = dia_addon_snaf_booze_condition;
	information = dia_addon_snaf_booze_info;
	permanent = FALSE;
	description = "Przygotowa≥em bimber.";
};


func int dia_addon_snaf_booze_condition()
{
	if((Npc_HasItems(other,itfo_addon_loushammer) >= 1) && (MIS_SNAFHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_booze_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Przygotowa≥em bimber.
	b_giveinvitems(other,self,itfo_addon_loushammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Doskonale, zaraz to dokoÒczÍ.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Teraz moøesz trochÍ skosztowaÊ. To doda ci si≥.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Poczekaj, jeúli bÍdziesz potrzebowaÊ pomocy, wszystkie informacje masz u mnie za darmo.
	SNAF_TIP_KOSTEN = 0;
	b_giveinvitems(self,other,itfo_addon_firestew,1);
	MIS_SNAFHAMMER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LOUSHAMMER);
};


instance DIA_ADDON_SNAF_ATTENTAT(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 4;
	condition = dia_addon_snaf_attentat_condition;
	information = dia_addon_snaf_attentat_info;
	permanent = FALSE;
	description = "Co wiesz na temat prÛby zabÛjstwa?";
};


func int dia_addon_snaf_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_snaf_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Co wiesz na temat prÛby zabÛjstwa?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Chodzi o ten zamach na Estebana?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//Wiesz, skπd wieje wiatr. Oberøysta widzi wszystko, ale nie bierze niczyjej strony...
	Info_ClearChoices(dia_addon_snaf_attentat);
	Info_AddChoice(dia_addon_snaf_attentat,"Powiedz mi chociaø, gdzie mogÍ zdobyÊ informacje.",dia_addon_snaf_attentat_gowhere);
	Info_AddChoice(dia_addon_snaf_attentat,"Co byú zrobi≥ na moim miejscu?",dia_addon_snaf_attentat_youbeingme);
	Info_AddChoice(dia_addon_snaf_attentat,"A wiÍc coú wiesz?",dia_addon_snaf_attentat_something);
};

func void dia_addon_snaf_attentat_something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//A wiÍc coú wiesz?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//TEGO nie powiedzia≥em.
};

func void dia_addon_snaf_attentat_gowhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Powiedz mi chociaø, gdzie mogÍ zdobyÊ informacje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//Na boga! To przecieø jedno i to samo! Zapomnij o tym.
};

func void dia_addon_snaf_attentat_youbeingme()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//Co byú zrobi≥ na moim miejscu?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Zastanowi≥bym siÍ, co wiem na temat osoby, ktÛra zleci≥a zabÛjstwo.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Po pierwsze ñ by≥ to najpewniej jeden z bandytÛw, czyli jest tutaj, w obozie.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Po drugie ñ skoro jest w obozie, to znaczy, øe ciÍ obserwuje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Po trzecie ñ jeúli dojdzie do wniosku, øe stoisz po stronie Estebana, to nigdy siÍ nie ujawni.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Pytanie brzmi ñ jakie masz szanse na znalezienie tego cz≥owieka?
	Info_ClearChoices(dia_addon_snaf_attentat);
};


instance DIA_ADDON_SNAF_ABRECHNUNG(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 5;
	condition = dia_addon_snaf_abrechnung_condition;
	information = dia_addon_snaf_abrechnung_info;
	permanent = TRUE;
	description = "No to jakie mam szanse na znalezienie tego cz≥owieka?";
};


func int dia_addon_snaf_abrechnung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && (MIS_JUDAS == LOG_RUNNING) && (HUNO_ZUSNAF == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_abrechnung_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//No to jakie mam szanse na znalezienie tego cz≥owieka?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm...
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && !Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//èle to widzÍ. NiektÛrzy zauwaøyli, øe krÍcisz siÍ ko≥o Senyana.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//Musisz zrezygnowaÊ ze swoich kontaktÛw. Inaczej nie znajdziesz osoby, ktÛra zleci≥a zabÛjstwo.
		if(SNAF_TIP_SENYAN == FALSE)
		{
			b_logentry(TOPIC_ADDON_SENYAN,"Powinienem zakoÒczyÊ kontakty z Senyanem. Jednak lepiej bezpoúrednio go nie atakowaÊ. Wczeúniej powinienem z nim jeszcze raz porozmawiaÊ.");
			SNAF_TIP_SENYAN = TRUE;
		};
	}
	else if(Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//Musisz za≥atwiÊ jednego z ludzi Estebana. Cz≥owiek, ktÛrego szukasz, uwierzy, øe jesteú po jego stronie.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Ale tak ≥atwo nie ujawni swojej toøsamoúci. Musisz wymyúliÊ coú wiÍcej.
	}
	else
	{
		if(FINN_PETZT == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Od czasu rozmowy z tobπ Finn wyglπda na bardzo podekscytowanego.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//A kaødy wie, øe trzyma siÍ blisko Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//To znaczy, øe powiedzia≥eú mu coú, czego nie chcia≥ us≥yszeÊ.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//Cz≥owiek, ktÛrego szukasz, bÍdzie bardzo zadowolony...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Ale istnieje ryzyko, øe pobiegnie do Estebana ñ ale sam o tym przecieø wiesz.
		};
		if(FINN_TELLALL == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Podobno powiedzia≥eú Finnowi, øe chÍtnie pracowa≥byú dla Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Nie wiem, co planujesz, ale cz≥owiek, ktÛrego szukasz, bÍdzie teraz bardzo ostroøny.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//No wszystko siÍ moøe zdarzyÊ.
		};
	};
	if(SNAF_RECHNUNG == FALSE)
	{
		if(SNAF_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//DziÍkujÍ.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//Hej, nie powiedzia≥em ci nic, czego byú wczeúniej nie wiedzia≥, jasne?
			SNAF_EINMAL = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//No pewnie..
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//Dok≥adnie.
		};
	};
};


instance DIA_ADDON_SNAF_HOCH(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 6;
	condition = dia_addon_snaf_hoch_condition;
	information = dia_addon_snaf_hoch_info;
	permanent = FALSE;
	description = "Huno mÛwi, øe mam kogoú tu spotkaÊ.";
};


func int dia_addon_snaf_hoch_condition()
{
	if(HUNO_ZUSNAF == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_snaf_hoch_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Przysy≥a mnie Huno.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Wyglπda na to, øe znalaz≥eú swojego cz≥owieka.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Idü na gÛrÍ. Ktoú tam na ciebie czeka.
	AI_StopProcessInfos(self);
	AI_Teleport(fisk,"BL_INN_UP_06");
	b_startotherroutine(fisk,"MEETING");
	b_giveplayerxp(XP_ADDON_AUFTRAGGEBER);
};


var int kosten_einmal;

instance DIA_ADDON_SNAF_PEOPLE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 6;
	condition = dia_addon_snaf_people_condition;
	information = dia_addon_snaf_people_info;
	permanent = TRUE;
	description = "Co ludzie sπdzπ o Estebanie?";
};


func int dia_addon_snaf_people_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_people_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Co ludzie sπdzπ o Estebanie?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//O kogo ci dok≥adnie chodzi?
	if((KOSTEN_EINMAL == FALSE) && (MIS_SNAFHAMMER != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Kaøda informacja kosztuje.
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Ile?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 sztuk z≥ota.
		SNAF_TIP_KOSTEN = 10;
		KOSTEN_EINMAL = TRUE;
	};
	Info_ClearChoices(dia_addon_snaf_people);
	Info_AddChoice(dia_addon_snaf_people,DIALOG_BACK,dia_addon_snaf_people_back);
	Info_AddChoice(dia_addon_snaf_people,"Paul.",dia_addon_snaf_people_paul);
	Info_AddChoice(dia_addon_snaf_people,"Huno.",dia_addon_snaf_people_huno);
	Info_AddChoice(dia_addon_snaf_people,"Fisk.",dia_addon_snaf_people_fisk);
	Info_AddChoice(dia_addon_snaf_people,"Emilio.",dia_addon_snaf_people_emilio);
	if(!Npc_IsDead(senyan))
	{
		Info_AddChoice(dia_addon_snaf_people,"Senyan.",dia_addon_snaf_people_senyan);
	};
	Info_AddChoice(dia_addon_snaf_people,"Lennar.",dia_addon_snaf_people_lennar);
	Info_AddChoice(dia_addon_snaf_people,"Finn.",dia_addon_snaf_people_finn);
};

func void b_addon_snaf_notenough()
{
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Nie masz doúÊ pieniÍdzy, ma≥y!
};

func void dia_addon_snaf_people_back()
{
	Info_ClearChoices(dia_addon_snaf_people);
};

func void dia_addon_snaf_people_paul()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Paul_15_00");	//Co wiesz na temat Paula?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Wydaje mi siÍ, øe nie przepada za Estebanem. Pracuje dla Huno, wiÍc nie schodzi juø do kopalni.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Huno lubi Estebana?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//Ha. Huno. W≥aúciwie nic o nim nie wiem.
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//Ta informacja jest za darmo.
};

func void dia_addon_snaf_people_fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//Co moøesz mi powiedzieÊ o Fisku?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk to Fisk. P≥aci haracz Estebanowi i oddaje mu czÍúÊ towarÛw, ktÛre dostaje od piratÛw.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//Wydaje mi siÍ jednak, øe Esteban za bardzo go nie obchodzi.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Co Emilio sπdzi o Estebanie?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Wydaje mi siÍ, øe nie zapali≥by úwieczki na jego grobie. Rozumiesz, o czym mÛwiÍ?
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_senyan()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Senyan_15_00");	//Co powiesz o Senyanie?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan jest jednym z ludzi Estebana. Pracuje dla niego juø od pewnego czasu.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Co Lennar myúli o Estebanie?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//O ile dobrze wiem, Lennar NIE myúli.
};

func void dia_addon_snaf_people_finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//Co mi powiesz o Finnie?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Dobry kopacz. Ma zmys≥ do szukania z≥ota.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Z tego powodu Esteban go szanuje. Wydaje mi siÍ, øe siÍ nawzajem dobrze dogadujπ.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};


instance DIA_ADDON_SNAF_HIMSELF(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 7;
	condition = dia_addon_snaf_himself_condition;
	information = dia_addon_snaf_himself_info;
	permanent = FALSE;
	description = "A jakie jest TWOJE zdanie o Estebanie?";
};


func int dia_addon_snaf_himself_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_himself_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//A jakie jest TWOJE zdanie o Estebanie?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Kto o nim mÛwi, szybko koÒczy martwy...
};


instance DIA_ADDON_SNAF_PERM(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 8;
	condition = dia_addon_snaf_perm_condition;
	information = dia_addon_snaf_perm_info;
	permanent = TRUE;
	description = "Jak idπ interesy?";
};


func int dia_addon_snaf_perm_condition()
{
	if(Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Jak idπ interesy?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//CÛø. åmierÊ Estebana jest dla paru osÛb okazjπ do úwiÍtowania...
};

