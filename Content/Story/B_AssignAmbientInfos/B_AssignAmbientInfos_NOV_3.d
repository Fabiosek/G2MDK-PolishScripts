
instance DIA_NOV_3_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_3_exit_condition;
	information = dia_nov_3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_3_exit_condition()
{
	return TRUE;
};

func void dia_nov_3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_3_fegen_condition;
	information = dia_nov_3_fegen_info;
	permanent = TRUE;
	description = "Potrzebuj� pomocy w sprz�taniu sal nowicjuszy.";
};


var int feger1_permanent;
var int feger2_permanent;

func int dia_nov_3_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};

func void dia_nov_3_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//Potrzebuj� pomocy przy sprz�taniu sal nowicjuszy.
	if(Hlp_GetInstanceID(feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_HELFER < 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//Czy�by nikt nie zgodzi� ci si� pom�c? Dobrze... B�d� ci towarzyszy� przy tym zaj�ciu, je�li znajdziesz jeszcze przynajmniej jedn� osob�, kt�ra zgodzi si� na to samo.
			b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz sprz�taj�cy piwnic� pomo�e mi, je�li zdo�am znale�� innego ch�tnego do pomocy w sprz�taniu komnat.");
		}
		else if((NOV_HELFER >= 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//Czy b�d� jedyn� osob� pomagaj�c� ci w pracy?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//Nie, ju� kto� mi pomaga.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//A wi�c i ja do was do��cz�.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER1_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz z piwnicy pomo�e mi teraz posprz�ta� komnaty.");
		}
		else if(FEGER1_PERMANENT == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//Bracie! Ju� przecie� ci pomagam, nie musisz mnie dalej nak�ania�.
		};
	};
	if(Hlp_GetInstanceID(feger2) == Hlp_GetInstanceID(self))
	{
		if(FEGER2_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//Oczywi�cie, �e ci pomog�. My nowicjusze powinni�my trzyma� si� razem. R�ka r�k� myje, je�li wiesz co mam na my�li.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//Potrzebuj� jednak 50 sztuk z�ota, w ko�cu musz� sp�aci� Parlana.
			b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz sprzed �wi�tyni pomo�e mi, je�li dam mu 50 sztuk z�ota.");
			Info_ClearChoices(dia_nov_3_fegen);
			Info_AddChoice(dia_nov_3_fegen,"Mo�e p�niej...",dia_nov_3_fegen_nein);
			if(Npc_HasItems(other,itmi_gold) >= 50)
			{
				Info_AddChoice(dia_nov_3_fegen,"W porz�dku, ju� p�ac�.",dia_nov_3_fegen_ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//Przecie� obieca�em. Ty pomog�e� mnie, ja pomog� tobie.
		};
	};
	if((Hlp_GetInstanceID(feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//Wykluczone - nie mam na to czasu. Poszukaj sobie kogo� innego do pomocy.
	};
};

func void dia_nov_3_fegen_nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//Mo�e innym razem, teraz nie sta� mnie na taki wydatek.
	Info_ClearChoices(dia_nov_3_fegen);
};

func void dia_nov_3_fegen_ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//W porz�dku, ju� p�ac�.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//Bior� si� wi�c do pracy.
	b_giveinvitems(other,self,itmi_gold,50);
	NOV_HELFER = NOV_HELFER + 1;
	b_giveplayerxp(XP_FEGER);
	FEGER2_PERMANENT = TRUE;
	Info_ClearChoices(dia_nov_3_fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz sprzed �wi�tyni pomo�e mi teraz posprz�ta� komnaty.");
};


instance DIA_NOV_3_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_3_wurst_condition;
	information = dia_nov_3_wurst_info;
	permanent = TRUE;
	description = "Chcesz spr�bowa� kie�basy?";
};


func int dia_nov_3_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_3_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//Mo�e chcesz kie�bas�?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//Jasne, czemu nie. Wygl�da smakowicie.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_NOV_3_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_3_join_condition;
	information = dia_nov_3_join_info;
	permanent = TRUE;
	description = "Chcia�bym zosta� magiem.";
};


func int dia_nov_3_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_3_join_info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Chcia�bym zosta� magiem.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//Wi�kszo�� nowicjuszy tego pragnie, jednak niewielu z nich udaje si� zyska� tytu� Wybra�ca, i szans� przyj�cia do Kr�gu Ognia.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//Najwy�szym zaszczytem, jakiego mo�esz dost�pi� w naszym zakonie, jest tytu� maga Kr�gu Ognia.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//B�dziesz musia� ci�ko pracowa�, by zas�u�y� na swoj� szans�.
};


instance DIA_NOV_3_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_3_people_condition;
	information = dia_nov_3_people_info;
	permanent = TRUE;
	description = "Kto jest przyw�dc� klasztoru?";
};


func int dia_nov_3_people_condition()
{
	return TRUE;
};

func void dia_nov_3_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Kto jest przyw�dc� klasztoru?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//My, nowicjusze, s�u�ymy magom Kr�gu Ognia. Oni za� podlegaj� decyzjom Najwy�szej Rady, w sk�ad kt�rej wchodz� trzej najpot�niejsi magowie.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//Sprawami nowicjuszy zajmuje si� jednak Parlan. Prawie zawsze przesiaduje na dziedzi�cu, nadzoruj�c ich prac�.
};


instance DIA_NOV_3_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_3_location_condition;
	information = dia_nov_3_location_info;
	permanent = TRUE;
	description = "Co mo�esz mi powiedzie� o tym klasztorze?";
};


func int dia_nov_3_location_condition()
{
	return TRUE;
};

func void dia_nov_3_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Co mo�esz mi powiedzie� o tym klasztorze?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//�yjemy tu bardzo skromnie. Hodujemy owce i wytwarzamy wino.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//Mamy te� bibliotek�, ale dost�p do niej posiadaj� jedynie magowie i wybrani nowicjusze.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//My, nowicjusze, dbamy o to, by niczego nie zabrak�o magom Kr�gu Ognia.
};


instance DIA_NOV_3_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_3_standard_condition;
	information = dia_nov_3_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_nov_3_standard_condition()
{
	return TRUE;
};

func void dia_nov_3_standard_info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//Dobre pytanie! Nowicjusze rozmawiaj� tylko o tobie.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//Naprawd� rzadko si� zdarza, aby kto� obcy zosta� tak szybko przyj�ty do Kr�gu Ognia.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//Nadszed� czas. Wkr�tce kt�ry� z nowicjuszy zostanie przyj�ty do Kr�gu Ognia.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//Wkr�tce rozpoczn� si� pr�by.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//Beliar zdo�a� przenikn�� do naszego klasztoru! Jego pot�ga ro�nie, skoro nawet tutaj ma ju� swoich sojusznik�w...
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//Pedro s�u�y� w zakonie przez lata. Obawiam si� jednak, �e sp�dzi� poza tymi murami zbyt wiele czasu, to za� os�abi�o jego wiar� i uczyni�o podatnym na wp�ywy Beliara.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//Przybywasz we w�a�ciwym czasie. Chyba sam Innos ci� tu przys�a�.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//Tajemnice zakonu poznasz ju� jako obro�ca Oka.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//Z G�rniczej Doliny docieraj� do nas niepokoj�ce wie�ci. Innos wystawia nas na ci�k� pr�b�.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//Paladyni, kt�rzy wyruszyli w kierunku G�rniczej Doliny, nie daj� znaku �ycia. Jedynie Najwy�sza Rada wie, co nale�y robi�.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//Zniszczymy smoki z pomoc� naszego Pana! Jedynie gniew Innosa jest w stanie przeciwstawi� si� bestiom Beliara.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//Chwa�a Innosowi, �e nie dopu�ci� do nast�pnego konfliktu. Jedynie powr�t na �cie�k� naszego Pana da nam si�� do przeciwstawienia si� Z�u.
	};
};

func void b_assignambientinfos_nov_3(var C_NPC slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_wurst.npc = Hlp_GetInstanceID(slf);
};

