
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
	description = "Potrzebujê pomocy w sprz¹taniu sal nowicjuszy.";
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
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//Potrzebujê pomocy przy sprz¹taniu sal nowicjuszy.
	if(Hlp_GetInstanceID(feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_HELFER < 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//Czy¿by nikt nie zgodzi³ ci siê pomóc? Dobrze... Bêdê ci towarzyszy³ przy tym zajêciu, jeœli znajdziesz jeszcze przynajmniej jedn¹ osobê, która zgodzi siê na to samo.
			b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz sprz¹taj¹cy piwnicê pomo¿e mi, jeœli zdo³am znaleŸæ innego chêtnego do pomocy w sprz¹taniu komnat.");
		}
		else if((NOV_HELFER >= 1) && (FEGER1_PERMANENT == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//Czy bêdê jedyn¹ osob¹ pomagaj¹c¹ ci w pracy?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//Nie, ju¿ ktoœ mi pomaga.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//A wiêc i ja do was do³¹czê.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER1_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz z piwnicy pomo¿e mi teraz posprz¹taæ komnaty.");
		}
		else if(FEGER1_PERMANENT == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//Bracie! Ju¿ przecie¿ ci pomagam, nie musisz mnie dalej nak³aniaæ.
		};
	};
	if(Hlp_GetInstanceID(feger2) == Hlp_GetInstanceID(self))
	{
		if(FEGER2_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//Oczywiœcie, ¿e ci pomogê. My nowicjusze powinniœmy trzymaæ siê razem. Rêka rêkê myje, jeœli wiesz co mam na myœli.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//Potrzebujê jednak 50 sztuk z³ota, w koñcu muszê sp³aciæ Parlana.
			b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz sprzed œwi¹tyni pomo¿e mi, jeœli dam mu 50 sztuk z³ota.");
			Info_ClearChoices(dia_nov_3_fegen);
			Info_AddChoice(dia_nov_3_fegen,"Mo¿e póŸniej...",dia_nov_3_fegen_nein);
			if(Npc_HasItems(other,itmi_gold) >= 50)
			{
				Info_AddChoice(dia_nov_3_fegen,"W porz¹dku, ju¿ p³acê.",dia_nov_3_fegen_ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//Przecie¿ obieca³em. Ty pomog³eœ mnie, ja pomogê tobie.
		};
	};
	if((Hlp_GetInstanceID(feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//Wykluczone - nie mam na to czasu. Poszukaj sobie kogoœ innego do pomocy.
	};
};

func void dia_nov_3_fegen_nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//Mo¿e innym razem, teraz nie staæ mnie na taki wydatek.
	Info_ClearChoices(dia_nov_3_fegen);
};

func void dia_nov_3_fegen_ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//W porz¹dku, ju¿ p³acê.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//Biorê siê wiêc do pracy.
	b_giveinvitems(other,self,itmi_gold,50);
	NOV_HELFER = NOV_HELFER + 1;
	b_giveplayerxp(XP_FEGER);
	FEGER2_PERMANENT = TRUE;
	Info_ClearChoices(dia_nov_3_fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	b_logentry(TOPIC_PARLANFEGEN,"Nowicjusz sprzed œwi¹tyni pomo¿e mi teraz posprz¹taæ komnaty.");
};


instance DIA_NOV_3_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_3_wurst_condition;
	information = dia_nov_3_wurst_info;
	permanent = TRUE;
	description = "Chcesz spróbowaæ kie³basy?";
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
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//Mo¿e chcesz kie³basê?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//Jasne, czemu nie. Wygl¹da smakowicie.
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
	description = "Chcia³bym zostaæ magiem.";
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
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Chcia³bym zostaæ magiem.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//Wiêkszoœæ nowicjuszy tego pragnie, jednak niewielu z nich udaje siê zyskaæ tytu³ Wybrañca, i szansê przyjêcia do Krêgu Ognia.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//Najwy¿szym zaszczytem, jakiego mo¿esz dost¹piæ w naszym zakonie, jest tytu³ maga Krêgu Ognia.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//Bêdziesz musia³ ciê¿ko pracowaæ, by zas³u¿yæ na swoj¹ szansê.
};


instance DIA_NOV_3_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_3_people_condition;
	information = dia_nov_3_people_info;
	permanent = TRUE;
	description = "Kto jest przywódc¹ klasztoru?";
};


func int dia_nov_3_people_condition()
{
	return TRUE;
};

func void dia_nov_3_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Kto jest przywódc¹ klasztoru?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//My, nowicjusze, s³u¿ymy magom Krêgu Ognia. Oni zaœ podlegaj¹ decyzjom Najwy¿szej Rady, w sk³ad której wchodz¹ trzej najpotê¿niejsi magowie.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//Sprawami nowicjuszy zajmuje siê jednak Parlan. Prawie zawsze przesiaduje na dziedziñcu, nadzoruj¹c ich pracê.
};


instance DIA_NOV_3_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_3_location_condition;
	information = dia_nov_3_location_info;
	permanent = TRUE;
	description = "Co mo¿esz mi powiedzieæ o tym klasztorze?";
};


func int dia_nov_3_location_condition()
{
	return TRUE;
};

func void dia_nov_3_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Co mo¿esz mi powiedzieæ o tym klasztorze?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//¯yjemy tu bardzo skromnie. Hodujemy owce i wytwarzamy wino.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//Mamy te¿ bibliotekê, ale dostêp do niej posiadaj¹ jedynie magowie i wybrani nowicjusze.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//My, nowicjusze, dbamy o to, by niczego nie zabrak³o magom Krêgu Ognia.
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
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//Dobre pytanie! Nowicjusze rozmawiaj¹ tylko o tobie.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//Naprawdê rzadko siê zdarza, aby ktoœ obcy zosta³ tak szybko przyjêty do Krêgu Ognia.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//Nadszed³ czas. Wkrótce któryœ z nowicjuszy zostanie przyjêty do Krêgu Ognia.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//Wkrótce rozpoczn¹ siê próby.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//Beliar zdo³a³ przenikn¹æ do naszego klasztoru! Jego potêga roœnie, skoro nawet tutaj ma ju¿ swoich sojuszników...
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//Pedro s³u¿y³ w zakonie przez lata. Obawiam siê jednak, ¿e spêdzi³ poza tymi murami zbyt wiele czasu, to zaœ os³abi³o jego wiarê i uczyni³o podatnym na wp³ywy Beliara.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//Przybywasz we w³aœciwym czasie. Chyba sam Innos ciê tu przys³a³.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//Tajemnice zakonu poznasz ju¿ jako obroñca Oka.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//Z Górniczej Doliny docieraj¹ do nas niepokoj¹ce wieœci. Innos wystawia nas na ciê¿k¹ próbê.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//Paladyni, którzy wyruszyli w kierunku Górniczej Doliny, nie daj¹ znaku ¿ycia. Jedynie Najwy¿sza Rada wie, co nale¿y robiæ.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//Zniszczymy smoki z pomoc¹ naszego Pana! Jedynie gniew Innosa jest w stanie przeciwstawiæ siê bestiom Beliara.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//Chwa³a Innosowi, ¿e nie dopuœci³ do nastêpnego konfliktu. Jedynie powrót na œcie¿kê naszego Pana da nam si³ê do przeciwstawienia siê Z³u.
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

