
var int urshak_sucked;

instance DIA_URSHAK_EXIT(C_INFO)
{
	npc = none_110_urshak;
	nr = 999;
	condition = dia_urshak_exit_condition;
	information = dia_urshak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_urshak_exit_condition()
{
	return TRUE;
};

func void dia_urshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HALLO(C_INFO)
{
	npc = none_110_urshak;
	nr = 5;
	condition = dia_urshak_hallo_condition;
	information = dia_urshak_hallo_info;
	important = TRUE;
};


func int dia_urshak_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hallo_info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//KHROTOK JABARTH!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Stój! Ciebie znaæ! Ty przyjaciel-cz³owiek, z ³agodny g³os.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Przyjaciel co zabiæ demon KRUSHAK!
	b_giveplayerxp(XP_URSHAKFOUND);
	Log_CreateTopic(TOPIC_URSHAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URSHAK,LOG_RUNNING);
	b_logentry(TOPIC_URSHAK,"Odnalaz³em mego starego orkowego przyjaciela, Ur-Shaka.");
	Info_ClearChoices(dia_urshak_hallo);
	Info_AddChoice(dia_urshak_hallo,"Co tu porabiasz?",dia_urshak_hallo_freund);
	Info_AddChoice(dia_urshak_hallo,"Gadaj¹cy ork?",dia_urshak_hallo_wer);
};

func void dia_urshak_hallo_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Gadaj¹cy ork?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Zapomnia³ Ur-Shak? Ur-Shak smutny.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Du¿o dni wczeœniej Ur-Shak pomóg³ zdobyæ ULU-MULU, ¿eby przyjaciel poszed³ do wioski. Wtedy orki go nie zabiæ.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Przyjaciel by³ w œwi¹tynia orków i pokona³ demon. Du¿o dni wczeœniej! Nie pamiêta?
};

func void dia_urshak_hallo_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//Szkoda, ¿e okolicznoœci nie s¹ bardziej sprzyjaj¹ce. O ma³o ciê nie zabi³em. Co tu robisz?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ur-Shak idzie, ¿eby zobaczyæ, co siê sta³o z jego bracia.
	Info_ClearChoices(dia_urshak_hallo);
};


instance DIA_URSHAK_WASMACHENORKS(C_INFO)
{
	npc = none_110_urshak;
	nr = 6;
	condition = dia_urshak_wasmachenorks_condition;
	information = dia_urshak_wasmachenorks_info;
	description = "Dlaczego orkowie atakuj¹ ludzi?";
};


func int dia_urshak_wasmachenorks_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_wasmachenorks_info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Dlaczego orkowie atakuj¹ ludzi?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ur-Shak zawsze mówi³, ¿e ludzie nie z³e, ¿e tam te¿ przyjaciele.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Ale szaman nie s³uchaæ Ur-Shak, a bracia ci¹gle nie lubiæ Ur-Shak.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Ur-Shak nie wie, czemu wielka wojna z ludzie.
	b_logentry(TOPIC_URSHAK,"Wci¹¿ nie przekona³ swego ludu do wys³uchania jego racji. Ci¹gle jest wygnañcem.");
};


instance DIA_URSHAK_SOVIELE(C_INFO)
{
	npc = none_110_urshak;
	nr = 7;
	condition = dia_urshak_soviele_condition;
	information = dia_urshak_soviele_info;
	description = "Sk¹d siê was tu tylu wziê³o?";
};


func int dia_urshak_soviele_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_soviele_info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Sk¹d siê was tu tylu wziê³o?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Jedne orki id¹ z gór, a inne ze statków. Wszystkie robi¹ wielkie ogrodzenie.
};


instance DIA_URSHAK_ZAUN(C_INFO)
{
	npc = none_110_urshak;
	nr = 8;
	condition = dia_urshak_zaun_condition;
	information = dia_urshak_zaun_info;
	description = "Co siê kryje za palisad¹ orków na wschodzie?";
};


func int dia_urshak_zaun_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_zaun_info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Co siê kryje za palisad¹ orków na wschodzie?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//U orków zawsze du¿y pali-sada. Tam wojenny obóz.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Pali-sada dobry na wojnê. Nie widaæ ilu orki, a orki bezpieczne.
};


instance DIA_URSHAK_WASHASTDUVOR(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_washastduvor_condition;
	information = dia_urshak_washastduvor_info;
	description = "Co zamierzasz teraz zrobiæ?";
};


func int dia_urshak_washastduvor_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_washastduvor_info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Co zamierzasz teraz zrobiæ?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ur-Shak poczeka, a¿ zwiadowcy zaprowadziæ go do Hosh-Pak.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Kim jest ten Hosh-Pak?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Bardzo du¿y szaman. Wielki wp³yw ma na wojownicy. Wielki plan ma dla orków.
	b_logentry(TOPIC_URSHAK,"Ur-Shak planuje spotkaæ siê z orkowym szamanem, Hosh-Pakiem. Chce otrzymaæ pozwolenie na ponowne do³¹czenie do Rady Szamanów.");
	Info_ClearChoices(dia_urshak_washastduvor);
	Info_AddChoice(dia_urshak_washastduvor,DIALOG_BACK,dia_urshak_washastduvor_weiter);
	Info_AddChoice(dia_urshak_washastduvor,"Gdzie znajdê tego Hosh-Paka?",dia_urshak_washastduvor_);
	Info_AddChoice(dia_urshak_washastduvor,"Wiêc dlaczego sam do niego nie pójdziesz?",dia_urshak_washastduvor_hoshpak);
};

func void dia_urshak_washastduvor_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Wiêc dlaczego sam do niego nie pójdziesz?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ur-Shak próbowaæ i próbowaæ oddostaæ honor, i byæ znów w rada szamanów.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Ale Hosh-Pak nie chcia³ s³uchaæ. Bez zwiadowców orki zabij¹ Ur-Shak. Ur-Shak musi porozmawiaæ z Hosh-Pak.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Mo¿e dzisiaj udaæ.
};

func void dia_urshak_washastduvor_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Gdzie znajdê tego Hosh-Paka?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//On ma miejsce, gdzie widzi wojownicy - nad fortec¹, przy ognista góra. Tam Hosh-Pak dowodzi wojownicy.
};

func void dia_urshak_washastduvor_weiter()
{
	Info_ClearChoices(dia_urshak_washastduvor);
};


instance DIA_URSHAK_HOSHPAKDEAD(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_hoshpakdead_condition;
	information = dia_urshak_hoshpakdead_info;
	description = "Hosh-Pak nie ¿yje.";
};


func int dia_urshak_hoshpakdead_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_washastduvor) && Npc_IsDead(hosh_pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakdead_info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Hosh-Pak nie ¿yje.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Hosh-Pak nie ¿yje? RUSHTASOK!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//Moje serce smutne. Ur-Shak nie zapomni wielki ork, który zrobi³ go szamanem.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Rozumiem. Hosh-Pak by³ twoim nauczycielem, tak?
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ur-Shak musi nieœæ swój smutek. Musi pogrzebaæ Hosh-Pak. Ur-Shak musi ju¿ iœæ.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Przyjaciel lepiej iœæ na prze³êcz. Tu niebezpiecznie.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ur-Shak bardzo smutny, jeœli przyjaciel-cz³owiek te¿ zgin¹æ.
	b_logentry(TOPIC_URSHAK,"Hosh-Pak nie ¿yje. Mój orkowy przyjaciel zmierza do jego namiotów, pogr¹¿ony w ¿a³obie po swoim mentorze. Nie powinienem mu przeszkadzaæ.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_02");
};


instance DIA_URSHAK_GEH(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_geh_condition;
	information = dia_urshak_geh_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_geh_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && ((Npc_GetDistToWP(self,"OW_HOSHPAK_04") < 1000) == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_geh_info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//Przyjaciel lepiej iœæ przez prze³êcz.
	Npc_SetRefuseTalk(self,10);
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HOSHPAKRACHE(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_hoshpakrache_condition;
	information = dia_urshak_hoshpakrache_info;
	important = TRUE;
};


func int dia_urshak_hoshpakrache_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakrache_info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//KHROTOK! Ja wiem, ¿e ty by³, gdzie zabili Hosh-Pak. Du¿y b³¹d, obcy cz³owiek!
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//Widzê, ¿e zaj¹³eœ tu jego miejsce. Od pocz¹tku mn¹ manipulowa³eœ.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//Twoja pozycja wœród orków jest wy¿sza, ni¿ sk³onny by³eœ przyznaæ. Teraz jesteœ niczym wiêcej jak narzêdziem w rêkach z³a.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//Obcy dobrze mówi. Ur-Shak zna teraz tylko nienawiœæ i zemsta.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ur-Shak zobaczy³ b³¹d, ¿e zaufa³ cz³owiek. Ur-Shak ¿a³uje, ¿e pomóg³ z³y cz³owiek i mówi³ mu przyjaciel.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Obcy iœæ ju¿ z doliny i przez prze³êcz. Ur-Shak nie mo¿e zabiæ obcy. Honor szamana nie pozwala teraz zabiæ.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//Nastêpnym razem bêdziemy wrogi. Ty ju¿ lepiej iœæ.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	b_logentry(TOPIC_URSHAK,"Rada orkowych szamanów ponownie przyjê³a w swe szeregi Ur-Shaka. Walczy on teraz po stronie wroga... Nie wiem, jak zareaguje na mój widok. Nie powinienem mu chyba wchodziæ w drogê, dopóki nie rozstrzygnê moich spraw z orkami - do tego czasu powinien siê ju¿ uspokoiæ.");
	b_giveplayerxp(XP_URSHAKBECOMESSHAMAN);
};


instance DIA_URSHAK_KEINEWAHL(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_keinewahl_condition;
	information = dia_urshak_keinewahl_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_keinewahl_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakrache) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_urshak_keinewahl_info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Ty iœæ. Nie rozmawiaæ z obcy.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};

