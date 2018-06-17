
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
	description = "Czy my si� przypadkiem nie znamy?";
};


func int dia_angardjg_hallo_condition()
{
	return TRUE;
};

func void dia_angardjg_hallo_info()
{
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");	//Ja ci� sk�d� znam... Jeste� Cor Angar! By�e� �wi�tynnym Stra�nikiem w obozie na bagnie!
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");	//Nazywaj mnie po prostu Angarem. Odk�d Bractwo �ni�cego przesta�o istnie�, nie u�ywam dawnego tytu�u.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");	//Dziwne, twoja twarz wygl�da znajomo, ale nie wiem, kim jeste�.
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");	//Ech, od jakiego� czasu nie mog� si� porz�dnie wyspa�. To przez te koszmary...
	b_logentry(TOPIC_DRAGONHUNTER,"W G�rniczej Dolinie znalaz�em Angara.");
};

func void b_sctellsangaraboutmadpsi()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");	//Bractwo �ni�cego pad�o ofiar� si� ciemno�ci.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");	//Twoi dawni kompani z obozu na bagnie snuj� si� teraz po bezdro�ach, atakuj�c wszystko, co im stanie na drodze.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");	//O czym ty m�wisz?!
	};
};

func void b_sctellsangaraboutmadpsi2()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");	//Przeszli na stron� nieprzyjaciela, staj�c si� bezdusznymi narz�dziami z�a.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");	//Bogowie! Dlaczego by�em taki za�lepiony?! To si� ju� nigdy nie powt�rzy. Przysi�gam!
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
	description = "Jak si� tu znalaz�e�?";
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
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");	//Jak si� tu znalaz�e�?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01");	//Po upadku Bariery ukry�em si� w g�rach. Postanowi�em wreszcie co� ze sob� zrobi�.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_02");	//Przez kilka dni w��czy�em si� po okolicy, a� wreszcie obudzi�em si� w zamku. Nie pytaj mnie, co si� ze mn� dzia�o, bo nie mam poj�cia.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");	//Co gorsza, zgubi�em gdzie� amulet, kt�ry mia�em od lat. Zwariuj�, je�li go nie odnajd�.
	Log_CreateTopic(TOPIC_ANGARSAMULETT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ANGARSAMULETT,LOG_RUNNING);
	b_logentry(TOPIC_ANGARSAMULETT,"Angar zgubi� sw�j amulet i pr�buje go teraz odnale��.");
	Info_AddChoice(dia_angar_wiekommstduhierher,DIALOG_BACK,dia_angar_wiekommstduhierher_gehen);
	Info_AddChoice(dia_angar_wiekommstduhierher,"Gdzie dok�adnie zgubi�e� ten amulet?",dia_angar_wiekommstduhierher_amulett);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Bractwo �ni�cego pad�o ofiar� si� ciemno�ci.",dia_angar_wiekommstduhierher_andere);
	}
	else
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"A co si� sta�o z pozosta�ymi cz�onkami Bractwa?",dia_angar_wiekommstduhierher_andere);
	};
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"Co zamierzasz teraz robi�?",dia_angar_wiekommstduhierher_nun);
	};
};

func void dia_angar_wiekommstduhierher_amulett()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");	//Gdzie dok�adnie zgubi�e� ten amulet?
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");	//Gdzie� na po�udniu, zanim trafi�em do zamku.
		b_logentry(TOPIC_ANGARSAMULETT,"Prawdopodobnie amulet znajduje si� gdzie� na po�udniu. Angar wybiera si� na poszukiwania zguby.");
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");	//Musi by� gdzie� tutaj.
		b_logentry(TOPIC_ANGARSAMULETT,"Amulet znajduje si� w pobli�u kamiennego grobowca na po�udniu G�rniczej Doliny.");
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");	//Podejrzewam, �e mi go ukradziono. Musz� go odzyska�!
};

func void dia_angar_wiekommstduhierher_andere()
{
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi();
	}
	else
	{
		AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");	//A co si� sta�o z pozosta�ymi cz�onkami Bractwa?
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");	//Ostatnia rzecz, kt�r� pami�tam, to widok zapadaj�cej si� Bariery i towarzysz�cy mu przera�liwy, parali�uj�cy zmys�y krzyk...
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");	//Padli�my na ziemi�, wij�c si� z b�lu, ale g�os nie milk�... stawa� si� coraz g�o�niejszy.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");	//A� nagle nast�pi� koniec i wszyscy rozbiegli si� w ciemn� noc, wrzeszcz�c jak op�tani.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");	//Nigdy ju� ich nie zobaczy�em.
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi2();
	};
};

func void dia_angar_wiekommstduhierher_nun()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00");	//Co zamierzasz robi� dalej?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01");	//Najpierw troch� odpoczn�. Potem poszukam mojego amuletu.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02");	//S�ysza�em jakie� plotki o smokach.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03");	//Ludzie m�wi�, �e wojownicy przybywaj� do G�rniczej Doliny, by z nimi walczy�.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04");	//Mo�e si� do nich przy��cz�?
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
	description = "Bractwo �ni�cego pad�o ofiar� si� ciemno�ci.";
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
	description = "Znalaz�em tw�j amulet.";
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
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");	//Znalaz�em tw�j amulet.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");	//Dzi�ki! Ju� straci�em nadziej�, �e go jeszcze zobacz�!
	b_giveinvitems(other,self,itam_mana_angar_mis,1);
	DJG_ANGARGOTAMULETT = TRUE;
	b_giveplayerxp(XP_ANGARDJGUNDEADMAGE);
};

func void dia_angar_foundamulett_info()
{
	b_angarsamulettabgeben();
	Info_AddChoice(dia_angar_foundamulett,"Dlaczego tak bardzo ci na nim zale�y?",dia_angar_foundamulett_besonders);
	Info_AddChoice(dia_angar_foundamulett,"Co zamierzasz teraz zrobi�?",dia_angar_foundamulett_nun);
};

func void dia_angar_foundamulett_besonders()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00");	//Dlaczego tak bardzo ci na nim zale�y?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01");	//Dosta�em go w prezencie...
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//Rozumiem.
};

func void dia_angar_foundamulett_nun()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");	//Co zamierzasz robi� dalej?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");	//Wynie�� si� z tej przekl�tej doliny!
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");	//Kto wie - mo�e si� jeszcze kiedy� spotkamy. Bywaj!
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
	description = "Mo�e m�g�bym ci jako� pom�c?";
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
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");	//Mo�e m�g�bym ci jako� pom�c?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");	//Czemu nie. �adna pomoc nie zaszkodzi.
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"Musz� ju� i��.",dia_angar_djg_anwerben_gehen);
		Info_AddChoice(dia_angar_djg_anwerben,"A gdzie zamierzasz szuka�?",dia_angar_djg_anwerben_wo);
		Info_AddChoice(dia_angar_djg_anwerben,"Kiedy zamierzasz wyruszy�?",dia_angar_djg_anwerben_wann);
	};
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"A co z �owcami smok�w?",dia_angar_djg_anwerben_djg);
	};
};

func void dia_angar_djg_anwerben_djg()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");	//A co z �owcami smok�w?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");	//Porozmawiam z nimi p�niej. Mo�e przyda im si� kto� taki jak ja.
};

func void dia_angar_djg_anwerben_wann()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");	//Kiedy zamierzasz wyruszy�?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");	//Jak tylko odzyskam si�y.
};

func void dia_angar_djg_anwerben_wo()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");	//A gdzie zamierzasz szuka�?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");	//P�jd� na po�udnie, tam, sk�d przyby�em.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");	//Jest tam pewna jaskinia otoczona g�azami, a w niej grobowiec...
};

func void dia_angar_djg_anwerben_gehen()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");	//Musz� ju� i��.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");	//Uwa�aj na siebie.
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_WASMACHSTDU(C_INFO)
{
	npc = djg_705_angar;
	nr = 9;
	condition = dia_angardjg_wasmachstdu_condition;
	information = dia_angardjg_wasmachstdu_info;
	description = "Co� nie tak?";
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
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00");	//Co� nie tak?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01");	//S�yszysz to? Nigdy w �yciu nie s�ysza�em czego� tak przera�aj�cego.
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02");	//Nie wiem, o czym m�wisz! Ja nic nie s�ysz�.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03");	//Wszystko tu cuchnie �mierci� i zniszczeniem. Wej�cia do tej krypty strzeg� odra�aj�ce istoty.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04");	//To kryj�wka mrocznej, z�owrogiej si�y, kt�rej poddani nawiedzaj� nasz �wiat.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05");	//Jestem prawie pewien, �e m�j amulet jest gdzie� tutaj.
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angardjg_wasmachstdu,"Rozmawia�e� ju� z �owcami smok�w?",dia_angardjg_wasmachstdu_djg);
	};
};

func void dia_angardjg_wasmachstdu_djg()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");	//Rozmawia�e� ju� z �owcami smok�w?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");	//Tak, ale spodziewa�em si� towarzystwa na kszta�t mojego dawnego Bractwa.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");	//Tymczasem ci �owcy to dzika zgraja bezm�zgich osi�k�w. To nie dla mnie.
};


instance DIA_ANGARDJG_WHATSINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 10;
	condition = dia_angardjg_whatsinthere_condition;
	information = dia_angardjg_whatsinthere_info;
	description = "Co si� kryje w tej jaskini za ska�ami?";
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
	AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");	//Co si� kryje w tej jaskini za ska�ami?
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");	//Co� nie pozwala mi zbli�y� si� do wej�cia!
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");	//Jaskini strze�e magiczna istota. Widzia�em j� w nocy, jak przeczesywa�a okolic�. To straszne... odra�aj�ce stworzenie.
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");	//Sunie w t� i z powrotem, mi�dzy drzewami, i wydaje si�, �e wysysa �ycie ze wszystkiego, do czego si� zbli�y.
	b_logentry(TOPIC_DRAGONHUNTER,"W G�rniczej Dolinie znalaz�em Angara.");
};


instance DIA_ANGARDJG_WANTTOGOINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 11;
	condition = dia_angardjg_wanttogointhere_condition;
	information = dia_angardjg_wanttogointhere_info;
	description = "Chod�my dalej.";
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
	AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");	//Chod�my dalej.
	AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");	//Spr�buj�. Ale b�d�my ostro�ni.
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
	AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");	//Tylko... �mier� i zniszczenie. Musz� si� st�d wydosta�!
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
	AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");	//Ciii... Teraz... S�yszysz?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_ANGAR_WASISTLOS(C_INFO)
{
	npc = djg_705_angar;
	nr = 14;
	condition = dia_angar_wasistlos_condition;
	information = dia_angar_wasistlos_info;
	description = "Co� nie tak?";
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
	AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");	//Nie mog� i�� z tob� dalej.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");	//Co� mi m�wi, �e nie wyjd� z tego �ywy.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");	//Nie potrafi� tego wyt�umaczy�, ale...
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");	//Musz� czym pr�dzej opu�ci� to przekl�te miejsce, zanim podziel� los moich dawnych kompan�w.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");	//Za ka�dym razem, gdy stawiam czo�a tym... upiorom... czuj� si�, jakbym walczy� z w�asnymi bra�mi.
	};
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_DRAGONHUNTER,"Angar odszed�. Przez tych wszystkich o�ywie�c�w mia� wra�enie, jakby walczy� ze swoimi w�asnymi lud�mi.");
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
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");	//By�em w drodze na prze��cz, gdy nagle natkn��em si� na band� ork�w. Ju� my�la�em, �e si� nie wywin�!
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");	//Odczekam troch� i spr�buj� znowu. Zobaczymy si� po drugiej stronie!
	b_logentry(TOPIC_DRAGONHUNTER,"Znowu spotka�em Angara. Utkn�� w G�rniczej Dolinie na dobre.");
	b_giveplayerxp(XP_ANGARDJGAGAIN);
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PERMKAP4(C_INFO)
{
	npc = djg_705_angar;
	condition = dia_angar_permkap4_condition;
	information = dia_angar_permkap4_info;
	permanent = TRUE;
	description = "Nie lubi� zostawia� ci� bez towarzystwa.";
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
	AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");	//Mo�esz tu zaczeka�?
	AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");	//Oczywi�cie. Ruszaj �mia�o.
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

