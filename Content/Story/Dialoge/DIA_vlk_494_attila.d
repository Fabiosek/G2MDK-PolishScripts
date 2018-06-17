
instance DIA_ATTILA_EXIT(C_INFO)
{
	npc = vlk_494_attila;
	nr = 999;
	condition = dia_attila_exit_condition;
	information = dia_attila_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_attila_exit_condition()
{
	return TRUE;
};

func void dia_attila_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ATTILA_PICKPOCKET(C_INFO)
{
	npc = vlk_494_attila;
	nr = 900;
	condition = dia_attila_pickpocket_condition;
	information = dia_attila_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_attila_pickpocket_condition()
{
	return c_beklauen(55,100);
};

func void dia_attila_pickpocket_info()
{
	Info_ClearChoices(dia_attila_pickpocket);
	Info_AddChoice(dia_attila_pickpocket,DIALOG_BACK,dia_attila_pickpocket_back);
	Info_AddChoice(dia_attila_pickpocket,DIALOG_PICKPOCKET,dia_attila_pickpocket_doit);
};

func void dia_attila_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_attila_pickpocket);
};

func void dia_attila_pickpocket_back()
{
	Info_ClearChoices(dia_attila_pickpocket);
};


instance DIA_ATTILA_HALLO(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_hallo_condition;
	information = dia_attila_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_attila_hallo_condition()
{
	if(MIS_THIEFGUILD_SUCKED == TRUE)
	{
		return TRUE;
	};
};

func void dia_attila_hallo_info()
{
	AI_Output(self,other,"DIA_Attila_Hallo_09_00");	//Ach - nareszcie. Czeka�em na ciebie, nieznajomy.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Czego ode mnie chcesz?",dia_attila_hallo_was);
	Info_AddChoice(dia_attila_hallo,"Kim jeste�?",dia_attila_hallo_wer);
	b_giveplayerxp(XP_ATTILA_METHIM);
};

func void dia_attila_hallo_wer()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Nazywaj� mnie Attila... Ale czy to wa�ne? Nasze imiona nie maj� znaczenia.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//Sam to powiniene� najlepiej wiedzie�, nieznajomy.
	KNOWS_ATTILA_WER = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WAS == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"Czego ode mnie chcesz?",dia_attila_hallo_was);
	};
	Info_AddChoice(dia_attila_hallo,"Co to za przedstawienie?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_was()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");	//Czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");	//Jestem tu po to, �eby ci wyja�ni� kilka spraw. A potem ci� zabij�.
	KNOWS_ATTILA_WAS = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WER == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"Kim jeste�?",dia_attila_hallo_wer);
	};
	Info_AddChoice(dia_attila_hallo,"Kto ci za to zap�aci�?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Co to za przedstawienie?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_theater()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00");	//Co to za przedstawienie?
	AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01");	//U kresu swojej podr�y powiniene� umrze�, wiedz�c dlaczego. Uznaj to za ostatni wyraz szacunku dla skaza�ca.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"P�jd� ju� sobie (KONIEC)",dia_attila_hallo_ende);
	Info_AddChoice(dia_attila_hallo,"Kto ci za to zap�aci�?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Czemu chcesz mnie zabi�?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_ende()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");	//Zamierzam st�d teraz wyj��...
	AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");	//Obawiam si�... �e nie mog� na to pozwoli�. Pog�d� si� z tym. Czas umiera�.
	AI_DrawWeapon(self);
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Kto ci za to zap�aci�?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Czemu chcesz mnie zabi�?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_auftrag()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//Kto ci za to zap�aci�?
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01");	//Moi zleceniodawcy wol� unika� rozg�osu. I ja tak�e.
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02");	//M�j kontrakt stwierdza, �e nie wolno mi zdradzi� ich imion ani miejsca pobytu.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Czemu chcesz mnie zabi�?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_warum()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//Czemu chcesz mnie zabi�?
	if(BETRAYAL_HALVOR == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");	//�ci�gn��e� uwag� na Halvora. Teraz on siedzi w wi�zieniu. Tego nie by�o w planie.
	};
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");	//Sprzeda�e� Rengara stra�nikom miejskim. To tylko drobny z�odziej, ale nie powiniene� by� tego robi�.
	};
	if(NAGUR_AUSGELIEFERT == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");	//Przez ciebie Nagur wyl�dowa� za kratami. Pewni ludzie uznali to za tw�j niewybaczalny b��d.
	};
	AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");	//Moi zleceniodawcy nie s� z tego zadowoleni. I wys�ali mnie, aby uniemo�liwi� ci pope�nienie dalszych b��d�w.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Mog� ci da� z�oto...",dia_attila_hallo_gold);
	Info_AddChoice(dia_attila_hallo,"Pozw�l mi przynajmniej wyci�gn�� bro�.",dia_attila_hallo_attacke);
};

func void dia_attila_hallo_gold()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");	//Mog� da� ci z�oto... Du�o z�ota.
	AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");	//Nic z tego. Nie po to tu przyszed�em. Jedyna cena, jak� zap�acisz, to twoje �ycie. W�a�nie teraz.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_attila_hallo_attacke()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00");	//Pozw�l mi przynajmniej wyci�gn�� bro�.
	if(Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01");	//Dobrze, a wi�c przygotuj si� do swej ostatniej walki.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02");	//Przecie� nie masz �adnej przy pasie. Zosta�o ci niewiele czasu, nieznajomy. �mier� na ciebie czeka.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,2);
	};
};


instance DIA_ATTILA_WILLKOMMEN(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_willkommen_condition;
	information = dia_attila_willkommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_attila_willkommen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_THIEFGUILD_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_attila_willkommen_info()
{
	AI_Output(self,other,"DIA_Attila_Willkommen_09_00");	//Ach - nareszcie. Czeka�em na ciebie, nieznajomy.
	b_giveplayerxp(XP_ATTILA_FRIEND);
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Kim jeste�? I czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Attila_Willkommen_09_02");	//To nieistotne. Wa�ne jest to, co zrobi�e�. Pozosta�e� lojalny - nawet je�li nie zdawa�e� sobie z tego sprawy.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_03");	//Pewni dobroczy�cy zwr�cili uwag� na twoj� lojalno��. I zaoferowali ci szans�. Wi�c lepiej j� wykorzystaj.
	AI_Output(other,self,"DIA_Attila_Willkommen_15_04");	//Hej, powiedz mi tylko, czemu tu jeste�...
	AI_Output(self,other,"DIA_Attila_Willkommen_09_05");	//Mam dla ciebie prezent. Reszta zale�y od ciebie, nieznajomy.
	b_giveinvitems(self,other,itke_thiefguildkey_mis,1);
	ATTILA_KEY = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AFTER");
};


instance DIA_ATTILA_NACHSCHLUESSEL(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_nachschluessel_condition;
	information = dia_attila_nachschluessel_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_attila_nachschluessel_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_wer) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_attila_nachschluessel_info()
{
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");	//Moje zadanie wykonane - na razie.
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");	//Ale kto wie, mo�e nasze drogi jeszcze si� kiedy� skrzy�uj�...
	AI_StopProcessInfos(self);
};


instance DIA_ATTILA_WER(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_wer_condition;
	information = dia_attila_wer_info;
	permanent = FALSE;
	description = "Kim jeste�?";
};


func int dia_attila_wer_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_willkommen))
	{
		return TRUE;
	};
};

func void dia_attila_wer_info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Nazywaj� mnie Attila... Ale czy to wa�ne? Nasze imiona nie maj� znaczenia.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//Sam to powiniene� najlepiej wiedzie�, nieznajomy.
	AI_StopProcessInfos(self);
};

