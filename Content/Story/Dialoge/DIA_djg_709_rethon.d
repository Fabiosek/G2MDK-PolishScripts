
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
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//Przygotowujê siê do walki, a co innego mogê robiæ?
};


instance DIA_RETHON_KAMPF(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_kampf_condition;
	information = dia_rethon_kampf_info;
	description = "Z kim chcesz walczyæ?";
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
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//Z kim chcesz walczyæ?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//Pomyœla³em sobie, ¿e odwiedzê kilku paladynów i skopiê im ich t³uste ty³ki.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//Dureñ. Ze smokami oczywiœcie. A ty myœla³eœ, ¿e z kim?
};


instance DIA_RETHON_PALADINE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_paladine_condition;
	information = dia_rethon_paladine_info;
	description = "Czy paladynów nie denerwuje twoja obecnoœæ?";
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
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//Czy paladynów nie denerwuje twoja obecnoœæ?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//Niby dlaczego? Paladyni maj¹ wiêksze problemy. Wiêkszoœæ z nich cieszy siê, ¿e jeszcze ¿yje.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//Morale ch³opców szybko siê pogarsza. Nied³ugo ca³kowicie siê za³ami¹.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//Popatrz tylko na te ich ostrza, z którymi wybieraj¹ siê do bitwy.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//Ka¿dy rozs¹dny wojak dawno by uciek³.
};


instance DIA_RETHON_WOGRUPPE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 7;
	condition = dia_rethon_wogruppe_condition;
	information = dia_rethon_wogruppe_info;
	description = "Oddzieli³eœ siê od swojej grupy?";
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
	AI_Output(other,self,"DIA_Rethon_WOGRUPPE_15_00");	//Oddzieli³eœ siê od swojej grupy?
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//Mojej grupy? Nie nale¿ê do ¿adnej grupy. Kolekcjonujê trofea.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//Jeœli wrócê do domu bez trofeum, ca³a wyprawa na nic. Jak widzisz, nie mam siê kim wyrêczyæ.
};


instance DIA_RETHON_DRACHENGESEHEN(C_INFO)
{
	npc = djg_709_rethon;
	nr = 8;
	condition = dia_rethon_drachengesehen_condition;
	information = dia_rethon_drachengesehen_info;
	description = "Widzia³eœ ju¿ jakiegoœ smoka?";
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
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//Widzia³eœ ju¿ jakiegoœ smoka?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//Nie, nim wyruszê na polowanie, muszê dobrze naostrzyæ broñ.
};


instance DIA_RETHON_ANGST(C_INFO)
{
	npc = djg_709_rethon;
	nr = 9;
	condition = dia_rethon_angst_condition;
	information = dia_rethon_angst_info;
	description = "Nikogo siê nie boisz?";
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
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//Nikogo siê nie boisz?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//Co? Kogo? Sylvia?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//Twój szef naprawdê myœli, ¿e przyjdzie tu i urz¹dzi masakrê, hê?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//Nie pracujê dla Sylvia, tylko dla siebie.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//Och. W takim razie zapomnij, ¿e coœ mówi³em.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//Widzia³eœ tych ¿a³osnych typków, którzy siê za nim w³ócz¹?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//Sylvio powinien siê cieszyæ, jeœli uda mu siê ujœæ st¹d z ¿yciem.
	if(Npc_IsDead(djg_sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//Nie uda mu siê. Nie ¿yje.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Mnie to nie przeszkadza.
	}
	else
	{
		Info_AddChoice(dia_rethon_angst,DIALOG_BACK,dia_rethon_angst_weiter);
		Info_AddChoice(dia_rethon_angst,"Chyba go nie lubisz, co?",dia_rethon_angst_sylviomoegen);
		Info_AddChoice(dia_rethon_angst,"Gdzie jest teraz Sylvio?",dia_rethon_angst_wosylvio);
		Info_AddChoice(dia_rethon_angst,"Sylvio by³ tutaj?",dia_rethon_angst_sylviohier);
	};
};

func void dia_rethon_angst_weiter()
{
	Info_ClearChoices(dia_rethon_angst);
};

func void dia_rethon_angst_sylviohier()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviohier_15_00");	//Sylvio by³ tutaj?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//W zamku? Tak, by³ tutaj. Jednak tylko przez chwilê.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//Porozmawia³ z kilkoma osobami i wyruszy³ dalej.
};

func void dia_rethon_angst_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//Chyba go nie lubisz, co?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//Co masz na myœli, mówi¹c 'nie lubisz'? Nie jest to znajomoœæ, z której by³bym jakoœ szczególnie dumny.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//Sylvio nie ma przyjació³. Jedynie popleczników pe³zn¹cych za nim krok w krok.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//To nie dla mnie. Ja pracujê sam.
};

func void dia_rethon_angst_wosylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//Gdzie jest teraz Sylvio?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//Tutejsi paladyni wspominali coœ o lodowym smoku na zachodzie. Mówi siê, ¿e jest najwiêkszy i najgroŸniejszy z tych wszystkich bestii.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//Powinieneœ by³ widzieæ b³ysk w oczach Sylvia, kiedy siê o tym dowiedzia³. Mo¿na wiêc chyba odgadn¹æ, dok¹d polaz³.
	b_logentry(TOPIC_DRACHENJAGD,"£owca smoków Rethon mówi³ coœ o lodowym smoku.");
	b_logentry(TOPIC_DRAGONHUNTER,"Sylvio by³ w zamku, a potem wyruszy³ na poszukiwania lodowego smoka.");
};


instance DIA_RETHON_MEINEWAFFE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 10;
	condition = dia_rethon_meinewaffe_condition;
	information = dia_rethon_meinewaffe_info;
	description = "Czy móg³byœ pomóc mi ulepszyæ broñ?";
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
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//Czy móg³byœ mi pomóc ulepszyæ broñ?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//Ulepszyæ? Lepiej kup sobie coœ nowego i czym prêdzej pozb¹dŸ siê tego swojego rupiecia.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//Mo¿e mia³bym coœ dla ciebie. Zainteresowany?
};


instance DIA_RETHON_TRADE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 11;
	condition = dia_rethon_trade_condition;
	information = dia_rethon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mo¿esz mi sprzedaæ?";
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
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//Co mo¿esz mi sprzedaæ?
	b_givetradeinv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//Spójrz, jak nisko upad³em. Sprzedajê broñ paladynowi.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//Nie mam zbyt wielu towarów dla maga, ale zerknij, proszê...
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//Wydaje mi siê, ¿e mam to, czego szukasz.
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

