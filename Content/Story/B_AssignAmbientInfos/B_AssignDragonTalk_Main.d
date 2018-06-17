
instance DIA_DRAGONTALK_MAIN_1(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_1_condition;
	information = dia_dragontalk_main_1_info;
	permanent = FALSE;
	description = "Co ci� sprowadza do tego miejsca?";
};


func int dia_dragontalk_main_1_condition()
{
	if(MIS_KILLEDDRAGONS == 0)
	{
		return 1;
	};
};

func void dia_dragontalk_main_1_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_1_15_00");	//S�ugo ciemno�ci! Co ci� sprowadza do tego miejsca? Czy twoim jedynym celem jest sianie strachu i zniszczenia?
	AI_Output(self,other,"DIA_DragonTalk_Main_1_20_01");	//Prawdziwy cel naszego przybycia do tego �wiata nigdy nie zostanie ci wyjawiony, cz�owiecze.
	Info_AddChoice(dia_dragontalk_main_1,"Jak mam zmusi� do m�wienia pozosta�e smoki?",dia_dragontalk_main_1_reden);
	Info_AddChoice(dia_dragontalk_main_1,"Co musz� zrobi�, aby ponownie ci� wygna�?",dia_dragontalk_main_1_verbannen);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void dia_dragontalk_main_1_verbannen()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_verbannen_15_00");	//Na Innosa, co mam uczyni�, by przegna� was precz z kr�lestwa ludzi?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_01");	//By tego dokona�, musia�by� najpierw zrozumie� znaczenie naszego spotkania.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_02");	//Ale �aden z nas nie wyjawi ci go z w�asnej woli.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_03");	//Tylko Oko mog�oby rozwi�za� nasze j�zyki i wyjawi� ci nasz prawdziwy cel.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_04");	//W ka�dym razie, po swojej �mierci niewiele b�dziesz mia� z tej wiedzy po�ytku.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_05");	//Doniesiono nam, �e obra�e� drog� �owcy smok�w.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_06");	//Dlatego wys�ali�my do twojego �wiata nasz pomiot, by zapewni� przetrwanie naszej staro�ytnej dynastii.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_07");	//Przegra�e� t� wojn�, ma�y cz�owieczku.
		Log_CreateTopic(TOPIC_DRACHENEIER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER,LOG_RUNNING);
		b_logentry(TOPIC_DRACHENEIER,"Jeden z tych smok�w mamrota� co� o 'potomkach' i utrzymaniu ci�g�o�ci jego rodu. Boj� si�, �e te potwory rozpleni�y si� po ca�ym cywilizowanym �wiecie.");
	}
	else
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_08");	//Oko pozwala ci rzuci� mi wyzwanie, ale to w walce oka�e si�, czy jeste� mnie godzien.
	};
};

func void dia_dragontalk_main_1_reden()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_reden_15_00");	//Jak mam zmusi� do m�wienia pozosta�e smoki?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_01");	//Tylko moje serce pozwoli ci odnowi� moc Oka.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_02");	//Ale nigdy nie zdo�asz wyrwa� go z mojej piersi.
};


instance DIA_DRAGONTALK_MAIN_2(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_2_condition;
	information = dia_dragontalk_main_2_info;
	permanent = FALSE;
	description = "Kto was tu przys�a�?";
};


func int dia_dragontalk_main_2_condition()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		return 1;
	};
};

func void dia_dragontalk_main_2_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_2_15_00");	//Kto wam rozkazuje? Kto was tu przys�a�?
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_01");	//Naszymi czynami kieruje nasz Pan i jego S�owo Mocy. Wkr�tce nikt nie zdo�a oprze� si� jego woli.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_02");	//Jego rami� si�ga daleko poza Kr�lestwo Umar�ych. Duchy nocy gromadz� si� wok�, oczekuj�c jego nadej�cia.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_03");	//Wkr�tce zostaniecie pokonani, a on zapanuje nad �wiatem.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_04");	//W por�wnaniu z nim, nawet my jeste�my nic nie znacz�cym py�em.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_05");	//Nasz Pan nadejdzie, by wskrzesi� wasze cia�a z popio��w i wykorzysta� je do podporz�dkowania sobie tego �wiata.
	b_logentry(TOPIC_DRACHENJAGD,"Te smoki nie s� samodzielnymi istotami. S�u�� jakiemu� panu, o kt�rym nie chc� m�wi� - no, mo�e poza bezwarto�ciowymi przepowiedniami w stylu 'nasz pan przyjdzie i zniszczy �wiat, bla bla bla'. Nic nowego.");
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_3(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_3_condition;
	information = dia_dragontalk_main_3_info;
	permanent = FALSE;
	description = "Jak mog� pokona� twego pana?";
};


func int dia_dragontalk_main_3_condition()
{
	if(MIS_KILLEDDRAGONS == 2)
	{
		return 1;
	};
};

func void dia_dragontalk_main_3_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_00");	//Jak mog� pokona� twego pana?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_01");	//M�j Pan jest wszechpot�ny i niemal niezwyci�ony. Gdyby� okaza� si� wystarczaj�co g�upi, by stawi� mu czo�a, czeka ci� d�uga, powolna �mier� w okrutnych m�czarniach.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_02");	//Nie pierwszy raz s�ysz� co� takiego. NIEMAL niezwyci�ony, a wi�c mo�na go pokona�!
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_03");	//M�w wi�c! Co musz� uczyni�?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_04");	//Aby stawi� mu czo�a, musisz posiada� rzeczy, kt�rych on nigdy nie pozwoli ci zdoby�.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_05");	//Co dok�adnie?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_06");	//Musisz posi��� najwspanialsz� zbroj�, jak� widzia� ten �wiat, i za�o�y� j� do ostatniego starcia.
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_01");	//Potrzebujesz miecza pob�ogos�awionego przez twojego boga.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_02");	//Potrzebujesz runy, kt�ra powsta�a specjalnie dla ciebie.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_00");	//Potrzebujesz or�a, kt�ry wykonano specjalnie dla ciebie.
	};
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_08");	//Ale najtrudniejszym do spe�nienia warunkiem jest znalezienie pi�ciu towarzyszy gotowych p�j�� za tob� na pewn� �mier�.
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_09");	//Dopiero wtedy mo�esz stawi� czo�a mojemu Panu.
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_4(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_4_condition;
	information = dia_dragontalk_main_4_info;
	permanent = FALSE;
	description = "Gdzie znajd� twego pana?";
};


func int dia_dragontalk_main_4_condition()
{
	if(MIS_KILLEDDRAGONS == 3)
	{
		return 1;
	};
};

func void dia_dragontalk_main_4_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_00");	//Gdzie znajd� twego pana?
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_01");	//Jego skarbiec znajduje si� w kamiennym Dworze Irdorath. Tam go szukaj.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_02");	//P�ki nie uda mu si� przywr�ci� w�a�ciwego porz�dku �wiata, b�dzie tam spoczywa�, pogr��ony w zadumie...
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_03");	//Daruj sobie szczeg�y. Powiedz mi lepiej, gdzie si� znajduje ten Dw�r Irdorath.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_04");	//Ha, ha, ha. Rozczarowa�e� mnie, cz�owieczku. Przezwyci�y�e� tyle przeciwno�ci i pokona�e� niemal wszystkich z nas, a teraz o�mieszasz si� w�asn� niewiedz�.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_05");	//Je�li nazwa Irdorath nic ci nie m�wi, lepiej udaj si� do swoich mag�w i popro�, by pozwolili ci sobie us�ugiwa�.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_06");	//Bo najwyra�niej nie jeste� jeszcze got�w, by d�wiga� brzemi� prawdziwej wiedzy.
	Log_CreateTopic(TOPIC_BUCHHALLENVONIRDORATH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUCHHALLENVONIRDORATH,LOG_RUNNING);
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"W�adca smok�w skry� si� podobno w pot�nym i �wi�tym Dworze Irdorath. To brzmi jako� znajomo. Gdzie to ja mog�em o tym czyta�?");
	b_npc_isalivecheck(OLDWORLD_ZEN);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void b_assigndragontalk_main(var C_NPC slf)
{
	dia_dragontalk_main_1.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_2.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_3.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_4.npc = Hlp_GetInstanceID(slf);
};

