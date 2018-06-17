
instance DIA_ADDON_FARIM_EXIT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 999;
	condition = dia_addon_farim_exit_condition;
	information = dia_addon_farim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_farim_exit_condition()
{
	return TRUE;
};

func void dia_addon_farim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FARIM_PICKPOCKET(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 900;
	condition = dia_addon_farim_pickpocket_condition;
	information = dia_addon_farim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_farim_pickpocket_condition()
{
	return c_beklauen(20,11);
};

func void dia_addon_farim_pickpocket_info()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_BACK,dia_addon_farim_pickpocket_back);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_PICKPOCKET,dia_addon_farim_pickpocket_doit);
};

func void dia_addon_farim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_farim_pickpocket);
};

func void dia_addon_farim_pickpocket_back()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
};


instance DIA_ADDON_FARIM_HALLO(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_hallo_condition;
	information = dia_addon_farim_hallo_info;
	description = "Jeste� rybakiem?";
};


func int dia_addon_farim_hallo_condition()
{
	return TRUE;
};

func void dia_addon_farim_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Jeste� rybakiem?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//Jak na to wpad�e�?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Mo�e po prostu zostawisz mnie w spokoju, co?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Nie mam nic do ciebie, ale ostatnio mia�em sporo nieprzyjemnych star� ze stra��, wi�c rozumiesz...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Nie oceniaj mnie zbyt pochopnie. Po prostu jestem w pod�ym nastroju. K�opoty ze stra��, rozumiesz...
	};
};


instance DIA_ADDON_FARIM_MILIZPROBS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_milizprobs_condition;
	information = dia_addon_farim_milizprobs_info;
	description = "K�opoty ze stra��?";
};


func int dia_addon_farim_milizprobs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_milizprobs_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//K�opoty ze stra��?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Ci dranie regularnie mnie nachodz� i zabieraj�, co im si� �ywnie podoba!
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//W ostatnim tygodniu zabrali mi ca�y po��w. Powiedzieli, �e to "dla wsp�lnego dobra"!
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//Wiem, �e jeste�my zdani na w�asne si�y od czasu, gdy farmerzy przestali handlowa�.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//Niekt�rzy jedz� porz�dny posi�ek raz na tydzie�. Nic dziwnego, �e stra� zabra�a mi wszystkie ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//Ale je�li tak dalej p�jdzie, to wkr�tce sam zaczn� g�odowa�.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Info_AddChoice(dia_addon_farim_milizprobs,"Daj mi swoje ryby.",dia_addon_farim_milizprobs_klauen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Mo�e b�d� m�g� ci jako� pom�c.",dia_addon_farim_milizprobs_helfen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Rozmawia�e� o tym z paladynami?",dia_addon_farim_milizprobs_paladine);
};

func void dia_addon_farim_milizprobs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Rozmawia�e� o tym z paladynami?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//�artujesz chyba! A co ich obchodzi, �e taki chudopacho�ek, jak ja, ma problemy ze stra��?
};


var int farim_pissedoff;

func void dia_addon_farim_milizprobs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Daj mi swoje ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//Wiedzia�em. Kolejny z tych siepaczy.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Obawiam si�, �e przyszed�e� troch� za p�no. Twoi kompani zabrali wszystko ju� wczoraj.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//My�l�, �e ju� czas na ciebie.
	FARIM_PISSEDOFF = TRUE;
	Info_ClearChoices(dia_addon_farim_milizprobs);
};

func void dia_addon_farim_milizprobs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Mo�e b�d� m�g� ci jako� pom�c.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Bo ja wiem... Musia�by� zna� kogo� w stra�y, kto ma doj�cie do paladyn�w...
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Sami paladyni raczej nie KUPI� ode mnie ryb.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Zobacz�, co da si� zrobi�.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Log_CreateTopic(TOPIC_ADDON_FARIMSFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMSFISH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FARIMSFISH,"Rybak Farim ma k�opoty ze stra��, kt�ra zabiera mu zbyt wiele ryb, by m�g� zarobi� na �ycie. Musz� znale�� w stra�y kogo�, kto ma wp�yw na paladyn�w, i pom�c Farimowi.");
	MIS_ADDON_FARIM_PALADINFISCH = LOG_RUNNING;
};


instance DIA_ADDON_FARIM_MARTINHELPS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_martinhelps_condition;
	information = dia_addon_farim_martinhelps_info;
	description = "Wiem ju�, jak rozwi�za� twoje problemy.";
};


func int dia_addon_farim_martinhelps_condition()
{
	if((MIS_ADDON_FARIM_PALADINFISCH == LOG_RUNNING) && (MARTIN_KNOWSFARIM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_farim_martinhelps_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//Wiem ju�, jak rozwi�za� twoje problemy.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//Zamieniam si� w s�uch.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Jestem tu od niedawna i ma�o mog�.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//Ale znam kogo�, kto m�g�by ci pom�c.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, kwatermistrz paladyn�w, powiedzia�, �e ch�tnie wys�ucha twojej skargi.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//My�lisz, �e powie stra�nikom, by zostawili mnie w spokoju?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//Tak powiedzia�.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Dobrze. Wielkie dzi�ki. Niestety, nie mog� ci si� odwdzi�czy�. Chocia�...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Ten dziwny b��kitny kamie� znalaz�em kiedy� na wyspie w pobli�u Khorinis.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Nie s�dz�, by by� wiele wart, ale kto� taki jak ty na pewno znajdzie dla niego zastosowanie.
	b_giveinvitems(self,other,itmi_aquamarine,1);
	MIS_ADDON_FARIM_PALADINFISCH = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FARIM_PALADINFISCH);
};


instance DIA_ADDON_FARIM_LANDSTREICHER(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_landstreicher_condition;
	information = dia_addon_farim_landstreicher_info;
	description = "Mo�esz mi co� powiedzie� o zaginionych ludziach?";
};


func int dia_addon_farim_landstreicher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_farim_landstreicher_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Mo�esz mi co� powiedzie� o zaginionych ludziach?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//M�j kumpel, William, zadawa� si� ostatnio z podejrzanymi typkami i do czego to doprowadzi�o?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Pewnego dnia nie przyszed� do pracy i od tego czasu nikt go ju� nie widzia�.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
};


instance DIA_ADDON_FARIM_WILLIAM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_william_condition;
	information = dia_addon_farim_william_info;
	description = "William te� zagin��?";
};


func int dia_addon_farim_william_condition()
{
	if((SCKNOWSFARIMASWILLIAMSFRIEND == TRUE) && Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_william_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//William te� zagin��?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Zgadza si�. By� zwyk�ym rybakiem, cho� nie da si� ukry�, �e czasami zdrowo mu odbija�o.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Nie powinien by� si� brata� z tymi obwiesiami.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_ClearChoices(dia_addon_farim_william);
	Info_AddChoice(dia_addon_farim_william,"Co masz na my�li?",dia_addon_farim_william_typen);
	Info_AddChoice(dia_addon_farim_william,"Jestem pewien, �e pr�dzej czy p�niej wr�ci do domu.",dia_addon_farim_william_auftauchen);
	Info_AddChoice(dia_addon_farim_william,"A co takiego robi�?",dia_addon_farim_william_wasgemacht);
	Info_AddChoice(dia_addon_farim_william,"Kiedy widzia�e� go po raz ostatni?",dia_addon_farim_william_wannweg);
};

func void dia_addon_farim_william_wasgemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//A co takiego robi�?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William chyba kr�ci� jakie� lewe interesy z tymi rzezimieszkami.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//S�dz�, �e sprzedawa� im jakie� nielegalne towary.
};

func void dia_addon_farim_william_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//Co masz na my�li?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Nie wiem, kim s�, ani czego szukaj� w Khorinis.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//Wiem tylko, gdzie si� spotykali z Williamem.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Widzia�em go tam tylko raz i to przypadkiem, podczas �owienia ryb.
	Info_AddChoice(dia_addon_farim_william,"Gdzie si� spotykali?",dia_addon_farim_william_wo);
};

func void dia_addon_farim_william_wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Gdzie si� spotykali?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//Po przeciwnej stronie przystani, na p�nocy, le�y ma�a zatoka.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//Mo�na si� tam dosta� wp�aw lub ��dk�.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//W zatoce znajduje si� pla�a, na kt�rej widzia�em tych przemytnik�w.
	self.flags = 0;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Kolega rybaka Farima, William, zagin��. Podobno William spotyka� si� z jakimi� rzezimieszkami w zatoce na p�noc od portu.");
	Info_AddChoice(dia_addon_farim_william,"Chyba us�ysza�em ju� wystarczaj�co wiele.",dia_addon_farim_william_tschau);
};

func void dia_addon_farim_william_wannweg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Kiedy widzia�e� go po raz ostatni?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Nie dalej jak kilka dni temu.
	Info_AddChoice(dia_addon_farim_william,"Mo�e po prostu wyp�yn�� na po��w?",dia_addon_farim_william_fischen);
};

func void dia_addon_farim_william_fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Mo�e po prostu wyp�yn�� na po��w?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//Niemo�liwe. Jego ��d� jest wci�� zacumowana na przystani.
};

func void dia_addon_farim_william_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Jestem pewien, �e pr�dzej czy p�niej wr�ci do domu.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//Nie s�dz�. Zbyt d�ugo ju� go nie ma.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Boj� si�, �e kt�rego� dnia morze wyrzuci na brzeg jego cia�o.
};

func void dia_addon_farim_william_tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Chyba us�ysza�em ju� wystarczaj�co wiele.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Nie przejmuj si� tym. W�tpi�, by� go znalaz�.
	Info_ClearChoices(dia_addon_farim_william);
};


instance DIA_ADDON_FARIM_PERM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 99;
	condition = dia_addon_farim_perm_condition;
	information = dia_addon_farim_perm_info;
	permanent = TRUE;
	description = "I jak tam ryby? Bior�?";
};


func int dia_addon_farim_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//I jak tam ryby? Bior�?
	if(FARIM_PISSEDOFF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Ech, nie udawaj, �e ci� to interesuje!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//Bywa�o lepiej. Jest jak jest. Za ma�o by �y�, za du�o, by umrze�.
	};
};


instance DIA_ADDON_FARIM_WILLIAMREPORT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 1;
	condition = dia_addon_farim_williamreport_condition;
	information = dia_addon_farim_williamreport_info;
	important = TRUE;
};


func int dia_addon_farim_williamreport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_william))
	{
		if((Npc_HasItems(other,itwr_addon_william_01) > 0) || (SATURAS_ABOUTWILLIAM == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_farim_williamreport_info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//Wr�ci�e�!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//S�ysza�e� co� o Williamie?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Nie �yje.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//Spodziewa�em si� takich wie�ci.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Dzi�ki, �e wr�ci�e�, by mi to powiedzie�.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//P�jd� do knajpy i za cz�� zdobyczy Williama wypij� za jego pami��. Wiem, �e on post�pi�by tak samo, gdybym to ja zgin��.
};

