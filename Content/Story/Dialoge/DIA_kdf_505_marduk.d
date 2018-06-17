
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
	description = "Czym si� zajmujesz?";
};


func int dia_marduk_job_condition()
{
	return TRUE;
};

func void dia_marduk_job_info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//Czym si� zajmujesz?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//Przygotowuj� paladyn�w do walki z si�ami Z�a.
};


instance DIA_MARDUK_ARBEIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_arbeit_condition;
	information = dia_marduk_arbeit_info;
	permanent = FALSE;
	description = "Czy mog� co� dla ciebie zrobi�, Mistrzu?";
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
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Czy mog� co� dla ciebie zrobi�, Mistrzu?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//Dla mnie? Nie, nie potrzebuj� twojej pomocy. Lepiej pom�dl si� za szcz�liwy powr�t wojownik�w Innosa, kt�rzy udali si� do G�rniczej Doliny.
	MIS_MARDUKBETEN = LOG_RUNNING;
	b_startotherroutine(sergio,"WAIT");
	Log_CreateTopic(TOPIC_MARDUKBETEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARDUKBETEN,LOG_RUNNING);
	b_logentry(TOPIC_MARDUKBETEN,"Mistrz Marduk nie ma dla mnie �adnych zada�. Powiedzia� mi, �ebym lepiej poszed� zm�wi� modlitw� za paladyn�w.");
};


instance DIA_MARDUK_GEBETET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_gebetet_condition;
	information = dia_marduk_gebetet_info;
	permanent = FALSE;
	description = "Modli�em si� za paladyn�w.";
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
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//Modli�em si� za paladyn�w.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//To bardzo dobrze. A teraz wracaj do swoich zaj��.
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
	description = "Co to s� 'si�y Z�a'?";
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
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//Co to s� 'si�y Z�a'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Z�o czai si� wsz�dzie. Jest �ywio�em Beliara, odwiecznego przeciwnika Innosa.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//To wszechobecny mrok, kt�ry pragnie na zawsze poch�on�� �wiat�o Innosa.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Beliar jest W�adc� Ciemno�ci, Nienawi�ci i Zniszczenia.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Tylko ci po�r�d nas, kt�rzy nosz� w sercach �wi�ty ogie� naszego pana, b�d� mogli roz�wietli� mrok jego wiecznym p�omieniem.
};


instance DIA_MARDUK_PAL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_pal_condition;
	information = dia_marduk_pal_info;
	permanent = FALSE;
	description = "Ale w klasztorze �yj� jedynie magowie i nowicjusze.";
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
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//Ale w klasztorze �yj� jedynie magowie i nowicjusze.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//Zgadza si�. W odr�nieniu od naszej spo�eczno�ci, koncentruj�cej si� g��wnie na S�owie Innosa...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//...paladyni s�awi� przede wszystkim wielkie czyny naszego Pana.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//My reprezentujemy nauk� Innosa, podczas gdy paladyni s� jego wojownikami, ruszaj�cymi do bitwy z jego imieniem na ustach i zwyci�aj�cymi ku jego chwale.
};


instance DIA_MARDUK_BEFORETEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_beforeteach_condition;
	information = dia_marduk_beforeteach_info;
	permanent = FALSE;
	description = "Czy m�g�by� mnie czego� nauczy�?";
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
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//Czy mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//Jestem ekspertem w dziedzinie magii lodu i pioruna. Mog� ci� nauczy�, jak okie�zna� ich moc.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//Jednak szkol� jedynie mag�w.
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
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//Zosta� moim nauczycielem.
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
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//Teraz nie mog� ci� uczy�.
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
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//Od kiedy to jeste� paladynem?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Sk�d pochodzisz?
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
	Info_AddChoice(dia_marduk_kap3_hello,"Nie tw�j interes.",dia_marduk_kap3_hello_notyourconcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Od niedawna.",dia_marduk_kap3_hello_soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Przyby�em z farmy.",dia_marduk_kap3_hello_djg);
	};
};

func void dia_marduk_kap3_hello_notyourconcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//To nie twoja sprawa.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//Paladyn powinien by� zawsze uprzejmy i skromny. Jego zadaniem jest chroni� tych, kt�rzy nie potrafi� obroni� si� sami.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//Powiniene� by� wdzi�czny Innosowi, �e powierzy� ci tak zaszczytn� misj�. Przemy�l to sobie!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//W dawnych czasach ho�ota nie mia�a wst�pu do naszego �wi�tego klasztoru. Jeste� �ywym dowodem na to, �e by�y to lepsze czasy.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//Ostrzegam, pilnuj si�, je�li nie chcesz zosta� ukarany. Taka arogancja nie jest tu mile widziana..
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Od niedawna.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//A zatem witam ci� w naszych szeregach. W nadchodz�cej bitwie przyda si� ka�dy, kto ma odwag� przeciwstawi� si� Z�u.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//Ca�a nasza przysz�o�� spoczywa w r�kach takich jak ty. Niechaj Innos zapewni ci m�stwo, b�dziesz go potrzebowa�.
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_djg()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//Przyby�em z farmy.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//A zatem witam ci� w tym przybytku. Mam nadziej�, �e docenisz nasz� go�cinno��.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Jednak pami�taj, �e jeste� tutaj jedynie go�ciem. Nie nadu�ywaj tej go�cinno�ci, je�li nie chcesz mie� powa�nych problem�w.
	Info_ClearChoices(dia_marduk_kap3_hello);
};


instance DIA_MARDUK_TRAINPALS(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 32;
	condition = dia_marduk_trainpals_condition;
	information = dia_marduk_trainpals_info;
	permanent = TRUE;
	description = "Czego mo�esz mnie nauczy�?";
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
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//Czego mo�esz mnie nauczy�?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Oczywi�cie, nie mog� ci pom�c, je�li chodzi o walk�.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//Mog� jednak przybli�y� ci istot� �aski Innosa i jego �wi�tych dar�w.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Poza tym, b�d� ci� przygotowywa� do rytua�u Konsekracji Miecza.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//Nauczacie tu magii?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Tutaj nauczamy tylko naszej magii. Ciebie interesuje zapewne magia paladyn�w, kt�r� mo�esz studiowa� w mie�cie.
	Info_ClearChoices(dia_marduk_trainpals);
	Info_AddChoice(dia_marduk_trainpals,"Mo�e p�niej.",dia_marduk_trainpals_later);
	Info_AddChoice(dia_marduk_trainpals,"Co przez to rozumiesz?",dia_marduk_trainpals_meaning);
	Info_AddChoice(dia_marduk_trainpals,"Co to jest Konsekracja Miecza?",dia_marduk_trainpals_blessing);
};

func void dia_marduk_trainpals_later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Mo�e p�niej.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//Jeste� tu zawsze mile widziany.
	Info_ClearChoices(dia_marduk_trainpals);
};

func void dia_marduk_trainpals_meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//Co przez to rozumiesz?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//Kiedy Innos opuszcza� ten �wiat, zostawi� ludziom cz�stk� swojej boskiej mocy.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Tylko nieliczni �miertelnicy zostali obdarzeni przywilejem jej u�ywania - na chwa�� Innosa i zgodnie z jego wol�.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//A co konkretnie chcesz mi przybli�y�?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//Mog� ci wskaza� �cie�k� Innosa. Mog� sprawi�, �e ni� pod��ysz.
};

func void dia_marduk_trainpals_blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//Co to jest Konsekracja Miecza?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//Jest to jeden z naj�wi�tszych rytua��w paladyn�w.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//Podczas tej ceremonii �wi�ta moc Innosa przep�ywa przez miecz paladyna, obdarzaj�c go niewiarygodn� moc�.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//Wy�wi�cony w ten spos�b miecz towarzyszy� b�dzie paladynowi do ko�ca jego dni jako najcenniejszy skarb.
	MARDUK_TRAINPALS_PERMANENT = TRUE;
};


instance DIA_MARDUK_SWORDBLESSING(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 33;
	condition = dia_marduk_swordblessing_condition;
	information = dia_marduk_swordblessing_info;
	permanent = TRUE;
	description = "Chcia�bym konsekrowa� m�j miecz.";
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
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//Chcia�bym konsekrowa� m�j miecz.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//Je�li jeste� zdecydowany, najpierw znajd� sobie magiczne ostrze.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//Udaj si� z nim do kaplicy i zm�w modlitw�, podczas kt�rej poprosisz Innnosa o �ask� i wsparcie w bitwie przeciw si�om Z�a.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//Powiniene� r�wnie� z�o�y� odpowiedni� ofiar�.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//Je�li Innos udzieli ci swojego b�ogos�awie�stwa, tw�j miecz zostanie konsekrowany.
	Info_ClearChoices(dia_marduk_swordblessing);
	Info_AddChoice(dia_marduk_swordblessing,DIALOG_BACK,dia_marduk_swordblessing_back);
	Info_AddChoice(dia_marduk_swordblessing,"Jak� ofiar�?",dia_marduk_swordblessing_donation);
	Info_AddChoice(dia_marduk_swordblessing,"Gdzie mog� zdoby� magiczne ostrze?",dia_marduk_swordblessing_oreblade);
};

func void dia_marduk_swordblessing_back()
{
	Info_ClearChoices(dia_marduk_swordblessing);
};

func void dia_marduk_swordblessing_donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//Jak� ofiar�?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Hm, bior�c pod uwag�, jak ogromny dar dostajesz w momencie wy�wi�cenia, suma 5000 z�otych monet nie wydaje si� zbyt wyg�rowan� cen�.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//Oczywi�cie, mo�esz da� wi�cej.
};

func void dia_marduk_swordblessing_oreblade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Gdzie mog� zdoby� magiczne ostrze?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Spr�buj u kowala Harada.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//Dop�ki paladyni przebywaj� na wyspach, to on zaopatruje ich w bro�.
	if(Npc_IsDead(harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Harad nie �yje.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//Przykro mi, wobec tego b�dziesz musia� poczeka�, a� wr�cisz na kontynent wraz z innymi paladynami.
	};
};


instance DIA_MARDUK_KAP3_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 39;
	condition = dia_marduk_kap3_perm_condition;
	information = dia_marduk_kap3_perm_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
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
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Jakie� wie�ci?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Tak, do naszego klasztoru przenikn�� szpieg.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//Ukrad� nam Oko Innosa, jeden z naszych najwa�niejszych artefakt�w. A to tylko wierzcho�ek g�ry lodowej.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//Wr�g najwyra�niej wkroczy� ju� do miasta.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//Co masz na my�li?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//Jeden z naszych paladyn�w, Lothar, zosta� zamordowany na ulicy.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//W bia�y dzie�! To zasz�o za daleko. Niestety, obawiam si�, �e to mo�e by� dopiero pocz�tek.
	Info_ClearChoices(dia_marduk_kap3_perm);
	Info_AddChoice(dia_marduk_kap3_perm,DIALOG_BACK,dia_marduk_kap3_perm_back);
	Info_AddChoice(dia_marduk_kap3_perm,"Co teraz?",dia_marduk_kap3_perm_andnow);
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Bennet jest niewinny.",dia_marduk_kap3_perm_bennetisnotguilty);
	}
	else
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Czy morderca zosta� ju� z�apany?",dia_marduk_kap3_perm_murderer);
	};
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Gdzie jest ten z�odziej?",dia_marduk_kap3_perm_thief);
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
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//B�dziemy �ciga� z�odzieja a� do skutku. A kiedy ju� go schwytamy, wymierzymy mu odpowiedni� kar�.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//Musimy tylko dowiedzie� si�, kto ukrad� Oko Innosa.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//Wkr�tce powinni�my pozna� to�samo�� z�odzieja. A potem go znajdziemy, cho�by mia�o nam to zaj�� ca�� wieczno��.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//Tak b�dzie, kln� si� na Innosa.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//Morderstwo, i to w dodatku pope�nione na paladynie, to bez w�tpienia jedno z najgorszych przest�pstw.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//Morderca na pewno zostanie skazany na kar� �mierci.
	};
};

func void dia_marduk_kap3_perm_bennetisnotguilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Bennet jest niewinny. �wiadek k�ama�.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//Sk�d to wiesz?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//Mam na to dow�d.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//Czasami my�l�, �e naszymi najwi�kszymi wrogami s� zdrada i chciwo��.
};

func void dia_marduk_kap3_perm_murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//Czy morderca zosta� ju� z�apany?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//Na szcz�cie tak. Okaza�o si�, �e to jeden z tych rzezimieszk�w z farmy Onara.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Kto?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//Nie znam jego imienia. Jednak przyznasz sam, �e w�r�d najemnik�w s� ludzie, kt�rzy za pieni�dze gotowi s� pope�ni� ka�d� niegodziwo��.
};

func void dia_marduk_kap3_perm_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Gdzie jest ten z�odziej?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//Nie wiem, ucieka�, jakby op�ta�o go stado demon�w. Nie widzia�em, dok�d pobieg�.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//Niewa�ne, gdzie si� ukrywa, pod jaki kamie� si� wczo�ga, gniew Innosa dosi�gnie go i spali jego czarn� dusz�!
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
	description = "Jakie� wie�ci?";
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
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Jakie� nowiny?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//Nie, niestety nie, sytuacja jest nadal niezmiernie powa�na.
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

