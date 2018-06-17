
instance DIA_RUKHAR_EXIT(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 999;
	condition = dia_rukhar_exit_condition;
	information = dia_rukhar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rukhar_exit_condition()
{
	return TRUE;
};

func void dia_rukhar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HALLO(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 4;
	condition = dia_rukhar_hallo_condition;
	information = dia_rukhar_hallo_info;
	description = "Dobre maj� tu piwo?";
};


func int dia_rukhar_hallo_condition()
{
	return TRUE;
};

func void dia_rukhar_hallo_info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//Dobre maj� tu piwo?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//Nie jest mo�e najlepsze, ale w tych ci�kich czasach nie ma co wybrzydza�.
};


instance DIA_RUKHAR_WASMACHSTDU(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 5;
	condition = dia_rukhar_wasmachstdu_condition;
	information = dia_rukhar_wasmachstdu_info;
	description = "Co tu porabiasz?";
};


func int dia_rukhar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_hallo))
	{
		return TRUE;
	};
};

func void dia_rukhar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//Co tu porabiasz?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//Jeszcze kilka dni temu wypruwa�em sobie flaki na polach obszarnika.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//Pewnego dnia powiedzia�em sobie: do��. Zabra�em swoje graty i odszed�em.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//Teraz sam sobie jestem szefem. Wszystko co mam, znajduje si� w moim kufrze. Niczego wi�cej mi nie trzeba.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//Interesowa�by ci� ma�y konkurs?
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"W gospodzie uprawiany jest hazard.");
};


instance DIA_RUKHAR_WETTKAMPF(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_wettkampf_condition;
	information = dia_rukhar_wettkampf_info;
	description = "A na czym mia�by on polega�?";
};


func int dia_rukhar_wettkampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_wettkampf_info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//A na czym mia�by on polega�?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//Nazwa�em go DO DNA.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//Zasady s� ca�kiem proste.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//Zamawiamy na zmian� po kuflu najlepszego w tej spelunie piwa.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//Ka�dy kufel musi by� opr�niony do dna, tak by po odwr�ceniu i postawieniu na stole nie pozostawia� �ladu.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//Ten, kt�ry d�u�ej ustoi na nogach, wygrywa. Przegrany p�aci stawk� i rachunek. Co ty na to?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//Mo�e kiedy indziej, je�li b�d� mia� troch� wi�cej czasu.
};


instance DIA_RUKHAR_HOLERANDOLPH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_holerandolph_condition;
	information = dia_rukhar_holerandolph_info;
	description = "Czy mog� postawi� na kogo� innego?";
};


func int dia_rukhar_holerandolph_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wettkampf))
	{
		return TRUE;
	};
};

func void dia_rukhar_holerandolph_info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//Czy mog� postawi� na kogo� innego?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//Oczywi�cie. Je�li tylko uda ci si� znale�� kogo� na tyle odwa�nego, by si� ze mn� zmierzy�, za�o�� si� z tob�.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//Wszyscy p�ac� po r�wno. Zwyci�zca bierze wszystko. Wysoko�� stawki zale�y od zasobno�ci sakiewki.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//Przyprowad� mi kogo�, kto odwa�y si� ze mn� zmierzy�, i b�dziesz mia� sw�j zak�ad.
	b_logentry(TOPIC_WETTSAUFEN,"Rukhar nazywa swoj� gr� DO DNA. Osobi�cie nie jestem zainteresowany. Pode�l� mu jakiego� innego zawodnika.");
};


instance DIA_RUKHAR_RANDOLPHWILL(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_randolphwill_condition;
	information = dia_rukhar_randolphwill_info;
	permanent = TRUE;
	description = "Znam kogo�, kto chcia�by si� z tob� zmierzy�.";
};


var int dia_rukhar_randolphwill_noperm;

func int dia_rukhar_randolphwill_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && Npc_KnowsInfo(other,dia_rukhar_holerandolph) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_rukhar_randolphwill_info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//Znam kogo�, kto chcia�by si� z tob� zmierzy�.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//A kt� to taki?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//Randolph.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//Ho, ho. Randolf moczymorda? Dobrze, czemu nie.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//Przy�lij tu tego cher�aka, niech poka�e, co potrafi.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//Zg�o� si� po niego za jakie� dwa dni. Mo�e do tego czasu b�dzie ju� w stanie utrzyma� si� na nogach.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//Jak du�o chcesz postawi�?
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nic.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 sztuk z�ota.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_annehmen()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//Wezm� pieni�dze na przechowanie, dop�ki konkurs si� nie sko�czy, dobra?
	DIA_RUKHAR_RANDOLPHWILL_NOPERM = TRUE;
};

func void dia_rukhar_randolphwill_mehr()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nic.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 sztuk z�ota.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//Nic.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//W takim razie zapomnij o ca�ej sprawie.
	AI_StopProcessInfos(self);
};

func void dia_rukhar_randolphwill_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 sztuk z�ota.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//No dalej, chyba nie m�wisz tego powa�nie. Kilka sztuk wi�cej chyba ci� nie zbawi?
	RUKHAR_EINSATZ = 10;
	RUKHAR_GEWINN = 20;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(wyb�r innej stawki)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(przyj�cie stawki)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//Je�li ju� chcesz si� zak�ada�, to sypnij kas�.
	RUKHAR_EINSATZ = 20;
	RUKHAR_GEWINN = 40;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(wyb�r innej stawki)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(przyj�cie stawki)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//Nie za wiele, ale to ju� co�.
	RUKHAR_EINSATZ = 50;
	RUKHAR_GEWINN = 100;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(wyb�r innej stawki)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(przyj�cie stawki)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//To mi si� podoba.
	RUKHAR_EINSATZ = 100;
	RUKHAR_GEWINN = 200;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(wyb�r innej stawki)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(przyj�cie stawki)",dia_rukhar_randolphwill_annehmen);
};


instance DIA_RUKHAR_ICHSEHEDICH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_ichsehedich_condition;
	information = dia_rukhar_ichsehedich_info;
	permanent = TRUE;
	description = "Oto m�j wk�ad.";
};


var int dia_rukhar_ichsehedich_noperm;

func int dia_rukhar_ichsehedich_condition()
{
	if((DIA_RUKHAR_ICHSEHEDICH_NOPERM == FALSE) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == TRUE) && (RUKHAR_EINSATZ != 0))
	{
		return TRUE;
	};
};

func void dia_rukhar_ichsehedich_info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//Oto m�j wk�ad.
	if(b_giveinvitems(other,self,itmi_gold,RUKHAR_EINSATZ))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//W porz�dku. Id� po Randolpha, i niech ci to nie zajmie ca�ego dnia, s�yszysz?
		DIA_RUKHAR_ICHSEHEDICH_NOPERM = TRUE;
		MIS_RUKHAR_WETTKAMPF = LOG_RUNNING;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//Bardzo �mieszne. Wr��, kiedy b�dziesz mia� pieni�dze.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_GELDZURUECK(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_geldzurueck_condition;
	information = dia_rukhar_geldzurueck_info;
	permanent = TRUE;
	description = "��dam zwrotu pieni�dzy.";
};


func int dia_rukhar_geldzurueck_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == TRUE))
	{
		return TRUE;
	};
};

func void dia_rukhar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//��dam zwrotu pieni�dzy.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//D�ugi to kwestia honoru, przyjacielu. Trzeba to by�o przemy�le� wcze�niej.
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HAENSELN(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_haenseln_condition;
	information = dia_rukhar_haenseln_info;
	permanent = TRUE;
	description = "Chyba przeliczy�e� si� nieco z si�ami.";
};


func int dia_rukhar_haenseln_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == FALSE))
	{
		return TRUE;
	};
};


var int dia_rukhar_haenseln_nureimalgeld;

func void dia_rukhar_haenseln_info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//Chyba przeliczy�e� nieco swoje si�y.
	if(DIA_RUKHAR_HAENSELN_NUREIMALGELD == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//Bierz swoje pieni�dze i ani s�owa wi�cej.
		b_giveplayerxp(XP_RUKHAR_LOST);
		IntToFloat(RUKHAR_GEWINN);
		CreateInvItems(self,itmi_gold,RUKHAR_GEWINN);
		b_giveinvitems(self,other,itmi_gold,RUKHAR_GEWINN);
		DIA_RUKHAR_HAENSELN_NUREIMALGELD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//Ju� ja ci si� odwdzi�cz�, mo�esz by� tego pewien.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_PERM(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 7;
	condition = dia_rukhar_perm_condition;
	information = dia_rukhar_perm_info;
	permanent = TRUE;
	description = "Czy dzia�o si� tu jeszcze co� interesuj�cego?";
};


func int dia_rukhar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_perm_info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//Czy dzia�o si� tu jeszcze co� interesuj�cego?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//Nie mam poj�cia. Nikt mi o niczym nie m�wi.
};


instance DIA_RUKHAR_PICKPOCKET(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 900;
	condition = dia_rukhar_pickpocket_condition;
	information = dia_rukhar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rukhar_pickpocket_condition()
{
	return c_beklauen(26,30);
};

func void dia_rukhar_pickpocket_info()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_BACK,dia_rukhar_pickpocket_back);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_PICKPOCKET,dia_rukhar_pickpocket_doit);
};

func void dia_rukhar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rukhar_pickpocket);
};

func void dia_rukhar_pickpocket_back()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
};

