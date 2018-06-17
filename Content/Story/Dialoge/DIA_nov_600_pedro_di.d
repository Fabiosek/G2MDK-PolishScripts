
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
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//Zdrajco! Nareszcie ciê znalaz³em!
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//Nie myœl, ¿e ulitujê siê nad tob¹ tylko dlatego, ¿e jestem teraz jednym z paladynów.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//Wielu najemników zaprzeda³o dusze Beliarowi, ale mimo to czu³em skrupu³y, pozbawiaj¹c ich ¿ycia. Ale ciebie, brudny wieprzu, zabijê z przyjemnoœci¹!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//Ze wszystkich bezdusznych szumowin, które pozna³em w ¿yciu, ty jesteœ najgorszy. Przynosisz hañbê ca³emu zakonowi.
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//Powinienem ciê zabiæ na miejscu!
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//B³agam! Litoœci! Rzucili na mnie urok! Nigdy nie zdradzi³bym klasztoru, gdyby nie oni!
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//Nie wyobra¿asz sobie przez co przeszed³em w ci¹gu ostatnich dni! S³ysza³em g³os w mojej g³owie! By³em bezradny!
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//Pu³kownik orków przes³uchiwa³ mnie przez wiele dni. Bi³ mnie i torturowa³. Zlituj siê! Jestem niewinny! Musisz mi uwierzyæ!
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Zatem powiedz mi wszystko, co wiesz.",dia_pedro_di_you_verschon);
	Info_AddChoice(dia_pedro_di_you,"Nic nie muszê. Ju¿ po tobie...",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"Daj mi jeden powód, dla którego mia³bym ci daæ wiarê.",dia_pedro_di_you_grund);
	if(MIS_GORAX_KILLPEDRO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pedro_di_you,"Serpentes kaza³ mi ciê zabiæ...",dia_pedro_di_you_serpentes);
	};
};

func void dia_pedro_di_you_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//Daj mi jeden powód, dla którego mia³bym ci daæ wiarê.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//Daruj mi ¿ycie! Mogê ci powiedzieæ, jak siê st¹d wydostaæ. Musisz mnie wys³uchaæ!
};


var int pedrodi_flee;

func void dia_pedro_di_you_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//Nic nie muszê. Ju¿ po tobie...
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//Na wszystkich bogów...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	b_attack(self,other,AR_NONE,1);
	PEDRODI_FLEE = LOG_RUNNING;
};

func void dia_pedro_di_you_serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//Serpentes kaza³ mi ciê zabiæ, a ja zwykle wype³niam polecenia.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//Nie, b³agam! Nie mo¿esz tego zrobiæ! Mogê ci siê jeszcze przydaæ!
	b_giveplayerxp(XP_PEDRO_SERPENTESMISSION);
	MIS_GORAX_KILLPEDRO = LOG_SUCCESS;
};

func void dia_pedro_di_you_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//Zatem powiedz mi wszystko, co wiesz.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//Tak, tak! Wszystko ci powiem. Ale pod jednym warunkiem! Musisz mi pomóc wydostaæ siê z tej przeklêtej wyspy. Zgoda?
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Nic nie muszê. Ju¿ po tobie...",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"W porz¹dku. ChodŸ ze mn¹ - zabiorê ciê na statek.",dia_pedro_di_you_followship);
};


var int mis_pedro_di_followship;

func void dia_pedro_di_you_followship()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//W porz¹dku. ChodŸ ze mn¹ - zabiorê ciê na statek.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//Dziêki! Dziêki! Nie po¿a³ujesz tego!
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
	description = "Oto jesteœmy.";
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
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Oto jesteœmy.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//Có¿ za wspania³y okrêt. Zaiste, jesteœ wielkim dowódc¹.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//Daruj sobie. Teraz mo¿emy porozmawiaæ.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//Ach, jasne. Od czego mam zacz¹æ?
	Info_ClearChoices(dia_pedro_di_arrivedatship);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Doœæ us³ysza³em.",dia_pedro_di_arrivedatship_back);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Jak mogê siê dostaæ w g³¹b wyspy?",dia_pedro_di_arrivedatship_innere);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Jakie monstra mo¿na jeszcze spotkaæ na tej wyspie?",dia_pedro_di_arrivedatship_monster);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Co z tym pu³kownikiem orków?",dia_pedro_di_arrivedatship_orkoberst);
};

func void dia_pedro_di_arrivedatship_orkoberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//Co z tym pu³kownikiem orków?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//Odebra³ mi ostatni¹ iskierkê nadziei na powrót w ojczyste strony.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//Odk¹d tu trafi³em, wypytywa³ mnie o rozmieszczenie si³ paladynów w Khorinis.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//Oczywiœcie zbyt wiele siê ode mnie nie dowiedzia³. Sk¹d niby mia³em wiedzieæ takie rzeczy? Jestem zwyk³ym nowicjuszem!
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
	{
		Info_AddChoice(dia_pedro_di_arrivedatship,"Pu³kownik orków nie ¿yje.",dia_pedro_di_arrivedatship_obersttot);
	};
};

func void dia_pedro_di_arrivedatship_monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//Jakie monstra mo¿na jeszcze spotkaæ na tej wyspie?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//W ci¹gu dnia wybrze¿e roi siê od jaszczuroludzi. Zwykle dŸwigaj¹ ze sob¹ ogromne jaja.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//Niewiele dociera³o do mojej celi, ale s¹dzê, ¿e przygotowuj¹ siê do opuszczenia wyspy.
};

func void dia_pedro_di_arrivedatship_innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//Jak mogê siê dostaæ w g³¹b wyspy?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//W sali tronowej orkowego pu³kownika jest tajemne przejœcie.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//Zaci¹gali mnie tam na ka¿de przes³uchanie, st¹d wiem o jego istnieniu.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//Jeden z szamanów uruchamia³ mechanizm, poci¹gaj¹c za pochodnie na œcianach.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//Hmmm... Wydaje mi siê, ¿e najpierw ci¹gn¹³ za lew¹, a potem za praw¹, ale mogê siê myliæ.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//W tylnej czêœci sali otwiera³o siê przejœcie prowadz¹ce w g³¹b góry.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//Dok¹d dok³adnie - nie wiem.
};

func void dia_pedro_di_arrivedatship_obersttot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//Pu³kownik orków nie ¿yje.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//Nie ¿yje? Chwa³a Innosowi. Nigdy nie zapomnê tej jego ohydnej gêby.
};

func void dia_pedro_di_arrivedatship_back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//Doœæ ju¿ us³ysza³em. Poszukaj sobie jakiegoœ miejsca na statku. Mam jeszcze coœ do za³atwienia.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//Niech moc Innosa zawsze ciê chroni. Bêdê siê za ciebie modli³.
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
	description = "Zmêczony?";
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
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Zmêczony?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PEDRODI_FLEE == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//Mo¿e ci przynieœæ poduszkê, co?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//Nie drwij ze mnie. Bêdê tu sobie siedzia³ cichutko jak myszka.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//Mmmh.
			b_giveplayerxp(XP_AMBIENT);
			PEDRODI_FLEE = LOG_SUCCESS;
		}
		else if(Npc_IsDead(dragon_undead))
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//Jestem zupe³nie wyczerpany.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//Walnij siê na ³ó¿ko. Wkrótce wyp³ywamy.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//Dziêki. Myœla³em, ¿e zaraz zlecê z tej ³awy. Dobranoc.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PEDRODI_TALKNOMORE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//W porz¹dku. Dziêki.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//B³agam! Daruj mi ¿ycie!
		AI_StopProcessInfos(self);
	};
};

