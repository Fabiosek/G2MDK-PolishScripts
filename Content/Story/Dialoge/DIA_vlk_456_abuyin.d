
instance DIA_ABUYIN_EXIT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 999;
	condition = dia_abuyin_exit_condition;
	information = dia_abuyin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_abuyin_exit_condition()
{
	return TRUE;
};

func void dia_abuyin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABUYIN_PICKPOCKET(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 900;
	condition = dia_abuyin_pickpocket_condition;
	information = dia_abuyin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_abuyin_pickpocket_condition()
{
	return c_beklauen(75,200);
};

func void dia_abuyin_pickpocket_info()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_BACK,dia_abuyin_pickpocket_back);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_PICKPOCKET,dia_abuyin_pickpocket_doit);
};

func void dia_abuyin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_abuyin_pickpocket);
};

func void dia_abuyin_pickpocket_back()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
};


instance DIA_ABUYIN_HALLO(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_hallo_condition;
	information = dia_abuyin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_abuyin_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_abuyin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//Dziwne... Wydajesz mi siê znajomy, podró¿niku.
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//Có¿... Niezbadane s¹ tajniki czasu i przestrzeni... Wybacz mi brak grzecznoœci, synu cierpliwoœci - nie zosta³eœ nawet jeszcze powitany...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//Witaj, przyjacielu. Usi¹dŸ na mym dywanie i zaci¹gnij siê dymem z fajki.
};


instance DIA_ABUYIN_DU(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_du_condition;
	information = dia_abuyin_du_info;
	permanent = FALSE;
	description = "Kim jesteœ?";
};


func int dia_abuyin_du_condition()
{
	return TRUE;
};

func void dia_abuyin_du_info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Nazywam siê Abuyin ibn Djadir ibn Omar Kalid ben Hadji al Sharidi. Jestem mêdrcem i wró¿bit¹, astrologiem i znawc¹ tytoniu.
};


instance DIA_ABUYIN_KRAUT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_kraut_condition;
	information = dia_abuyin_kraut_info;
	permanent = FALSE;
	description = "Jaki tytoñ proponujesz?";
};


func int dia_abuyin_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du))
	{
		return TRUE;
	};
};

func void dia_abuyin_kraut_info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Jaki tytoñ proponujesz?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//Moje fajki nabite s¹ ostrym, orzeŸwiaj¹cym tytoniem jab³kowym.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Spróbuj, czego tylko zapragniesz, Synu Przygody.
};


instance DIA_ABUYIN_ANDEREN(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_anderen_condition;
	information = dia_abuyin_anderen_info;
	permanent = FALSE;
	description = "Czy masz jeszcze jakiœ inny tytoñ?";
};


func int dia_abuyin_anderen_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_kraut))
	{
		return TRUE;
	};
};

func void dia_abuyin_anderen_info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//Czy masz jeszcze jakiœ inny tytoñ?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//U¿ywam tylko najlepszego tytoniu. Ta mieszanka o aromacie jab³oni pochodzi z mojej ojczyzny, z Wysp Po³udniowych.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Ale, oczywiœcie, zawsze chêtnie spróbujê nowej mieszanki - jeœli komuœ uda³oby siê przyrz¹dziæ naprawdê dobr¹.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//Jak to siê robi?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//WeŸ na przyk³ad moje jab³kowe ziele. A potem spróbuj zmieszaæ je z innymi sk³adnikami.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//Mo¿esz to zrobiæ na stole alchemicznym, jeœli oczywiœcie znasz podstawy alchemii.
};


instance DIA_ABUYIN_WOHER(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_woher_condition;
	information = dia_abuyin_woher_info;
	permanent = FALSE;
	description = "Gdzie mogê kupiæ tytoñ jab³kowy?";
};


func int dia_abuyin_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen))
	{
		return TRUE;
	};
};

func void dia_abuyin_woher_info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Gdzie mogê kupiæ tytoñ jab³kowy?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//Dam ci dwie porcje. Od twojej m¹droœci zale¿y, jak je wykorzystasz.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Jeœli pragniesz wiêcej, udaj siê do Zurisa, Mistrza Mikstur. On robi ten tytoñ i go sprzedaje.
	b_giveinvitems(self,other,itmi_apfeltabak,2);
};

func void b_tabakprobieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Daj mi spróbowaæ twego tytoniu.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Nie, ta mieszanka mi nie odpowiada. Ale mo¿e ktoœ doceni ten... eee... przysmak.
};


instance DIA_ABUYIN_MISCHUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 10;
	condition = dia_abuyin_mischung_condition;
	information = dia_abuyin_mischung_info;
	permanent = TRUE;
	description = "Mam now¹ mieszankê tytoniu...";
};


func int dia_abuyin_mischung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen) && (ABUYIN_HONIGTABAK == FALSE) && ((Npc_HasItems(other,itmi_sumpftabak) >= 1) || (Npc_HasItems(other,itmi_pilztabak) >= 1) || (Npc_HasItems(other,itmi_doppeltabak) >= 1) || (Npc_HasItems(other,itmi_honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void dia_abuyin_mischung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//Mam now¹ mieszankê tytoniu...
	Info_ClearChoices(dia_abuyin_mischung);
	Info_AddChoice(dia_abuyin_mischung,DIALOG_BACK,dia_abuyin_mischung_back);
	if(Npc_HasItems(other,itmi_sumpftabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_KRAUT,dia_abuyin_mischung_sumpf);
	};
	if(Npc_HasItems(other,itmi_pilztabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_PILZ,dia_abuyin_mischung_pilz);
	};
	if(Npc_HasItems(other,itmi_doppeltabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_DOPPEL,dia_abuyin_mischung_doppel);
	};
	if(Npc_HasItems(other,itmi_honigtabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_HONIG,dia_abuyin_mischung_super);
	};
};

func void dia_abuyin_mischung_back()
{
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_sumpf()
{
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_pilz()
{
	b_giveinvitems(other,self,itmi_pilztabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_doppel()
{
	b_giveinvitems(other,self,itmi_doppeltabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_super()
{
	b_giveinvitems(other,self,itmi_honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Daj mi spróbowaæ.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//Có¿ za cudowny smak! Nigdy nie pali³em nic równie dobrego!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Jak przygotowa³eœ tê mieszankê?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Zmiesza³em tytoñ z miodem.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//Dobrze siê sprawi³eœ, Ojcze Sztuki Fajkowej. By³bym zachwycony, mog¹c nabiæ me niegodne fajki tym arcydzie³em.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//A zatem nabij sobie.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Dziêki ci, Synu Szczodroœci. ¯aden inny tytoñ nie mo¿e siê z tym równaæ. Kupiê od ciebie ka¿de Ÿdziebe³ko, jakie mi dostarczysz.
	ABUYIN_HONIGTABAK = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Info_ClearChoices(dia_abuyin_mischung);
};


instance DIA_ABUYIN_TRADE(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_trade_condition;
	information = dia_abuyin_trade_info;
	permanent = TRUE;
	description = "Mam dla ciebie trochê miodowego tytoniu.";
};


func int dia_abuyin_trade_condition()
{
	if((ABUYIN_HONIGTABAK == TRUE) && (Npc_HasItems(other,itmi_honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_trade_info()
{
	ABUYIN_SCORE = 0;
	ABUYIN_SCORE = Npc_HasItems(other,itmi_honigtabak) * VALUE_ITMI_HONIGTABAK;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//Mam dla ciebie trochê miodowego tytoniu.
	b_giveinvitems(other,self,itmi_honigtabak,Npc_HasItems(other,itmi_honigtabak));
	b_giveinvitems(self,other,itmi_gold,ABUYIN_SCORE);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Interesy z tob¹ to czysta przyjemnoœæ.
};


instance DIA_ABUYIN_HERB(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_herb_condition;
	information = dia_abuyin_herb_info;
	permanent = FALSE;
	description = "Mo¿e zainteresuje ciê ta paczuszka zió³?";
};


func int dia_abuyin_herb_condition()
{
	if(Npc_HasItems(other,itmi_herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_abuyin_herb_info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Mo¿e zainteresuje ciê ta paczuszka zió³?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Czy to bagienne ziele? Och, zabierz to st¹d, Synu Nieopatrznoœci.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Gdyby z³apa³a mnie z tym stra¿ miejska, wyl¹dowa³bym za kratami - i ty tak¿e!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Jeœli chcesz to sprzedawaæ, to coœ ci poradzê - wyjedŸ szybko z miasta.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Wyrzuæ to lepiej za murami miasta. Tutaj sprowadzi to na ciebie tylko mnóstwo k³opotów.
};


instance DIA_ABUYIN_WEISSAGUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung_condition;
	information = dia_abuyin_weissagung_info;
	permanent = FALSE;
	description = "Czy mo¿esz dla mnie powró¿yæ?";
};


func int dia_abuyin_weissagung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Czy mo¿esz mi powró¿yæ?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Moje talenty s¹ na twoje us³ugi za skromn¹ op³at¹, o Ojcze Szczodroœci.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Ile chcesz?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//Dla ciebie zaryzykujê spojrzenie przez czas za marne 25 monet.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Ale pamiêtaj - przysz³oœæ zawsze jest niepewna. Mogê tylko ujrzeæ przelotnie niektóre chwile.
};


instance DIA_ABUYIN_ZUKUNFT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft_condition;
	information = dia_abuyin_zukunft_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz³oœæ (zap³aæ 25 sztuk z³ota).";
};


var int dia_abuyin_zukunft_permanent;

func int dia_abuyin_zukunft_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung) && (DIA_ABUYIN_ZUKUNFT_PERMANENT == FALSE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Opowiedz mi o przysz³oœci.
	if(b_giveinvitems(other,self,itmi_gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Dobrze, Poszukiwaczu Wiedzy. Teraz wejdê w trans. Czy jesteœ gotowy?
		Info_ClearChoices(dia_abuyin_zukunft);
		Info_AddChoice(dia_abuyin_zukunft,"Jestem gotów!",dia_abuyin_zukunft_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz³oœæ proszê ciê o 25 sztuk z³ota.
	};
};

func void dia_abuyin_zukunft_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//...Orkowie... pilnuj¹ wejœcia... stary tunel... Górnicza Dolina...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//...Ludzie w lœni¹cych zbrojach... Mag... twój przyjaciel jest z nimi... czeka na ciebie...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//...Ogieñ! Atak... potê¿na istota... p³omienie... wielu... zginie...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//Có¿ to? Miasto... Ruiny... Quarhodron w Jarkendarze...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//On... Zwie siê... Quarhodron w Jarkendarze!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//...Przykro mi. Wizja siê skoñczy³a. Nie widzê nic wiêcej.
	DIA_ABUYIN_ZUKUNFT_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 1;
	Info_ClearChoices(dia_abuyin_zukunft);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_NOCHMAL(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_nochmal_condition;
	information = dia_abuyin_nochmal_info;
	permanent = TRUE;
	description = "Czy mo¿esz przygotowaæ dla mnie jeszcze jedn¹ wró¿bê?";
};


func int dia_abuyin_nochmal_condition()
{
	if(KAPITEL == ABUYIN_ZUKUNFT)
	{
		return TRUE;
	};
};

func void dia_abuyin_nochmal_info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Czy mo¿esz przygotowaæ dla mnie jeszcze jedn¹ wró¿bê?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//Och, Synu Tajemniczej Przysz³oœci, nie w mojej mocy jest uchylenie zas³ony, która spowija tajemnice czasu.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Dopiero kiedy czas zeœle mi kolejny omen, znów bêdê móg³ spojrzeæ w przysz³oœæ dla ciebie.
	if(ABUYIN_ERZAEHLT == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//To znaczy kiedy?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//Kiedy przysz³oœæ stanie siê teraŸniejszoœci¹ i minie kolejny etep twojej wêdrówki.
		ABUYIN_ERZAEHLT = TRUE;
	};
};

func void b_abuyin_weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Czy mo¿esz mi powró¿yæ?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Tak, czas min¹³, wiêc przygotujê dla ciebie wró¿bê w zamian za kilka monet.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Ile?
};


instance DIA_ABUYIN_WEISSAGUNG2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung2_condition;
	information = dia_abuyin_weissagung2_info;
	permanent = FALSE;
	description = "Czy mo¿esz dla mnie powró¿yæ?";
};


func int dia_abuyin_weissagung2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung2_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//Dla ciebie zaryzykujê spojrzenie przez czas za marne 100 monet.
};


instance DIA_ABUYIN_ZUKUNFT2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft2_condition;
	information = dia_abuyin_zukunft2_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz³oœæ (zap³aæ 100 sztuk z³ota).";
};


var int dia_abuyin_zukunft2_permanent;

func int dia_abuyin_zukunft2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung2) && (DIA_ABUYIN_ZUKUNFT2_PERMANENT == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft2_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Opowiedz mi o przysz³oœci.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Dobrze, Synu Odwagi. Teraz wejdê w trans. Czy jesteœ gotowy?
		Info_ClearChoices(dia_abuyin_zukunft2);
		Info_AddChoice(dia_abuyin_zukunft2,"Jestem gotów!",dia_abuyin_zukunft2_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz³oœæ proszê ciê o 100 sztuk z³ota.
	};
};

func void dia_abuyin_zukunft2_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//...Najemnik... on ciê bêdzie potrzebowa³... straszne morderstwo... Oko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//...z³owrodzy sprzymierzeñcy... nadchodz¹... szukaj¹ ciê... stra¿nik zostanie pokonany...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//...ale trójka siê zjednoczy... dopiero wtedy otrzymasz co twoje...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//To wszystko. Nie widzê nic wiêcej.
	DIA_ABUYIN_ZUKUNFT2_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 2;
	Info_ClearChoices(dia_abuyin_zukunft2);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung3_condition;
	information = dia_abuyin_weissagung3_info;
	permanent = FALSE;
	description = "Czy mo¿esz dla mnie powró¿yæ?";
};


func int dia_abuyin_weissagung3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung3_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//Dla ciebie zaryzykujê spojrzenie przez czas za marne 250 monet.
};


instance DIA_ABUYIN_ZUKUNFT3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft3_condition;
	information = dia_abuyin_zukunft3_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz³oœæ (zap³aæ 250 sztuk z³ota).";
};


var int dia_abuyin_zukunft3_permanent;

func int dia_abuyin_zukunft3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung3) && (DIA_ABUYIN_ZUKUNFT3_PERMANENT == FALSE) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft3_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Opowiedz mi o przysz³oœci.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Dobrze, Synu Wiedzy. Teraz wejdê w trans. Czy jesteœ gotowy?
		Info_ClearChoices(dia_abuyin_zukunft3);
		Info_AddChoice(dia_abuyin_zukunft3,"Jestem gotów!",dia_abuyin_zukunft3_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz³oœæ proszê ciê o 250 sztuk z³ota.
	};
};

func void dia_abuyin_zukunft3_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//...wymusisz... swoje w³asne przeznaczenie...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//...przez ogieñ i œnieg... przez lód i p³omienie...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//...Ludzie w obcych zbrojach... bagno... jaszczury... oczekuj¹ ciê...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//To wszystko. Nie widzê nic wiêcej.
	DIA_ABUYIN_ZUKUNFT3_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 3;
	Info_ClearChoices(dia_abuyin_zukunft3);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung4_condition;
	information = dia_abuyin_weissagung4_info;
	permanent = FALSE;
	description = "Czy mo¿esz dla mnie powró¿yæ?";
};


func int dia_abuyin_weissagung4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung4_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//Dla ciebie zaryzykujê spojrzenie przez czas za marne 500 monet.
};


instance DIA_ABUYIN_ZUKUNFT4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft4_condition;
	information = dia_abuyin_zukunft4_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz³oœæ (zap³aæ 500 sztuk z³ota).";
};


var int dia_abuyin_zukunft4_permanent;

func int dia_abuyin_zukunft4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung4) && (DIA_ABUYIN_ZUKUNFT4_PERMANENT == FALSE) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft4_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Opowiedz mi o przysz³oœci.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Dobrze, Synu Wiedzy. Teraz wejdê w trans. Czy jesteœ gotowy?
		Info_ClearChoices(dia_abuyin_zukunft4);
		Info_AddChoice(dia_abuyin_zukunft4,"Jestem gotów!",dia_abuyin_zukunft4_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz³oœæ proszê ciê o 500 sztuk z³ota.
	};
};

func void dia_abuyin_zukunft4_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//...miejsce wiedzy... obcy kraj... ciemne miejsce daleko st¹d...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//...dzielni towarzysze... sam dokonasz wyboru...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//...œwi¹tynia... stoi samotnie w królestwie Adanosa... ukryta we mgle...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//To wszystko. Nie widzê nic wiêcej.
	DIA_ABUYIN_ZUKUNFT4_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 4;
	Info_ClearChoices(dia_abuyin_zukunft4);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung5_condition;
	information = dia_abuyin_weissagung5_info;
	permanent = FALSE;
	description = "Czy mo¿esz dla mnie powró¿yæ?";
};


func int dia_abuyin_weissagung5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung5_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//Dla ciebie zaryzykujê spojrzenie przez czas za marne 1000 monet.
};


instance DIA_ABUYIN_ZUKUNFT5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft5_condition;
	information = dia_abuyin_zukunft5_info;
	permanent = TRUE;
	description = "Przepowiedz mi przysz³oœæ (zap³aæ 1000 sztuk z³ota).";
};


var int dia_abuyin_zukunft5_permanent;

func int dia_abuyin_zukunft5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung5) && (DIA_ABUYIN_ZUKUNFT5_PERMANENT == FALSE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft5_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Opowiedz mi o przysz³oœci.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Dobrze, Synu Wiedzy. Teraz wejdê w trans. Czy jesteœ gotowy?
		Info_ClearChoices(dia_abuyin_zukunft5);
		Info_AddChoice(dia_abuyin_zukunft5,"Jestem gotów!",dia_abuyin_zukunft5_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//Och, Ojcze Monet, w zamian za spojrzenie w przysz³oœæ proszê ciê o 1000 sztuk z³ota.
	};
};

func void dia_abuyin_zukunft5_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//...Ciemnoœæ przenika ziemie... z³o zatryumfuje...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//...Król przegra wojnê z orkami...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//...ty powrócisz, ale nie zaznasz spokoju...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//To wszystko. Nie widzê nic wiêcej.
	DIA_ABUYIN_ZUKUNFT5_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 5;
	Info_ClearChoices(dia_abuyin_zukunft5);
	b_giveplayerxp(XP_AMBIENT * 4);
};

