
instance DIA_JARVIS_EXIT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 999;
	condition = dia_jarvis_exit_condition;
	information = dia_jarvis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jarvis_exit_condition()
{
	return TRUE;
};

func void dia_jarvis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JARVIS_HELLO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 1;
	condition = dia_jarvis_hello_condition;
	information = dia_jarvis_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jarvis_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jarvis_hello_info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//Hej! Czy ja ci� sk�d� nie znam?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//To mo�liwe. Te� by�em w Kolonii.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//Taak... Czego chcesz?
};


instance DIA_JARVIS_DIELAGE(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 2;
	condition = dia_jarvis_dielage_condition;
	information = dia_jarvis_dielage_info;
	permanent = FALSE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_jarvis_dielage_condition()
{
	return TRUE;
};

func void dia_jarvis_dielage_info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//Jak wygl�da sytuacja?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//Teraz mamy powa�ne k�opoty. W�r�d nas, najemnik�w, tworz� si� dwa obozy.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//Sylvio i jego ludzie nie wierz�, �e Lee ma dobry plan.
};


instance DIA_JARVIS_TWOFRONTS(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 3;
	condition = dia_jarvis_twofronts_condition;
	information = dia_jarvis_twofronts_info;
	permanent = FALSE;
	description = "Co was tak por�ni�o?";
};


func int dia_jarvis_twofronts_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_twofronts_info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//Co was tak por�ni�o?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//Wi�kszo�� z nas pochodzi z Kolonii, tak samo jak Lee.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//Jednak niekt�rzy z najemnik�w do��czyli do nas p�niej.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//Nie byli w Kolonii, ale walczyli z orkami - dalej na po�udniu.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//Jakim� sposobem dowiedzieli si�, �e Lee szuka ludzi. Ich szefem by� Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//Uzna� przyw�dztwo Lee, ale teraz pr�buje podburza� przeciwko niemu najemnik�w, �eby nie realizowali jego planu.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//Sporo ludzi Lee uwa�a, �e to �aden problem. Ale ja znam kolesi takich jak Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//Zrobi wszystko, �eby zrealizowa� swoje zamierzenia.
};


instance DIA_JARVIS_LEESPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 4;
	condition = dia_jarvis_leesplan_condition;
	information = dia_jarvis_leesplan_info;
	permanent = FALSE;
	description = "Czy wiesz, co zmierza Lee?";
};


func int dia_jarvis_leesplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_leesplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//Czy wiesz, co zmierza Lee?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//Lee chce, �eby�my czekali, a� paladyni w mie�cie wymr� z g�odu.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//Planuje zabra� nas wszystkich z wyspy. A Innos wie, �e nie mam nic przeciwko opuszczeniu tego miejsca.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//Nie wiem, jak zamierza tego dokona�, ale mu ufam. Dobrze nami dowodzi.
};


instance DIA_JARVIS_SYLVIOSPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 5;
	condition = dia_jarvis_sylviosplan_condition;
	information = dia_jarvis_sylviosplan_info;
	permanent = FALSE;
	description = "Czy wiesz, co planuje Sylvio?";
};


func int dia_jarvis_sylviosplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//Czy wiesz, co planuje Sylvio?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//Sylvio dowiedzia� si�, �e niekt�rzy z paladyn�w przenie�li si� do starej Kolonii.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//M�wi, �e reszta paladyn�w nie odwa�y si� nas tutaj zaatakowa� i chce wykorzysta� sytuacj�.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//Pl�drowa� ma�e farmy, rozprawi� si� z ma�ymi patrolami stra�y poza miastem, z�upi� podr�nych - takie rzeczy.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//Lee uwa�a jednak, �e w naszej sytuacji by�aby to najgorsza rzecz, jak� mogliby�my zrobi�.
};


instance DIA_JARVIS_WANNAJOIN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 6;
	condition = dia_jarvis_wannajoin_condition;
	information = dia_jarvis_wannajoin_info;
	permanent = FALSE;
	description = "Chc� zosta� najemnikiem!";
};


func int dia_jarvis_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_wannajoin_info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//Chc� zosta� najemnikiem!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//Nie jestem pewien, czy to dobry pomys�...
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//W czym problem?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//No c�, musz� g�osowa� za tob� albo przeciwko tobie.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//A w obecnej sytuacji zag�osuj� na ciebie tylko wtedy, je�li b�d� pewien, �e stoisz po stronie Lee!
};


instance DIA_JARVIS_MISSIONKO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 7;
	condition = dia_jarvis_missionko_condition;
	information = dia_jarvis_missionko_info;
	permanent = FALSE;
	description = "Wi�c co powinienem zrobi�?";
};


func int dia_jarvis_missionko_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_wannajoin) && Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_missionko_info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//Wi�c co powinienem zrobi�?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//To proste. Obij paru ch�opak�w Sylvia! Tym sposobem obie strony b�d� dok�adnie wiedzia�y, za kim si� opowiedzia�e�.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//A je�li do tego b�dziesz si� trzyma� zasad pojedynku, to zaskarbisz sobie szacunek pozosta�ych.
	MIS_JARVIS_SLDKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_MURDER] = TRUE;
	Log_CreateTopic(TOPIC_JARVISSLDKO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JARVISSLDKO,LOG_RUNNING);
	b_logentry(TOPIC_JARVISSLDKO,"Jarvis chce przetrzepa� sk�r� kilku ch�opakom Sylvia. Kiedy ta sprawa b�dzie ju� za�atwiona, udzieli mi swojego poparcia.");
};


instance DIA_JARVIS_DUELLREGELN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_duellregeln_condition;
	information = dia_jarvis_duellregeln_info;
	permanent = FALSE;
	description = "Jakie s� regu�y pojedynku?";
};


func int dia_jarvis_duellregeln_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_duellregeln_info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//Jakie s� regu�y pojedynku?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//Id� do Torlofa, je�li jeste� zainteresowany, on ci to wyja�ni.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//�eby�my si� dobrze zrozumieli: nie interesuje mnie, czy b�dziesz przestrzega� zasad, czy nie. Wa�ne, �eby ci kolesie wyl�dowali na glebie!
	b_logentry(TOPIC_JARVISSLDKO,"Nie musz� nawet trzyma� si� zasad obowi�zuj�cych w czasie pojedynku...");
};


instance DIA_JARVIS_SYLVIOSMEN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_sylviosmen_condition;
	information = dia_jarvis_sylviosmen_info;
	permanent = FALSE;
	description = "Kt�rzy z najemnik�w to ludzie Sylvia?";
};


func int dia_jarvis_sylviosmen_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosmen_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//Kt�rzy z najemnik�w to ludzie Sylvia?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//Jest sze�ciu ch�opa. Po pierwsze Sylvio i jego prawa r�ka Bullko.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//Potem Rod, Sentenza, Fester i Raoul.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//Reszta jest neutralna albo stoi po stronie Lee.
	b_logentry(TOPIC_JARVISSLDKO,"Ludzie Sylvia - Bullko, Rod, Sentenza, Fester i Raoul - s� tacy sami jak on.");
};


instance DIA_JARVIS_HOWMANY(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmany_condition;
	information = dia_jarvis_howmany_info;
	permanent = FALSE;
	description = "Ilu ludzi Sylvia musz� pokona�?";
};


func int dia_jarvis_howmany_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_howmany_info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//Ilu ludzi Sylvia powinienem pokona�?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//Je�eli powalisz trzech z nich, poka�esz po czyjej jeste� stronie.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//Kogo wybierzesz, to ju� twoja sprawa.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//Ma�a rada: nie chodzi o sprawdzian twojej odwagi. Nie zadzieraj z Sylviem - zrobi z ciebie siekane kotlety.
	b_logentry(TOPIC_JARVISSLDKO,"Wystarczy, je�li pokonam trzech spo�r�d ludzi Sylvia. Od tego ostatniego lepiej trzyma� si� z daleka.");
};


instance DIA_JARVIS_HOWMANYLEFT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmanyleft_condition;
	information = dia_jarvis_howmanyleft_info;
	permanent = TRUE;
	description = "Ilu ludzi Sylvia jest jeszcze na mojej li�cie?";
};


func int dia_jarvis_howmanyleft_condition()
{
	if((MIS_JARVIS_SLDKO == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jarvis_howmany))
	{
		return TRUE;
	};
};

func void dia_jarvis_howmanyleft_info()
{
	var int victories;
	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//Ilu ludzi Sylvia jest jeszcze na mojej li�cie?
	victories = 0;
	if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (bullco.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//Pokona�em Bullka.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//S�ysza�em. Nie�le.
		victories = victories + 1;
	};
	if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (rod.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//Rod wygl�da, jakby przytrafi� mu si� ma�y wypadek.
		victories = victories + 1;
	};
	if((sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (sentenza.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(Npc_KnowsInfo(other,dia_sentenza_hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//Sentenza pr�bowa� wydusi� ze mnie troch� z�ota - to by� niezbyt m�dry pomys�.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//Powali�em Sentenz�.
		};
		victories = victories + 1;
	};
	if((fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (fester.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(MIS_FESTER_KILLBUGS == LOG_OBSOLETE)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");	//Fester chcia� mnie zrobi� w konia - i to by� jego b��d.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//Fester dosta� to, co mu si� nale�a�o.
		};
		victories = victories + 1;
	};
	if((raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (raoul.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//A je�li chodzi o Raoula...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//Poszed�em zobaczy� si� z Raoulem...
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//I?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//Koniecznie potrzebowa� porz�dnego obicia pyska.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//Jak dot�d nie pokona�e� �adnego z ludzi Sylvia.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//Dobrze - tylko tak dalej.
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//Spodziewam si�, �e sponiewierasz przynajmniej trzech z nich.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//Wystarczy, wystarczy.
		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//Naprawd� nakopa�e� ka�demu z nich, h�?
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//Jestem pod wra�eniem - je�li Lee mnie spyta, to bez wahania na ciebie zag�osuj�.
		MIS_JARVIS_SLDKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_MURDER] = FALSE;
		b_giveplayerxp(XP_AMBIENT * victories);
		b_logentry(TOPIC_SLDRESPEKT,"Jarvis udzieli mi swojego poparcia, je�li zechc� wst�pi� w szeregi najemnik�w.");
	};
};


var int jarvis_guildcomment;
var int jarvis_sylviocomment;

instance DIA_JARVIS_PERM(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_perm_condition;
	information = dia_jarvis_perm_info;
	permanent = FALSE;
	description = "Jakie� wie�ci?";
};


func int dia_jarvis_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_perm_info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Jakie� wie�ci?
	if(KAPITEL <= 3)
	{
		if(JARVIS_GUILDCOMMENT == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//Teraz jeste� jednym z nas. To dobrze.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//Dokona�e� z�ego wyboru - mog�e� by� jednym z nas.
			};
			JARVIS_GUILDCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//Ch�opaki Sylvia dostali ostatnio niez�� nauczk�.
		};
	};
	if(KAPITEL >= 4)
	{
		if(JARVIS_SYLVIOCOMMENT == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//Silvio w ko�cu si� zmy�. Gdy dowiedzia� si� o smokach, to razem z cz�ci� swoich ch�opak�w wyruszy� do Kolonii.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//Pewnie my�li, �e tam mo�na si� ob�owi�.
			JARVIS_SYLVIOCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//Nic, jak na razie spok�j. Nie mog� si� doczeka�, �eby zobaczy�, co z tego wyniknie.
		};
	};
};


instance DIA_JARVIS_PICKPOCKET(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 900;
	condition = dia_jarvis_pickpocket_condition;
	information = dia_jarvis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jarvis_pickpocket_condition()
{
	return c_beklauen(41,55);
};

func void dia_jarvis_pickpocket_info()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_BACK,dia_jarvis_pickpocket_back);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_PICKPOCKET,dia_jarvis_pickpocket_doit);
};

func void dia_jarvis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jarvis_pickpocket);
};

func void dia_jarvis_pickpocket_back()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
};

