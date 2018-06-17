
instance DIA_ANGARDJG_EXIT(C_INFO)
{
	npc = djg_705_angar;
	nr = 999;
	condition = dia_angardjg_exit_condition;
	information = dia_angardjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angardjg_exit_condition()
{
	return TRUE;
};

func void dia_angardjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_HALLO(C_INFO)
{
	npc = djg_705_angar;
	nr = 5;
	condition = dia_angardjg_hallo_condition;
	information = dia_angardjg_hallo_info;
	description = "Czy my siê przypadkiem nie znamy?";
};


func int dia_angardjg_hallo_condition()
{
	return TRUE;
};

func void dia_angardjg_hallo_info()
{
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");	//Ja ciê sk¹dœ znam... Jesteœ Cor Angar! By³eœ Œwi¹tynnym Stra¿nikiem w obozie na bagnie!
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");	//Nazywaj mnie po prostu Angarem. Odk¹d Bractwo Œni¹cego przesta³o istnieæ, nie u¿ywam dawnego tytu³u.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");	//Dziwne, twoja twarz wygl¹da znajomo, ale nie wiem, kim jesteœ.
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");	//Ech, od jakiegoœ czasu nie mogê siê porz¹dnie wyspaæ. To przez te koszmary...
	b_logentry(TOPIC_DRAGONHUNTER,"W Górniczej Dolinie znalaz³em Angara.");
};

func void b_sctellsangaraboutmadpsi()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");	//Bractwo Œni¹cego pad³o ofiar¹ si³ ciemnoœci.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");	//Twoi dawni kompani z obozu na bagnie snuj¹ siê teraz po bezdro¿ach, atakuj¹c wszystko, co im stanie na drodze.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");	//O czym ty mówisz?!
	};
};

func void b_sctellsangaraboutmadpsi2()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");	//Przeszli na stronê nieprzyjaciela, staj¹c siê bezdusznymi narzêdziami z³a.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");	//Bogowie! Dlaczego by³em taki zaœlepiony?! To siê ju¿ nigdy nie powtórzy. Przysiêgam!
		b_giveplayerxp(XP_ANGAR_KNOWSMADPSI);
		ANGAR_KNOWSMADPSI = TRUE;
	};
};


instance DIA_ANGAR_WIEKOMMSTDUHIERHER(C_INFO)
{
	npc = djg_705_angar;
	nr = 6;
	condition = dia_angar_wiekommstduhierher_condition;
	information = dia_angar_wiekommstduhierher_info;
	description = "Jak siê tu znalaz³eœ?";
};


func int dia_angar_wiekommstduhierher_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_hallo))
	{
		return TRUE;
	};
};

func void dia_angar_wiekommstduhierher_info()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");	//Jak siê tu znalaz³eœ?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01");	//Po upadku Bariery ukry³em siê w górach. Postanowi³em wreszcie coœ ze sob¹ zrobiæ.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_02");	//Przez kilka dni w³óczy³em siê po okolicy, a¿ wreszcie obudzi³em siê w zamku. Nie pytaj mnie, co siê ze mn¹ dzia³o, bo nie mam pojêcia.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");	//Co gorsza, zgubi³em gdzieœ amulet, który mia³em od lat. Zwariujê, jeœli go nie odnajdê.
	Log_CreateTopic(TOPIC_ANGARSAMULETT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ANGARSAMULETT,LOG_RUNNING);
	b_logentry(TOPIC_ANGARSAMULETT,"Angar zgubi³ swój amulet i próbuje go teraz odnaleŸæ.");
	Info_AddChoice(dia_angar_wiekommstduhierher,DIALOG_BACK,dia_angar_wiekommstduhierher_gehen);
	Info_AddChoice(dia_angar_wiekommstduhierher,"Gdzie dok³adnie zgubi³eœ ten amulet?",dia_angar_wiekommstduhierher_amulett);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Bractwo œni¹cego pad³o ofiar¹ si³ ciemnoœci.",dia_angar_wiekommstduhierher_andere);
	}
	else
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"A co siê sta³o z pozosta³ymi cz³onkami Bractwa?",dia_angar_wiekommstduhierher_andere);
	};
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Co zamierzasz teraz robiæ?",dia_angar_wiekommstduhierher_nun);
	};
};

func void dia_angar_wiekommstduhierher_amulett()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");	//Gdzie dok³adnie zgubi³eœ ten amulet?
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");	//Gdzieœ na po³udniu, zanim trafi³em do zamku.
		b_logentry(TOPIC_ANGARSAMULETT,"Prawdopodobnie amulet znajduje siê gdzieœ na po³udniu. Angar wybiera siê na poszukiwania zguby.");
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");	//Musi byæ gdzieœ tutaj.
		b_logentry(TOPIC_ANGARSAMULETT,"Amulet znajduje siê w pobli¿u kamiennego grobowca na po³udniu Górniczej Doliny.");
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");	//Podejrzewam, ¿e mi go ukradziono. Muszê go odzyskaæ!
};

func void dia_angar_wiekommstduhierher_andere()
{
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi();
	}
	else
	{
		AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");	//A co siê sta³o z pozosta³ymi cz³onkami Bractwa?
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");	//Ostatnia rzecz, któr¹ pamiêtam, to widok zapadaj¹cej siê Bariery i towarzysz¹cy mu przeraŸliwy, parali¿uj¹cy zmys³y krzyk...
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");	//Padliœmy na ziemiê, wij¹c siê z bólu, ale g³os nie milk³... stawa³ siê coraz g³oœniejszy.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");	//A¿ nagle nast¹pi³ koniec i wszyscy rozbiegli siê w ciemn¹ noc, wrzeszcz¹c jak opêtani.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");	//Nigdy ju¿ ich nie zobaczy³em.
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi2();
	};
};

func void dia_angar_wiekommstduhierher_nun()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00");	//Co zamierzasz robiæ dalej?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01");	//Najpierw trochê odpocznê. Potem poszukam mojego amuletu.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02");	//S³ysza³em jakieœ plotki o smokach.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03");	//Ludzie mówi¹, ¿e wojownicy przybywaj¹ do Górniczej Doliny, by z nimi walczyæ.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04");	//Mo¿e siê do nich przy³¹czê?
	ANGAR_WILLDJGWERDEN = TRUE;
};

func void dia_angar_wiekommstduhierher_gehen()
{
	Info_ClearChoices(dia_angar_wiekommstduhierher);
};


instance DIA_ANGAR_SCTELLSANGARABOUTMADPSI2(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_sctellsangaraboutmadpsi2_condition;
	information = dia_angar_sctellsangaraboutmadpsi2_info;
	description = "Bractwo œni¹cego pad³o ofiar¹ si³ ciemnoœci.";
};


func int dia_angar_sctellsangaraboutmadpsi2_condition()
{
	if((SC_KNOWSMADPSI == TRUE) && (ANGAR_KNOWSMADPSI == FALSE) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void dia_angar_sctellsangaraboutmadpsi2_info()
{
	b_sctellsangaraboutmadpsi();
	b_sctellsangaraboutmadpsi2();
};


instance DIA_ANGAR_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_foundamulett_condition;
	information = dia_angar_foundamulett_info;
	description = "Znalaz³em twój amulet.";
};


func int dia_angar_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void b_angarsamulettabgeben()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");	//Znalaz³em twój amulet.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");	//Dziêki! Ju¿ straci³em nadziejê, ¿e go jeszcze zobaczê!
	b_giveinvitems(other,self,itam_mana_angar_mis,1);
	DJG_ANGARGOTAMULETT = TRUE;
	b_giveplayerxp(XP_ANGARDJGUNDEADMAGE);
};

func void dia_angar_foundamulett_info()
{
	b_angarsamulettabgeben();
	Info_AddChoice(dia_angar_foundamulett,"Dlaczego tak bardzo ci na nim zale¿y?",dia_angar_foundamulett_besonders);
	Info_AddChoice(dia_angar_foundamulett,"Co zamierzasz teraz zrobiæ?",dia_angar_foundamulett_nun);
};

func void dia_angar_foundamulett_besonders()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00");	//Dlaczego tak bardzo ci na nim zale¿y?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01");	//Dosta³em go w prezencie...
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//Rozumiem.
};

func void dia_angar_foundamulett_nun()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");	//Co zamierzasz robiæ dalej?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");	//Wynieœæ siê z tej przeklêtej doliny!
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");	//Kto wie - mo¿e siê jeszcze kiedyœ spotkamy. Bywaj!
	AI_StopProcessInfos(self);
	if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
	{
		Npc_ExchangeRoutine(self,"LeavingOW");
	};
};


instance DIA_ANGAR_DJG_ANWERBEN(C_INFO)
{
	npc = djg_705_angar;
	nr = 8;
	condition = dia_angar_djg_anwerben_condition;
	information = dia_angar_djg_anwerben_info;
	description = "Mo¿e móg³bym ci jakoœ pomóc?";
};


func int dia_angar_djg_anwerben_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_djg_anwerben_info()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");	//Mo¿e móg³bym ci jakoœ pomóc?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");	//Czemu nie. ¯adna pomoc nie zaszkodzi.
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"Muszê ju¿ iœæ.",dia_angar_djg_anwerben_gehen);
		Info_AddChoice(dia_angar_djg_anwerben,"A gdzie zamierzasz szukaæ?",dia_angar_djg_anwerben_wo);
		Info_AddChoice(dia_angar_djg_anwerben,"Kiedy zamierzasz wyruszyæ?",dia_angar_djg_anwerben_wann);
	};
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"A co z ³owcami smoków?",dia_angar_djg_anwerben_djg);
	};
};

func void dia_angar_djg_anwerben_djg()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");	//A co z ³owcami smoków?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");	//Porozmawiam z nimi póŸniej. Mo¿e przyda im siê ktoœ taki jak ja.
};

func void dia_angar_djg_anwerben_wann()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");	//Kiedy zamierzasz wyruszyæ?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");	//Jak tylko odzyskam si³y.
};

func void dia_angar_djg_anwerben_wo()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");	//A gdzie zamierzasz szukaæ?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");	//Pójdê na po³udnie, tam, sk¹d przyby³em.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");	//Jest tam pewna jaskinia otoczona g³azami, a w niej grobowiec...
};

func void dia_angar_djg_anwerben_gehen()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");	//Muszê ju¿ iœæ.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");	//Uwa¿aj na siebie.
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_WASMACHSTDU(C_INFO)
{
	npc = djg_705_angar;
	nr = 9;
	condition = dia_angardjg_wasmachstdu_condition;
	information = dia_angardjg_wasmachstdu_info;
	description = "Coœ nie tak?";
};


func int dia_angardjg_wasmachstdu_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,dia_angar_djg_anwerben) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00");	//Coœ nie tak?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01");	//S³yszysz to? Nigdy w ¿yciu nie s³ysza³em czegoœ tak przera¿aj¹cego.
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02");	//Nie wiem, o czym mówisz! Ja nic nie s³yszê.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03");	//Wszystko tu cuchnie œmierci¹ i zniszczeniem. Wejœcia do tej krypty strzeg¹ odra¿aj¹ce istoty.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04");	//To kryjówka mrocznej, z³owrogiej si³y, której poddani nawiedzaj¹ nasz œwiat.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05");	//Jestem prawie pewien, ¿e mój amulet jest gdzieœ tutaj.
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angardjg_wasmachstdu,"Rozmawia³eœ ju¿ z ³owcami smoków?",dia_angardjg_wasmachstdu_djg);
	};
};

func void dia_angardjg_wasmachstdu_djg()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");	//Rozmawia³eœ ju¿ z ³owcami smoków?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");	//Tak, ale spodziewa³em siê towarzystwa na kszta³t mojego dawnego Bractwa.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");	//Tymczasem ci ³owcy to dzika zgraja bezmózgich osi³ków. To nie dla mnie.
};


instance DIA_ANGARDJG_WHATSINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 10;
	condition = dia_angardjg_whatsinthere_condition;
	information = dia_angardjg_whatsinthere_info;
	description = "Co siê kryje w tej jaskini za ska³ami?";
};


func int dia_angardjg_whatsinthere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_wasmachstdu) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_whatsinthere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");	//Co siê kryje w tej jaskini za ska³ami?
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");	//Coœ nie pozwala mi zbli¿yæ siê do wejœcia!
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");	//Jaskini strze¿e magiczna istota. Widzia³em j¹ w nocy, jak przeczesywa³a okolicê. To straszne... odra¿aj¹ce stworzenie.
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");	//Sunie w tê i z powrotem, miêdzy drzewami, i wydaje siê, ¿e wysysa ¿ycie ze wszystkiego, do czego siê zbli¿y.
	b_logentry(TOPIC_DRAGONHUNTER,"W Górniczej Dolinie znalaz³em Angara.");
};


instance DIA_ANGARDJG_WANTTOGOINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 11;
	condition = dia_angardjg_wanttogointhere_condition;
	information = dia_angardjg_wanttogointhere_info;
	description = "ChodŸmy dalej.";
};


func int dia_angardjg_wanttogointhere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_whatsinthere) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wanttogointhere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");	//ChodŸmy dalej.
	AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");	//Spróbujê. Ale b¹dŸmy ostro¿ni.
	AI_StopProcessInfos(self);
	if(Npc_IsDead(skeletonmage_angar))
	{
		Npc_ExchangeRoutine(self,"Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Angriff");
		DJG_ANGARANGRIFF = TRUE;
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ANGARDJG_UNDEADMAGEDEAD(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagedead_condition;
	information = dia_angardjg_undeadmagedead_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagedead_condition()
{
	if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_ANGARANGRIFF == TRUE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagedead_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");	//Tylko... œmieræ i zniszczenie. Muszê siê st¹d wydostaæ!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RunToEntrance");
};


instance DIA_ANGARDJG_UNDEADMAGECOMES(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagecomes_condition;
	information = dia_angardjg_undeadmagecomes_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagecomes_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_13") < 500) && Npc_KnowsInfo(other,dia_angardjg_wanttogointhere) && (Npc_KnowsInfo(other,dia_angardjg_undeadmagedead) == FALSE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagecomes_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");	//Ciii... Teraz... S³yszysz?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_ANGAR_WASISTLOS(C_INFO)
{
	npc = djg_705_angar;
	nr = 14;
	condition = dia_angar_wasistlos_condition;
	information = dia_angar_wasistlos_info;
	description = "Coœ nie tak?";
};


func int dia_angar_wasistlos_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angar_wasistlos_info()
{
	AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");	//Nie mogê iœæ z tob¹ dalej.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");	//Coœ mi mówi, ¿e nie wyjdê z tego ¿ywy.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");	//Nie potrafiê tego wyt³umaczyæ, ale...
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");	//Muszê czym prêdzej opuœciæ to przeklête miejsce, zanim podzielê los moich dawnych kompanów.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");	//Za ka¿dym razem, gdy stawiam czo³a tym... upiorom... czujê siê, jakbym walczy³ z w³asnymi braæmi.
	};
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_DRAGONHUNTER,"Angar odszed³. Przez tych wszystkich o¿ywieñców mia³ wra¿enie, jakby walczy³ ze swoimi w³asnymi ludŸmi.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"LeavingOW");
};


instance DIA_ANGAR_WHYAREYOUHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 15;
	condition = dia_angar_whyareyouhere_condition;
	information = dia_angar_whyareyouhere_info;
	description = "Angar? Co ty tu robisz?";
};


func int dia_angar_whyareyouhere_condition()
{
	if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_angar_whyareyouhere_info()
{
	AI_Output(other,self,"DIA_Angar_WHYAREYOUHERE_15_00");	//Angar? Co ty tu robisz?
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");	//By³em w drodze na prze³êcz, gdy nagle natkn¹³em siê na bandê orków. Ju¿ myœla³em, ¿e siê nie wywinê!
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");	//Odczekam trochê i spróbujê znowu. Zobaczymy siê po drugiej stronie!
	b_logentry(TOPIC_DRAGONHUNTER,"Znowu spotka³em Angara. Utkn¹³ w Górniczej Dolinie na dobre.");
	b_giveplayerxp(XP_ANGARDJGAGAIN);
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PERMKAP4(C_INFO)
{
	npc = djg_705_angar;
	condition = dia_angar_permkap4_condition;
	information = dia_angar_permkap4_info;
	permanent = TRUE;
	description = "Nie lubiê zostawiaæ ciê bez towarzystwa.";
};


func int dia_angar_permkap4_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_whyareyouhere))
	{
		return TRUE;
	};
};

func void dia_angar_permkap4_info()
{
	AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");	//Mo¿esz tu zaczekaæ?
	AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");	//Oczywiœcie. Ruszaj œmia³o.
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar;
	nr = 900;
	condition = dia_angar_pickpocket_condition;
	information = dia_angar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_pickpocket_condition()
{
	return c_beklauen(47,55);
};

func void dia_angar_pickpocket_info()
{
	Info_ClearChoices(dia_angar_pickpocket);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_BACK,dia_angar_pickpocket_back);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_PICKPOCKET,dia_angar_pickpocket_doit);
};

func void dia_angar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_pickpocket);
};

func void dia_angar_pickpocket_back()
{
	Info_ClearChoices(dia_angar_pickpocket);
};

