
instance DIA_HYGLAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap1_exit_condition;
	information = dia_hyglas_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_FEUER(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_feuer_condition;
	information = dia_hyglas_feuer_info;
	permanent = FALSE;
	description = "Prosz� o Pr�b� Ognia.";
};


func int dia_hyglas_feuer_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_feuer_info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Prosz� o Pr�b� Ognia.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Pr�ba Ognia nie by�a stosowana od zamierzch�ych czas�w.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//To zbyt niebezpieczne. Nawet o tym nie my�l.
};


instance DIA_HYGLAS_HALLO(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_hallo_condition;
	information = dia_hyglas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hyglas_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hyglas_hallo_info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Jestem Mistrz Hyglas, Stra�nik Ognia i Wiedzy.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//A wi�c Mistrz Parlan wyda� ci pozwolenie na dost�p do pism.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Zatem prosz�, masz woln� r�k�. Czytaj, a znajdziesz w pismach o�wiecenie, kt�rego szukasz.
	};
};


instance DIA_HYGLAS_JOB(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_job_condition;
	information = dia_hyglas_job_info;
	permanent = FALSE;
	description = "Co studiujesz, Mistrzu?";
};


func int dia_hyglas_job_condition()
{
	return TRUE;
};

func void dia_hyglas_job_info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Co studiujesz, Mistrzu?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Moje badania koncentruj� si� na ogniu - �ywiole Innosa.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//To wielki dar, a zarazem pot�na bro�. Zajmuj� si� tworzeniem run zawieraj�cych moc ognia Innosa.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//To bardzo m�dre. Nauczysz mnie?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Tylko Innos mo�e zes�a� dar magii. I jedynie jego s�udzy, Magowie Ognia, mog� z niego korzysta�.
	};
};


instance DIA_HYGLAS_CONTEST(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_contest_condition;
	information = dia_hyglas_contest_info;
	permanent = FALSE;
	description = "Za��da�em Pr�by Ognia.";
};


func int dia_hyglas_contest_condition()
{
	if(MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hyglas_contest_info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Za��da�em pr�by ognia. Ulthar kaza� mi stworzy� run� ognistej strza�y.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//A teraz pewnie chcesz, abym nauczy� ci� odpowiedniej formu�y?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Nie za bardzo wiem, co jeszcze m�g�bym zrobi�.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Dobrze, naucz� ci� tej formu�y. Ale najpierw musisz znale�� niezb�dne sk�adniki.
	b_logentry(TOPIC_RUNE,"Hyglas ma mnie nauczy� formu�y runy ognistej strza�y, kiedy tylko zdob�d� wszystkie sk�adniki.");
};


instance DIA_HYGLAS_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_firebolt_condition;
	information = dia_hyglas_firebolt_info;
	permanent = FALSE;
	description = "Jakie sk�adniki potrzebne s� do stworzenia runy ognistej strza�y?";
};


func int dia_hyglas_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (MIS_RUNE == LOG_RUNNING) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Jakie sk�adniki potrzebne s� do stworzenia runy ognistej strza�y?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Wszystkie odpowiedzi znajdziesz w ksi�gach.
};


instance DIA_HYGLAS_TALENT_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 990;
	condition = dia_hyglas_talent_firebolt_condition;
	information = dia_hyglas_talent_firebolt_info;
	permanent = TRUE;
	description = "Naucz mnie, jak stworzy� run� OGNISTEJ STRZA�Y.";
};


func int dia_hyglas_talent_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE) && (Npc_HasItems(other,itmi_runeblank) >= 1) && (Npc_HasItems(other,itsc_firebolt) >= 1) && (Npc_HasItems(other,itmi_sulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_talent_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Naucz mnie, jak stworzy� run� OGNISTEJ STRZA�Y.
	if(b_teachplayertalentrunes(self,other,SPL_FIREBOLT))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Aby stworzy� run� ognistej strza�y, musisz po��czy� na stole runicznym siark� z kamieniem runicznym.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Moc zakl�cia ognistej strza�y wniknie w run�, a ty dostaniesz narz�dzie Innosa.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Skoro ju� masz wszystkie materia�y, mo�esz przyst�pi� do tworzenia runy.
	};
};


instance DIA_HYGLAS_BLANK_RUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_blank_rune_condition;
	information = dia_hyglas_blank_rune_info;
	permanent = FALSE;
	description = "Gdzie znajd� kamie� runiczny?";
};


func int dia_hyglas_blank_rune_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_firebolt) && (MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(other,itmi_runeblank) < 1) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_blank_rune_info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Gdzie znajd� kamie� runiczny?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Hej hej, to twoja pr�ba, nie moja. Znalezienie kamienia jest cz�ci� zadania.
};


instance DIA_HYGLAS_GOTRUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_gotrune_condition;
	information = dia_hyglas_gotrune_info;
	permanent = FALSE;
	description = "Stworzy�em run�.";
};


func int dia_hyglas_gotrune_condition()
{
	if((Npc_KnowsInfo(hero,dia_ulthar_success) == FALSE) && (Npc_HasItems(hero,itru_firebolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_hyglas_gotrune_info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Stworzy�em run�.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//No prosz�. Zdaje si�, �e przeszed�e� pr�b�. Nie by�o to chyba a� takie trudne.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Id� do Ulthara i poka� mu swoje dzie�o.
	b_logentry(TOPIC_RUNE,"Stworzy�em run� Ognistej Strza�y.");
};


instance DIA_HYGLAS_TEACH(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 15;
	condition = dia_hyglas_teach_condition;
	information = dia_hyglas_teach_info;
	permanent = TRUE;
	description = "Naucz mnie.";
};


func int dia_hyglas_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_hyglas_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//Zosta� moim nauczycielem.
	Info_ClearChoices(dia_hyglas_teach);
	Info_AddChoice(dia_hyglas_teach,DIALOG_BACK,dia_hyglas_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_hyglas_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),dia_hyglas_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_hyglas_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_hyglas_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_hyglas_teach_firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		b_say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(dia_hyglas_teach);
	};
};

func void dia_hyglas_teach_back()
{
	Info_ClearChoices(dia_hyglas_teach);
};

func void dia_hyglas_teach_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_hyglas_teach_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_hyglas_teach_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_hyglas_teach_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_hyglas_teach_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};


instance DIA_HYGLAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap2_exit_condition;
	information = dia_hyglas_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap3_exit_condition;
	information = dia_hyglas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_BRINGBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_bringbook_condition;
	information = dia_hyglas_bringbook_info;
	permanent = FALSE;
	description = "Jakie� wie�ci?";
};


func int dia_hyglas_bringbook_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_hyglas_bringbook_info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Jakie� wie�ci?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, tak. No c�, prawdopodobnie zauwa�y�e� te odziane na czarno postacie.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Spotka�em je.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//I tu dochodzimy do sedna problemu. Aktualny uk�ad gwiazd jest bardzo nietypowy.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//M�wi�c konkretniej, konstelacja Wo�a wesz�a w koniunkcj� z konstelacj� Wojownika. Nie musz� chyba t�umaczy�, co to oznacza.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmmm. No c�, szczerze m�wi�c...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Jasne, rozumiem. Nie b�d� si� teraz wdawa� w szczeg�owe rozwa�ania na temat takiej konfiguracji. Powiem tylko tyle, �e oznacza ona wielkie zmiany. A ja nie lubi� zmian.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Dlatego chc�, aby� przyni�s� mi z miasta pewn� ksi�g�, zatytu�owan� 'Boska moc gwiazd'. Zdobycie jej mo�e wymaga� nieco wysi�ku, ale jestem pewien, �e sobie poradzisz.
	Info_ClearChoices(dia_hyglas_bringbook);
	Info_AddChoice(dia_hyglas_bringbook,"Sam sobie znajd� t� ksi�g�.",dia_hyglas_bringbook_getityourself);
	Info_AddChoice(dia_hyglas_bringbook,"A co JA b�d� z tego mia�?",dia_hyglas_bringbook_getforit);
	Info_AddChoice(dia_hyglas_bringbook,"Zobacz�, czy uda mi si� j� znale��.",dia_hyglas_bringbook_yes);
};

func void dia_hyglas_bringbook_getityourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Sam sobie znajd� t� ksi�g�.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Jak �miesz odzywa� si� do mnie w ten spos�b? Takim zachowaniem okazujesz brak nale�nego mi szacunku.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Zejd� mi z oczu i zastan�w si� dobrze nad swoim post�powaniem.
	MIS_HYGLASBRINGBOOK = LOG_OBSOLETE;
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_getforit()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//A co z tego b�d� mia�?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Nie ca�kiem rozumiem...
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Chcia�bym wiedzie�, co zyskam, je�li przynios� ci ksi�g�.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nic. A czego oczekiwa�e�? Je�li masz czas na wycieczk� do miasta, twoim obowi�zkiem jest mi pom�c.
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Zobacz�, czy uda mi si� j� znale��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//Dobrze - dzi�ki temu b�d� mia� wi�cej czasu na inne sprawy.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Spr�buj za�atwi� to jak najszybciej. Obawiam si�, �e czas jest w tej chwili do�� cennym towarem.
	MIS_HYGLASBRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(dia_hyglas_bringbook);
	Log_CreateTopic(TOPIC_HYGLASBRINGBOOK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HYGLASBRINGBOOK,LOG_RUNNING);
	b_logentry(TOPIC_HYGLASBRINGBOOK,"Hyglas chce, abym przyni�s� mu ksi�g� zatytu�owan� 'Boska moc gwiazd'. Mo�e ma j� kt�ry� z handlarzy w mie�cie.");
};


instance DIA_HYGLAS_HAVEBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_havebook_condition;
	information = dia_hyglas_havebook_info;
	permanent = FALSE;
	description = "Przynios�em ci ksi�g�.";
};


func int dia_hyglas_havebook_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook) && (Npc_HasItems(other,itwr_astronomy_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_havebook_info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Przynios�em ci ksi�g�.
	if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Bardzo dobrze, daj mi j�.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//A wi�c jednak zmieni�e� zdanie. Bardzo dobrze. Gdzie jest ksi�ga?
	};
	b_giveinvitems(other,self,itwr_astronomy_mis,1);
	MIS_HYGLASBRINGBOOK = LOG_SUCCESS;
	b_giveplayerxp(XP_HYGLASBRINGBOOK);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Mo�esz odej��. A ja zajm� si� badaniami.
};


instance DIA_HYGLAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap4_exit_condition;
	information = dia_hyglas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP4_PERM(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 49;
	condition = dia_hyglas_kap4_perm_condition;
	information = dia_hyglas_kap4_perm_info;
	permanent = TRUE;
	description = "Dowiedzia�e� si� czego� nowego?";
};


func int dia_hyglas_kap4_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook))
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Dowiedzia�e� si� czego� nowego?
	if(MIS_HYGLASBRINGBOOK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//Nie jestem do ko�ca pewien, ale wygl�da na to, �e aktualny uk�ad gwiazd zwiastuje k�opoty.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Jakie problemy?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Materia rozdzielaj�ca dwa �wiaty sta�a si� bardzo cienka. Gdyby kto� chcia� otworzy� przej�cie, m�g�by to zrobi�, u�ywaj�c zaledwie cz�stki mocy potrzebnej do tego w innych okoliczno�ciach.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Demony mog� u�ywa� takich przej��, aby przenika� do naszego �wiata.
		HYGLAS_SENDSTOKARRAS = TRUE;
	}
	else if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Nie, wci�� czekam na t� ksi�g�.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Oczywi�cie wci�� prowadz� swoje badania, jednak potrwaj� one znacznie d�u�ej, je�li nie b�d� mia� niezb�dnych materia��w.
	};
};


instance DIA_HYGLAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap5_exit_condition;
	information = dia_hyglas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_PICKPOCKET(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 900;
	condition = dia_hyglas_pickpocket_condition;
	information = dia_hyglas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hyglas_pickpocket_condition()
{
	return c_beklauen(73,200);
};

func void dia_hyglas_pickpocket_info()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_BACK,dia_hyglas_pickpocket_back);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_PICKPOCKET,dia_hyglas_pickpocket_doit);
};

func void dia_hyglas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hyglas_pickpocket);
};

func void dia_hyglas_pickpocket_back()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
};

