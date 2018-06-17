
instance DIA_RETHON_EXIT(C_INFO)
{
	npc = djg_709_rethon;
	nr = 999;
	condition = dia_rethon_exit_condition;
	information = dia_rethon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rethon_exit_condition()
{
	return TRUE;
};

func void dia_rethon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RETHON_HALLO(C_INFO)
{
	npc = djg_709_rethon;
	nr = 5;
	condition = dia_rethon_hallo_condition;
	information = dia_rethon_hallo_info;
	description = "Co tu porabiasz?";
};


func int dia_rethon_hallo_condition()
{
	return TRUE;
};

func void dia_rethon_hallo_info()
{
	AI_Output(other,self,"DIA_Rethon_HALLO_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//Przygotowuj� si� do walki, a co innego mog� robi�?
};


instance DIA_RETHON_KAMPF(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_kampf_condition;
	information = dia_rethon_kampf_info;
	description = "Z kim chcesz walczy�?";
};


func int dia_rethon_kampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_kampf_info()
{
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//Z kim chcesz walczy�?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//Pomy�la�em sobie, �e odwiedz� kilku paladyn�w i skopi� im ich t�uste ty�ki.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//Dure�. Ze smokami oczywi�cie. A ty my�la�e�, �e z kim?
};


instance DIA_RETHON_PALADINE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_paladine_condition;
	information = dia_rethon_paladine_info;
	description = "Czy paladyn�w nie denerwuje twoja obecno��?";
};


func int dia_rethon_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_paladine_info()
{
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//Czy paladyn�w nie denerwuje twoja obecno��?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//Niby dlaczego? Paladyni maj� wi�ksze problemy. Wi�kszo�� z nich cieszy si�, �e jeszcze �yje.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//Morale ch�opc�w szybko si� pogarsza. Nied�ugo ca�kowicie si� za�ami�.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//Popatrz tylko na te ich ostrza, z kt�rymi wybieraj� si� do bitwy.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//Ka�dy rozs�dny wojak dawno by uciek�.
};


instance DIA_RETHON_WOGRUPPE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 7;
	condition = dia_rethon_wogruppe_condition;
	information = dia_rethon_wogruppe_info;
	description = "Oddzieli�e� si� od swojej grupy?";
};


func int dia_rethon_wogruppe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_wogruppe_info()
{
	AI_Output(other,self,"DIA_Rethon_WOGRUPPE_15_00");	//Oddzieli�e� si� od swojej grupy?
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//Mojej grupy? Nie nale�� do �adnej grupy. Kolekcjonuj� trofea.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//Je�li wr�c� do domu bez trofeum, ca�a wyprawa na nic. Jak widzisz, nie mam si� kim wyr�czy�.
};


instance DIA_RETHON_DRACHENGESEHEN(C_INFO)
{
	npc = djg_709_rethon;
	nr = 8;
	condition = dia_rethon_drachengesehen_condition;
	information = dia_rethon_drachengesehen_info;
	description = "Widzia�e� ju� jakiego� smoka?";
};


func int dia_rethon_drachengesehen_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_kampf))
	{
		return TRUE;
	};
};

func void dia_rethon_drachengesehen_info()
{
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//Widzia�e� ju� jakiego� smoka?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//Nie, nim wyrusz� na polowanie, musz� dobrze naostrzy� bro�.
};


instance DIA_RETHON_ANGST(C_INFO)
{
	npc = djg_709_rethon;
	nr = 9;
	condition = dia_rethon_angst_condition;
	information = dia_rethon_angst_info;
	description = "Nikogo si� nie boisz?";
};


func int dia_rethon_angst_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_wogruppe))
	{
		return TRUE;
	};
};

func void dia_rethon_angst_info()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//Nikogo si� nie boisz?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//Co? Kogo? Sylvia?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//Tw�j szef naprawd� my�li, �e przyjdzie tu i urz�dzi masakr�, h�?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//Nie pracuj� dla Sylvia, tylko dla siebie.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//Och. W takim razie zapomnij, �e co� m�wi�em.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//Widzia�e� tych �a�osnych typk�w, kt�rzy si� za nim w��cz�?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//Sylvio powinien si� cieszy�, je�li uda mu si� uj�� st�d z �yciem.
	if(Npc_IsDead(djg_sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//Nie uda mu si�. Nie �yje.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Mnie to nie przeszkadza.
	}
	else
	{
		Info_AddChoice(dia_rethon_angst,DIALOG_BACK,dia_rethon_angst_weiter);
		Info_AddChoice(dia_rethon_angst,"Chyba go nie lubisz, co?",dia_rethon_angst_sylviomoegen);
		Info_AddChoice(dia_rethon_angst,"Gdzie jest teraz Sylvio?",dia_rethon_angst_wosylvio);
		Info_AddChoice(dia_rethon_angst,"Sylvio by� tutaj?",dia_rethon_angst_sylviohier);
	};
};

func void dia_rethon_angst_weiter()
{
	Info_ClearChoices(dia_rethon_angst);
};

func void dia_rethon_angst_sylviohier()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviohier_15_00");	//Sylvio by� tutaj?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//W zamku? Tak, by� tutaj. Jednak tylko przez chwil�.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//Porozmawia� z kilkoma osobami i wyruszy� dalej.
};

func void dia_rethon_angst_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//Chyba go nie lubisz, co?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//Co masz na my�li, m�wi�c 'nie lubisz'? Nie jest to znajomo��, z kt�rej by�bym jako� szczeg�lnie dumny.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//Sylvio nie ma przyjaci�. Jedynie poplecznik�w pe�zn�cych za nim krok w krok.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//To nie dla mnie. Ja pracuj� sam.
};

func void dia_rethon_angst_wosylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//Gdzie jest teraz Sylvio?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//Tutejsi paladyni wspominali co� o lodowym smoku na zachodzie. M�wi si�, �e jest najwi�kszy i najgro�niejszy z tych wszystkich bestii.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//Powiniene� by� widzie� b�ysk w oczach Sylvia, kiedy si� o tym dowiedzia�. Mo�na wi�c chyba odgadn��, dok�d polaz�.
	b_logentry(TOPIC_DRACHENJAGD,"�owca smok�w Rethon m�wi� co� o lodowym smoku.");
	b_logentry(TOPIC_DRAGONHUNTER,"Sylvio by� w zamku, a potem wyruszy� na poszukiwania lodowego smoka.");
};


instance DIA_RETHON_MEINEWAFFE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 10;
	condition = dia_rethon_meinewaffe_condition;
	information = dia_rethon_meinewaffe_info;
	description = "Czy m�g�by� pom�c mi ulepszy� bro�?";
};


func int dia_rethon_meinewaffe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_paladine))
	{
		return TRUE;
	};
};

func void dia_rethon_meinewaffe_info()
{
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//Czy m�g�by� mi pom�c ulepszy� bro�?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//Ulepszy�? Lepiej kup sobie co� nowego i czym pr�dzej pozb�d� si� tego swojego rupiecia.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//Mo�e mia�bym co� dla ciebie. Zainteresowany?
};


instance DIA_RETHON_TRADE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 11;
	condition = dia_rethon_trade_condition;
	information = dia_rethon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mo�esz mi sprzeda�?";
};


func int dia_rethon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_meinewaffe))
	{
		return TRUE;
	};
};

func void dia_rethon_trade_info()
{
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//Co mo�esz mi sprzeda�?
	b_givetradeinv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//Sp�jrz, jak nisko upad�em. Sprzedaj� bro� paladynowi.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//Nie mam zbyt wielu towar�w dla maga, ale zerknij, prosz�...
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//Wydaje mi si�, �e mam to, czego szukasz.
	};
};


instance DIA_RETHON_PICKPOCKET(C_INFO)
{
	npc = djg_709_rethon;
	nr = 900;
	condition = dia_rethon_pickpocket_condition;
	information = dia_rethon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_rethon_pickpocket_condition()
{
	return c_beklauen(78,230);
};

func void dia_rethon_pickpocket_info()
{
	Info_ClearChoices(dia_rethon_pickpocket);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_BACK,dia_rethon_pickpocket_back);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_PICKPOCKET,dia_rethon_pickpocket_doit);
};

func void dia_rethon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rethon_pickpocket);
};

func void dia_rethon_pickpocket_back()
{
	Info_ClearChoices(dia_rethon_pickpocket);
};

