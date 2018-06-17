
instance DIA_HAUPTTORWACHE_EXIT(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 999;
	condition = dia_haupttorwache_exit_condition;
	information = dia_haupttorwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_haupttorwache_exit_condition()
{
	return TRUE;
};

func void dia_haupttorwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_AUFGABE(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 4;
	condition = dia_haupttorwache_aufgabe_condition;
	information = dia_haupttorwache_aufgabe_info;
	permanent = TRUE;
	description = "Jakie jest twoje zadanie?";
};


func int dia_haupttorwache_aufgabe_condition()
{
	return TRUE;
};

func void dia_haupttorwache_aufgabe_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//Jakie jest twoje zadanie?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//Moje zadanie jest proste. Mam siê upewniæ, ¿e orkowie trzymaj¹ siê ponad 10 metrów od bramy.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//Jeœli bêd¹ próbowali wedrzeæ siê przez bramê, podniosê alarm. I to wszystko.
};


instance DIA_HAUPTTORWACHE_TOROEFFNEN(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 5;
	condition = dia_haupttorwache_toroeffnen_condition;
	information = dia_haupttorwache_toroeffnen_info;
	permanent = TRUE;
	description = "Co trzeba zrobiæ, aby otworzyæ g³ówn¹ bramê?";
};


func int dia_haupttorwache_toroeffnen_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_haupttorwache_toroeffnen_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//Co trzeba zrobiæ, aby otworzyæ g³ówn¹ bramê?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//Na niebiosa, czemu ktokolwiek mia³by chcieæ j¹ otworzyæ?
	self.flags = 0;
	Info_ClearChoices(dia_haupttorwache_toroeffnen);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"Martwiê siê o bezpieczeñstwo zamku.",dia_haupttorwache_toroeffnen_sicherheit);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"Niewa¿ne. Tak tylko pytam.",dia_haupttorwache_toroeffnen_frage);
};

func void dia_haupttorwache_toroeffnen_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//Martwiê siê o bezpieczeñstwo zamku.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//Wierz mi, ja równie¿. Przez ca³y czas.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//A poniewa¿ jestem takim wiernym stra¿nikiem, Garond powierzy³ mi klucz do ko³owrotu.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//To wielka odpowiedzialnoœæ. Bêdê go dobrze strzeg³, tak jak przysiêga³em Garondowi.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//Tak. WyobraŸ sobie, ¿e ktoœ wchodzi i poci¹ga za dŸwigniê, aby otworzyæ bramê, a to stare zardzewia³e ¿elastwo siê blokuje.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//Nikt jej wtedy nie zdo³a zamkn¹æ. Wolê nawet nie myœleæ, co nast¹pi³oby potem. Na szczêœcie nikt nie wie, ¿e to ja mam klucz.
	AI_StopProcessInfos(self);
};

func void dia_haupttorwache_toroeffnen_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//Niewa¿ne. Tak tylko pytam.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//Nawet tak nie mów, bo jeszcze wykraczesz. I tak jest ju¿ wystarczaj¹co ciê¿ko. A teraz odejdŸ, jestem zajêty.
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_PICKPOCKET(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 900;
	condition = dia_haupttorwache_pickpocket_condition;
	information = dia_haupttorwache_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie dziecinnie ³atwa)";
};


func int dia_haupttorwache_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_oc_maingate_mis) >= 1) && (KAPITEL >= 5) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_haupttorwache_pickpocket_info()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_BACK,dia_haupttorwache_pickpocket_back);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_PICKPOCKET,dia_haupttorwache_pickpocket_doit);
};

func void dia_haupttorwache_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_oc_maingate_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_haupttorwache_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_haupttorwache_pickpocket_back()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
};

