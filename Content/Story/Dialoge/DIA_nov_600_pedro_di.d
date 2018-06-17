
instance DIA_PEDRO_DI_EXIT(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 999;
	condition = dia_pedro_di_exit_condition;
	information = dia_pedro_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_di_exit_condition()
{
	return TRUE;
};

func void dia_pedro_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_DI_YOU(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 2;
	condition = dia_pedro_di_you_condition;
	information = dia_pedro_di_you_info;
	description = "Zdrajca!";
};


func int dia_pedro_di_you_condition()
{
	return TRUE;
};

func void dia_pedro_di_you_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//Zdrajco! Nareszcie ci� znalaz�em!
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//Nie my�l, �e ulituj� si� nad tob� tylko dlatego, �e jestem teraz jednym z paladyn�w.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//Wielu najemnik�w zaprzeda�o dusze Beliarowi, ale mimo to czu�em skrupu�y, pozbawiaj�c ich �ycia. Ale ciebie, brudny wieprzu, zabij� z przyjemno�ci�!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//Ze wszystkich bezdusznych szumowin, kt�re pozna�em w �yciu, ty jeste� najgorszy. Przynosisz ha�b� ca�emu zakonowi.
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//Powinienem ci� zabi� na miejscu!
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//B�agam! Lito�ci! Rzucili na mnie urok! Nigdy nie zdradzi�bym klasztoru, gdyby nie oni!
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//Nie wyobra�asz sobie przez co przeszed�em w ci�gu ostatnich dni! S�ysza�em g�os w mojej g�owie! By�em bezradny!
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//Pu�kownik ork�w przes�uchiwa� mnie przez wiele dni. Bi� mnie i torturowa�. Zlituj si�! Jestem niewinny! Musisz mi uwierzy�!
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Zatem powiedz mi wszystko, co wiesz.",dia_pedro_di_you_verschon);
	Info_AddChoice(dia_pedro_di_you,"Nic nie musz�. Ju� po tobie...",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"Daj mi jeden pow�d, dla kt�rego mia�bym ci da� wiar�.",dia_pedro_di_you_grund);
	if(MIS_GORAX_KILLPEDRO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pedro_di_you,"Serpentes kaza� mi ci� zabi�...",dia_pedro_di_you_serpentes);
	};
};

func void dia_pedro_di_you_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//Daj mi jeden pow�d, dla kt�rego mia�bym ci da� wiar�.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//Daruj mi �ycie! Mog� ci powiedzie�, jak si� st�d wydosta�. Musisz mnie wys�ucha�!
};


var int pedrodi_flee;

func void dia_pedro_di_you_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//Nic nie musz�. Ju� po tobie...
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//Na wszystkich bog�w...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	b_attack(self,other,AR_NONE,1);
	PEDRODI_FLEE = LOG_RUNNING;
};

func void dia_pedro_di_you_serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//Serpentes kaza� mi ci� zabi�, a ja zwykle wype�niam polecenia.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//Nie, b�agam! Nie mo�esz tego zrobi�! Mog� ci si� jeszcze przyda�!
	b_giveplayerxp(XP_PEDRO_SERPENTESMISSION);
	MIS_GORAX_KILLPEDRO = LOG_SUCCESS;
};

func void dia_pedro_di_you_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//Zatem powiedz mi wszystko, co wiesz.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//Tak, tak! Wszystko ci powiem. Ale pod jednym warunkiem! Musisz mi pom�c wydosta� si� z tej przekl�tej wyspy. Zgoda?
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Nic nie musz�. Ju� po tobie...",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"W porz�dku. Chod� ze mn� - zabior� ci� na statek.",dia_pedro_di_you_followship);
};


var int mis_pedro_di_followship;

func void dia_pedro_di_you_followship()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//W porz�dku. Chod� ze mn� - zabior� ci� na statek.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//Dzi�ki! Dzi�ki! Nie po�a�ujesz tego!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_PEDRO_DI_FOLLOWSHIP = LOG_RUNNING;
};


instance DIA_PEDRO_DI_ARRIVEDATSHIP(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 4;
	condition = dia_pedro_di_arrivedatship_condition;
	information = dia_pedro_di_arrivedatship_info;
	description = "Oto jeste�my.";
};


func int dia_pedro_di_arrivedatship_condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_PEDRO_DI_FOLLOWSHIP == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pedro_di_arrivedatship_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Oto jeste�my.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//C� za wspania�y okr�t. Zaiste, jeste� wielkim dow�dc�.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//Daruj sobie. Teraz mo�emy porozmawia�.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//Ach, jasne. Od czego mam zacz��?
	Info_ClearChoices(dia_pedro_di_arrivedatship);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Do�� us�ysza�em.",dia_pedro_di_arrivedatship_back);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Jak mog� si� dosta� w g��b wyspy?",dia_pedro_di_arrivedatship_innere);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Jakie monstra mo�na jeszcze spotka� na tej wyspie?",dia_pedro_di_arrivedatship_monster);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Co z tym pu�kownikiem ork�w?",dia_pedro_di_arrivedatship_orkoberst);
};

func void dia_pedro_di_arrivedatship_orkoberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//Co z tym pu�kownikiem ork�w?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//Odebra� mi ostatni� iskierk� nadziei na powr�t w ojczyste strony.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//Odk�d tu trafi�em, wypytywa� mnie o rozmieszczenie si� paladyn�w w Khorinis.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//Oczywi�cie zbyt wiele si� ode mnie nie dowiedzia�. Sk�d niby mia�em wiedzie� takie rzeczy? Jestem zwyk�ym nowicjuszem!
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
	{
		Info_AddChoice(dia_pedro_di_arrivedatship,"Pu�kownik ork�w nie �yje.",dia_pedro_di_arrivedatship_obersttot);
	};
};

func void dia_pedro_di_arrivedatship_monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//Jakie monstra mo�na jeszcze spotka� na tej wyspie?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//W ci�gu dnia wybrze�e roi si� od jaszczuroludzi. Zwykle d�wigaj� ze sob� ogromne jaja.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//Niewiele dociera�o do mojej celi, ale s�dz�, �e przygotowuj� si� do opuszczenia wyspy.
};

func void dia_pedro_di_arrivedatship_innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//Jak mog� si� dosta� w g��b wyspy?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//W sali tronowej orkowego pu�kownika jest tajemne przej�cie.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//Zaci�gali mnie tam na ka�de przes�uchanie, st�d wiem o jego istnieniu.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//Jeden z szaman�w uruchamia� mechanizm, poci�gaj�c za pochodnie na �cianach.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//Hmmm... Wydaje mi si�, �e najpierw ci�gn�� za lew�, a potem za praw�, ale mog� si� myli�.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//W tylnej cz�ci sali otwiera�o si� przej�cie prowadz�ce w g��b g�ry.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//Dok�d dok�adnie - nie wiem.
};

func void dia_pedro_di_arrivedatship_obersttot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//Pu�kownik ork�w nie �yje.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//Nie �yje? Chwa�a Innosowi. Nigdy nie zapomn� tej jego ohydnej g�by.
};

func void dia_pedro_di_arrivedatship_back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//Do�� ju� us�ysza�em. Poszukaj sobie jakiego� miejsca na statku. Mam jeszcze co� do za�atwienia.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//Niech moc Innosa zawsze ci� chroni. B�d� si� za ciebie modli�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_PEDRO_DI_PERM(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 5;
	condition = dia_pedro_di_perm_condition;
	information = dia_pedro_di_perm_info;
	permanent = TRUE;
	description = "Zm�czony?";
};


var int pedrodi_talknomore;

func int dia_pedro_di_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you) && (PEDRODI_TALKNOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_di_perm_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Zm�czony?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PEDRODI_FLEE == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//Mo�e ci przynie�� poduszk�, co?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//Nie drwij ze mnie. B�d� tu sobie siedzia� cichutko jak myszka.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//Mmmh.
			b_giveplayerxp(XP_AMBIENT);
			PEDRODI_FLEE = LOG_SUCCESS;
		}
		else if(Npc_IsDead(dragon_undead))
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//Jestem zupe�nie wyczerpany.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//Walnij si� na ��ko. Wkr�tce wyp�ywamy.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//Dzi�ki. My�la�em, �e zaraz zlec� z tej �awy. Dobranoc.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PEDRODI_TALKNOMORE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//W porz�dku. Dzi�ki.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//B�agam! Daruj mi �ycie!
		AI_StopProcessInfos(self);
	};
};

