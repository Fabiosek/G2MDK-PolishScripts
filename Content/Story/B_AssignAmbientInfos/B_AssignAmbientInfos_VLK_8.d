
instance DIA_VLK_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_8_exit_condition;
	information = dia_vlk_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_8_exit_condition()
{
	return TRUE;
};

func void dia_vlk_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_8_join_condition;
	information = dia_vlk_8_join_info;
	permanent = TRUE;
	description = "Chcia³bym zostaæ obywatelem tego miasta!";
};


func int dia_vlk_8_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_8_join_info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Chcia³bym zostaæ obywatelem tego miasta!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//Po co mi to mówisz? IdŸ do któregoœ z rzemieœlników w dolnej czêœci miasta. Jeœli dopisze ci szczêœcie, któryœ przyjmie ciê na czeladnika.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//W innym wypadku bêdziesz musia³ pójœæ do gubernatora i zostaæ zarejestrowany jako prawny obywatel.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//W chwili obecnej mo¿esz jednak o tym zapomnieæ. Dopóki w mieœcie stacjonuj¹ paladyni, dopóty gubernator nie ma w³adzy w mieœcie.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//Przywódca paladynów, Lord Hagen, z pewnoœci¹ nie ma czasu na takie drobnostki.
};


instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_8_people_condition;
	information = dia_vlk_8_people_info;
	permanent = TRUE;
	description = "Którzy z obywateli miasta s¹ najwa¿niejsi?";
};


func int dia_vlk_8_people_condition()
{
	return TRUE;
};

func void dia_vlk_8_people_info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Którzy z obywateli miasta s¹ najwa¿niejsi?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Oprócz paladynów... Najwa¿niejsi s¹ rzemieœlnicy z dolnej czêœci miasta. Ich zdanie bardzo siê tu liczy.
};


instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_8_location_condition;
	information = dia_vlk_8_location_info;
	permanent = TRUE;
	description = "Czy s¹ tutaj jakieœ interesuj¹ce rzeczy?";
};


func int dia_vlk_8_location_condition()
{
	return TRUE;
};

func void dia_vlk_8_location_info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Jakie ciekawe miejsca warto tu zobaczyæ?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//Niedawno do portu wp³yn¹³ statek paladynów. Jest wielki. Koniecznie musisz go zobaczyæ.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//W¹tpiê jednak, by chcieli ciê wpuœciæ na pok³ad. Paladyni broni¹ wstêpu na statek jak klejnotów koronnych.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Nic dziwnego. To jedyna p³ywaj¹ca jednostka zakotwiczona w okolicy.
};


instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_8_standard_condition;
	information = dia_vlk_8_standard_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_vlk_8_standard_condition()
{
	return TRUE;
};

func void dia_vlk_8_standard_info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Ostatnimi czasy wszyscy s¹ bardzo nerwowi.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//Jakby ma³o by³o tego, ¿e przybyli tu paladyni - teraz jeszcze znikaj¹ ludzie!
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//Najwy¿sza pora, ¿eby stra¿ coœ z tym zrobi³a.
		if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
		{
			Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
			b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
		};
		SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//Wszyscy czekaj¹ na og³oszenie powodu wizyty paladynów. Domyœlam siê, ¿e s¹ tu z powodu orków. Bestie pewnie wkrótce zaatakuj¹!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Mo¿e i paladynów prowadzi ³aska Innosa, lecz kiedy zjawi¹ siê orkowe hordy, wszyscy bêdziemy straceni.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//Ludzie powiadaj¹, ¿e jedynym powodem wizyty paladynów jest chêæ zabrania rudy... na potrzeby wojny na kontynencie.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//Czy wiesz, co to oznacza? Król ma w g³êbokim powa¿aniu to, ¿e orkowie wszystkich nas pozabijaj¹.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Zrobiê wszystko, by byæ na tym statku, kiedy paladyni zaczn¹ podnosiæ kotwicê.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//Ponoæ orkowie lec¹ tutaj na grzbietach smoków, wielkich jak po³owa miasta. Nie mamy ¿adnych szans na obronê!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Ludzie mówi¹, ¿e smoki zosta³y pokonane. Czy to prawda?
	};
};

func void b_assignambientinfos_vlk_8(var C_NPC slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

