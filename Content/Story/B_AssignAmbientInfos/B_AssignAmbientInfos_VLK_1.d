
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
	description = "W jaki spos�b mog� zosta� obywatelem tego miasta?";
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
	AI_Output(other,self,"DIA_VLK_1_JOIN_15_00");	//W jaki spos�b mog� zosta� obywatelem tego miasta?
	AI_Output(self,other,"DIA_VLK_1_JOIN_01_01");	//Poszukaj sobie jakiej� przyzwoitej pracy! Wszyscy, kt�rzy maj� prac� w Khorinis, s� zaliczani do obywateli miasta.
};


instance DIA_VLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_1_people_condition;
	information = dia_vlk_1_people_info;
	permanent = TRUE;
	description = "Kto jest tu w okolicy najwa�niejszy?";
};


func int dia_vlk_1_people_condition()
{
	return TRUE;
};

func void dia_vlk_1_people_info()
{
	AI_Output(other,self,"DIA_VLK_1_PEOPLE_15_00");	//Kto jest tu w okolicy najwa�niejszy?
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_01");	//Do niedawna gubernator i s�dzia. Jednak niedawno przybyli do miasta paladyni i przej�li w�adz�.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_02");	//Mo�na rzec, �e ich przyw�dca, Lord Hagen, jest teraz kim� w rodzaju gubernatora.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_03");	//Jego praw� r�k� jest Lord Andre. To on dowodzi stra�� miejsk�, pe�ni te� funkcj� s�dziego.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_04");	//Wszyscy przest�pcy w mie�cie odpowiadaj� przed nim.
};


instance DIA_VLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_1_location_condition;
	information = dia_vlk_1_location_info;
	permanent = TRUE;
	description = "Jakie ciekawe miejsca mo�na odwiedzi� w tym mie�cie?";
};


func int dia_vlk_1_location_condition()
{
	return TRUE;
};

func void dia_vlk_1_location_info()
{
	AI_Output(other,self,"DIA_VLK_1_LOCATION_15_00");	//Co ciekawego mo�na znale�� w mie�cie?
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_01");	//Mo�na tu kupi� praktycznie wszystko. Albo od kupc�w na targowisku, albo w dolnej cz�ci miasta.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_02");	//Zwa� jednak, �e za wi�kszo�� towar�w trzeba s�ono zap�aci�.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_03");	//Je�li nie masz zbyt du�o z�ota, udaj si� do Lehmara, lichwiarza, mo�e b�dzie m�g� ci pom�c. Jego dom znajduje si� u wej�cia do dzielnicy portowej, w dolnej cz�ci miasta.
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
	AI_Output(other,self,"DIA_VLK_1_STANDARD_15_00");	//Co s�ycha�?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_01");	//Od upadku Bariery handel z najwa�niejszym z wie�niak�w nagle si� urwa�. Kto wie, co on knuje. Co� mi tu �mierdzi...
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_02");	//Onar posuwa si� za daleko. Wci�� odmawia dostaw dla miasta. Je�li stra� nie zareaguje odpowiednio szybko, pozostali ch�opi wkr�tce te� zaczn� si� buntowa�.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_03");	//Pono� bandyci po��czyli swe si�y z magami. Pot�ni czarni magowie w czarnych szatach. Chyba nawet widzia�em jednego z nich ostatniej nocy.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_04");	//S�ysza�em, �e jeden z najemnik�w Onara wyruszy�, aby pozabija� smoki. W ko�cu zaj�li si� czym� po�ytecznym.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_05");	//Wie�� niesie, �e smoki zosta�y pokonane! Lord Hagen zbiera swe oddzia�y, by poprowadzi� je przeciw reszcie bestii, pl�druj�cych G�rnicz� Dolin�.
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

