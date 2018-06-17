
instance DIA_MARDUK_KAP1_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap1_exit_condition;
	information = dia_marduk_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_marduk_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_JOB(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_job_condition;
	information = dia_marduk_job_info;
	permanent = FALSE;
	description = "Czym siê zajmujesz?";
};


func int dia_marduk_job_condition()
{
	return TRUE;
};

func void dia_marduk_job_info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//Czym siê zajmujesz?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//Przygotowujê paladynów do walki z si³ami Z³a.
};


instance DIA_MARDUK_ARBEIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_arbeit_condition;
	information = dia_marduk_arbeit_info;
	permanent = FALSE;
	description = "Czy mogê coœ dla ciebie zrobiæ, Mistrzu?";
};


func int dia_marduk_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_marduk_arbeit_info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Czy mogê coœ dla ciebie zrobiæ, Mistrzu?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//Dla mnie? Nie, nie potrzebujê twojej pomocy. Lepiej pomódl siê za szczêœliwy powrót wojowników Innosa, którzy udali siê do Górniczej Doliny.
	MIS_MARDUKBETEN = LOG_RUNNING;
	b_startotherroutine(sergio,"WAIT");
	Log_CreateTopic(TOPIC_MARDUKBETEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARDUKBETEN,LOG_RUNNING);
	b_logentry(TOPIC_MARDUKBETEN,"Mistrz Marduk nie ma dla mnie ¿adnych zadañ. Powiedzia³ mi, ¿ebym lepiej poszed³ zmówiæ modlitwê za paladynów.");
};


instance DIA_MARDUK_GEBETET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_gebetet_condition;
	information = dia_marduk_gebetet_info;
	permanent = FALSE;
	description = "Modli³em siê za paladynów.";
};


func int dia_marduk_gebetet_condition()
{
	if((MIS_MARDUKBETEN == LOG_RUNNING) && Npc_KnowsInfo(other,pc_prayshrine_paladine))
	{
		return TRUE;
	};
};

func void dia_marduk_gebetet_info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//Modli³em siê za paladynów.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//To bardzo dobrze. A teraz wracaj do swoich zajêæ.
	MIS_MARDUKBETEN = LOG_SUCCESS;
	b_giveplayerxp(XP_MARDUKBETEN);
	b_startotherroutine(sergio,"START");
};


instance DIA_MARDUK_EVIL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_evil_condition;
	information = dia_marduk_evil_info;
	permanent = TRUE;
	description = "Co to s¹ 'si³y Z³a'?";
};


func int dia_marduk_evil_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_evil_info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//Co to s¹ 'si³y Z³a'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Z³o czai siê wszêdzie. Jest ¿ywio³em Beliara, odwiecznego przeciwnika Innosa.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//To wszechobecny mrok, który pragnie na zawsze poch³on¹æ Œwiat³o Innosa.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Beliar jest W³adc¹ Ciemnoœci, Nienawiœci i Zniszczenia.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Tylko ci poœród nas, którzy nosz¹ w sercach œwiêty ogieñ naszego pana, bêd¹ mogli rozœwietliæ mrok jego wiecznym p³omieniem.
};


instance DIA_MARDUK_PAL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_pal_condition;
	information = dia_marduk_pal_info;
	permanent = FALSE;
	description = "Ale w klasztorze ¿yj¹ jedynie magowie i nowicjusze.";
};


func int dia_marduk_pal_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_pal_info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//Ale w klasztorze ¿yj¹ jedynie magowie i nowicjusze.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//Zgadza siê. W odró¿nieniu od naszej spo³ecznoœci, koncentruj¹cej siê g³ównie na S³owie Innosa...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//...paladyni s³awi¹ przede wszystkim wielkie czyny naszego Pana.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//My reprezentujemy naukê Innosa, podczas gdy paladyni s¹ jego wojownikami, ruszaj¹cymi do bitwy z jego imieniem na ustach i zwyciê¿aj¹cymi ku jego chwale.
};


instance DIA_MARDUK_BEFORETEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_beforeteach_condition;
	information = dia_marduk_beforeteach_info;
	permanent = FALSE;
	description = "Czy móg³byœ mnie czegoœ nauczyæ?";
};


func int dia_marduk_beforeteach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_beforeteach_info()
{
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//Czy mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//Jestem ekspertem w dziedzinie magii lodu i pioruna. Mogê ciê nauczyæ, jak okie³znaæ ich moc.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//Jednak szkolê jedynie magów.
	};
};


instance DIA_MARDUK_TEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 10;
	condition = dia_marduk_teach_condition;
	information = dia_marduk_teach_info;
	permanent = TRUE;
	description = "Nauczaj mnie (tworzenie run)";
};


func int dia_marduk_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_beforeteach) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_marduk_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//Zostañ moim nauczycielem.
	Info_ClearChoices(dia_marduk_teach);
	Info_AddChoice(dia_marduk_teach,DIALOG_BACK,dia_marduk_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ZAP)),dia_marduk_teach_zap);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_marduk_teach_icebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICECUBE)),dia_marduk_teach_icecube);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEZAP)),dia_marduk_teach_thunderball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_marduk_teach_lightningflash);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_marduk_teach_icewave);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//Teraz nie mogê ciê uczyæ.
		Info_ClearChoices(dia_marduk_teach);
	};
};

func void dia_marduk_teach_back()
{
	Info_ClearChoices(dia_marduk_teach);
};

func void dia_marduk_teach_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void dia_marduk_teach_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void dia_marduk_teach_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_marduk_teach_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_marduk_teach_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void dia_marduk_teach_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};


instance DIA_MARDUK_KAP2_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap2_exit_condition;
	information = dia_marduk_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marduk_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap3_exit_condition;
	information = dia_marduk_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_HELLO(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 30;
	condition = dia_marduk_kap3_hello_condition;
	information = dia_marduk_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marduk_kap3_hello_condition()
{
	if((KAPITEL == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_hello_info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//Witaj, synu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//Od kiedy to jesteœ paladynem?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Sk¹d pochodzisz?
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
	Info_AddChoice(dia_marduk_kap3_hello,"Nie twój interes.",dia_marduk_kap3_hello_notyourconcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Od niedawna.",dia_marduk_kap3_hello_soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Przyby³em z farmy.",dia_marduk_kap3_hello_djg);
	};
};

func void dia_marduk_kap3_hello_notyourconcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//To nie twoja sprawa.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//Paladyn powinien byæ zawsze uprzejmy i skromny. Jego zadaniem jest chroniæ tych, którzy nie potrafi¹ obroniæ siê sami.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//Powinieneœ byæ wdziêczny Innosowi, ¿e powierzy³ ci tak zaszczytn¹ misjê. Przemyœl to sobie!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//W dawnych czasach ho³ota nie mia³a wstêpu do naszego œwiêtego klasztoru. Jesteœ ¿ywym dowodem na to, ¿e by³y to lepsze czasy.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//Ostrzegam, pilnuj siê, jeœli nie chcesz zostaæ ukarany. Taka arogancja nie jest tu mile widziana..
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Od niedawna.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//A zatem witam ciê w naszych szeregach. W nadchodz¹cej bitwie przyda siê ka¿dy, kto ma odwagê przeciwstawiæ siê Z³u.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//Ca³a nasza przysz³oœæ spoczywa w rêkach takich jak ty. Niechaj Innos zapewni ci mêstwo, bêdziesz go potrzebowa³.
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_djg()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//Przyby³em z farmy.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//A zatem witam ciê w tym przybytku. Mam nadziejê, ¿e docenisz nasz¹ goœcinnoœæ.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Jednak pamiêtaj, ¿e jesteœ tutaj jedynie goœciem. Nie nadu¿ywaj tej goœcinnoœci, jeœli nie chcesz mieæ powa¿nych problemów.
	Info_ClearChoices(dia_marduk_kap3_hello);
};


instance DIA_MARDUK_TRAINPALS(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 32;
	condition = dia_marduk_trainpals_condition;
	information = dia_marduk_trainpals_info;
	permanent = TRUE;
	description = "Czego mo¿esz mnie nauczyæ?";
};


var int marduk_trainpals_permanent;

func int dia_marduk_trainpals_condition()
{
	if((hero.guild == GIL_PAL) && (MARDUK_TRAINPALS_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_trainpals_info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//Czego mo¿esz mnie nauczyæ?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Oczywiœcie, nie mogê ci pomóc, jeœli chodzi o walkê.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//Mogê jednak przybli¿yæ ci istotê ³aski Innosa i jego œwiêtych darów.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Poza tym, bêdê ciê przygotowywa³ do rytua³u Konsekracji Miecza.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//Nauczacie tu magii?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Tutaj nauczamy tylko naszej magii. Ciebie interesuje zapewne magia paladynów, któr¹ mo¿esz studiowaæ w mieœcie.
	Info_ClearChoices(dia_marduk_trainpals);
	Info_AddChoice(dia_marduk_trainpals,"Mo¿e póŸniej.",dia_marduk_trainpals_later);
	Info_AddChoice(dia_marduk_trainpals,"Co przez to rozumiesz?",dia_marduk_trainpals_meaning);
	Info_AddChoice(dia_marduk_trainpals,"Co to jest Konsekracja Miecza?",dia_marduk_trainpals_blessing);
};

func void dia_marduk_trainpals_later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Mo¿e póŸniej.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//Jesteœ tu zawsze mile widziany.
	Info_ClearChoices(dia_marduk_trainpals);
};

func void dia_marduk_trainpals_meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//Co przez to rozumiesz?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//Kiedy Innos opuszcza³ ten œwiat, zostawi³ ludziom cz¹stkê swojej boskiej mocy.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Tylko nieliczni œmiertelnicy zostali obdarzeni przywilejem jej u¿ywania - na chwa³ê Innosa i zgodnie z jego wol¹.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//A co konkretnie chcesz mi przybli¿yæ?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//Mogê ci wskazaæ œcie¿kê Innosa. Mogê sprawiæ, ¿e ni¹ pod¹¿ysz.
};

func void dia_marduk_trainpals_blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//Co to jest Konsekracja Miecza?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//Jest to jeden z najœwiêtszych rytua³ów paladynów.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//Podczas tej ceremonii œwiêta moc Innosa przep³ywa przez miecz paladyna, obdarzaj¹c go niewiarygodn¹ moc¹.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//Wyœwiêcony w ten sposób miecz towarzyszyæ bêdzie paladynowi do koñca jego dni jako najcenniejszy skarb.
	MARDUK_TRAINPALS_PERMANENT = TRUE;
};


instance DIA_MARDUK_SWORDBLESSING(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 33;
	condition = dia_marduk_swordblessing_condition;
	information = dia_marduk_swordblessing_info;
	permanent = TRUE;
	description = "Chcia³bym konsekrowaæ mój miecz.";
};


func int dia_marduk_swordblessing_condition()
{
	if(MARDUK_TRAINPALS_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_marduk_swordblessing_info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//Chcia³bym konsekrowaæ mój miecz.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//Jeœli jesteœ zdecydowany, najpierw znajdŸ sobie magiczne ostrze.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//Udaj siê z nim do kaplicy i zmów modlitwê, podczas której poprosisz Innnosa o ³askê i wsparcie w bitwie przeciw si³om Z³a.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//Powinieneœ równie¿ z³o¿yæ odpowiedni¹ ofiarê.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//Jeœli Innos udzieli ci swojego b³ogos³awieñstwa, twój miecz zostanie konsekrowany.
	Info_ClearChoices(dia_marduk_swordblessing);
	Info_AddChoice(dia_marduk_swordblessing,DIALOG_BACK,dia_marduk_swordblessing_back);
	Info_AddChoice(dia_marduk_swordblessing,"Jak¹ ofiarê?",dia_marduk_swordblessing_donation);
	Info_AddChoice(dia_marduk_swordblessing,"Gdzie mogê zdobyæ magiczne ostrze?",dia_marduk_swordblessing_oreblade);
};

func void dia_marduk_swordblessing_back()
{
	Info_ClearChoices(dia_marduk_swordblessing);
};

func void dia_marduk_swordblessing_donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//Jak¹ ofiarê?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Hm, bior¹c pod uwagê, jak ogromny dar dostajesz w momencie wyœwiêcenia, suma 5000 z³otych monet nie wydaje siê zbyt wygórowan¹ cen¹.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//Oczywiœcie, mo¿esz daæ wiêcej.
};

func void dia_marduk_swordblessing_oreblade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Gdzie mogê zdobyæ magiczne ostrze?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Spróbuj u kowala Harada.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//Dopóki paladyni przebywaj¹ na wyspach, to on zaopatruje ich w broñ.
	if(Npc_IsDead(harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Harad nie ¿yje.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//Przykro mi, wobec tego bêdziesz musia³ poczekaæ, a¿ wrócisz na kontynent wraz z innymi paladynami.
	};
};


instance DIA_MARDUK_KAP3_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 39;
	condition = dia_marduk_kap3_perm_condition;
	information = dia_marduk_kap3_perm_info;
	permanent = TRUE;
	description = "Jakieœ wieœci?";
};


func int dia_marduk_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Jakieœ wieœci?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Tak, do naszego klasztoru przenikn¹³ szpieg.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//Ukrad³ nam Oko Innosa, jeden z naszych najwa¿niejszych artefaktów. A to tylko wierzcho³ek góry lodowej.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//Wróg najwyraŸniej wkroczy³ ju¿ do miasta.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//Co masz na myœli?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//Jeden z naszych paladynów, Lothar, zosta³ zamordowany na ulicy.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//W bia³y dzieñ! To zasz³o za daleko. Niestety, obawiam siê, ¿e to mo¿e byæ dopiero pocz¹tek.
	Info_ClearChoices(dia_marduk_kap3_perm);
	Info_AddChoice(dia_marduk_kap3_perm,DIALOG_BACK,dia_marduk_kap3_perm_back);
	Info_AddChoice(dia_marduk_kap3_perm,"Co teraz?",dia_marduk_kap3_perm_andnow);
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Bennet jest niewinny.",dia_marduk_kap3_perm_bennetisnotguilty);
	}
	else
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Czy morderca zosta³ ju¿ z³apany?",dia_marduk_kap3_perm_murderer);
	};
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Gdzie jest ten z³odziej?",dia_marduk_kap3_perm_thief);
	};
};

func void dia_marduk_kap3_perm_back()
{
	Info_ClearChoices(dia_marduk_kap3_perm);
};

func void dia_marduk_kap3_perm_andnow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//Co teraz?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//Bêdziemy œcigaæ z³odzieja a¿ do skutku. A kiedy ju¿ go schwytamy, wymierzymy mu odpowiedni¹ karê.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//Musimy tylko dowiedzieæ siê, kto ukrad³ Oko Innosa.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//Wkrótce powinniœmy poznaæ to¿samoœæ z³odzieja. A potem go znajdziemy, choæby mia³o nam to zaj¹æ ca³¹ wiecznoœæ.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//Tak bêdzie, klnê siê na Innosa.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//Morderstwo, i to w dodatku pope³nione na paladynie, to bez w¹tpienia jedno z najgorszych przestêpstw.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//Morderca na pewno zostanie skazany na karê œmierci.
	};
};

func void dia_marduk_kap3_perm_bennetisnotguilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Bennet jest niewinny. Œwiadek k³ama³.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//Sk¹d to wiesz?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//Mam na to dowód.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//Czasami myœlê, ¿e naszymi najwiêkszymi wrogami s¹ zdrada i chciwoœæ.
};

func void dia_marduk_kap3_perm_murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//Czy morderca zosta³ ju¿ z³apany?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//Na szczêœcie tak. Okaza³o siê, ¿e to jeden z tych rzezimieszków z farmy Onara.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Kto?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//Nie znam jego imienia. Jednak przyznasz sam, ¿e wœród najemników s¹ ludzie, którzy za pieni¹dze gotowi s¹ pope³niæ ka¿d¹ niegodziwoœæ.
};

func void dia_marduk_kap3_perm_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Gdzie jest ten z³odziej?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//Nie wiem, ucieka³, jakby opêta³o go stado demonów. Nie widzia³em, dok¹d pobieg³.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//Niewa¿ne, gdzie siê ukrywa, pod jaki kamieñ siê wczo³ga, gniew Innosa dosiêgnie go i spali jego czarn¹ duszê!
};


instance DIA_MARDUK_KAP4_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap4_exit_condition;
	information = dia_marduk_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_marduk_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP4U5_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 49;
	condition = dia_marduk_kap4u5_perm_condition;
	information = dia_marduk_kap4u5_perm_info;
	permanent = TRUE;
	description = "Jakieœ wieœci?";
};


func int dia_marduk_kap4u5_perm_condition()
{
	if((KAPITEL == 4) || (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_marduk_kap4u5_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Jakieœ nowiny?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//Nie, niestety nie, sytuacja jest nadal niezmiernie powa¿na.
};


instance DIA_MARDUK_KAP5_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap5_exit_condition;
	information = dia_marduk_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_marduk_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_PICKPOCKET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 900;
	condition = dia_marduk_pickpocket_condition;
	information = dia_marduk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_marduk_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_marduk_pickpocket_info()
{
	Info_ClearChoices(dia_marduk_pickpocket);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_BACK,dia_marduk_pickpocket_back);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_PICKPOCKET,dia_marduk_pickpocket_doit);
};

func void dia_marduk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marduk_pickpocket);
};

func void dia_marduk_pickpocket_back()
{
	Info_ClearChoices(dia_marduk_pickpocket);
};

