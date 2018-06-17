
instance DIA_PABLO_EXIT(C_INFO)
{
	npc = mil_319_pablo;
	nr = 999;
	condition = dia_pablo_exit_condition;
	information = dia_pablo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pablo_exit_condition()
{
	return TRUE;
};

func void dia_pablo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_PICKPOCKET(C_INFO)
{
	npc = mil_319_pablo;
	nr = 900;
	condition = dia_pablo_pickpocket_condition;
	information = dia_pablo_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie dziecinnie ³atwa)";
};


func int dia_pablo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_pablo_pickpocket_info()
{
	Info_ClearChoices(dia_pablo_pickpocket);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_BACK,dia_pablo_pickpocket_back);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_PICKPOCKET,dia_pablo_pickpocket_doit);
};

func void dia_pablo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_city_tower_01,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_pablo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_pablo_pickpocket_back()
{
	Info_ClearChoices(dia_pablo_pickpocket);
};


var int pablo_belogen;

instance DIA_PABLO_WANTED(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_wanted_condition;
	information = dia_pablo_wanted_info;
	important = TRUE;
};


func int dia_pablo_wanted_condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pablo_wanted_info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Hej ty, zaczekaj! Chyba gdzieœ ciê ju¿ widzia³em.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//Mówiê przecie¿, ¿e ju¿ ciê gdzieœ widzia³em... a, tak!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Spójrz - znaleŸliœmy ten portret przy bandytach, na których natknêliœmy siê kilka dni temu - facet wygl¹da zupe³nie jak ty.
	b_giveinvitems(self,other,itwr_poster_mis,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//Ci kolesie chyba ciê szukali.
	Info_ClearChoices(dia_pablo_wanted);
	Info_AddChoice(dia_pablo_wanted,"Nie, mylisz siê.",dia_pablo_wanted_nothing);
	Info_AddChoice(dia_pablo_wanted,"No, no. Sam bym na to nie wpad³.",dia_pablo_wanted_irony);
};

func void dia_pablo_wanted_nothing()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Mylisz siê. Jak widzisz, wszystko ze mn¹ w porz¹dku...
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Jak uwa¿asz, nieznajomy...
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Jeœli jednak portret przedstawia TWOJ¥ gêbê, a ty wmiesza³eœ siê w jakieœ k³opoty, to trzymaj siê z dala od miasta. Nie potrzeba nam wiêcej problemów.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//Nie potrzebujemy tu ¿adnych zabijaków - mam nadziejê, ¿e wyra¿am siê jasno.
	PABLO_BELOGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pablo_wanted_irony()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//No, no. Sam bym na to nie wpad³.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Bardzo œmieszne... gadaj lepiej, czego chcieli od ciebie ci ludzie?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Zapytaj ich o to sam. Chyba ich zamkn¹³eœ, prawda?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Nie - nie ¿yj¹.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//W takim razie nigdy siê nie dowiemy.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//Jeœli masz jakieœ k³opoty, porozmawiaj z Lordem Andre. Mo¿e on bêdzie w stanie ci pomóc. Znajdziesz go w koszarach.
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_BANDITEN(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_banditen_condition;
	information = dia_pablo_banditen_info;
	permanent = FALSE;
	description = "Co wiesz na temat bandytów?";
};


func int dia_pablo_banditen_condition()
{
	return TRUE;
};

func void dia_pablo_banditen_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Co wiesz o bandytach?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//Przybyli z tej zakichanej kolonii górniczej. Jest jednak kilka oddzielnych grup.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Niektórzy ukryli siê w górach, inni do³¹czyli do Onara, w³aœciciela ziemskiego.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Jednak to bandyci na obrze¿ach miasta powoduj¹ najwiêcej problemów.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//To przez nich kupcy nie wyœciubiaj¹ nosów poza granice miasta.
};


instance DIA_PABLO_HAKONBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_hakonbandits_condition;
	information = dia_pablo_hakonbandits_info;
	permanent = FALSE;
	description = "Co wiesz o bandytach, którzy obrabowali kupca Hakona?";
};


func int dia_pablo_hakonbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_miliz) && Npc_KnowsInfo(other,dia_pablo_banditen))
	{
		return TRUE;
	};
};

func void dia_pablo_hakonbandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Co wiesz o bandytach, którzy obrabowali kupca Hakona?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Och, o tej sprawie mówisz. Nawet mi jej nie przypominaj...
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Podobno ta grupa jest odpowiedzialna za wiele ataków na kupców.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Ostatnio te szczury powpe³za³y do swoich nor i boj¹ siê wyœciubiæ nosa.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Kiedyœ wytropiliœmy ich, ale œlad urwa³ siê nagle w lasach za miastem.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//W tamtych okolicach grasuje wiele potworów, to zbyt niebezpieczne miejsce.
	b_logentry(TOPIC_HAKONBANDITEN,"Bandyci, którzy obrabowali Hakona, ukrywaj¹ siê w lasach w pobli¿u miasta.");
	if(PABLO_ANDREMELDEN == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Jest jeszcze coœ...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//Niektóre ze skradzionych towarów pojawi³y siê w Khorinis.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//Oznacza³oby to, ¿e bandyci przemycaj¹ towary do miasta, i tam je sprzedaj¹.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//No có¿, podejrzewamy, ¿e maj¹ swojego cz³owieka wœród stra¿ników. Jak dot¹d nie uda³o siê go jednak z³apaæ.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Jeœli dowiesz siê czegoœ na ten temat, pamiêtaj - Lord Andre wyznaczy³ nagrodê za odnalezienie tego zdrajcy.
		b_logentry(TOPIC_HAKONBANDITEN,"Bandyci s¹ prawdopodobnie w zmowie z jakimœ dealerem w mieœcie. Za jego schwytanie Lord Andre wyznaczy³ nagrodê.");
	};
};


instance DIA_PABLO_MYBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 4;
	condition = dia_pablo_mybandits_condition;
	information = dia_pablo_mybandits_info;
	permanent = FALSE;
	description = "Sk¹d przybyli bandyci, którzy mieli list goñczy z moj¹ podobizn¹?";
};


func int dia_pablo_mybandits_condition()
{
	if(Npc_KnowsInfo(other,dia_pablo_banditen) && Npc_KnowsInfo(other,dia_pablo_wanted))
	{
		return TRUE;
	};
};

func void dia_pablo_mybandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//Sk¹d przybyli bandyci, którzy mieli list goñczy z moj¹ podobizn¹?
	if(PABLO_BELOGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//Aha! Wiêc to jednak TWOJA gêba znajduje siê na tym papierze. Dlaczego siê od razu nie przyzna³eœ, co?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//Za co jesteœ poszukiwany?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//Nie wiem - szczerze!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Tak, tak. Wiem. Pozwól, ¿e coœ ci powiem - gdybym wiedzia³, ¿e trzymasz sztamê z tymi bandytami, dawno siedzia³byœ w pierdlu, rozumiesz?
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//Mimo to muszê zg³osiæ ten przypadek Lordowi Andre...
		PABLO_ANDREMELDEN = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Wracaj¹c jednak do twojego pytania...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Natknêliœmy siê na nich niedaleko domu w³aœciciela ziemskiego.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Nie wygl¹dali jednak jak banda Onara.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//Wydaje mi siê, ¿e to czêœæ mniejszej grupy, która osiedli³a siê w górach, niedaleko posiad³oœci Onara.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Jeœli siê tam wybierasz, przyjmij ostrze¿enie. Ci szubrawcy krótko siê z tob¹ rozprawi¹!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Zapamiêtam to.
};


instance DIA_PABLO_PERM(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_perm_condition;
	information = dia_pablo_perm_info;
	permanent = TRUE;
	description = "Jak wygl¹da sytuacja?";
};


func int dia_pablo_perm_condition()
{
	return TRUE;
};

func void dia_pablo_perm_info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Jak wygl¹da sytuacja?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//Zawsze powtarza³em, ¿e najemnikom nie wolno ufaæ.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Najwy¿szy czas daæ tym szumowinom nauczkê. Bennet przecie¿ sam nie wymyœli³ tego wszystkiego.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//Œmieræ paladyna Lothara wstrz¹snê³a mn¹ do g³êbi.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Wiem jednak, ¿e s³udzy œwi¹tyni odnajd¹ winnego i surowo go ukarz¹.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Po co w³óczysz siê po okolicy? Jeœli chcesz uwolniæ tego najemnika, swego kole¿kê, to lepiej od razu o tym zapomnij.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//To ¿a³osne, teraz próbuj¹ nas ze sob¹ sk³óciæ.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Gdyby nie uda³o ci siê odnaleŸæ prawdziwego winowajcy, orkowie mieliby znacznie u³atwion¹ sprawê.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//Martwi mnie to, co mo¿e siê staæ, jeœli paladyni opuszcz¹ to miejsce.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Mo¿esz na nas liczyæ, u¿yjemy wszystkich dostêpnych œrodków, by to miasto nie zmieni³o siê w siedlisko zbrodni.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Uwa¿aj na to, co robisz. Takich ³otrzyków jak ty mamy tu ca³y czas na oku.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//W tej chwili panuje tu spokój. Jedynie bandyci spoza miasta sprawiaj¹ pewne problemy.
	};
};

