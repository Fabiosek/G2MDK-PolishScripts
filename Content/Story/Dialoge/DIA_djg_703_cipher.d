
var int djg_cipher_dragonkillednotyet;

instance DIA_CIPHERDJG_EXIT(C_INFO)
{
	npc = djg_703_cipher;
	nr = 999;
	condition = dia_cipherdjg_exit_condition;
	information = dia_cipherdjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cipherdjg_exit_condition()
{
	return TRUE;
};

func void dia_cipherdjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_HALLO(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipher_hallo_condition;
	information = dia_cipher_hallo_info;
	description = "�adne obozowisko.";
};


func int dia_cipher_hallo_condition()
{
	return TRUE;
};

func void dia_cipher_hallo_info()
{
	AI_Output(other,self,"DIA_Cipher_HALLO_15_00");	//�adne obozowisko.
	AI_Output(self,other,"DIA_Cipher_HALLO_07_01");	//�wi�te s�owa. Cuchnie tu jak w rze�ni. Wsz�dzie martwe zwierz�ta i przegni�e drzewa.
};


instance DIA_CIPHERDJG_HELLOAGAIN(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_helloagain_condition;
	information = dia_cipherdjg_helloagain_info;
	description = "Co tu porabiasz?";
};


func int dia_cipherdjg_helloagain_condition()
{
	if((Npc_IsDead(swampdragon) == FALSE) && Npc_KnowsInfo(other,dia_cipher_hallo))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_helloagain_info()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_01");	//Siedz� tu ju� od pewnego czasu w oczekiwaniu na odpowiedni moment.
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_02");	//Odpowiedni moment? Na co?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_03");	//Gdzie� tu powinien by� smok. Od czasu jak si� pojawi�, zrobi�o si� tu wstr�tne bagno.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_04");	//Dobrze pami�tam czasy, kiedy nie trzeba by�o tutaj brodzi�...
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_05");	//Teraz jednak nie odwa�y�bym si� przyj�� tutaj sam.
	if(Npc_IsDead(djg_rod) == FALSE)
	{
		AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_06");	//C�. Rod wci�� tu jest. A on by zwia�, gdyby zobaczy� nawet jednego chrz�szcza.
	};
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_07");	//A co z tob�? Nie przyszed�e� tutaj na spacer, prawda? Wejd�my tam razem.
	b_logentry(TOPIC_DRAGONHUNTER,"Cipher powiedzia� mi, �e na bagnach w G�rniczej Dolinie mieszka smok.");
	Info_AddChoice(dia_cipherdjg_helloagain,"Wol� by� sam.",dia_cipherdjg_helloagain_goalone);
	Info_AddChoice(dia_cipherdjg_helloagain,"Czemu nie - przyda mi si� pomoc.",dia_cipherdjg_helloagain_gotogether);
};

func void dia_cipherdjg_helloagain_goalone()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00");	//Wol� by� sam.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01");	//Jak ci pasuje. Czyli pomyli�em si� co do ciebie!
	AI_StopProcessInfos(self);
};

func void dia_cipherdjg_helloagain_gotogether()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00");	//Czemu nie - przyda mi si� pomoc.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01");	//To dobrze. Czyli w ko�cu si� st�d wydostan�. Ten smr�d jest nie do zniesienia. Daj mi tylko zna� kiedy!
	DJG_SWAMPPARTY = TRUE;
	Info_ClearChoices(dia_cipherdjg_helloagain);
};


instance DIA_CIPHERDJG_GOTOGETHERAGAIN(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_gotogetheragain_condition;
	information = dia_cipherdjg_gotogetheragain_info;
	description = "Zmieni�em zdanie! Chod�my razem!";
};


func int dia_cipherdjg_gotogetheragain_condition()
{
	if(Npc_KnowsInfo(other,dia_cipherdjg_helloagain) && (DJG_SWAMPPARTY == FALSE) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_gotogetheragain_info()
{
	AI_Output(other,self,"DIA_CipherDJG_GOTOGETHERAGAIN_15_00");	//Zmieni�em zdanie! Chod�my razem!
	AI_Output(self,other,"DIA_CipherDJG_GOTOGETHERAGAIN_07_01");	//Daj mi tylko zna� kiedy!
	DJG_SWAMPPARTY = TRUE;
};


instance DIA_CIPHERDJG_GO(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_go_condition;
	information = dia_cipherdjg_go_info;
	description = "Teraz jest dobry moment, �eby ruszy�!";
};


func int dia_cipherdjg_go_condition()
{
	if((DJG_SWAMPPARTY == TRUE) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};


var int djg_swampparty_gogogo;

func void dia_cipherdjg_go_info()
{
	AI_Output(other,self,"DIA_CipherDJG_GO_15_00");	//Teraz jest dobry moment, �eby ruszy�!
	AI_Output(self,other,"DIA_CipherDJG_GO_07_01");	//Chod�my wi�c!
	AI_StopProcessInfos(self);
	DJG_SWAMPPARTY_GOGOGO = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	djg_rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait1");
	b_startotherroutine(djg_rod,"SwampWait1");
};


instance DIA_CIPHERDJG_SWAMPWAIT2(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_swampwait2_condition;
	information = dia_cipherdjg_swampwait2_info;
	important = TRUE;
};


func int dia_cipherdjg_swampwait2_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01") < 700) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_swampwait2_info()
{
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_00");	//Bagno zaczyna si� za nast�pnym zakr�tem. Powinni�my p�j�� prosto.
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_01");	//Albo mo�esz wypr�bowa� tamten korytarz, tak �eby �adna z bestii nie zaatakowa�a nas z ty�u. Co wolisz?
	AI_Output(other,self,"DIA_CipherDJG_SwampWait2_15_02");	//Nie marnujmy czasu!
	Info_AddChoice(dia_cipherdjg_swampwait2,DIALOG_ENDE,dia_cipherdjg_swampwait2_weiter);
};

func void dia_cipherdjg_swampwait2_weiter()
{
	AI_StopProcessInfos(self);
	DJG_SWAMPPARTY = TRUE;
	DJG_SWAMPPARTY_GOGOGO = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	djg_rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
	b_startotherroutine(djg_rod,"SwampWait2");
};


instance DIA_CIPHERDJG_GOFORSWAMPDRAGON(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_goforswampdragon_condition;
	information = dia_cipherdjg_goforswampdragon_info;
	important = 1;
	permanent = 0;
};


func int dia_cipherdjg_goforswampdragon_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01") < 1000) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_goforswampdragon_info()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_exit))
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_00");	//Do ataku!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SwampDragon");
		b_startotherroutine(djg_rod,"SwampDragon");
	}
	else
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_01");	//Ju� s�ysz� stwora. Musimy uwa�a�!
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_02");	//No dalej, zobaczmy, czy mo�emy zaatakowa�.
		AI_StopProcessInfos(self);
	};
	self.flags = 0;
	djg_rod.flags = 0;
};


instance DIA_CIPHERDJG_SWAMPDRAGONDEAD(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_swampdragondead_condition;
	information = dia_cipherdjg_swampdragondead_info;
	important = TRUE;
};


func int dia_cipherdjg_swampdragondead_condition()
{
	if((Npc_IsDead(swampdragon) == TRUE) && (DJG_SWAMPPARTY == TRUE) && (DJG_SWAMPPARTY_GOGOGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_swampdragondead_info()
{
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_00");	//Cholera, nie �yje?
	AI_Output(other,self,"DIA_CipherDJG_SWAMPDRAGONDEAD_15_01");	//Uspok�j si�. To ju� koniec!
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_02");	//O rany, ale w dech� kole�!
	AI_StopProcessInfos(self);
	b_giveplayerxp(XP_CIPHERDJGDEADDRAGON);
	DJG_SWAMPPARTY = FALSE;
	DJG_SWAMPPARTY_GOGOGO = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	djg_rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(djg_rod,"Start");
};


instance DIA_CIPHERDJG_WHATNEXT(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_whatnext_condition;
	information = dia_cipherdjg_whatnext_info;
	permanent = TRUE;
	description = "Bagienny smok nie �yje!";
};


func int dia_cipherdjg_whatnext_condition()
{
	if(Npc_IsDead(swampdragon) == TRUE)
	{
		return TRUE;
	};
};

func void dia_cipherdjg_whatnext_info()
{
	AI_Output(other,self,"DIA_CipherDJG_WHATNEXT_15_00");	//Bagienny smok nie �yje! Co teraz zrobisz?
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_01");	//Nie mam poj�cia. Nie zastanawia�em si� nad tym, naprawd�. W ka�dym razie mo�esz wr�ci� do Khorinis jako bohater.
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_02");	//Za�o�� si�, �e mo�na na tym zarobi�. Zastan�w si�.
	b_logentry(TOPIC_DRAGONHUNTER,"Kiedy bagienny smok zosta� zabity, Cipher stwierdzi�, �e zbije fortun� jako 'bohater'. To si� jeszcze oka�e.");
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_PICKPOCKET(C_INFO)
{
	npc = djg_703_cipher;
	nr = 900;
	condition = dia_cipher_pickpocket_condition;
	information = dia_cipher_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_cipher_pickpocket_condition()
{
	return c_beklauen(79,220);
};

func void dia_cipher_pickpocket_info()
{
	Info_ClearChoices(dia_cipher_pickpocket);
	Info_AddChoice(dia_cipher_pickpocket,DIALOG_BACK,dia_cipher_pickpocket_back);
	Info_AddChoice(dia_cipher_pickpocket,DIALOG_PICKPOCKET,dia_cipher_pickpocket_doit);
};

func void dia_cipher_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cipher_pickpocket);
};

func void dia_cipher_pickpocket_back()
{
	Info_ClearChoices(dia_cipher_pickpocket);
};

