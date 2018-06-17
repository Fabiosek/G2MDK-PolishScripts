
instance DIA_ALRIK_EXIT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 999;
	condition = dia_alrik_exit_condition;
	information = dia_alrik_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alrik_exit_condition()
{
	return TRUE;
};

func void dia_alrik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALRIK_PICKPOCKET(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 900;
	condition = dia_alrik_pickpocket_condition;
	information = dia_alrik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_alrik_pickpocket_condition()
{
	return c_beklauen(55,50);
};

func void dia_alrik_pickpocket_info()
{
	Info_ClearChoices(dia_alrik_pickpocket);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_BACK,dia_alrik_pickpocket_back);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_PICKPOCKET,dia_alrik_pickpocket_doit);
};

func void dia_alrik_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alrik_pickpocket);
};

func void dia_alrik_pickpocket_back()
{
	Info_ClearChoices(dia_alrik_pickpocket);
};


instance DIA_ALRIK_HALLO(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_hallo_condition;
	information = dia_alrik_hallo_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_alrik_hallo_condition()
{
	return TRUE;
};

func void dia_alrik_hallo_info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tu robisz?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//To m�j dom!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//A co mam robi�? Pij�.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Id� na przechadzk�.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale je�li pytasz, co robi� przez ca�y dzie�, to ci powiem - organizuj� walki.
};


instance DIA_ALRIK_YOUFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_youfight_condition;
	information = dia_alrik_youfight_info;
	permanent = FALSE;
	description = "Ty organizujesz walki?";
};


func int dia_alrik_youfight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_hallo))
	{
		return TRUE;
	};
};

func void dia_alrik_youfight_info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty organizujesz walki?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Codziennie, od po�udnia do wieczora.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//Dok�adnie tutaj!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za magazynem w dzielnicy portowej - wsz�dzie dobrze, ale w domu najlepiej!
};


instance DIA_ALRIK_REGELN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_regeln_condition;
	information = dia_alrik_regeln_info;
	permanent = FALSE;
	description = "Jakie s� zasady walk?";
};


func int dia_alrik_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_regeln_info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jakie s� zasady walk?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Ca�kiem proste: mo�na u�ywa� ka�dej normalnej broni. �adnych �uk�w ani kusz, i �ADNEJ magii!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Walczymy, dop�ki jeden nie padnie. Kiedy jeden z walcz�cych pada na ziemi�, walka si� ko�czy. Zrozumia�e�?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Kto wyjdzie z naro�nika, ten odpada! Wi�c je�li si� wycofasz, ja wygrywam!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Stawka wynosi 50 z�otych monet. Je�li wygrasz, zabierasz st�w�. Je�li nie - no c� - wtedy twoje pieni�dze znikaj�.
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Zrozumia�e�?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jasne!
};

func void b_alrik_again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Jak leci? Chcesz znowu stan�� przeciwko mnie? S�dz�, �e w mi�dzyczasie sta�em si� lepszy...
};


instance DIA_ALRIK_NEWFIGHTS3(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights3_condition;
	information = dia_alrik_newfights3_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights3_condition()
{
	if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN <= 6))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights3_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,4);
	b_alrik_again();
};


instance DIA_ALRIK_NEWFIGHTS5(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights5_condition;
	information = dia_alrik_newfights5_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights5_condition()
{
	if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN <= 9))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights5_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,6);
	b_alrik_again();
};

func void b_alrik_enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//My�l�, �e ju� do�� wygra�e�.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Nie zrozum mnie �le, ale we �bie nadal mi si� kr�ci po poprzednim razie...
};

func void b_alrik_comebacklater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Wr�� do mnie p�niej. A w mi�dzyczasie troch� potrenuj�...
};


instance DIA_ALRIK_WANNAFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_wannafight_condition;
	information = dia_alrik_wannafight_info;
	permanent = TRUE;
	description = "Chc� z tob� walczy�!";
};


func int dia_alrik_wannafight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_regeln) && (self.aivar[AIV_ARENAFIGHT] == AF_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_wannafight_info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chc� z tob� walczy�!
	Info_ClearChoices(dia_alrik_wannafight);
	if(((ALRIK_ARENAKAMPFVERLOREN > 0) && (Npc_HasItems(self,itmw_alrikssword_mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_ALRIK_SWORD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Najpierw oddaj mi m�j miecz. Wtedy zobaczymy...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Nie, nie. Zanim znowu zmierz� si� z tob�, potrzebna mi lepsza bro�!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//Kilka dni temu musia�em sprzeda� sw�j miecz.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//Z tym male�stwem jestem niepokonany! Je�li je odzyskasz, znowu si� z tob� zmierz�!
			ALRIK_VOMSCHWERTERZAEHLT = TRUE;
			Log_CreateTopic(TOPIC_ALRIKSCHWERT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ALRIKSCHWERT,LOG_RUNNING);
			b_logentry(TOPIC_ALRIKSCHWERT,"Arik sprzeda� sw�j miecz kupcowi imieniem Jora. Zgodzi si� ze mn� walczy� tylko pod warunkiem, �e odzyskam jego bro�.");
		};
	}
	else if((KAPITEL <= 2) && (ALRIK_ARENAKAMPFVERLOREN > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Chyba na razie wystarczy...
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Zr�bmy kr�tk� przerw�.
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN > 6))
	{
		b_alrik_enough();
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN > 9))
	{
		b_alrik_enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Poza tym zgarn��em ju� do�� z�ota.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//Rezygnuj�, zamierzam zatrzyma� si� gdzie� w mie�cie...
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kto wie, mo�e otworz� sklep z broni�...
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//Masz 50 sztuk z�ota?
		Info_ClearChoices(dia_alrik_wannafight);
		Info_AddChoice(dia_alrik_wannafight,"Nie...",dia_alrik_wannafight_nogold);
		if(Npc_HasItems(other,itmi_gold) >= 50)
		{
			Info_AddChoice(dia_alrik_wannafight,"Prosz� bardzo...",dia_alrik_wannafight_gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Walcz� tylko od po�udnia do wieczora.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Walka ma jaki� sens tylko wtedy, kiedy jest do�� widz�w obstawiaj�cych zak�ady.
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Jest ju� za p�no. Wr�� jutro w po�udnie!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Jest jeszcze za wcze�nie, przyjd� p�niej!
		};
	};
};

func void dia_alrik_wannafight_gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Prosz� bardzo...
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//Mamy nowego zawodnika!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//Zak�ady obstawione...
	Npc_RemoveInvItems(self,itmi_gold,Npc_HasItems(self,itmi_gold));
	CreateInvItems(self,itmi_gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Jeste� gotowy?
	self.aivar[AIV_ARENAFIGHT] = AF_RUNNING;
	ALRIK_KAEMPFE = ALRIK_KAEMPFE + 1;
	Info_ClearChoices(dia_alrik_wannafight);
	Info_AddChoice(dia_alrik_wannafight,"Chwileczk�...",dia_alrik_wannafight_moment);
	Info_AddChoice(dia_alrik_wannafight,"No chod�!",dia_alrik_wannafight_now);
};

func void dia_alrik_wannafight_nogold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Nie...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//No to je przynie�! Bez stawki nie ma walki!
	Info_ClearChoices(dia_alrik_wannafight);
};

func void dia_alrik_wannafight_now()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//No chod�!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//No to zobaczymy, na co ci� sta�!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_alrik_wannafight_moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Chwileczk�...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Spokojnie... Ja zaczynam!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ALRIK_AFTERFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_afterfight_condition;
	information = dia_alrik_afterfight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_alrik_afterfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ARENAFIGHT] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
	};
};

func void dia_alrik_afterfight_info()
{
	if((self.aivar[AIV_LASTPLAYERAR] == AR_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Och, stary! Masz niez�y cios.
			if(Npc_HasItems(self,itmi_gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Oto twoje 100 sztuk z�ota! Zas�u�y�e� na nie!
				b_giveinvitems(self,other,itmi_gold,100);
			}
			else if(Npc_HasItems(self,itmi_gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Jak widz�, ju� wzi��e� swoje z�oto.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//Mog�e� zaczeka�, a� ci je dam - dotrzymuj� s�owa!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Przetrz�sn��e� mi kieszenie, kiedy by�em nieprzytomny!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To z�y zwyczaj, stary! Niewa�ne, pieni�dze i tak by�y twoje. Tu jest reszta.
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
			};
			ALRIK_ARENAKAMPFVERLOREN = ALRIK_ARENAKAMPFVERLOREN + 1;
		}
		else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//To by�a dobra walka. Twoja stawka przepad�a - nie �a�uj jej, to dla dobra sprawy!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hej, m�wi�em, kto opuszcza naro�nik, przegrywa walk�! Je�li chcesz spr�bowa� jeszcze raz, jestem do twojej dyspozycji!
		};
		if(ALRIK_KAEMPFE == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//I jeszcze jedno: nikt nie rozmawia o tym, co si� dzieje za magazynem.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Stra� pakuje za kratki ka�dego, kto si� tu zjawia. Ci ch�opcy nie lubi� walk za pieni�dze.
			};
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Walka by�a sko�czona, ty w��cz�go!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Nie podoba mi si�, kiedy kto� nie przestrzega zasad.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Wyno� si� st�d!
		}
		else
		{
			if(ALRIK_KAEMPFE == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Skoro chcia�e� walczy� ze mn�, wystarczy�o mnie wyzwa�.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Skoro chcia�e� walczy� ze mn� jeszcze raz, wystarczy�o mnie wyzwa�!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//Nie chc� mie� nic wsp�lnego z m�tami takimi jak ty! Zje�d�aj!
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ALRIK_DUWOHNST(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_duwohnst_condition;
	information = dia_alrik_duwohnst_info;
	permanent = FALSE;
	description = "'Mieszkasz' za tym magazynem?";
};


func int dia_alrik_duwohnst_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_duwohnst_info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//'Mieszkasz' za tym magazynem?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//To tylko chwilowe. Kiedy b�dziesz mia� tyle z�ota co ja, b�dzie ci� sta� na troch� luksusu!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//By�em instruktorem musztry w armii, ale rzuci�em to, �eby zazna� przyg�d i poszuka� szcz�cia gdzie indziej.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//A teraz ugrz�z�em w tej dziurze. Moje ostatnie 100 sztuk z�ota znikn�o w kieszeniach stra�nik�w przy bramie.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Wi�c staram si� znowu zdoby� troch� pieni�dzy. Musia�em nawet sprzeda� sw�j miecz.
	ALRIK_VOMSCHWERTERZAEHLT = TRUE;
};


instance DIA_ALRIK_WERSCHWERT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_werschwert_condition;
	information = dia_alrik_werschwert_info;
	permanent = FALSE;
	description = "Komu sprzeda�e� ten miecz?";
};


func int dia_alrik_werschwert_condition()
{
	if((ALRIK_VOMSCHWERTERZAEHLT == TRUE) && (MIS_ALRIK_SWORD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_alrik_werschwert_info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu sprzeda�e� ten miecz?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//Wymieni�em go z handlarzem na targowisku na par� drobiazg�w.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Facet nazywa si� Jora. Pochodnie i troch� �arcia, kt�re da� mi w zamian, dawno ju� zu�y�em.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Raczej nie odda mi go za darmo...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//To stary miecz. Nie b�dzie za niego du�o chcia�. Pomy�l o tych pieni�dzach jako o dodatkowej stawce.
	MIS_ALRIK_SWORD = LOG_RUNNING;
};


var int alrik_einmalschwertbonus;

instance DIA_ALRIK_HAVESWORD(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_havesword_condition;
	information = dia_alrik_havesword_info;
	permanent = TRUE;
	description = "Mam tw�j miecz!";
};


func int dia_alrik_havesword_condition()
{
	if(Npc_HasItems(other,itmw_alrikssword_mis) > 0)
	{
		return TRUE;
	};
};

func void dia_alrik_havesword_info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//Mam tw�j miecz!
	b_giveinvitems(other,self,itmw_alrikssword_mis,1);
	if(MIS_ALRIK_SWORD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Ach! To znacznie lepsze, ni� wymachiwanie starym kijem!
		MIS_ALRIK_SWORD = LOG_SUCCESS;
		b_giveplayerxp(XP_ALRIKSSWORD);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Dobrze! Ciekaw jestem, kiedy odwa�ysz si� wyzwa� mnie ponownie!
	};
	if(ALRIK_EINMALSCHWERTBONUS == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_1H,20);
		ALRIK_EINMALSCHWERTBONUS = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_ALRIK_KRIEG(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_krieg_condition;
	information = dia_alrik_krieg_info;
	permanent = FALSE;
	description = "Co wiesz o wojnie z orkami?";
};


func int dia_alrik_krieg_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_krieg_info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Co wiesz o wojnie z orkami?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//Nie mam wiele do powiedzenia. Wojna trwa�a zdecydowanie za d�ugo.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Pro�ci ludzie g�oduj�. Wsz�dzie wybuchaj� ch�opskie bunty, kt�re Kr�l t�umi bez lito�ci.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Ale jest ich za du�o. Je�li wojna si� szybko nie sko�czy, to b�dzie koniec kr�lestwa.
};


var int alrik_vorauserzaehlt;

instance DIA_ALRIK_AUSBILDEN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_ausbilden_condition;
	information = dia_alrik_ausbilden_info;
	permanent = TRUE;
	description = "Czy mo�esz mnie wyszkoli�?";
};


func int dia_alrik_ausbilden_condition()
{
	if((Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE)) && (ALRIK_TEACH1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_ausbilden_info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Czy mo�esz mnie wyszkoli�?
	if((ALRIK_KAEMPFE == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Je�li naprawd� chcesz nauczy� si� walczy�, to zmierz si� ze mn�. Ta lekcja b�dzie za darmo.
		ALRIK_VORAUSERZAEHLT = TRUE;
	}
	else
	{
		if(ALRIK_VORAUSERZAEHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Dotrzymuj� s�owa. Naucz� ci� wszystkiego, co umiem - je�li jeste� wystarczaj�co do�wiadczony.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Jasne, pod warunkiem, �e masz do�� do�wiadczenia.
		};
		ALRIK_TEACH1H = TRUE;
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Alrik, kt�ry kr�ci si� za magazynem w dzielnicy portowej, mo�e mnie nauczy� walki or�em jednor�cznym.");
	};
};


var int alrik_merke_1h;

instance DIA_ALRIK_TEACH(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_teach_condition;
	information = dia_alrik_teach_info;
	permanent = TRUE;
	description = "Wyszkol mnie we w�adaniu mieczem!";
};


func int dia_alrik_teach_condition()
{
	if(ALRIK_TEACH1H == TRUE)
	{
		return TRUE;
	};
};

func void dia_alrik_teach_info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Wyszkol mnie we w�adaniu mieczem!
	ALRIK_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//Ju� nie jeste� pocz�tkuj�cy!
	}
	else if(other.hitchance[NPC_TALENT_1H] > ALRIK_MERKE_1H)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//Jeste� ju� lepszy. Nied�ugo staniesz si� prawdziwym wojownikiem!
	};
	Info_ClearChoices(dia_alrik_teach);
};

func void dia_alrik_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

