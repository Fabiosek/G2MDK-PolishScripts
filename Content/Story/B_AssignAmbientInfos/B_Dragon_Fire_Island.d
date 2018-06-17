
instance DIA_DRAGON_FIRE_ISLAND_EXIT(C_INFO)
{
	npc = dragon_fire_island;
	nr = 999;
	condition = dia_dragon_fire_island_exit_condition;
	information = dia_dragon_fire_island_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_island_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_FIRE_ISLAND_HELLO(C_INFO)
{
	npc = dragon_fire_island;
	nr = 5;
	condition = dia_dragon_fire_island_hello_condition;
	information = dia_dragon_fire_island_hello_info;
	important = TRUE;
};


func int dia_dragon_fire_island_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//Zostañ, cz³owieku. Moje zmys³y podpowiadaj¹ mi, ¿e to ty unicestwi³eœ moich najbli¿szych.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//Czy¿by? Kogo nazywasz zabójc¹, pomiocie piekie³?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//Nie wystarczy ci, ¿e zniszczy³eœ niemal ca³e nasze potomstwo?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//Masz na sumieniu mojego brata, Feomathara, i za to mi zap³acisz.
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//Bez obaw. Resztê twoich pobratymców te¿ dopadnê.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//Arrrrh. Spalê ciê na popió³ i zrobiê to z prawdziw¹ przyjemnoœci¹.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//Wiêc daruj sobie tê przemowê i przejdŸmy od razu do rzeczy.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//Daleko zaszed³eœ, ma³y cz³owieczku, ale ju¿ nigdy nie opuœcisz tych sal.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Nastêpny ognisty smok. Zaczynam ich mieæ po dziurki w nosie. Jedyne, czego teraz chcê, to przedostaæ siê przez rozpadlinê, któr¹ widaæ za smokiem.");
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

