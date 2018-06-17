
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
	description = "Jesteœ rybakiem?";
};


func int dia_addon_farim_hallo_condition()
{
	return TRUE;
};

func void dia_addon_farim_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Jesteœ rybakiem?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//Jak na to wpad³eœ?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Mo¿e po prostu zostawisz mnie w spokoju, co?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Nie mam nic do ciebie, ale ostatnio mia³em sporo nieprzyjemnych staræ ze stra¿¹, wiêc rozumiesz...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Nie oceniaj mnie zbyt pochopnie. Po prostu jestem w pod³ym nastroju. K³opoty ze stra¿¹, rozumiesz...
	};
};


instance DIA_ADDON_FARIM_MILIZPROBS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_milizprobs_condition;
	information = dia_addon_farim_milizprobs_info;
	description = "K³opoty ze stra¿¹?";
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
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//K³opoty ze stra¿¹?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Ci dranie regularnie mnie nachodz¹ i zabieraj¹, co im siê ¿ywnie podoba!
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//W ostatnim tygodniu zabrali mi ca³y po³ów. Powiedzieli, ¿e to "dla wspólnego dobra"!
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//Wiem, ¿e jesteœmy zdani na w³asne si³y od czasu, gdy farmerzy przestali handlowaæ.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//Niektórzy jedz¹ porz¹dny posi³ek raz na tydzieñ. Nic dziwnego, ¿e stra¿ zabra³a mi wszystkie ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//Ale jeœli tak dalej pójdzie, to wkrótce sam zacznê g³odowaæ.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Info_AddChoice(dia_addon_farim_milizprobs,"Daj mi swoje ryby.",dia_addon_farim_milizprobs_klauen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Mo¿e bêdê móg³ ci jakoœ pomóc.",dia_addon_farim_milizprobs_helfen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Rozmawia³eœ o tym z paladynami?",dia_addon_farim_milizprobs_paladine);
};

func void dia_addon_farim_milizprobs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Rozmawia³eœ o tym z paladynami?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//¯artujesz chyba! A co ich obchodzi, ¿e taki chudopacho³ek, jak ja, ma problemy ze stra¿¹?
};


var int farim_pissedoff;

func void dia_addon_farim_milizprobs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Daj mi swoje ryby.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//Wiedzia³em. Kolejny z tych siepaczy.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Obawiam siê, ¿e przyszed³eœ trochê za póŸno. Twoi kompani zabrali wszystko ju¿ wczoraj.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//Myœlê, ¿e ju¿ czas na ciebie.
	FARIM_PISSEDOFF = TRUE;
	Info_ClearChoices(dia_addon_farim_milizprobs);
};

func void dia_addon_farim_milizprobs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Mo¿e bêdê móg³ ci jakoœ pomóc.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Bo ja wiem... Musia³byœ znaæ kogoœ w stra¿y, kto ma dojœcie do paladynów...
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Sami paladyni raczej nie KUPI¥ ode mnie ryb.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Zobaczê, co da siê zrobiæ.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Log_CreateTopic(TOPIC_ADDON_FARIMSFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMSFISH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FARIMSFISH,"Rybak Farim ma k³opoty ze stra¿¹, która zabiera mu zbyt wiele ryb, by móg³ zarobiæ na ¿ycie. Muszê znaleŸæ w stra¿y kogoœ, kto ma wp³yw na paladynów, i pomóc Farimowi.");
	MIS_ADDON_FARIM_PALADINFISCH = LOG_RUNNING;
};


instance DIA_ADDON_FARIM_MARTINHELPS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_martinhelps_condition;
	information = dia_addon_farim_martinhelps_info;
	description = "Wiem ju¿, jak rozwi¹zaæ twoje problemy.";
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
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//Wiem ju¿, jak rozwi¹zaæ twoje problemy.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//Zamieniam siê w s³uch.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Jestem tu od niedawna i ma³o mogê.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//Ale znam kogoœ, kto móg³by ci pomóc.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, kwatermistrz paladynów, powiedzia³, ¿e chêtnie wys³ucha twojej skargi.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//Myœlisz, ¿e powie stra¿nikom, by zostawili mnie w spokoju?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//Tak powiedzia³.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Dobrze. Wielkie dziêki. Niestety, nie mogê ci siê odwdziêczyæ. Chocia¿...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Ten dziwny b³êkitny kamieñ znalaz³em kiedyœ na wyspie w pobli¿u Khorinis.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Nie s¹dzê, by by³ wiele wart, ale ktoœ taki jak ty na pewno znajdzie dla niego zastosowanie.
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
	description = "Mo¿esz mi coœ powiedzieæ o zaginionych ludziach?";
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
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Mo¿esz mi coœ powiedzieæ o zaginionych ludziach?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//Mój kumpel, William, zadawa³ siê ostatnio z podejrzanymi typkami i do czego to doprowadzi³o?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Pewnego dnia nie przyszed³ do pracy i od tego czasu nikt go ju¿ nie widzia³.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
};


instance DIA_ADDON_FARIM_WILLIAM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_william_condition;
	information = dia_addon_farim_william_info;
	description = "William te¿ zagin¹³?";
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
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//William te¿ zagin¹³?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Zgadza siê. By³ zwyk³ym rybakiem, choæ nie da siê ukryæ, ¿e czasami zdrowo mu odbija³o.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Nie powinien by³ siê brataæ z tymi obwiesiami.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_ClearChoices(dia_addon_farim_william);
	Info_AddChoice(dia_addon_farim_william,"Co masz na myœli?",dia_addon_farim_william_typen);
	Info_AddChoice(dia_addon_farim_william,"Jestem pewien, ¿e prêdzej czy póŸniej wróci do domu.",dia_addon_farim_william_auftauchen);
	Info_AddChoice(dia_addon_farim_william,"A co takiego robi³?",dia_addon_farim_william_wasgemacht);
	Info_AddChoice(dia_addon_farim_william,"Kiedy widzia³eœ go po raz ostatni?",dia_addon_farim_william_wannweg);
};

func void dia_addon_farim_william_wasgemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//A co takiego robi³?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William chyba krêci³ jakieœ lewe interesy z tymi rzezimieszkami.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//S¹dzê, ¿e sprzedawa³ im jakieœ nielegalne towary.
};

func void dia_addon_farim_william_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//Co masz na myœli?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Nie wiem, kim s¹, ani czego szukaj¹ w Khorinis.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//Wiem tylko, gdzie siê spotykali z Williamem.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Widzia³em go tam tylko raz i to przypadkiem, podczas ³owienia ryb.
	Info_AddChoice(dia_addon_farim_william,"Gdzie siê spotykali?",dia_addon_farim_william_wo);
};

func void dia_addon_farim_william_wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Gdzie siê spotykali?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//Po przeciwnej stronie przystani, na pó³nocy, le¿y ma³a zatoka.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//Mo¿na siê tam dostaæ wp³aw lub ³ódk¹.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//W zatoce znajduje siê pla¿a, na której widzia³em tych przemytników.
	self.flags = 0;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Kolega rybaka Farima, William, zagin¹³. Podobno William spotyka³ siê z jakimiœ rzezimieszkami w zatoce na pó³noc od portu.");
	Info_AddChoice(dia_addon_farim_william,"Chyba us³ysza³em ju¿ wystarczaj¹co wiele.",dia_addon_farim_william_tschau);
};

func void dia_addon_farim_william_wannweg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Kiedy widzia³eœ go po raz ostatni?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Nie dalej jak kilka dni temu.
	Info_AddChoice(dia_addon_farim_william,"Mo¿e po prostu wyp³yn¹³ na po³ów?",dia_addon_farim_william_fischen);
};

func void dia_addon_farim_william_fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Mo¿e po prostu wyp³yn¹³ na po³ów?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//Niemo¿liwe. Jego ³ódŸ jest wci¹¿ zacumowana na przystani.
};

func void dia_addon_farim_william_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Jestem pewien, ¿e prêdzej czy póŸniej wróci do domu.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//Nie s¹dzê. Zbyt d³ugo ju¿ go nie ma.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Bojê siê, ¿e któregoœ dnia morze wyrzuci na brzeg jego cia³o.
};

func void dia_addon_farim_william_tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Chyba us³ysza³em ju¿ wystarczaj¹co wiele.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Nie przejmuj siê tym. W¹tpiê, byœ go znalaz³.
	Info_ClearChoices(dia_addon_farim_william);
};


instance DIA_ADDON_FARIM_PERM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 99;
	condition = dia_addon_farim_perm_condition;
	information = dia_addon_farim_perm_info;
	permanent = TRUE;
	description = "I jak tam ryby? Bior¹?";
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
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//I jak tam ryby? Bior¹?
	if(FARIM_PISSEDOFF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Ech, nie udawaj, ¿e ciê to interesuje!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//Bywa³o lepiej. Jest jak jest. Za ma³o by ¿yæ, za du¿o, by umrzeæ.
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
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//Wróci³eœ!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//S³ysza³eœ coœ o Williamie?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Nie ¿yje.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//Spodziewa³em siê takich wieœci.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Dziêki, ¿e wróci³eœ, by mi to powiedzieæ.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//Pójdê do knajpy i za czêœæ zdobyczy Williama wypijê za jego pamiêæ. Wiem, ¿e on post¹pi³by tak samo, gdybym to ja zgin¹³.
};

