
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
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Chcesz pi� czy gada�? Czego potrzebujesz?
};


instance DIA_ADDON_SNAF_COOK(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 2;
	condition = dia_addon_snaf_cook_condition;
	information = dia_addon_snaf_cook_info;
	permanent = FALSE;
	description = "Masz co� dobrego do jedzenia?";
};


func int dia_addon_snaf_cook_condition()
{
	return TRUE;
};

func void dia_addon_snaf_cook_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//Masz co� dobrego do jedzenia?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//Chc� sprawdzi� nowy przepis � Ognisty gulasz w mocnym sosie.
	Info_ClearChoices(dia_addon_snaf_cook);
	Info_AddChoice(dia_addon_snaf_cook,"Ognisty gulasz?",dia_addon_snaf_cook_feuer);
	Info_AddChoice(dia_addon_snaf_cook,"Mocny sos?",dia_addon_snaf_cook_hammer);
};

func void dia_addon_snaf_cook_feuer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Ognisty gulasz?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//Chrupi�ce, delikatne, pieczone mi�so w otoczce z ognistej kapusty.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//Spokojnie � mam ju� przygotowane sk�adniki.
};

func void dia_addon_snaf_cook_hammer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Mocny sos?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//Sos z bardzo mocnego bimbru. Dosta�em ten przepis od niejakiego Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//Zdob�d� sk�adniki i przygotuj bimber w laboratorium, a ja zrobi� sos. Co ty na to?
	Info_AddChoice(dia_addon_snaf_cook,"Nie mam na to czasu.",dia_addon_snaf_cook_no);
	Info_AddChoice(dia_addon_snaf_cook,"Dobrze, zrobi� to.",dia_addon_snaf_cook_yes);
};

func void dia_addon_snaf_cook_no()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//Nie mam na to czasu.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Dobra, niewa�ne.
	MIS_SNAFHAMMER = LOG_OBSOLETE;
	Info_ClearChoices(dia_addon_snaf_cook);
};

func void dia_addon_snaf_cook_yes()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Dobrze, zrobi� to.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//Super. Oto przepis.
	b_giveinvitems(self,other,itwr_addon_lou_rezept,1);
	MIS_SNAFHAMMER = LOG_RUNNING;
	Info_ClearChoices(dia_addon_snaf_cook);
	Log_CreateTopic(TOPIC_ADDON_HAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HAMMER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HAMMER,"Snaf potrzebuje troch� gorza�ki do swojego sosu. Da� mi przepis na mocn� nalewk�, kt�r� mam przyrz�dzi� przy stole laboratoryjnym. ");
};


var int snaf_tip_kosten;

instance DIA_ADDON_SNAF_BOOZE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 3;
	condition = dia_addon_snaf_booze_condition;
	information = dia_addon_snaf_booze_info;
	permanent = FALSE;
	description = "Przygotowa�em bimber.";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Przygotowa�em bimber.
	b_giveinvitems(other,self,itfo_addon_loushammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Doskonale, zaraz to doko�cz�.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Teraz mo�esz troch� skosztowa�. To doda ci si�.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Poczekaj, je�li b�dziesz potrzebowa� pomocy, wszystkie informacje masz u mnie za darmo.
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
	description = "Co wiesz na temat pr�by zab�jstwa?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//Co wiesz na temat pr�by zab�jstwa?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//Chodzi o ten zamach na Estebana?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//Wiesz, sk�d wieje wiatr. Ober�ysta widzi wszystko, ale nie bierze niczyjej strony...
	Info_ClearChoices(dia_addon_snaf_attentat);
	Info_AddChoice(dia_addon_snaf_attentat,"Powiedz mi chocia�, gdzie mog� zdoby� informacje.",dia_addon_snaf_attentat_gowhere);
	Info_AddChoice(dia_addon_snaf_attentat,"Co by� zrobi� na moim miejscu?",dia_addon_snaf_attentat_youbeingme);
	Info_AddChoice(dia_addon_snaf_attentat,"A wi�c co� wiesz?",dia_addon_snaf_attentat_something);
};

func void dia_addon_snaf_attentat_something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//A wi�c co� wiesz?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//TEGO nie powiedzia�em.
};

func void dia_addon_snaf_attentat_gowhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//Powiedz mi chocia�, gdzie mog� zdoby� informacje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//Na boga! To przecie� jedno i to samo! Zapomnij o tym.
};

func void dia_addon_snaf_attentat_youbeingme()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//Co by� zrobi� na moim miejscu?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//Zastanowi�bym si�, co wiem na temat osoby, kt�ra zleci�a zab�jstwo.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//Po pierwsze � by� to najpewniej jeden z bandyt�w, czyli jest tutaj, w obozie.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Po drugie � skoro jest w obozie, to znaczy, �e ci� obserwuje.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Po trzecie � je�li dojdzie do wniosku, �e stoisz po stronie Estebana, to nigdy si� nie ujawni.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//Pytanie brzmi � jakie masz szanse na znalezienie tego cz�owieka?
	Info_ClearChoices(dia_addon_snaf_attentat);
};


instance DIA_ADDON_SNAF_ABRECHNUNG(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 5;
	condition = dia_addon_snaf_abrechnung_condition;
	information = dia_addon_snaf_abrechnung_info;
	permanent = TRUE;
	description = "No to jakie mam szanse na znalezienie tego cz�owieka?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//No to jakie mam szanse na znalezienie tego cz�owieka?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm...
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && !Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//�le to widz�. Niekt�rzy zauwa�yli, �e kr�cisz si� ko�o Senyana.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//Musisz zrezygnowa� ze swoich kontakt�w. Inaczej nie znajdziesz osoby, kt�ra zleci�a zab�jstwo.
		if(SNAF_TIP_SENYAN == FALSE)
		{
			b_logentry(TOPIC_ADDON_SENYAN,"Powinienem zako�czy� kontakty z Senyanem. Jednak lepiej bezpo�rednio go nie atakowa�. Wcze�niej powinienem z nim jeszcze raz porozmawia�.");
			SNAF_TIP_SENYAN = TRUE;
		};
	}
	else if(Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//Musisz za�atwi� jednego z ludzi Estebana. Cz�owiek, kt�rego szukasz, uwierzy, �e jeste� po jego stronie.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//Ale tak �atwo nie ujawni swojej to�samo�ci. Musisz wymy�li� co� wi�cej.
	}
	else
	{
		if(FINN_PETZT == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Od czasu rozmowy z tob� Finn wygl�da na bardzo podekscytowanego.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//A ka�dy wie, �e trzyma si� blisko Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//To znaczy, �e powiedzia�e� mu co�, czego nie chcia� us�ysze�.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//Cz�owiek, kt�rego szukasz, b�dzie bardzo zadowolony...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//Ale istnieje ryzyko, �e pobiegnie do Estebana � ale sam o tym przecie� wiesz.
		};
		if(FINN_TELLALL == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//Podobno powiedzia�e� Finnowi, �e ch�tnie pracowa�by� dla Estebana.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//Nie wiem, co planujesz, ale cz�owiek, kt�rego szukasz, b�dzie teraz bardzo ostro�ny.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//No wszystko si� mo�e zdarzy�.
		};
	};
	if(SNAF_RECHNUNG == FALSE)
	{
		if(SNAF_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//Dzi�kuj�.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//Hej, nie powiedzia�em ci nic, czego by� wcze�niej nie wiedzia�, jasne?
			SNAF_EINMAL = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//No pewnie..
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//Dok�adnie.
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
	description = "Huno m�wi, �e mam kogo� tu spotka�.";
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
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Przysy�a mnie Huno.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Wygl�da na to, �e znalaz�e� swojego cz�owieka.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Id� na g�r�. Kto� tam na ciebie czeka.
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
	description = "Co ludzie s�dz� o Estebanie?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//Co ludzie s�dz� o Estebanie?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//O kogo ci dok�adnie chodzi?
	if((KOSTEN_EINMAL == FALSE) && (MIS_SNAFHAMMER != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Ka�da informacja kosztuje.
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//Ile?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 sztuk z�ota.
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
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//Nie masz do�� pieni�dzy, ma�y!
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
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//Wydaje mi si�, �e nie przepada za Estebanem. Pracuje dla Huno, wi�c nie schodzi ju� do kopalni.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//Huno lubi Estebana?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//Ha. Huno. W�a�ciwie nic o nim nie wiem.
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//Ta informacja jest za darmo.
};

func void dia_addon_snaf_people_fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//Co mo�esz mi powiedzie� o Fisku?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk to Fisk. P�aci haracz Estebanowi i oddaje mu cz�� towar�w, kt�re dostaje od pirat�w.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//Wydaje mi si� jednak, �e Esteban za bardzo go nie obchodzi.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Co Emilio s�dzi o Estebanie?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//Wydaje mi si�, �e nie zapali�by �wieczki na jego grobie. Rozumiesz, o czym m�wi�?
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
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan jest jednym z ludzi Estebana. Pracuje dla niego ju� od pewnego czasu.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//Co Lennar my�li o Estebanie?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//O ile dobrze wiem, Lennar NIE my�li.
};

func void dia_addon_snaf_people_finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//Co mi powiesz o Finnie?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//Dobry kopacz. Ma zmys� do szukania z�ota.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Z tego powodu Esteban go szanuje. Wydaje mi si�, �e si� nawzajem dobrze dogaduj�.
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
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Kto o nim m�wi, szybko ko�czy martwy...
};


instance DIA_ADDON_SNAF_PERM(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 8;
	condition = dia_addon_snaf_perm_condition;
	information = dia_addon_snaf_perm_info;
	permanent = TRUE;
	description = "Jak id� interesy?";
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
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//Jak id� interesy?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//C�. �mier� Estebana jest dla paru os�b okazj� do �wi�towania...
};

