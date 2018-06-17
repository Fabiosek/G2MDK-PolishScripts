
instance DIA_ROD_EXIT(C_INFO)
{
	npc = sld_804_rod;
	nr = 999;
	condition = dia_rod_exit_condition;
	information = dia_rod_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rod_exit_condition()
{
	return TRUE;
};

func void dia_rod_exit_info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_ROD_HELLO(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_hello_condition;
	information = dia_rod_hello_info;
	permanent = FALSE;
	description = "Jak leci?";
};


func int dia_rod_hello_condition()
{
	return TRUE;
};

func void dia_rod_hello_info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//Co s�ycha�?
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//Czego ode mnie chcesz, mi�czaku?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//Nie znale�li ci milutkiego pokoiku w klasztorze?
		};
	};
};


var int rod_schwachgesagt;

instance DIA_ROD_WANNALEARN(C_INFO)
{
	npc = sld_804_rod;
	nr = 2;
	condition = dia_rod_wannalearn_condition;
	information = dia_rod_wannalearn_info;
	permanent = TRUE;
	description = "Czy m�g�by� mnie nauczy�, jak walczy� broni� dwur�czn�?";
};


func int dia_rod_wannalearn_condition()
{
	if(ROD_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_rod_wannalearn_info()
{
	AI_Output(other,self,"DIA_Rod_WannaLearn_15_00");	//Czy m�g�by� mnie nauczy�, jak walczy� broni� dwur�czn�?
	if((ROD_WETTEGEWONNEN == TRUE) || (self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//Jestem niezgorszym wojownikiem, co nie znaczy - dobrym nauczycielem.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//Chocia� pewnie m�g�bym ci pokaza� podstawy walki t� broni�.
		if(Npc_HasItems(self,itmw_2h_rod) == 0)
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_03");	//Pod warunkiem, oczywi�cie, �e mi zwr�cisz m�j miecz.
		}
		else
		{
			ROD_TEACH2H = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_04");	//Pos�uchaj ch�opcze. Potrzeba wiele si�y, by w og�le ud�wign�� bro� dwur�czn�.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//Skocz ch�opcze lepiej na pastwisko i pobaw si� w ciuciubabk� z owieczkami!
		ROD_SCHWACHGESAGT = TRUE;
	};
};


var int rod_merke_2h;

instance DIA_ROD_TEACH(C_INFO)
{
	npc = sld_804_rod;
	nr = 3;
	condition = dia_rod_teach_condition;
	information = dia_rod_teach_info;
	permanent = TRUE;
	description = "Chc� poprawi� swoje umiej�tno�ci w walce broni� dwur�czn�!";
};


func int dia_rod_teach_condition()
{
	if(ROD_TEACH2H == TRUE)
	{
		return TRUE;
	};
};

func void dia_rod_teach_info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//Chc� poprawi� swoje umiej�tno�ci w walce broni� dwur�czn�!
	ROD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_back()
{
	if(ROD_MERKE_2H < other.hitchance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//Ju� ca�kiem nie�le sobie radzisz.
	};
	Info_ClearChoices(dia_rod_teach);
};

func void dia_rod_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};


instance DIA_ROD_WANNAJOIN(C_INFO)
{
	npc = sld_804_rod;
	nr = 4;
	condition = dia_rod_wannajoin_condition;
	information = dia_rod_wannajoin_info;
	permanent = TRUE;
	description = "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
};


func int dia_rod_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rod_wannajoin_info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?
	if(Npc_HasItems(self,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//Mo�e najpierw oddasz mi miecz, co?
	}
	else if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//W porz�dku, nie chowam urazy.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//Dobrze walczysz, a to jest najwa�niejsze.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//B�jki mi�dzy przyjaci�mi to tutaj normalka. Przyzwyczaisz si�.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_05");	//No prosz�, masz ju� ca�kiem przyzwoity miecz. Reszty te� si� nauczysz.
		};
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//Je�li o mnie chodzi, nie ma sprawy.
		b_logentry(TOPIC_SLDRESPEKT,"Rod poprze mnie, je�li zechc� si� przy��czy� do najemnik�w.");
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_07");	//Nie mamy tu miejsca dla mi�czak�w.
		ROD_SCHWACHGESAGT = TRUE;
	};
};


instance DIA_ROD_DUELL(C_INFO)
{
	npc = sld_804_rod;
	nr = 6;
	condition = dia_rod_duell_condition;
	information = dia_rod_duell_info;
	permanent = TRUE;
	description = "Chyba przyda�aby ci si� lekcja dobrych manier, co?";
};


func int dia_rod_duell_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		if((ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
		{
			return TRUE;
		};
		if(MIS_JARVIS_SLDKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};

func void dia_rod_duell_info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//Chyba przyda�aby ci si� lekcja dobrych manier, co?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//Dalej, spr�buj!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//Chyba nigdy si� nie nauczysz!
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ROD_STARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_starkgenug_condition;
	information = dia_rod_starkgenug_info;
	permanent = FALSE;
	description = "Jestem raczej silny!";
};


func int dia_rod_starkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rod_starkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//Jestem do�� silny!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//Nonsens! Nie uni�s�by� nawet przyzwoitego miecza, takiego jak cho�by m�j.
	Log_CreateTopic(TOPIC_RODWETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RODWETTE,LOG_RUNNING);
	b_logentry(TOPIC_RODWETTE,"Najemnik Rod twierdzi, �e nie zdo�am ud�wign�� jego miecza.");
};


instance DIA_ROD_BINSTARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_binstarkgenug_condition;
	information = dia_rod_binstarkgenug_info;
	permanent = FALSE;
	description = "Powiedzia�em, �e JESTEM dostatecznie silny.";
};


func int dia_rod_binstarkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_starkgenug))
	{
		return TRUE;
	};
};

func void dia_rod_binstarkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//Powiedzia�em, �e JESTEM dostatecznie silny.
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//Jeste� rozbrajaj�cy. Zaryzykujesz zak�adzik?
};


var int rod_wettegewonnen;
var int rod_wetteangenommen;

instance DIA_ROD_WETTE(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_wette_condition;
	information = dia_rod_wette_info;
	permanent = TRUE;
	description = "Za�o�� si�, �e spokojnie dam sobie rad� z twoim mieczem!";
};


func int dia_rod_wette_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_binstarkgenug) && (Npc_HasItems(self,itmw_2h_rod) > 0) && (ROD_WETTEANGENOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_rod_wette_info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//Za�o�� si�, �e spokojnie dam sobie rad� z twoim mieczem!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//Naprawd�? Hmmm... Ile chcesz przegra�?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//No c�, wygl�dasz raczej na biednego durnia. Powiedzmy - 30 sztuk z�ota! Masz chocia� tyle?
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"Nie.",dia_rod_wette_no);
	Info_AddChoice(dia_rod_wette,"Jasne.",dia_rod_wette_yes);
	b_logentry(TOPIC_RODWETTE,"Rod got�w jest za�o�y� si� o 30 sztuk z�ota, �e nie ud�wign� jego miecza.");
};

func void dia_rod_wette_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//Nie.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//Ach, odejd�.
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//Jasne.
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Niech no spojrz�...
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		ROD_WETTEANGENOMMEN = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Prosz�!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//W porz�dku, zobaczmy, na co ci� sta�...
		b_giveinvitems(self,other,itmw_2h_rod,1);
		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons(other);
			AI_EquipBestMeleeWeapon(other);
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//Cho�by na to?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//No c�, wygl�da na to, �e wygra�e�.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//Kto by przypuszcza�. Naprawd� nie wygl�dasz mi na kogo�, kto mia�by tyle krzepy.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//Wygl�da na to, �e w�a�nie straci�em 30 sztuk z�ota. Oto pieni�dze.
			b_giveinvitems(self,other,itmi_gold,60);
			ROD_WETTEGEWONNEN = TRUE;
			b_giveplayerxp(XP_ROD);
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//Nie ud�wign� tej broni!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//To w�a�nie pr�buj� ci u�wiadomi�!
		};
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//A teraz oddaj miecz.
		Info_ClearChoices(dia_rod_wette);
		Info_AddChoice(dia_rod_wette,"Raczej nie...",dia_rod_wette_keepit);
		Info_AddChoice(dia_rod_wette,"Prosz�!",dia_rod_wette_giveback);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//Chwileczk�, gdzie� ja go po�o�y�em...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//Hmmm... Wr��, kiedy b�dziesz mia� pieni�dze na zak�ad.
		Info_ClearChoices(dia_rod_wette);
	};
};

func void dia_rod_wette_giveback()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//Prosz�!
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"(Oddaj bro�)",dia_rod_wette_giveback2);
};

func void dia_rod_wette_giveback2()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	if(ROD_WETTEGEWONNEN == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//Mimo wszystko jeste� mi�czak i tyle.
	};
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_keepit()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//Raczej nie...
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//S�ucham?
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Chyba zatrzymam go na jaki� czas.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//Zaczekaj no, skurczybyku!
	Info_ClearChoices(dia_rod_wette);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


var int rod_schwertxpgiven;

instance DIA_ROD_GIVEITBACK(C_INFO)
{
	npc = sld_804_rod;
	nr = 7;
	condition = dia_rod_giveitback_condition;
	information = dia_rod_giveitback_info;
	permanent = TRUE;
	description = "Prosz�, oto tw�j miecz!";
};


func int dia_rod_giveitback_condition()
{
	if(Npc_HasItems(other,itmw_2h_rod) > 0)
	{
		return TRUE;
	};
};

func void dia_rod_giveitback_info()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Prosz�, oto tw�j miecz!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Czas najwy�szy!
	if(ROD_SCHWERTXPGIVEN == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		ROD_SCHWERTXPGIVEN = TRUE;
	};
};


instance DIA_ROD_PERM(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_perm_condition;
	information = dia_rod_perm_info;
	permanent = TRUE;
	description = "Co s�ycha�?";
};


func int dia_rod_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rod_hello))
	{
		return TRUE;
	};
};

func void dia_rod_perm_info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//Jak leci?
	if(KAPITEL <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//Nie twoja sprawa, kole�.
				ROD_SCHWACHGESAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//Ciekawe czy pozwol� ci si� przy��czy�.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//Jeste� teraz jednym z nas, ch�opcze. Chyba si� jako� dogadamy.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//Nie ma tu dla ciebie miejsca. Id� si� lepiej powa��sa� gdzie indziej.
		};
	};
	if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//Je�li opowie�ci o smokach s� prawdziwe, powinni�my zebra� paru ludzi i pokaza� tym bestiom, gdzie ich miejsce!
	};
};


instance DIA_RODSLD_PICKPOCKET(C_INFO)
{
	npc = sld_804_rod;
	nr = 900;
	condition = dia_rodsld_pickpocket_condition;
	information = dia_rodsld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rodsld_pickpocket_condition()
{
	return c_beklauen(15,35);
};

func void dia_rodsld_pickpocket_info()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_BACK,dia_rodsld_pickpocket_back);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_PICKPOCKET,dia_rodsld_pickpocket_doit);
};

func void dia_rodsld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rodsld_pickpocket);
};

func void dia_rodsld_pickpocket_back()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
};

