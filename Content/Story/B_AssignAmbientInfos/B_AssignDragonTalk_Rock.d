
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
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Doœæ gadania. Oko straci³o sw¹ ochronn¹ moc. Przygotuj siê na œmieræ.
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
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Jeszcze jeden zadufany w sobie karze³, który oœmieli³ siê wspi¹æ na moj¹ ska³ê... Ach, ludzie. Tacy waleczni... i tacy w¹tli.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Ej, ty mówisz!
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Wypatroszê ciê i rzucê twoje wnêtrznoœci œcierwojadom.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Nie tak szybko! Mam tu Oko Innosa. Odpowiesz mi najpierw na moje pytania.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//Aaargh. Pytaj wiêc!
};


instance DIA_DRAGON_ROCK_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_rock_werbistdu_condition;
	information = dia_dragon_rock_werbistdu_info;
	description = "Kim jesteœ?";
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
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Nazywam siê Pedrakhan. Jak ciê dopadnê, obedrê ¿ywcem ze skóry!
};


instance DIA_DRAGON_ROCK_HIERARCHIE(C_INFO)
{
	nr = 7;
	condition = dia_dragon_rock_hierarchie_condition;
	information = dia_dragon_rock_hierarchie_info;
	description = "Który z was, smoków, jest najpotê¿niejszy?";
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
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Który z was, smoków, jest najpotê¿niejszy?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//Czerpiemy nasz¹ moc z ¿ywio³ów waszego œwiata. Ich hierarchia jest bardzo prosta.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Miêkka ziemia obdarza ¿yciem wszystkie istoty pod s³oñcem, ale otworzy siê i poch³onie ciê, jeœli zbli¿ysz siê do niej za bardzo.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Ska³a, która prêdzej pêknie, ni¿ siê podda, wznosi siê dumnie ku niebu, by pogrzebaæ pod sob¹ nieostro¿nych. A mimo to jest przecie¿ najlepsz¹ ochron¹ przed fal¹ przyp³ywu.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Iskra ¿ycia p³onie w hucz¹cym ogniu tego œwiata. A przecie¿ ogieñ spala ca³e ¿ycie, pozostawiaj¹c po nim ledwie garstkê popio³u.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//Wszystkie ¿ywio³y maj¹ moc tworzenia i niszczenia. Ale tylko w wodzie, która sta³a siê twarda jak ska³a, wszystko stanie siê s³upem soli, na którym ¿ycie jest niemo¿liwe.
};

func void b_assigndragontalk_rock(var C_NPC slf)
{
	dia_dragon_rock_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hierarchie.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

