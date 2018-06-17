
instance DIA_SLD_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_sld_6_exit_condition;
	information = dia_sld_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_6_exit_condition()
{
	return TRUE;
};

func void dia_sld_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_sld_6_join_condition;
	information = dia_sld_6_join_info;
	permanent = TRUE;
	description = "Chcê siê do was przy³¹czyæ!";
};


func int dia_sld_6_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sld_6_join_info()
{
	AI_Output(other,self,"DIA_SLD_6_JOIN_15_00");	//Chcê siê do was przy³¹czyæ.
	if(MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_01");	//S³ysza³em o sprawie ze stra¿¹. Torlof powiada, ¿e zda³eœ test. Mo¿esz liczyæ na mój g³os.
	}
	else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_02");	//Ograbianie ch³opów to jedno, ale potyczki z regularnymi oddzia³ami stra¿y to zupe³nie inna sprawa. Có¿, jeœli Onar uwa¿a, ¿e siê nadajesz, to ja nie bêdê siê sprzeciwia³.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_03");	//Pogadaj z Torlofem. On ci dopiero poka¿e...
	};
};


instance DIA_SLD_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_sld_6_people_condition;
	information = dia_sld_6_people_info;
	permanent = TRUE;
	description = "Kto tu dowodzi?";
};


func int dia_sld_6_people_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_people_info()
{
	AI_Output(other,self,"DIA_SLD_6_PEOPLE_15_00");	//Kto tu rz¹dzi?
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_01");	//Farma nale¿y do Onara, jeœli o to ci chodzi. Jednak naszym przywódc¹ jest Lee.
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_02");	//Swego czasu by³ genera³em armii królewskiej. Jednak chyba nie lubi¹ siê ju¿ z królem.
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_03");	//Zapamiêtaj jego imiê. Jeœli wpadniesz w jakieœ tarapaty, tylko on bêdzie móg³ uratowaæ twój ty³ek. Ka¿dy inny po prostu poder¿nie ci gard³o.
};


instance DIA_SLD_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_sld_6_location_condition;
	information = dia_sld_6_location_info;
	permanent = TRUE;
	description = "Czy chronicie farmerów?";
};


func int dia_sld_6_location_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_location_info()
{
	AI_Output(other,self,"DIA_SLD_6_LOCATION_15_00");	//Czy chronicie farmerów?
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_01");	//Chronimy nie tylko farmê Onara, ale i ca³¹ dolinê.
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_02");	//Onar chce, byœmy zajêli siê ka¿dym, kto sprawia k³opoty. Uwa¿aj wiêc na siebie.
};


instance DIA_SLD_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_sld_6_standard_condition;
	information = dia_sld_6_standard_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_sld_6_standard_condition()
{
	return TRUE;
};

func void dia_sld_6_standard_info()
{
	AI_Output(other,self,"DIA_SLD_6_STANDARD_15_00");	//Co s³ychaæ?
	if(KAPITEL <= 2)
	{
		if(ENTEROW_KAPITEL2 == FALSE)
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_01");	//Teraz, dzieciaku, jesteœ jednym z nas.
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_02");	//Czego chcesz?
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_03");	//Kiedy pierwszy raz us³ysza³em o smokach, nie mog³em w to uwierzyæ.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_04");	//Smok - to dopiero przeciwnik, nie jakieœ owce czy g³upkowaci stra¿nicy. To prawdziwe wyzwanie.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_05");	//I co, jak tam ten twój Lord Hagen? Posra³ siê ju¿ w gacie ze strachu przed smokami?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_06");	//Wygl¹da na to, ¿e w koñcu bêdzie musia³ ruszyæ swoje szanowne dupsko z miasta.
		};
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_07");	//Lord Hagen ma szczêœcie. Jeszcze kilka dni, a sami odbilibyœmy Benneta.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_08");	//Jeœli w ci¹gu kilku dni nie wypuszcz¹ Benneta z wiêzienia, sami po niego pójdziemy.
		};
	};
	if(KAPITEL == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_09");	//Co tu jeszcze robisz? Nie wybiera³eœ siê przypadkiem z innymi do Doliny?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_10");	//Jeœli o mnie chodzi, to nie musicie wracaæ.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_11");	//Powinieneœ iœæ do Górniczej Doliny. S³ysza³em, ¿e te biedne psubraty same sobie nie poradz¹.
		};
	};
	if(KAPITEL >= 5)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_12");	//Kiedy tylko siê pojawi³eœ - wiedzia³em, ¿e wywrócisz to miejsce do góry nogami.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_13");	//Ale smoki? No, to ju¿ coœ. W najbli¿szym czasie nikt nie odwa¿y siê skrzy¿owaæ z tob¹ miecza.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_14");	//Jestem pod wra¿eniem. Nie walczymy po tej samej stronie, ale zabicie smoków to nie lada wyczyn.
		};
	};
};

func void b_assignambientinfos_sld_6(var C_NPC slf)
{
	dia_sld_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_standard.npc = Hlp_GetInstanceID(slf);
};

