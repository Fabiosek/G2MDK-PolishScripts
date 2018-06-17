
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
	description = "Proszê o Próbê Ognia.";
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
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Proszê o Próbê Ognia.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Próba Ognia nie by³a stosowana od zamierzch³ych czasów.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//To zbyt niebezpieczne. Nawet o tym nie myœl.
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
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Jestem Mistrz Hyglas, Stra¿nik Ognia i Wiedzy.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//A wiêc Mistrz Parlan wyda³ ci pozwolenie na dostêp do pism.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Zatem proszê, masz woln¹ rêkê. Czytaj, a znajdziesz w pismach oœwiecenie, którego szukasz.
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
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Moje badania koncentruj¹ siê na ogniu - ¿ywiole Innosa.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//To wielki dar, a zarazem potê¿na broñ. Zajmujê siê tworzeniem run zawieraj¹cych moc ognia Innosa.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//To bardzo m¹dre. Nauczysz mnie?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Tylko Innos mo¿e zes³aæ dar magii. I jedynie jego s³udzy, Magowie Ognia, mog¹ z niego korzystaæ.
	};
};


instance DIA_HYGLAS_CONTEST(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_contest_condition;
	information = dia_hyglas_contest_info;
	permanent = FALSE;
	description = "Za¿¹da³em Próby Ognia.";
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
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Za¿¹da³em próby ognia. Ulthar kaza³ mi stworzyæ runê ognistej strza³y.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//A teraz pewnie chcesz, abym nauczy³ ciê odpowiedniej formu³y?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Nie za bardzo wiem, co jeszcze móg³bym zrobiæ.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//Dobrze, nauczê ciê tej formu³y. Ale najpierw musisz znaleŸæ niezbêdne sk³adniki.
	b_logentry(TOPIC_RUNE,"Hyglas ma mnie nauczyæ formu³y runy ognistej strza³y, kiedy tylko zdobêdê wszystkie sk³adniki.");
};


instance DIA_HYGLAS_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_firebolt_condition;
	information = dia_hyglas_firebolt_info;
	permanent = FALSE;
	description = "Jakie sk³adniki potrzebne s¹ do stworzenia runy ognistej strza³y?";
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
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Jakie sk³adniki potrzebne s¹ do stworzenia runy ognistej strza³y?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Wszystkie odpowiedzi znajdziesz w ksiêgach.
};


instance DIA_HYGLAS_TALENT_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 990;
	condition = dia_hyglas_talent_firebolt_condition;
	information = dia_hyglas_talent_firebolt_info;
	permanent = TRUE;
	description = "Naucz mnie, jak stworzyæ runê OGNISTEJ STRZA³Y.";
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
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Naucz mnie, jak stworzyæ runê OGNISTEJ STRZA£Y.
	if(b_teachplayertalentrunes(self,other,SPL_FIREBOLT))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Aby stworzyæ runê ognistej strza³y, musisz po³¹czyæ na stole runicznym siarkê z kamieniem runicznym.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Moc zaklêcia ognistej strza³y wniknie w runê, a ty dostaniesz narzêdzie Innosa.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Skoro ju¿ masz wszystkie materia³y, mo¿esz przyst¹piæ do tworzenia runy.
	};
};


instance DIA_HYGLAS_BLANK_RUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_blank_rune_condition;
	information = dia_hyglas_blank_rune_info;
	permanent = FALSE;
	description = "Gdzie znajdê kamieñ runiczny?";
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
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Gdzie znajdê kamieñ runiczny?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Hej hej, to twoja próba, nie moja. Znalezienie kamienia jest czêœci¹ zadania.
};


instance DIA_HYGLAS_GOTRUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_gotrune_condition;
	information = dia_hyglas_gotrune_info;
	permanent = FALSE;
	description = "Stworzy³em runê.";
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
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Stworzy³em runê.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//No proszê. Zdaje siê, ¿e przeszed³eœ próbê. Nie by³o to chyba a¿ takie trudne.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//IdŸ do Ulthara i poka¿ mu swoje dzie³o.
	b_logentry(TOPIC_RUNE,"Stworzy³em runê Ognistej Strza³y.");
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
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//Zostañ moim nauczycielem.
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
	description = "Jakieœ wieœci?";
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
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Jakieœ wieœci?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, tak. No có¿, prawdopodobnie zauwa¿y³eœ te odziane na czarno postacie.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Spotka³em je.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//I tu dochodzimy do sedna problemu. Aktualny uk³ad gwiazd jest bardzo nietypowy.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//Mówi¹c konkretniej, konstelacja Wo³a wesz³a w koniunkcjê z konstelacj¹ Wojownika. Nie muszê chyba t³umaczyæ, co to oznacza.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmmm. No có¿, szczerze mówi¹c...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Jasne, rozumiem. Nie bêdê siê teraz wdawa³ w szczegó³owe rozwa¿ania na temat takiej konfiguracji. Powiem tylko tyle, ¿e oznacza ona wielkie zmiany. A ja nie lubiê zmian.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Dlatego chcê, abyœ przyniós³ mi z miasta pewn¹ ksiêgê, zatytu³owan¹ 'Boska moc gwiazd'. Zdobycie jej mo¿e wymagaæ nieco wysi³ku, ale jestem pewien, ¿e sobie poradzisz.
	Info_ClearChoices(dia_hyglas_bringbook);
	Info_AddChoice(dia_hyglas_bringbook,"Sam sobie znajdŸ tê ksiêgê.",dia_hyglas_bringbook_getityourself);
	Info_AddChoice(dia_hyglas_bringbook,"A co JA bêdê z tego mia³?",dia_hyglas_bringbook_getforit);
	Info_AddChoice(dia_hyglas_bringbook,"Zobaczê, czy uda mi siê j¹ znaleŸæ.",dia_hyglas_bringbook_yes);
};

func void dia_hyglas_bringbook_getityourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Sam sobie znajdŸ tê ksiêgê.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Jak œmiesz odzywaæ siê do mnie w ten sposób? Takim zachowaniem okazujesz brak nale¿nego mi szacunku.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//ZejdŸ mi z oczu i zastanów siê dobrze nad swoim postêpowaniem.
	MIS_HYGLASBRINGBOOK = LOG_OBSOLETE;
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_getforit()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//A co z tego bêdê mia³?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Nie ca³kiem rozumiem...
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Chcia³bym wiedzieæ, co zyskam, jeœli przyniosê ci ksiêgê.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nic. A czego oczekiwa³eœ? Jeœli masz czas na wycieczkê do miasta, twoim obowi¹zkiem jest mi pomóc.
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Zobaczê, czy uda mi siê j¹ znaleŸæ.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//Dobrze - dziêki temu bêdê mia³ wiêcej czasu na inne sprawy.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Spróbuj za³atwiæ to jak najszybciej. Obawiam siê, ¿e czas jest w tej chwili doœæ cennym towarem.
	MIS_HYGLASBRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(dia_hyglas_bringbook);
	Log_CreateTopic(TOPIC_HYGLASBRINGBOOK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HYGLASBRINGBOOK,LOG_RUNNING);
	b_logentry(TOPIC_HYGLASBRINGBOOK,"Hyglas chce, abym przyniós³ mu ksiêgê zatytu³owan¹ 'Boska moc gwiazd'. Mo¿e ma j¹ któryœ z handlarzy w mieœcie.");
};


instance DIA_HYGLAS_HAVEBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_havebook_condition;
	information = dia_hyglas_havebook_info;
	permanent = FALSE;
	description = "Przynios³em ci ksiêgê.";
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
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Przynios³em ci ksiêgê.
	if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Bardzo dobrze, daj mi j¹.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//A wiêc jednak zmieni³eœ zdanie. Bardzo dobrze. Gdzie jest ksiêga?
	};
	b_giveinvitems(other,self,itwr_astronomy_mis,1);
	MIS_HYGLASBRINGBOOK = LOG_SUCCESS;
	b_giveplayerxp(XP_HYGLASBRINGBOOK);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Mo¿esz odejœæ. A ja zajmê siê badaniami.
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
	description = "Dowiedzia³eœ siê czegoœ nowego?";
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
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Dowiedzia³eœ siê czegoœ nowego?
	if(MIS_HYGLASBRINGBOOK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//Nie jestem do koñca pewien, ale wygl¹da na to, ¿e aktualny uk³ad gwiazd zwiastuje k³opoty.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Jakie problemy?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Materia rozdzielaj¹ca dwa œwiaty sta³a siê bardzo cienka. Gdyby ktoœ chcia³ otworzyæ przejœcie, móg³by to zrobiæ, u¿ywaj¹c zaledwie cz¹stki mocy potrzebnej do tego w innych okolicznoœciach.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Demony mog¹ u¿ywaæ takich przejœæ, aby przenikaæ do naszego œwiata.
		HYGLAS_SENDSTOKARRAS = TRUE;
	}
	else if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Nie, wci¹¿ czekam na tê ksiêgê.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Oczywiœcie wci¹¿ prowadzê swoje badania, jednak potrwaj¹ one znacznie d³u¿ej, jeœli nie bêdê mia³ niezbêdnych materia³ów.
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

