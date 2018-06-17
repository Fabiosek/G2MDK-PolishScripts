
instance DIA_VLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_1_exit_condition;
	information = dia_vlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_1_exit_condition()
{
	return TRUE;
};

func void dia_vlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_1_join_condition;
	information = dia_vlk_1_join_info;
	permanent = TRUE;
	description = "W jaki sposób mogê zostaæ obywatelem tego miasta?";
};


func int dia_vlk_1_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_1_join_info()
{
	AI_Output(other,self,"DIA_VLK_1_JOIN_15_00");	//W jaki sposób mogê zostaæ obywatelem tego miasta?
	AI_Output(self,other,"DIA_VLK_1_JOIN_01_01");	//Poszukaj sobie jakiejœ przyzwoitej pracy! Wszyscy, którzy maj¹ pracê w Khorinis, s¹ zaliczani do obywateli miasta.
};


instance DIA_VLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_1_people_condition;
	information = dia_vlk_1_people_info;
	permanent = TRUE;
	description = "Kto jest tu w okolicy najwa¿niejszy?";
};


func int dia_vlk_1_people_condition()
{
	return TRUE;
};

func void dia_vlk_1_people_info()
{
	AI_Output(other,self,"DIA_VLK_1_PEOPLE_15_00");	//Kto jest tu w okolicy najwa¿niejszy?
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_01");	//Do niedawna gubernator i sêdzia. Jednak niedawno przybyli do miasta paladyni i przejêli w³adzê.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_02");	//Mo¿na rzec, ¿e ich przywódca, Lord Hagen, jest teraz kimœ w rodzaju gubernatora.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_03");	//Jego praw¹ rêk¹ jest Lord Andre. To on dowodzi stra¿¹ miejsk¹, pe³ni te¿ funkcjê sêdziego.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_04");	//Wszyscy przestêpcy w mieœcie odpowiadaj¹ przed nim.
};


instance DIA_VLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_1_location_condition;
	information = dia_vlk_1_location_info;
	permanent = TRUE;
	description = "Jakie ciekawe miejsca mo¿na odwiedziæ w tym mieœcie?";
};


func int dia_vlk_1_location_condition()
{
	return TRUE;
};

func void dia_vlk_1_location_info()
{
	AI_Output(other,self,"DIA_VLK_1_LOCATION_15_00");	//Co ciekawego mo¿na znaleŸæ w mieœcie?
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_01");	//Mo¿na tu kupiæ praktycznie wszystko. Albo od kupców na targowisku, albo w dolnej czêœci miasta.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_02");	//Zwa¿ jednak, ¿e za wiêkszoœæ towarów trzeba s³ono zap³aciæ.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_03");	//Jeœli nie masz zbyt du¿o z³ota, udaj siê do Lehmara, lichwiarza, mo¿e bêdzie móg³ ci pomóc. Jego dom znajduje siê u wejœcia do dzielnicy portowej, w dolnej czêœci miasta.
};


instance DIA_VLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_1_standard_condition;
	information = dia_vlk_1_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_vlk_1_standard_condition()
{
	return TRUE;
};

func void dia_vlk_1_standard_info()
{
	AI_Output(other,self,"DIA_VLK_1_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_01");	//Od upadku Bariery handel z najwa¿niejszym z wieœniaków nagle siê urwa³. Kto wie, co on knuje. Coœ mi tu œmierdzi...
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_02");	//Onar posuwa siê za daleko. Wci¹¿ odmawia dostaw dla miasta. Jeœli stra¿ nie zareaguje odpowiednio szybko, pozostali ch³opi wkrótce te¿ zaczn¹ siê buntowaæ.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_03");	//Ponoæ bandyci po³¹czyli swe si³y z magami. Potê¿ni czarni magowie w czarnych szatach. Chyba nawet widzia³em jednego z nich ostatniej nocy.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_04");	//S³ysza³em, ¿e jeden z najemników Onara wyruszy³, aby pozabijaæ smoki. W koñcu zajêli siê czymœ po¿ytecznym.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_05");	//Wieœæ niesie, ¿e smoki zosta³y pokonane! Lord Hagen zbiera swe oddzia³y, by poprowadziæ je przeciw reszcie bestii, pl¹druj¹cych Górnicz¹ Dolinê.
	};
};

func void b_assignambientinfos_vlk_1(var C_NPC slf)
{
	dia_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

