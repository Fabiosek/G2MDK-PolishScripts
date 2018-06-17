
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
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//Hej! Czy ja ciê sk¹dœ nie znam?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//To mo¿liwe. Te¿ by³em w Kolonii.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//Taak... Czego chcesz?
};


instance DIA_JARVIS_DIELAGE(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 2;
	condition = dia_jarvis_dielage_condition;
	information = dia_jarvis_dielage_info;
	permanent = FALSE;
	description = "Jak wygl¹da sytuacja?";
};


func int dia_jarvis_dielage_condition()
{
	return TRUE;
};

func void dia_jarvis_dielage_info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//Jak wygl¹da sytuacja?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//Teraz mamy powa¿ne k³opoty. Wœród nas, najemników, tworz¹ siê dwa obozy.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//Sylvio i jego ludzie nie wierz¹, ¿e Lee ma dobry plan.
};


instance DIA_JARVIS_TWOFRONTS(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 3;
	condition = dia_jarvis_twofronts_condition;
	information = dia_jarvis_twofronts_info;
	permanent = FALSE;
	description = "Co was tak poró¿ni³o?";
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
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//Co was tak poró¿ni³o?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//Wiêkszoœæ z nas pochodzi z Kolonii, tak samo jak Lee.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//Jednak niektórzy z najemników do³¹czyli do nas póŸniej.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//Nie byli w Kolonii, ale walczyli z orkami - dalej na po³udniu.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//Jakimœ sposobem dowiedzieli siê, ¿e Lee szuka ludzi. Ich szefem by³ Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//Uzna³ przywództwo Lee, ale teraz próbuje podburzaæ przeciwko niemu najemników, ¿eby nie realizowali jego planu.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//Sporo ludzi Lee uwa¿a, ¿e to ¿aden problem. Ale ja znam kolesi takich jak Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//Zrobi wszystko, ¿eby zrealizowaæ swoje zamierzenia.
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
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//Lee chce, ¿ebyœmy czekali, a¿ paladyni w mieœcie wymr¹ z g³odu.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//Planuje zabraæ nas wszystkich z wyspy. A Innos wie, ¿e nie mam nic przeciwko opuszczeniu tego miejsca.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//Nie wiem, jak zamierza tego dokonaæ, ale mu ufam. Dobrze nami dowodzi.
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
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//Sylvio dowiedzia³ siê, ¿e niektórzy z paladynów przenieœli siê do starej Kolonii.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//Mówi, ¿e reszta paladynów nie odwa¿y siê nas tutaj zaatakowaæ i chce wykorzystaæ sytuacjê.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//Pl¹drowaæ ma³e farmy, rozprawiæ siê z ma³ymi patrolami stra¿y poza miastem, z³upiæ podró¿nych - takie rzeczy.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//Lee uwa¿a jednak, ¿e w naszej sytuacji by³aby to najgorsza rzecz, jak¹ moglibyœmy zrobiæ.
};


instance DIA_JARVIS_WANNAJOIN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 6;
	condition = dia_jarvis_wannajoin_condition;
	information = dia_jarvis_wannajoin_info;
	permanent = FALSE;
	description = "Chcê zostaæ najemnikiem!";
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
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//Chcê zostaæ najemnikiem!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//Nie jestem pewien, czy to dobry pomys³...
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//W czym problem?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//No có¿, muszê g³osowaæ za tob¹ albo przeciwko tobie.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//A w obecnej sytuacji zag³osujê na ciebie tylko wtedy, jeœli bêdê pewien, ¿e stoisz po stronie Lee!
};


instance DIA_JARVIS_MISSIONKO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 7;
	condition = dia_jarvis_missionko_condition;
	information = dia_jarvis_missionko_info;
	permanent = FALSE;
	description = "Wiêc co powinienem zrobiæ?";
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
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//Wiêc co powinienem zrobiæ?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//To proste. Obij paru ch³opaków Sylvia! Tym sposobem obie strony bêd¹ dok³adnie wiedzia³y, za kim siê opowiedzia³eœ.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//A jeœli do tego bêdziesz siê trzyma³ zasad pojedynku, to zaskarbisz sobie szacunek pozosta³ych.
	MIS_JARVIS_SLDKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_MURDER] = TRUE;
	Log_CreateTopic(TOPIC_JARVISSLDKO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JARVISSLDKO,LOG_RUNNING);
	b_logentry(TOPIC_JARVISSLDKO,"Jarvis chce przetrzepaæ skórê kilku ch³opakom Sylvia. Kiedy ta sprawa bêdzie ju¿ za³atwiona, udzieli mi swojego poparcia.");
};


instance DIA_JARVIS_DUELLREGELN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_duellregeln_condition;
	information = dia_jarvis_duellregeln_info;
	permanent = FALSE;
	description = "Jakie s¹ regu³y pojedynku?";
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
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//Jakie s¹ regu³y pojedynku?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//IdŸ do Torlofa, jeœli jesteœ zainteresowany, on ci to wyjaœni.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//¯ebyœmy siê dobrze zrozumieli: nie interesuje mnie, czy bêdziesz przestrzega³ zasad, czy nie. Wa¿ne, ¿eby ci kolesie wyl¹dowali na glebie!
	b_logentry(TOPIC_JARVISSLDKO,"Nie muszê nawet trzymaæ siê zasad obowi¹zuj¹cych w czasie pojedynku...");
};


instance DIA_JARVIS_SYLVIOSMEN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_sylviosmen_condition;
	information = dia_jarvis_sylviosmen_info;
	permanent = FALSE;
	description = "Którzy z najemników to ludzie Sylvia?";
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
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//Którzy z najemników to ludzie Sylvia?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//Jest szeœciu ch³opa. Po pierwsze Sylvio i jego prawa rêka Bullko.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//Potem Rod, Sentenza, Fester i Raoul.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//Reszta jest neutralna albo stoi po stronie Lee.
	b_logentry(TOPIC_JARVISSLDKO,"Ludzie Sylvia - Bullko, Rod, Sentenza, Fester i Raoul - s¹ tacy sami jak on.");
};


instance DIA_JARVIS_HOWMANY(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmany_condition;
	information = dia_jarvis_howmany_info;
	permanent = FALSE;
	description = "Ilu ludzi Sylvia muszê pokonaæ?";
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
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//Ilu ludzi Sylvia powinienem pokonaæ?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//Je¿eli powalisz trzech z nich, poka¿esz po czyjej jesteœ stronie.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//Kogo wybierzesz, to ju¿ twoja sprawa.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//Ma³a rada: nie chodzi o sprawdzian twojej odwagi. Nie zadzieraj z Sylviem - zrobi z ciebie siekane kotlety.
	b_logentry(TOPIC_JARVISSLDKO,"Wystarczy, jeœli pokonam trzech spoœród ludzi Sylvia. Od tego ostatniego lepiej trzymaæ siê z daleka.");
};


instance DIA_JARVIS_HOWMANYLEFT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmanyleft_condition;
	information = dia_jarvis_howmanyleft_info;
	permanent = TRUE;
	description = "Ilu ludzi Sylvia jest jeszcze na mojej liœcie?";
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
	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//Ilu ludzi Sylvia jest jeszcze na mojej liœcie?
	victories = 0;
	if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (bullco.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//Pokona³em Bullka.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//S³ysza³em. NieŸle.
		victories = victories + 1;
	};
	if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (rod.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//Rod wygl¹da, jakby przytrafi³ mu siê ma³y wypadek.
		victories = victories + 1;
	};
	if((sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (sentenza.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(Npc_KnowsInfo(other,dia_sentenza_hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//Sentenza próbowa³ wydusiæ ze mnie trochê z³ota - to by³ niezbyt m¹dry pomys³.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//Powali³em Sentenzê.
		};
		victories = victories + 1;
	};
	if((fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (fester.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(MIS_FESTER_KILLBUGS == LOG_OBSOLETE)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");	//Fester chcia³ mnie zrobiæ w konia - i to by³ jego b³¹d.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//Fester dosta³ to, co mu siê nale¿a³o.
		};
		victories = victories + 1;
	};
	if((raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (raoul.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//A jeœli chodzi o Raoula...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//Poszed³em zobaczyæ siê z Raoulem...
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//I?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//Koniecznie potrzebowa³ porz¹dnego obicia pyska.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//Jak dot¹d nie pokona³eœ ¿adnego z ludzi Sylvia.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//Dobrze - tylko tak dalej.
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//Spodziewam siê, ¿e sponiewierasz przynajmniej trzech z nich.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//Wystarczy, wystarczy.
		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//Naprawdê nakopa³eœ ka¿demu z nich, hê?
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//Jestem pod wra¿eniem - jeœli Lee mnie spyta, to bez wahania na ciebie zag³osujê.
		MIS_JARVIS_SLDKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_MURDER] = FALSE;
		b_giveplayerxp(XP_AMBIENT * victories);
		b_logentry(TOPIC_SLDRESPEKT,"Jarvis udzieli mi swojego poparcia, jeœli zechcê wst¹piæ w szeregi najemników.");
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
	description = "Jakieœ wieœci?";
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
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Jakieœ wieœci?
	if(KAPITEL <= 3)
	{
		if(JARVIS_GUILDCOMMENT == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//Teraz jesteœ jednym z nas. To dobrze.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//Dokona³eœ z³ego wyboru - mog³eœ byæ jednym z nas.
			};
			JARVIS_GUILDCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//Ch³opaki Sylvia dostali ostatnio niez³¹ nauczkê.
		};
	};
	if(KAPITEL >= 4)
	{
		if(JARVIS_SYLVIOCOMMENT == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//Silvio w koñcu siê zmy³. Gdy dowiedzia³ siê o smokach, to razem z czêœci¹ swoich ch³opaków wyruszy³ do Kolonii.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//Pewnie myœli, ¿e tam mo¿na siê ob³owiæ.
			JARVIS_SYLVIOCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//Nic, jak na razie spokój. Nie mogê siê doczekaæ, ¿eby zobaczyæ, co z tego wyniknie.
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

