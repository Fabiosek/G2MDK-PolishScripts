
instance DIA_DAR_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_exit_condition;
	information = dia_dar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_dar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_HALLO(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_hallo_condition;
	information = dia_dar_hallo_info;
	permanent = FALSE;
	description = "Co tam palisz?";
};


func int dia_dar_hallo_condition()
{
	return TRUE;
};

func void dia_dar_hallo_info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//Co tam palisz?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//Chcesz bucha?
	Info_ClearChoices(dia_dar_hallo);
	Info_AddChoice(dia_dar_hallo,"Nie.",dia_dar_hallo_nein);
	Info_AddChoice(dia_dar_hallo,"Jasne.",dia_dar_hallo_ja);
};

func void dia_dar_hallo_ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//Jasne.
	CreateInvItem(other,itmi_joint);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Niez³e, co?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Sk¹d masz towar?
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//Mam swoje Ÿród³a.
	Info_ClearChoices(dia_dar_hallo);
};

func void dia_dar_hallo_nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//Nie.
	Info_ClearChoices(dia_dar_hallo);
};


var int dar_einmal;

instance DIA_DAR_PERM(C_INFO)
{
	npc = sld_810_dar;
	nr = 2;
	condition = dia_dar_perm_condition;
	information = dia_dar_perm_info;
	permanent = TRUE;
	description = "Czy poza paleniem masz jeszcze jakieœ zajêcie?";
};


func int dia_dar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo))
	{
		return TRUE;
	};
};

func void dia_dar_perm_info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//Czy poza paleniem masz jeszcze jakieœ zajêcie?
	if((DAR_LOSTAGAINSTCIPHER == TRUE) && (DAR_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//Tak, czasami pozwalam siê pobiæ jakimœ pal¹cym ziele œmieciom...
		DAR_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//Nie w tej chwili.
	};
};


instance DIA_DAR_WANNAJOIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 3;
	condition = dia_dar_wannajoin_condition;
	information = dia_dar_wannajoin_info;
	permanent = FALSE;
	description = "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
};


func int dia_dar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo) && (other.guild == GIL_NONE) && (DAR_LOSTAGAINSTCIPHER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//A kogo to obchodzi...
};


instance DIA_DAR_DUDIEB(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_dudieb_condition;
	information = dia_dar_dudieb_info;
	permanent = FALSE;
	description = "Cipher powiedzia³ mi, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela.";
};


func int dia_dar_dudieb_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_dudieb_info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Cipher powiedzia³ mi, ¿e ktoœ mu ukrad³ paczkê bagiennego ziela.
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(œmiech)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Wiesz coœ mo¿e na ten temat?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//Nie.
	DAR_VERDACHT = TRUE;
};


instance DIA_DAR_WOPAKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_wopaket_condition;
	information = dia_dar_wopaket_info;
	permanent = TRUE;
	description = "Gdzie jest paczka?";
};


func int dia_dar_wopaket_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_wopaket_info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//Gdzie jest paczka?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Dobra, ju¿ dobra. Sprzeda³em to jakiemuœ obdartusowi w mieœcie.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//To by³o w porcie. Nie pamiêtam, jak wygl¹da³.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Czy¿byœ znowu domaga³ siê lania?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Powa¿nie cz³owieku, by³em kompletnie najarany. Nie mam zielonego pojêcia, jak wygl¹da³ ten goœæ.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Pamiêtam tylko tyle, ¿e by³o to w porcie niedaleko miejsca, gdzie buduj¹ ³odzie.
		DAR_DIEB = TRUE;
		b_logentry(TOPIC_CIPHERPAKET,"Dar przyzna³ siê do kradzie¿y paczki ziela. Sprzeda³ j¹ w dzielnicy portowej Khorinis, niedaleko stoczni.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//Ja tam nic nie wiem.
	};
};


instance DIA_DAR_AUFSMAUL(C_INFO)
{
	npc = sld_810_dar;
	nr = 5;
	condition = dia_dar_aufsmaul_condition;
	information = dia_dar_aufsmaul_info;
	permanent = FALSE;
	description = "Wyduszê to z ciebie!";
};


func int dia_dar_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_dar_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//Wyduszê to z ciebie!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Spokojnie. Jestem zbyt upalony, ¿eby z tob¹ walczyæ.
	b_giveinvitems(self,other,itmi_joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Najpierw weŸ sobie porz¹dnego macha.
};


instance DIA_DAR_KAMERADENSCHWEIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_kameradenschwein_condition;
	information = dia_dar_kameradenschwein_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dar_kameradenschwein_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = FALSE;
		return TRUE;
	};
};

func void dia_dar_kameradenschwein_info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Nie potrafisz trzymaæ jêzyka za zêbami? Powiedzia³eœ Cipherowi, ¿e ukrad³em jego ziele!
	if(Npc_KnowsInfo(other,dia_dar_wannajoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//Jasne, ju¿ idê oddaæ na ciebie g³os.
	};
};


instance DIA_DAR_PILZTABAK(C_INFO)
{
	npc = sld_810_dar;
	nr = 6;
	condition = dia_dar_pilztabak_condition;
	information = dia_dar_pilztabak_info;
	permanent = FALSE;
	description = "Czy kiedykolwiek próbowa³eœ grzybowego tytoniu?";
};


func int dia_dar_pilztabak_condition()
{
	if(Npc_HasItems(other,itmi_pilztabak) > 0)
	{
		return TRUE;
	};
};

func void dia_dar_pilztabak_info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//Czy kiedykolwiek próbowa³eœ grzybowego tytoniu?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//Brzmi interesuj¹co. Dawaj.
	b_giveinvitems(other,self,itmi_pilztabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//No dobrze, zaczynamy...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//Czy kiedykolwiek pali³eœ ten towar?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//Hm...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Tak czy nie?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//Jestem ostatnio trochê zajêty...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//O cholera!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Na œwiêtego Rhobara!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Ten towar jest za mocny! Lepiej go nawet nie próbuj!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_DAR_KAP3_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap3_exit_condition;
	information = dia_dar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_dar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP4_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap4_exit_condition;
	information = dia_dar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_dar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_ORCRING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_orcring_condition;
	information = dia_dar_orcring_info;
	description = "Zdaje siê, ¿e brakuje tu kilku najemników.";
};


func int dia_dar_orcring_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_dar_orcring_info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Zdaje siê, ¿e brakuje tu kilku najemników.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Jasne. To prawda. Sylvio jest ca³e mile st¹d i zabra³ ze sob¹ po³owê za³ogi.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//Kogo to obchodzi? Z Lee i jego ch³opakami mam szansê staæ siê naprawdê kimœ. Potrzebujê tylko kopa.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Gdybym zdo³a³ udowodniæ Lee, ¿e jestem naprawdê twardym facetem, mo¿e nawet mianowa³by mnie jednym ze swoich ochroniarzy.
	Info_ClearChoices(dia_dar_orcring);
	Info_AddChoice(dia_dar_orcring,"To mnie nie dotyczy.",dia_dar_orcring_no);
	Info_AddChoice(dia_dar_orcring,"Ty? Twardzielem?",dia_dar_orcring_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(dia_dar_orcring,"Jak mia³oby to niby wygl¹daæ?",dia_dar_orcring_wie);
	};
};

func void dia_dar_orcring_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Ty? Twardzielem?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//Zamknij siê. Kim ty w ogóle jesteœ?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//Pó³g³ówek z miasta. Gdyby ka¿dy by³ taki jak ty, to...
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//By³eœ tu tylko parê dni, a ju¿ wymiêkasz.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Kogo próbujesz przestraszyæ tymi magicznymi bredniami? Chyba nie mnie?
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//W³aœciwie, jak siê tak nad tym zastanowiæ, to roz³upanie twojej czaszki z pewnoœci¹ zapewni³oby mi szacunek wœród ch³opaków Lee.
		Info_ClearChoices(dia_dar_orcring);
		Info_AddChoice(dia_dar_orcring,"Nie mam czasu na te bzdury.",dia_dar_orcring_necken_no);
		Info_AddChoice(dia_dar_orcring,"Dobrze. Tylko spróbuj.",dia_dar_orcring_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Tylko poczekaj. Znajdê jakiœ sposób, ¿eby zrobiæ wra¿enie na Lee.
	};
};


var int dar_fightagainstpaladin;

func void dia_dar_orcring_necken_schlagen()
{
	DAR_FIGHTAGAINSTPALADIN = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Dobrze. Tylko spróbuj.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Och, nie mogê siê doczekaæ.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_dar_orcring_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//Nie mam czasu na te bzdury.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//No tak. Rycerz sprawiedliwoœci w lœni¹cej zbroi, zapomnia³em. Szkoda, myœla³em, ¿e staæ ciê na coœ wiêcej.
	AI_StopProcessInfos(self);
};

func void dia_dar_orcring_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Jak mia³oby to niby wygl¹daæ?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Tak do koñca to nie wiem. Jakieœ orkowe trofeum nie by³oby najgorsze...
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//Jakieœ insygnia orkowych przywódców albo coœ w tym stylu. Sztandar, naramiennik, pierœcieñ, no wiesz, o co mi chodzi.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//To chyba oczywiste, ¿e nic poœledniejszego nie wchodzi w rachubê.
	Log_CreateTopic(TOPIC_DAR_BRINGORCELITERING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAR_BRINGORCELITERING,LOG_RUNNING);
	b_logentry(TOPIC_DAR_BRINGORCELITERING,"Dar chce zyskaæ szacunek najemników. Dlatego potrzebuje jakiegoœ orkowego trofeum - sztandaru, naramiennika, pierœcienia...");
	MIS_DAR_BRINGORCELITERING = LOG_RUNNING;
	Info_ClearChoices(dia_dar_orcring);
};

func void dia_dar_orcring_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//To mnie nie dotyczy.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//Oczywiœcie. By³bym naprawdê zdumiony.
	Info_ClearChoices(dia_dar_orcring);
};


instance DIA_DAR_FIGHTAGAINSTPALOVER(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_fightagainstpalover_condition;
	information = dia_dar_fightagainstpalover_info;
	important = TRUE;
};


func int dia_dar_fightagainstpalover_condition()
{
	if((DAR_FIGHTAGAINSTPALADIN == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_dar_fightagainstpalover_info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//No có¿, chyba nie zyskam uznania Lee, ponownie wdaj¹c siê z tob¹ w walkê.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Nie potrzebujê wrogów. Wiêc mo¿e po prostu zapomnijmy o tych bzdurach, co ty na to?
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_DAR_BRINGORCELITERING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_bringorcelitering_condition;
	information = dia_dar_bringorcelitering_info;
	description = "Mam tutaj orkowe trofeum, na którym ci zale¿a³o.";
};


func int dia_dar_bringorcelitering_condition()
{
	if((MIS_DAR_BRINGORCELITERING == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};

func void dia_dar_bringorcelitering_info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//Mam tutaj orkowe trofeum, na którym ci zale¿a³o.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Co mi przynios³eœ?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Pierœcieñ orkowego herszta.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//Có¿, w takim wypadku... Co za to chcesz?
	MIS_DAR_BRINGORCELITERING = LOG_SUCCESS;
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Co mo¿esz mi zaoferowaæ?",dia_dar_bringorcelitering_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_dar_bringorcelitering,"Daj mi z³oto.",dia_dar_bringorcelitering_geld);
	};
};

func void dia_dar_bringorcelitering_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Daj mi z³oto.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//Hm. 600 z³otych monet?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//O co chodzi?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//Dobrze. Dam ci za niego 1200 z³otych monet.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//WeŸ pieni¹dze albo zatrzymaj sobie pierœcieñ.
	};
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"To za ma³o.",dia_dar_bringorcelitering_geld_no);
	Info_AddChoice(dia_dar_bringorcelitering,"Umowa stoi.",dia_dar_bringorcelitering_geld_ok);
};

func void dia_dar_bringorcelitering_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Umowa stoi. Oto pierœcieñ.
	b_giveinvitems(other,self,itri_orcelitering,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//Dziêki. Ju¿ siê nie mogê doczekaæ, co powiedz¹ na to inni.
	CreateInvItems(self,itmi_gold,1200);
	b_giveinvitems(self,other,itmi_gold,1200);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//To za ma³o.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//A ja uwa¿am, ¿e to za du¿o. Bez obrazy, ale jak dla mnie to jakiœ podejrzany interes.
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Co mo¿esz mi zaoferowaæ?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Mo¿esz przyj¹æ pieni¹dze albo ten amulet, który... hm, powiedzmy, ¿e wpad³ mi w rêce jakiœ czas temu.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Podnosi zrêcznoœæ. Wypróbowa³em go ju¿ parê razy.
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Daj mi z³oto.",dia_dar_bringorcelitering_geld);
	Info_AddChoice(dia_dar_bringorcelitering,"Daj mi amulet.",dia_dar_bringorcelitering_was_am);
};

func void dia_dar_bringorcelitering_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Daj mi amulet.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Jasne. Mi³ej zabawy. A teraz poproszê pierœcieñ.
	b_giveinvitems(other,self,itri_orcelitering,1);
	CreateInvItems(self,itam_dex_01,1);
	b_giveinvitems(self,other,itam_dex_01,1);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//Interesy z tob¹ to sama przyjemnoœæ.
	Info_ClearChoices(dia_dar_bringorcelitering);
};


instance DIA_DAR_KAP5_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap5_exit_condition;
	information = dia_dar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_dar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP6_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap6_exit_condition;
	information = dia_dar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_dar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_PICKPOCKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 900;
	condition = dia_dar_pickpocket_condition;
	information = dia_dar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_dar_pickpocket_condition()
{
	return c_beklauen(67,35);
};

func void dia_dar_pickpocket_info()
{
	Info_ClearChoices(dia_dar_pickpocket);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_BACK,dia_dar_pickpocket_back);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_PICKPOCKET,dia_dar_pickpocket_doit);
};

func void dia_dar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dar_pickpocket);
};

func void dia_dar_pickpocket_back()
{
	Info_ClearChoices(dia_dar_pickpocket);
};

