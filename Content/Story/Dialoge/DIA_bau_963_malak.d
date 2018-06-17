
instance DIA_MALAK_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_exit_condition;
	information = dia_malak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_malak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALAK_HALLO(C_INFO)
{
	npc = bau_963_malak;
	nr = 3;
	condition = dia_malak_hallo_condition;
	information = dia_malak_hallo_info;
	description = "Wszystko w porz¹dku?";
};


func int dia_malak_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_malak_hallo_info()
{
	AI_Output(other,self,"DIA_Malak_HALLO_15_00");	//Wszystko w porz¹dku?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_01");	//Kolejna osoba, która nie wie, gdzie siê podziaæ? To ¿aden problem. Porozmawiaj z farmerem Bengarem.
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_02");	//Jasne.
	};
};


instance DIA_MALAK_WASMACHSTDU(C_INFO)
{
	npc = bau_963_malak;
	nr = 4;
	condition = dia_malak_wasmachstdu_condition;
	information = dia_malak_wasmachstdu_info;
	description = "Co tu porabiasz?";
};


func int dia_malak_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Malak_WASMACHSTDU_15_00");	//Czym siê zajmujesz?
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_01");	//Jestem pasterzem. Nie jest to bardzo wymagaj¹ca praca.
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_02");	//Jednak czasami trzeba byæ naprawdê czujnym. Zw³aszcza jeœli zbli¿asz siê do prze³êczy.
};


instance DIA_MALAK_PASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 5;
	condition = dia_malak_pass_condition;
	information = dia_malak_pass_info;
	description = "Co wiesz na temat prze³êczy?";
};


func int dia_malak_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_wasmachstdu) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_pass_info()
{
	AI_Output(other,self,"DIA_Malak_PASS_15_00");	//Co wiesz na temat prze³êczy?
	AI_Output(self,other,"DIA_Malak_PASS_08_01");	//Niewiele. Wiem tylko, ¿e prowadzi do starej Górniczej Doliny, która jeszcze parê tygodni temu by³a otoczona przez Barierê.
	AI_Output(self,other,"DIA_Malak_PASS_08_02");	//Kiedyœ jedyn¹ rzecz¹, jak¹ musieliœmy siê przejmowaæ, by³a comiesiêczna karawana, wioz¹ca przeró¿ne dobra do Górniczej Doliny.
	AI_Output(self,other,"DIA_Malak_PASS_08_03");	//Zdarza³o siê, ¿e te rzezimieszki utrudnia³y nam ¿ycie.
};


instance DIA_MALAK_WOPASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 6;
	condition = dia_malak_wopass_condition;
	information = dia_malak_wopass_info;
	description = "Gdzie dok³adnie znajduje siê prze³êcz wiod¹ca do Górniczej Doliny?";
};


func int dia_malak_wopass_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_wopass_info()
{
	AI_Output(other,self,"DIA_Malak_WOPASS_15_00");	//Gdzie dok³adnie znajduje siê prze³êcz wiod¹ca do Górniczej Doliny?
	AI_Output(self,other,"DIA_Malak_WOPASS_08_01");	//Tu¿ obok dwóch wodospadów po drugiej stronie pastwisk.
};


instance DIA_MALAK_MINENTAL(C_INFO)
{
	npc = bau_963_malak;
	nr = 7;
	condition = dia_malak_minental_condition;
	information = dia_malak_minental_info;
	description = "Jakie opowieœci kr¹¿¹ o Górniczej Dolinie?";
};


func int dia_malak_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_minental_info()
{
	AI_Output(other,self,"DIA_Malak_MINENTAL_15_00");	//Jakie opowieœci kr¹¿¹ o Górniczej Dolinie?
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_01");	//Przeró¿ne. Podobno niektórzy s³yszeli tam w nocy krzyki, inni opowiadaj¹ o dziwnych œwiat³ach ponad górami.
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_02");	//Moim zdaniem, to wszystko wyssane z palca opowieœci starych bab.
};


instance DIA_MALAK_WARSTDUSCHONDA(C_INFO)
{
	npc = bau_963_malak;
	nr = 8;
	condition = dia_malak_warstduschonda_condition;
	information = dia_malak_warstduschonda_info;
	description = "Czy kiedykolwiek by³eœ w Górniczej Dolinie?";
};


func int dia_malak_warstduschonda_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_warstduschonda_info()
{
	AI_Output(other,self,"DIA_Malak_WARSTDUSCHONDA_15_00");	//Czy kiedykolwiek by³eœ w Górniczej Dolinie?
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_01");	//Nie. Ale od czasu do czasu zdarza mi siê przechodziæ w pobli¿u prze³êczy. Zawsze stoi tam na warcie dwóch paladynów.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_02");	//Wygl¹da to tak, jakby pilnowali, ¿eby nic nie wydosta³o siê z doliny.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_03");	//Kiedyœ Górnicza Dolina by³a wykorzystywana jako naturalne wiêzienie. Jeœli ktoœ tam wszed³, nie by³o ju¿ powrotu.
};


instance DIA_MALAK_PALADINE(C_INFO)
{
	npc = bau_963_malak;
	nr = 9;
	condition = dia_malak_paladine_condition;
	information = dia_malak_paladine_info;
	description = "Powiedz mi coœ wiêcej o paladynach.";
};


func int dia_malak_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_warstduschonda) && Npc_KnowsInfo(other,dia_malak_minental) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_paladine_info()
{
	AI_Output(other,self,"DIA_Malak_PALADINE_15_00");	//Opowiedz mi wiêcej o paladynach. Od kiedy tu stacjonuj¹?
	AI_Output(self,other,"DIA_Malak_PALADINE_08_01");	//Tydzieñ lub dwa... Nie pamiêtam dok³adnie, kiedy siê tu pojawili.
	AI_Output(self,other,"DIA_Malak_PALADINE_08_02");	//Jakiœ czas temu ca³y oddzia³ paladynów przekroczy³ prze³êcz. Od tamtej pory ju¿ ich nie widzia³em.
};


instance DIA_MALAK_KEINEFRAUEN(C_INFO)
{
	npc = bau_963_malak;
	nr = 10;
	condition = dia_malak_keinefrauen_condition;
	information = dia_malak_keinefrauen_info;
	description = "Nie widzê tu ¿adnych kobiet.";
};


func int dia_malak_keinefrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_wasmachstdu) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_keinefrauen_info()
{
	AI_Output(other,self,"DIA_Malak_KEINEFRAUEN_15_00");	//Nie widzê tu ¿adnych kobiet.
	AI_Output(self,other,"DIA_Malak_KEINEFRAUEN_08_01");	//Masz racjê. Ta farma nale¿y do mê¿czyzn. Jeœli o mnie chodzi, sprawdza siê to ca³kiem nieŸle.
};


instance DIA_MALAK_PERMKAP1(C_INFO)
{
	npc = bau_963_malak;
	nr = 11;
	condition = dia_malak_permkap1_condition;
	information = dia_malak_permkap1_info;
	permanent = TRUE;
	description = "Tylko siê nie przepracuj.";
};


func int dia_malak_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_malak_hallo) && Npc_KnowsInfo(other,dia_malak_wasmachstdu) && Npc_KnowsInfo(other,dia_malak_pass) && Npc_KnowsInfo(other,dia_malak_minental) && Npc_KnowsInfo(other,dia_malak_warstduschonda) && Npc_KnowsInfo(other,dia_malak_paladine) && Npc_KnowsInfo(other,dia_malak_keinefrauen) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_malak_permkap1_info()
{
	AI_Output(other,self,"DIA_Malak_PERMKAP1_15_00");	//Tylko siê nie przepracuj.
	AI_Output(self,other,"DIA_Malak_PERMKAP1_08_01");	//Postaram siê.
	AI_StopProcessInfos(self);
};


instance DIA_MALAK_KAP3_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap3_exit_condition;
	information = dia_malak_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_malak_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_FLEEFROMPASS(C_INFO)
{
	npc = bau_963_malak;
	nr = 30;
	condition = dia_malak_fleefrompass_condition;
	information = dia_malak_fleefrompass_info;
	description = "Co tu porabiasz?";
};


func int dia_malak_fleefrompass_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_malak_fleefrompass_info()
{
	if((NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild == GIL_KDF))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_00");	//Co tu robisz?
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_01");	//Uciek³em z farmy Bengara. Nie chcia³em zostaæ rozszarpany przez jakieœ stworzenie, które mo¿e w ka¿dej chwili przekroczyæ prze³êcz.
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_02");	//Nawet sobie nie wyobra¿asz, jakie paskudztwa wy³oni³y siê stamt¹d w ci¹gu kilku ostatnich dni.
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_03");	//Chyba jednak mogê to sobie wyobraziæ.
		b_logentry(TOPIC_BENGARALLEIN,"Malak schroni³ siê na po³udniu, poniewa¿ obawia siê stworzeñ przybywaj¹cych na pastwiska od strony prze³êczy.");
		b_giveplayerxp(XP_FOUNDMALAKFLEEFROMPASS);
	};
};


instance DIA_MALAK_HEILUNG(C_INFO)
{
	npc = bau_963_malak;
	nr = 55;
	condition = dia_malak_heilung_condition;
	information = dia_malak_heilung_info;
	permanent = TRUE;
	description = "Potrzebujesz pomocy.";
};


func int dia_malak_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_MALAK == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};


var int dia_malak_heilung_onetime;

func void dia_malak_heilung_info()
{
	AI_Output(other,self,"DIA_Malak_Heilung_15_00");	//Potrzebujesz pomocy.
	if(DIA_MALAK_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_01");	//Po prostu chcê wróciæ do domu. Do Bengara. Mam nadziejê, ¿e jeszcze ¿yje.
		b_npcclearobsessionbydmt(self);
		Npc_ExchangeRoutine(self,"Start");
		b_startotherroutine(bau_962_bauer,"Start");
		b_startotherroutine(bau_964_bauer,"Start");
		b_startotherroutine(bau_965_bauer,"Start");
		b_startotherroutine(bau_966_bauer,"Start");
		b_startotherroutine(bau_967_bauer,"Start");
		b_startotherroutine(bau_968_bauer,"Start");
		b_startotherroutine(bau_969_bauer,"Start");
		DIA_MALAK_HEILUNG_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_02");	//Zostaw mnie w spokoju, magu. Sam sobie poradzê.
		b_npcclearobsessionbydmt(self);
	};
};


instance DIA_MALAK_PERMCASTLE(C_INFO)
{
	npc = bau_963_malak;
	nr = 31;
	condition = dia_malak_permcastle_condition;
	information = dia_malak_permcastle_info;
	permanent = TRUE;
	description = "Jak ci siê tu ¿yje?";
};


func int dia_malak_permcastle_condition()
{
	if((Npc_GetDistToWP(self,"CASTLEMINE") < 4000) && (MIS_GETMALAKBACK != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_malak_fleefrompass) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_permcastle_info()
{
	AI_Output(other,self,"DIA_Malak_PERMCASTLE_15_00");	//Jak ci siê tu ¿yje?
	AI_Output(self,other,"DIA_Malak_PERMCASTLE_08_01");	//Muszê tylko uwa¿aæ na bandytów. Z dwojga z³ego - wolê to.
};


instance DIA_MALAK_BACKTOBENGAR(C_INFO)
{
	npc = bau_963_malak;
	nr = 31;
	condition = dia_malak_backtobengar_condition;
	information = dia_malak_backtobengar_info;
	permanent = TRUE;
	description = "Bengar ciê potrzebuje.";
};


func int dia_malak_backtobengar_condition()
{
	if((MIS_GETMALAKBACK == LOG_RUNNING) && Npc_KnowsInfo(other,dia_malak_fleefrompass) && (Npc_IsDead(bengar) == FALSE) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_backtobengar_info()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_00");	//Bengar ciê potrzebuje. Chce, abyœ wróci³ na jego farmê.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_01");	//Jeszcze nie zwariowa³em. Tam jest niebezpiecznie! Nigdzie siê st¹d nie ruszam.
	b_logentry(TOPIC_BENGARALLEIN,"Malak nie chce powróciæ na farmê Bengara, poniewa¿ nie ma ona ¿adnej ochrony.");
	if(MIS_BENGARSHELPINGSLD == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_02");	//Zatrudni³em najemnika, który bêdzie pilnowa³ farmy.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_03");	//To zupe³nie co innego. Ale zaraz, kto bêdzie go op³aca³?
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_04");	//To ju¿ mój problem.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_05");	//Chyba odebra³eœ mi wszystkie argumenty, prawda?
		Info_AddChoice(dia_malak_backtobengar,"Prawda.",dia_malak_backtobengar_los);
	};
};

func void dia_malak_backtobengar_los()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_los_15_00");	//Prawda.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_los_08_01");	//Dobrze. A zatem wrócê na farmê. Mam nadziejê, ¿e ten twój najemnik zna siê na rzeczy.
	MIS_GETMALAKBACK = LOG_SUCCESS;
	b_giveplayerxp(XP_MALAK_BACKTOBENGAR);
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(bau_962_bauer,"Start");
	b_startotherroutine(bau_964_bauer,"Start");
	b_startotherroutine(bau_965_bauer,"Start");
	b_startotherroutine(bau_966_bauer,"Start");
	b_startotherroutine(bau_967_bauer,"Start");
	b_startotherroutine(bau_968_bauer,"Start");
	b_startotherroutine(bau_969_bauer,"Start");
};


instance DIA_MALAK_BACK(C_INFO)
{
	npc = bau_963_malak;
	nr = 32;
	condition = dia_malak_back_condition;
	information = dia_malak_back_info;
	permanent = TRUE;
	description = "Czy teraz zamieszkasz na farmie Bengara?";
};


func int dia_malak_back_condition()
{
	if((MIS_GETMALAKBACK == LOG_SUCCESS) && (NPCOBSESSEDBYDMT_MALAK == FALSE) && (hero.guild != GIL_KDF) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_malak_back_info()
{
	AI_Output(other,self,"DIA_Malak_BACK_15_00");	//Czy teraz zamieszkasz na farmie Bengara?
	AI_Output(self,other,"DIA_Malak_BACK_08_01");	//Pewnie. Dodatkowa para r¹k na pewno siê tam przyda. Razem jakoœ damy sobie radê.
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP4_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap4_exit_condition;
	information = dia_malak_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_malak_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP5_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap5_exit_condition;
	information = dia_malak_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_malak_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_KAP6_EXIT(C_INFO)
{
	npc = bau_963_malak;
	nr = 999;
	condition = dia_malak_kap6_exit_condition;
	information = dia_malak_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_malak_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_malak_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_MALAK_PICKPOCKET(C_INFO)
{
	npc = bau_963_malak;
	nr = 900;
	condition = dia_malak_pickpocket_condition;
	information = dia_malak_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_malak_pickpocket_condition()
{
	return c_beklauen(43,40);
};

func void dia_malak_pickpocket_info()
{
	Info_ClearChoices(dia_malak_pickpocket);
	Info_AddChoice(dia_malak_pickpocket,DIALOG_BACK,dia_malak_pickpocket_back);
	Info_AddChoice(dia_malak_pickpocket,DIALOG_PICKPOCKET,dia_malak_pickpocket_doit);
};

func void dia_malak_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_malak_pickpocket);
};

func void dia_malak_pickpocket_back()
{
	Info_ClearChoices(dia_malak_pickpocket);
};

