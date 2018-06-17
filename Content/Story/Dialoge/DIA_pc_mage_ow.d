
instance DIA_MILTENOW_EXIT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 999;
	condition = dia_miltenow_exit_condition;
	information = dia_miltenow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltenow_exit_condition()
{
	return TRUE;
};

func void dia_miltenow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENOW_HELLO(C_INFO)
{
	npc = pc_mage_ow;
	nr = TRUE;
	condition = dia_miltenow_hello_condition;
	information = dia_miltenow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltenow_hello_condition()
{
	return TRUE;
};

func void dia_miltenow_hello_info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Kogo ja widzê! To nasz bohater zza Bariery!
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Mi³o ciê znowu widzieæ, Miltenie.",dia_miltenow_hello_yes);
	Info_AddChoice(dia_miltenow_hello,"A powinienem ich pamiêtaæ?",dia_miltenow_hello_no);
};

func void b_milten_gorndiegolester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Pamiêtasz jeszcze Gorna, Diega i Lestera?
};

func void dia_miltenow_hello_yes()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Mi³o ciê znowu widzieæ, Miltenie. A ty - CI¥GLE tutaj, czy ZNOWU tutaj?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Znowu. Po upadku Bariery wróci³em do klasztoru Magów Ognia.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Ale gdy paladyni postanowili zejœæ do Doliny, moje doœwiadczenie i znajomoœæ terenu okaza³y siê bardzo przydatne.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Dlatego Najwy¿sza Rada wys³a³a mnie tutaj jako magiczne wsparcie dla ca³ej ekspedycji.
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Oczywiœcie, ¿e ich pamiêtam!",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Te imiona nic mi nie mówi¹.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_no()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//A powinienem ich pamiêtaæ?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Przeszed³eœ przez niez³e piek³o, co?
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Jak siê maj¹ sprawy?",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Te imiona nic mi nie mówi¹.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Oczywiœcie, ¿e ich pamiêtam!
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//Có¿, Gorn i Diego daleko nie zaszli. Zostali schwytani w Dolinie przez paladynów.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Tylko Lesterowi uda³o siê prysn¹æ, chocia¿ nie wiem, gdzie siê teraz podziewa.
	if(Npc_KnowsInfo(other,dia_lester_hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//Spotka³em Lestera. Jest u Xardasa.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Przynajmniej jedna dobra wiadomoœæ.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//Có¿, nie mam dla ciebie ¿adnych dobrych wieœci.
	KNOWS_DIEGO = TRUE;
	Info_ClearChoices(dia_miltenow_hello);
};

func void dia_miltenow_hello_forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Te imiona nic mi nie mówi¹.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Wiele zapomnia³eœ... Zostawmy zatem przesz³oœæ i skoncentrujmy siê na teraŸniejszoœci.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//Mimo ¿e nie prezentuje siê ona najlepiej.
	Info_ClearChoices(dia_miltenow_hello);
};


instance DIA_MILTENOW_BERICHT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 3;
	condition = dia_miltenow_bericht_condition;
	information = dia_miltenow_bericht_info;
	permanent = FALSE;
	description = "Jak siê maj¹ sprawy?";
};


func int dia_miltenow_bericht_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello))
	{
		return TRUE;
	};
};

func void dia_miltenow_bericht_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//Jak siê maj¹ sprawy?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//Paladyni przybyli tutaj, ¿eby zgromadziæ jak najwiêcej magicznej rudy.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Ale bior¹c pod uwagê smocze ataki i orkow¹ armiê, œmiem w¹tpiæ, czy im siê to uda.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Nie, na Innosa. Wyczuwam tu obecnoœæ czegoœ mrocznego... czegoœ bardzo z³ego. Ponura moc wype³nia ca³¹ Dolinê.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Cena za zwyciêstwo nad Œni¹cym okaza³a siê bardzo wysoka. Upadek Bariery to prawdziwa katastrofa.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Jeœli to przetrwamy, mo¿emy mówiæ o prawdziwym szczêœciu.
};


instance DIA_MILTENOW_ERZ(C_INFO)
{
	npc = pc_mage_ow;
	nr = 4;
	condition = dia_miltenow_erz_condition;
	information = dia_miltenow_erz_info;
	permanent = FALSE;
	description = "Ile rudy zgromadziliœcie do tej pory?";
};


func int dia_miltenow_erz_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_bericht))
	{
		return TRUE;
	};
};

func void dia_miltenow_erz_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Ile rudy zgromadziliœcie do tej pory?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Ile rudy? Ani bry³ki! Od jakiegoœ czasu nie mamy ¿adnych wieœci od górników.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//Nie zdziwi³bym siê, gdyby ju¿ nie ¿yli. A na domiar z³ego jesteœmy atakowani przez smoki i hordê orków!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Ta wyprawa to jedno wielkie niepowodzenie!
};


instance DIA_MILTENOW_WO(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_wo_condition;
	information = dia_miltenow_wo_info;
	permanent = FALSE;
	description = "Gdzie s¹ teraz Gorn i Diego?";
};


func int dia_miltenow_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello) && (KNOWS_DIEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_miltenow_wo_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//Gdzie s¹ teraz Gorn i Diego?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Có¿. Gorn siedzi w tutejszym lochu za stawianie oporu paladynom.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Diego zosta³ przydzielony do grupy górników. Porozmawiaj z paladynem imieniem Parcival. To on dobiera³ ludzi.
	KNOWSABOUTGORN = TRUE;
	SEARCHFORDIEGO = LOG_RUNNING;
};


instance DIA_MILTENOW_GORN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_gorn_condition;
	information = dia_miltenow_gorn_info;
	permanent = FALSE;
	description = "ChodŸmy uwolniæ Gorna!";
};


func int dia_miltenow_gorn_condition()
{
	if((KNOWSABOUTGORN == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_gorn_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//ChodŸmy uwolniæ Gorna!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//To nie takie proste! Gorn jest skazañcem.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Przy odrobinie szczêœcia Garond wyznaczy jak¹œ grzywnê, po której zap³aceniu Gorn odzyska wolnoœæ.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Tak, to mo¿liwe...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Daj mi znaæ, gdybyœ siê czegoœ dowiedzia³.
	Log_CreateTopic(TOPIC_RESCUEGORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGORN,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEGORN,"Kapitan Garond kaza³ wsadziæ Gorna do wiêzienia. Mo¿e uda nam siê go jakoœ uwolniæ.");
};


instance DIA_MILTENOW_PREIS(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_preis_condition;
	information = dia_miltenow_preis_info;
	permanent = FALSE;
	description = "Garond domaga siê 1000 sztuk z³ota za uwolnienie Gorna.";
};


func int dia_miltenow_preis_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_preis_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Garond domaga siê 1000 sztuk z³ota za uwolnienie Gorna.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Niez³a sumka. Mogê dorzuciæ 250 sztuk z mojej kieszeni.
	b_giveinvitems(self,other,itmi_gold,250);
	b_logentry(TOPIC_RESCUEGORN,"Milten da³ mi 250 sztuk z³ota, abym zap³aci³ za wypuszczenie Gorna z wiêzienia.");
};


instance DIA_MILTENOW_MEHR(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_mehr_condition;
	information = dia_miltenow_mehr_info;
	permanent = FALSE;
	description = "To za ma³o. Muszê jakoœ zdobyæ ca³¹ resztê.";
};


func int dia_miltenow_mehr_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (Npc_HasItems(other,itmi_gold) < 1000) && Npc_KnowsInfo(other,dia_miltenow_preis))
	{
		return TRUE;
	};
};

func void dia_miltenow_mehr_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//To za ma³o. Muszê jakoœ zdobyæ ca³¹ resztê.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Zdobyæ wiêcej z³ota... hmmm. Diego jest w tym specjalist¹, ale go tu nie ma...
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Mo¿e sam Gorn od³o¿y³ gdzieœ trochê z³ota? Powinniœmy siê tego dowiedzieæ.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Czekaj. Napiszê do niego list. Spróbuj go jakoœ przemyciæ do lochu.
	b_giveinvitems(self,other,itwr_letterforgorn_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Milten da³ mi wiadomoœæ dla Gorna. Jeœli zdo³am j¹ przemyciæ do wiêzienia, mo¿e dowiedziemy siê, czy Gorn posiada jakieœ zapasy z³ota.");
};


instance DIA_MILTENOW_EQUIPMENT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_equipment_condition;
	information = dia_miltenow_equipment_info;
	permanent = FALSE;
	description = "Masz mo¿e dla mnie jakieœ wyposa¿enie?";
};


func int dia_miltenow_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_miltenow_equipment_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Masz mo¿e dla mnie jakieœ wyposa¿enie? Garond kaza³ mi odwiedziæ kopalnie.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//Sk¹d niby mia³bym je wzi¹æ? Jeœli chcesz, mogê ci daæ runiczny kamieñ.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_MILTENOW_VERSTECK(C_INFO)
{
	npc = pc_mage_ow;
	nr = 1;
	condition = dia_miltenow_versteck_condition;
	information = dia_miltenow_versteck_info;
	permanent = FALSE;
	important = FALSE;
	description = "Mam odpowiedŸ od Gorna...";
};


func int dia_miltenow_versteck_condition()
{
	if((GORNSTREASURE == TRUE) && (Npc_HasItems(other,itmi_gornstreasure_mis) <= 0) && (GORNS_BEUTEL == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_versteck_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//Mam odpowiedŸ od Gorna. Podobno ukry³ z³oto gdzieœ przy po³udniowej bramie.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//DAWNEJ po³udniowej bramie, chcia³eœ powiedzieæ. Smok obróci³ j¹ w zupe³n¹ ruinê.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Jak siê tam dostaæ?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//To niedaleko tarana orków. Po³udniowa brama by³a na prawo od niego.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//To nie bêdzie ³atwy spacerek. Uwa¿aj na siebie i œpiesz siê!
	b_logentry(TOPIC_RESCUEGORN,"By³a po³udniowa brama znajduje siê na prawo od orkowego tarana. Gorn ukry³ z³oto gdzieœ w tej okolicy.");
};


instance DIA_MILTENOW_FREI(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_frei_condition;
	information = dia_miltenow_frei_info;
	permanent = FALSE;
	description = "Uwolni³em Gorna.";
};


func int dia_miltenow_frei_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_frei_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Uwolni³em Gorna.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Dobra robota. Zastanówmy siê, co dalej.
};


instance DIA_MILTENOW_LEHREN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 9;
	condition = dia_miltenow_lehren_condition;
	information = dia_miltenow_lehren_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_miltenow_lehren_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_lehren_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Mogê nauczyæ ciê niektórych zaklêæ z drugiego krêgu magii albo zwiêkszyæ trochê twoj¹ magiczn¹ moc.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Jeœli jesteœ gotów zwiêkszyæ swoj¹ magiczn¹ moc, mogê ci pomóc.
};


instance DIA_MILTENOW_TEACHCIRCLE2(C_INFO)
{
	npc = pc_mage_ow;
	nr = 91;
	condition = dia_miltenow_teachcircle2_condition;
	information = dia_miltenow_teachcircle2_info;
	permanent = TRUE;
	description = "WprowadŸ mnie do drugiego krêgu magii!";
};


func int dia_miltenow_teachcircle2_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teachcircle2_info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//WprowadŸ mnie do drugiego krêgu magii!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//W zasadzie powinien siê tym zaj¹æ któryœ z nauczycieli naszego zakonu...
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//...ale w tej sytuacji mo¿emy chyba zrobiæ wyj¹tek.
	if(b_teachmagiccircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Nie wiem, czy pamiêtam oficjaln¹ formu³kê...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Oto wkraczasz w drugi kr¹g magii... Eee... Magia wska¿e ci drogê, ale to twoje czyny ciê ni¹ poprowadz¹... Czy coœ w tym stylu...
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//Chyba wiesz, o co mi chodzi...
	};
};


instance DIA_MILTENOW_TEACH(C_INFO)
{
	npc = pc_mage_ow;
	nr = 90;
	condition = dia_miltenow_teach_condition;
	information = dia_miltenow_teach_info;
	permanent = TRUE;
	description = "Chcê siê nauczyæ nowych zaklêæ.";
};


func int dia_miltenow_teach_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teach_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Chcê siê nauczyæ nowych zaklêæ.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltenow_teach);
		Info_AddChoice(dia_miltenow_teach,DIALOG_BACK,dia_miltenow_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltenow_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltenow_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltenow_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Nie pozna³eœ jeszcze drugiego krêgu magii. Nie mogê ciê niczego nauczyæ.
	};
};

func void dia_miltenow_teach_back()
{
	Info_ClearChoices(dia_miltenow_teach);
};

func void dia_miltenow_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltenow_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltenow_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENOW_MANA(C_INFO)
{
	npc = pc_mage_ow;
	nr = 100;
	condition = dia_miltenow_mana_condition;
	information = dia_miltenow_mana_info;
	permanent = TRUE;
	description = "Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
};


func int dia_miltenow_mana_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_mana_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Twoja magiczna moc i tak jest ogromna. Obawiam siê, ¿e nie mogê ci pomóc.
	};
	Info_ClearChoices(dia_miltenow_mana);
};

func void dia_miltenow_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};


instance DIA_MILTENOW_PERM(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_perm_condition;
	information = dia_miltenow_perm_info;
	permanent = TRUE;
	description = "Czym siê tutaj zajmujesz?";
};


func int dia_miltenow_perm_condition()
{
	if((KAPITEL == 2) && (Npc_KnowsInfo(other,dia_miltenow_frei) == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltenow_perm_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//Czym siê tutaj zajmujesz?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Mia³em sprawdzaæ czystoœæ zgromadzonej rudy, ale na to przyjdzie mi chyba jeszcze poczekaæ.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//Chwilowo bawiê siê w alchemika.
};


instance DIA_MILTENOW_PLAN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_plan_condition;
	information = dia_miltenow_plan_info;
	permanent = TRUE;
	description = "Co zamierzasz dalej robiæ?";
};


func int dia_miltenow_plan_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_miltenow_frei))
	{
		return TRUE;
	};
};

func void dia_miltenow_plan_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//Co zamierzasz dalej robiæ?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Wróciæ do klasztoru. Zaczekam tutaj jeszcze trochê, ale skoro Gorn znów jest na wolnoœci, mogê siê z nim zabraæ.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Pyrokar musi koniecznie dowiedzieæ siê o wszystkim, co siê tutaj dzieje.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Jak uwa¿asz.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Mam tylko nadziejê, ¿e Lord Hagen w³aœciwie oceni zagro¿enie. Wolê nie myœleæ, co siê stanie, gdy orkowie przekrocz¹ prze³êcz.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//Zatem bezpiecznej podró¿y!
};


instance DIA_MILTENOW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_ow;
	nr = 888;
	condition = dia_miltenow_pickpocket_condition;
	information = dia_miltenow_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tej mikstury bêdzie trudnym zadaniem)";
};


func int dia_miltenow_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_miltenow_pickpocket_info()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_BACK,dia_miltenow_pickpocket_back);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_PICKPOCKET,dia_miltenow_pickpocket_doit);
};

func void dia_miltenow_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itpo_perm_mana,1);
		b_giveinvitems(self,other,itpo_perm_mana,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_miltenow_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_miltenow_pickpocket_back()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
};

