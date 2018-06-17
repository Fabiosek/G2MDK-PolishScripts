
instance DIA_DRAGON_ROCK_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_rock_exit_condition;
	information = dia_dragon_rock_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_rock_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Do�� gadania. Oko straci�o sw� ochronn� moc. Przygotuj si� na �mier�.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_ROCK_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_rock_hello_condition;
	information = dia_dragon_rock_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_rock_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_rock_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Jeszcze jeden zadufany w sobie karze�, kt�ry o�mieli� si� wspi�� na moj� ska��... Ach, ludzie. Tacy waleczni... i tacy w�tli.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Ej, ty m�wisz!
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Wypatrosz� ci� i rzuc� twoje wn�trzno�ci �cierwojadom.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Nie tak szybko! Mam tu Oko Innosa. Odpowiesz mi najpierw na moje pytania.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//Aaargh. Pytaj wi�c!
};


instance DIA_DRAGON_ROCK_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_rock_werbistdu_condition;
	information = dia_dragon_rock_werbistdu_info;
	description = "Kim jeste�?";
};


func int dia_dragon_rock_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Nazywam si� Pedrakhan. Jak ci� dopadn�, obedr� �ywcem ze sk�ry!
};


instance DIA_DRAGON_ROCK_HIERARCHIE(C_INFO)
{
	nr = 7;
	condition = dia_dragon_rock_hierarchie_condition;
	information = dia_dragon_rock_hierarchie_info;
	description = "Kt�ry z was, smok�w, jest najpot�niejszy?";
};


func int dia_dragon_rock_hierarchie_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hierarchie_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Kt�ry z was, smok�w, jest najpot�niejszy?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//Czerpiemy nasz� moc z �ywio��w waszego �wiata. Ich hierarchia jest bardzo prosta.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Mi�kka ziemia obdarza �yciem wszystkie istoty pod s�o�cem, ale otworzy si� i poch�onie ci�, je�li zbli�ysz si� do niej za bardzo.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Ska�a, kt�ra pr�dzej p�knie, ni� si� podda, wznosi si� dumnie ku niebu, by pogrzeba� pod sob� nieostro�nych. A mimo to jest przecie� najlepsz� ochron� przed fal� przyp�ywu.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Iskra �ycia p�onie w hucz�cym ogniu tego �wiata. A przecie� ogie� spala ca�e �ycie, pozostawiaj�c po nim ledwie garstk� popio�u.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//Wszystkie �ywio�y maj� moc tworzenia i niszczenia. Ale tylko w wodzie, kt�ra sta�a si� twarda jak ska�a, wszystko stanie si� s�upem soli, na kt�rym �ycie jest niemo�liwe.
};

func void b_assigndragontalk_rock(var C_NPC slf)
{
	dia_dragon_rock_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hierarchie.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

