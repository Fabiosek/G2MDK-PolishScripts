
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
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Kogo ja widz�! To nasz bohater zza Bariery!
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Mi�o ci� znowu widzie�, Miltenie.",dia_miltenow_hello_yes);
	Info_AddChoice(dia_miltenow_hello,"A powinienem ich pami�ta�?",dia_miltenow_hello_no);
};

func void b_milten_gorndiegolester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Pami�tasz jeszcze Gorna, Diega i Lestera?
};

func void dia_miltenow_hello_yes()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Mi�o ci� znowu widzie�, Miltenie. A ty - CI�GLE tutaj, czy ZNOWU tutaj?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Znowu. Po upadku Bariery wr�ci�em do klasztoru Mag�w Ognia.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Ale gdy paladyni postanowili zej�� do Doliny, moje do�wiadczenie i znajomo�� terenu okaza�y si� bardzo przydatne.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Dlatego Najwy�sza Rada wys�a�a mnie tutaj jako magiczne wsparcie dla ca�ej ekspedycji.
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Oczywi�cie, �e ich pami�tam!",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Te imiona nic mi nie m�wi�.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_no()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//A powinienem ich pami�ta�?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Przeszed�e� przez niez�e piek�o, co?
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Jak si� maj� sprawy?",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Te imiona nic mi nie m�wi�.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Oczywi�cie, �e ich pami�tam!
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//C�, Gorn i Diego daleko nie zaszli. Zostali schwytani w Dolinie przez paladyn�w.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Tylko Lesterowi uda�o si� prysn��, chocia� nie wiem, gdzie si� teraz podziewa.
	if(Npc_KnowsInfo(other,dia_lester_hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//Spotka�em Lestera. Jest u Xardasa.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Przynajmniej jedna dobra wiadomo��.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//C�, nie mam dla ciebie �adnych dobrych wie�ci.
	KNOWS_DIEGO = TRUE;
	Info_ClearChoices(dia_miltenow_hello);
};

func void dia_miltenow_hello_forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Te imiona nic mi nie m�wi�.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Wiele zapomnia�e�... Zostawmy zatem przesz�o�� i skoncentrujmy si� na tera�niejszo�ci.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//Mimo �e nie prezentuje si� ona najlepiej.
	Info_ClearChoices(dia_miltenow_hello);
};


instance DIA_MILTENOW_BERICHT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 3;
	condition = dia_miltenow_bericht_condition;
	information = dia_miltenow_bericht_info;
	permanent = FALSE;
	description = "Jak si� maj� sprawy?";
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
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//Jak si� maj� sprawy?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//Paladyni przybyli tutaj, �eby zgromadzi� jak najwi�cej magicznej rudy.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Ale bior�c pod uwag� smocze ataki i orkow� armi�, �miem w�tpi�, czy im si� to uda.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Nie, na Innosa. Wyczuwam tu obecno�� czego� mrocznego... czego� bardzo z�ego. Ponura moc wype�nia ca�� Dolin�.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Cena za zwyci�stwo nad �ni�cym okaza�a si� bardzo wysoka. Upadek Bariery to prawdziwa katastrofa.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Je�li to przetrwamy, mo�emy m�wi� o prawdziwym szcz�ciu.
};


instance DIA_MILTENOW_ERZ(C_INFO)
{
	npc = pc_mage_ow;
	nr = 4;
	condition = dia_miltenow_erz_condition;
	information = dia_miltenow_erz_info;
	permanent = FALSE;
	description = "Ile rudy zgromadzili�cie do tej pory?";
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
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Ile rudy zgromadzili�cie do tej pory?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Ile rudy? Ani bry�ki! Od jakiego� czasu nie mamy �adnych wie�ci od g�rnik�w.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//Nie zdziwi�bym si�, gdyby ju� nie �yli. A na domiar z�ego jeste�my atakowani przez smoki i hord� ork�w!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Ta wyprawa to jedno wielkie niepowodzenie!
};


instance DIA_MILTENOW_WO(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_wo_condition;
	information = dia_miltenow_wo_info;
	permanent = FALSE;
	description = "Gdzie s� teraz Gorn i Diego?";
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
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//Gdzie s� teraz Gorn i Diego?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//C�. Gorn siedzi w tutejszym lochu za stawianie oporu paladynom.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Diego zosta� przydzielony do grupy g�rnik�w. Porozmawiaj z paladynem imieniem Parcival. To on dobiera� ludzi.
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
	description = "Chod�my uwolni� Gorna!";
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
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Chod�my uwolni� Gorna!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//To nie takie proste! Gorn jest skaza�cem.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Przy odrobinie szcz�cia Garond wyznaczy jak�� grzywn�, po kt�rej zap�aceniu Gorn odzyska wolno��.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Tak, to mo�liwe...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Daj mi zna�, gdyby� si� czego� dowiedzia�.
	Log_CreateTopic(TOPIC_RESCUEGORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGORN,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEGORN,"Kapitan Garond kaza� wsadzi� Gorna do wi�zienia. Mo�e uda nam si� go jako� uwolni�.");
};


instance DIA_MILTENOW_PREIS(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_preis_condition;
	information = dia_miltenow_preis_info;
	permanent = FALSE;
	description = "Garond domaga si� 1000 sztuk z�ota za uwolnienie Gorna.";
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
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Garond domaga si� 1000 sztuk z�ota za uwolnienie Gorna.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Niez�a sumka. Mog� dorzuci� 250 sztuk z mojej kieszeni.
	b_giveinvitems(self,other,itmi_gold,250);
	b_logentry(TOPIC_RESCUEGORN,"Milten da� mi 250 sztuk z�ota, abym zap�aci� za wypuszczenie Gorna z wi�zienia.");
};


instance DIA_MILTENOW_MEHR(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_mehr_condition;
	information = dia_miltenow_mehr_info;
	permanent = FALSE;
	description = "To za ma�o. Musz� jako� zdoby� ca�� reszt�.";
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
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//To za ma�o. Musz� jako� zdoby� ca�� reszt�.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Zdoby� wi�cej z�ota... hmmm. Diego jest w tym specjalist�, ale go tu nie ma...
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Mo�e sam Gorn od�o�y� gdzie� troch� z�ota? Powinni�my si� tego dowiedzie�.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Czekaj. Napisz� do niego list. Spr�buj go jako� przemyci� do lochu.
	b_giveinvitems(self,other,itwr_letterforgorn_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Milten da� mi wiadomo�� dla Gorna. Je�li zdo�am j� przemyci� do wi�zienia, mo�e dowiedziemy si�, czy Gorn posiada jakie� zapasy z�ota.");
};


instance DIA_MILTENOW_EQUIPMENT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_equipment_condition;
	information = dia_miltenow_equipment_info;
	permanent = FALSE;
	description = "Masz mo�e dla mnie jakie� wyposa�enie?";
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
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Masz mo�e dla mnie jakie� wyposa�enie? Garond kaza� mi odwiedzi� kopalnie.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//Sk�d niby mia�bym je wzi��? Je�li chcesz, mog� ci da� runiczny kamie�.
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
	description = "Mam odpowied� od Gorna...";
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
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//Mam odpowied� od Gorna. Podobno ukry� z�oto gdzie� przy po�udniowej bramie.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//DAWNEJ po�udniowej bramie, chcia�e� powiedzie�. Smok obr�ci� j� w zupe�n� ruin�.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Jak si� tam dosta�?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//To niedaleko tarana ork�w. Po�udniowa brama by�a na prawo od niego.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//To nie b�dzie �atwy spacerek. Uwa�aj na siebie i �piesz si�!
	b_logentry(TOPIC_RESCUEGORN,"By�a po�udniowa brama znajduje si� na prawo od orkowego tarana. Gorn ukry� z�oto gdzie� w tej okolicy.");
};


instance DIA_MILTENOW_FREI(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_frei_condition;
	information = dia_miltenow_frei_info;
	permanent = FALSE;
	description = "Uwolni�em Gorna.";
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
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Uwolni�em Gorna.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Dobra robota. Zastan�wmy si�, co dalej.
};


instance DIA_MILTENOW_LEHREN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 9;
	condition = dia_miltenow_lehren_condition;
	information = dia_miltenow_lehren_info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Mog� nauczy� ci� niekt�rych zakl�� z drugiego kr�gu magii albo zwi�kszy� troch� twoj� magiczn� moc.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Je�li jeste� got�w zwi�kszy� swoj� magiczn� moc, mog� ci pom�c.
};


instance DIA_MILTENOW_TEACHCIRCLE2(C_INFO)
{
	npc = pc_mage_ow;
	nr = 91;
	condition = dia_miltenow_teachcircle2_condition;
	information = dia_miltenow_teachcircle2_info;
	permanent = TRUE;
	description = "Wprowad� mnie do drugiego kr�gu magii!";
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
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Wprowad� mnie do drugiego kr�gu magii!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//W zasadzie powinien si� tym zaj�� kt�ry� z nauczycieli naszego zakonu...
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//...ale w tej sytuacji mo�emy chyba zrobi� wyj�tek.
	if(b_teachmagiccircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Nie wiem, czy pami�tam oficjaln� formu�k�...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Oto wkraczasz w drugi kr�g magii... Eee... Magia wska�e ci drog�, ale to twoje czyny ci� ni� poprowadz�... Czy co� w tym stylu...
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
	description = "Chc� si� nauczy� nowych zakl��.";
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
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Chc� si� nauczy� nowych zakl��.
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
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Nie pozna�e� jeszcze drugiego kr�gu magii. Nie mog� ci� niczego nauczy�.
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
	description = "Chc� zwi�kszy� moj� magiczn� moc.";
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
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Chc� zwi�kszy� moj� magiczn� moc.
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Twoja magiczna moc i tak jest ogromna. Obawiam si�, �e nie mog� ci pom�c.
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
	description = "Czym si� tutaj zajmujesz?";
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
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//Czym si� tutaj zajmujesz?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Mia�em sprawdza� czysto�� zgromadzonej rudy, ale na to przyjdzie mi chyba jeszcze poczeka�.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//Chwilowo bawi� si� w alchemika.
};


instance DIA_MILTENOW_PLAN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_plan_condition;
	information = dia_miltenow_plan_info;
	permanent = TRUE;
	description = "Co zamierzasz dalej robi�?";
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
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//Co zamierzasz dalej robi�?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Wr�ci� do klasztoru. Zaczekam tutaj jeszcze troch�, ale skoro Gorn zn�w jest na wolno�ci, mog� si� z nim zabra�.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Pyrokar musi koniecznie dowiedzie� si� o wszystkim, co si� tutaj dzieje.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Jak uwa�asz.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Mam tylko nadziej�, �e Lord Hagen w�a�ciwie oceni zagro�enie. Wol� nie my�le�, co si� stanie, gdy orkowie przekrocz� prze��cz.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//Zatem bezpiecznej podr�y!
};


instance DIA_MILTENOW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_ow;
	nr = 888;
	condition = dia_miltenow_pickpocket_condition;
	information = dia_miltenow_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tej mikstury b�dzie trudnym zadaniem)";
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

