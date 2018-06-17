
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
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Niez�e, co?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Sk�d masz towar?
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//Mam swoje �r�d�a.
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
	description = "Czy poza paleniem masz jeszcze jakie� zaj�cie?";
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
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//Czy poza paleniem masz jeszcze jakie� zaj�cie?
	if((DAR_LOSTAGAINSTCIPHER == TRUE) && (DAR_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//Tak, czasami pozwalam si� pobi� jakim� pal�cym ziele �mieciom...
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
	description = "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
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
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//A kogo to obchodzi...
};


instance DIA_DAR_DUDIEB(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_dudieb_condition;
	information = dia_dar_dudieb_info;
	permanent = FALSE;
	description = "Cipher powiedzia� mi, �e kto� mu ukrad� paczk� bagiennego ziela.";
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
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Cipher powiedzia� mi, �e kto� mu ukrad� paczk� bagiennego ziela.
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(�miech)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Wiesz co� mo�e na ten temat?
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
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Dobra, ju� dobra. Sprzeda�em to jakiemu� obdartusowi w mie�cie.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//To by�o w porcie. Nie pami�tam, jak wygl�da�.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Czy�by� znowu domaga� si� lania?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Powa�nie cz�owieku, by�em kompletnie najarany. Nie mam zielonego poj�cia, jak wygl�da� ten go��.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Pami�tam tylko tyle, �e by�o to w porcie niedaleko miejsca, gdzie buduj� �odzie.
		DAR_DIEB = TRUE;
		b_logentry(TOPIC_CIPHERPAKET,"Dar przyzna� si� do kradzie�y paczki ziela. Sprzeda� j� w dzielnicy portowej Khorinis, niedaleko stoczni.");
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
	description = "Wydusz� to z ciebie!";
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
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//Wydusz� to z ciebie!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Spokojnie. Jestem zbyt upalony, �eby z tob� walczy�.
	b_giveinvitems(self,other,itmi_joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Najpierw we� sobie porz�dnego macha.
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
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Nie potrafisz trzyma� j�zyka za z�bami? Powiedzia�e� Cipherowi, �e ukrad�em jego ziele!
	if(Npc_KnowsInfo(other,dia_dar_wannajoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//Jasne, ju� id� odda� na ciebie g�os.
	};
};


instance DIA_DAR_PILZTABAK(C_INFO)
{
	npc = sld_810_dar;
	nr = 6;
	condition = dia_dar_pilztabak_condition;
	information = dia_dar_pilztabak_info;
	permanent = FALSE;
	description = "Czy kiedykolwiek pr�bowa�e� grzybowego tytoniu?";
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
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//Czy kiedykolwiek pr�bowa�e� grzybowego tytoniu?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//Brzmi interesuj�co. Dawaj.
	b_giveinvitems(other,self,itmi_pilztabak,1);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//No dobrze, zaczynamy...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//Czy kiedykolwiek pali�e� ten towar?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//Hm...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Tak czy nie?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//Jestem ostatnio troch� zaj�ty...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//O cholera!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Na �wi�tego Rhobara!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Ten towar jest za mocny! Lepiej go nawet nie pr�buj!
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
	description = "Zdaje si�, �e brakuje tu kilku najemnik�w.";
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
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Zdaje si�, �e brakuje tu kilku najemnik�w.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Jasne. To prawda. Sylvio jest ca�e mile st�d i zabra� ze sob� po�ow� za�ogi.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//Kogo to obchodzi? Z Lee i jego ch�opakami mam szans� sta� si� naprawd� kim�. Potrzebuj� tylko kopa.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Gdybym zdo�a� udowodni� Lee, �e jestem naprawd� twardym facetem, mo�e nawet mianowa�by mnie jednym ze swoich ochroniarzy.
	Info_ClearChoices(dia_dar_orcring);
	Info_AddChoice(dia_dar_orcring,"To mnie nie dotyczy.",dia_dar_orcring_no);
	Info_AddChoice(dia_dar_orcring,"Ty? Twardzielem?",dia_dar_orcring_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(dia_dar_orcring,"Jak mia�oby to niby wygl�da�?",dia_dar_orcring_wie);
	};
};

func void dia_dar_orcring_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Ty? Twardzielem?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//Zamknij si�. Kim ty w og�le jeste�?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//P�g��wek z miasta. Gdyby ka�dy by� taki jak ty, to...
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//By�e� tu tylko par� dni, a ju� wymi�kasz.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Kogo pr�bujesz przestraszy� tymi magicznymi bredniami? Chyba nie mnie?
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//W�a�ciwie, jak si� tak nad tym zastanowi�, to roz�upanie twojej czaszki z pewno�ci� zapewni�oby mi szacunek w�r�d ch�opak�w Lee.
		Info_ClearChoices(dia_dar_orcring);
		Info_AddChoice(dia_dar_orcring,"Nie mam czasu na te bzdury.",dia_dar_orcring_necken_no);
		Info_AddChoice(dia_dar_orcring,"Dobrze. Tylko spr�buj.",dia_dar_orcring_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Tylko poczekaj. Znajd� jaki� spos�b, �eby zrobi� wra�enie na Lee.
	};
};


var int dar_fightagainstpaladin;

func void dia_dar_orcring_necken_schlagen()
{
	DAR_FIGHTAGAINSTPALADIN = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Dobrze. Tylko spr�buj.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Och, nie mog� si� doczeka�.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_dar_orcring_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//Nie mam czasu na te bzdury.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//No tak. Rycerz sprawiedliwo�ci w l�ni�cej zbroi, zapomnia�em. Szkoda, my�la�em, �e sta� ci� na co� wi�cej.
	AI_StopProcessInfos(self);
};

func void dia_dar_orcring_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Jak mia�oby to niby wygl�da�?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Tak do ko�ca to nie wiem. Jakie� orkowe trofeum nie by�oby najgorsze...
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//Jakie� insygnia orkowych przyw�dc�w albo co� w tym stylu. Sztandar, naramiennik, pier�cie�, no wiesz, o co mi chodzi.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//To chyba oczywiste, �e nic po�ledniejszego nie wchodzi w rachub�.
	Log_CreateTopic(TOPIC_DAR_BRINGORCELITERING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAR_BRINGORCELITERING,LOG_RUNNING);
	b_logentry(TOPIC_DAR_BRINGORCELITERING,"Dar chce zyska� szacunek najemnik�w. Dlatego potrzebuje jakiego� orkowego trofeum - sztandaru, naramiennika, pier�cienia...");
	MIS_DAR_BRINGORCELITERING = LOG_RUNNING;
	Info_ClearChoices(dia_dar_orcring);
};

func void dia_dar_orcring_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//To mnie nie dotyczy.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//Oczywi�cie. By�bym naprawd� zdumiony.
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
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//No c�, chyba nie zyskam uznania Lee, ponownie wdaj�c si� z tob� w walk�.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Nie potrzebuj� wrog�w. Wi�c mo�e po prostu zapomnijmy o tych bzdurach, co ty na to?
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_DAR_BRINGORCELITERING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_bringorcelitering_condition;
	information = dia_dar_bringorcelitering_info;
	description = "Mam tutaj orkowe trofeum, na kt�rym ci zale�a�o.";
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
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//Mam tutaj orkowe trofeum, na kt�rym ci zale�a�o.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Co mi przynios�e�?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Pier�cie� orkowego herszta.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//C�, w takim wypadku... Co za to chcesz?
	MIS_DAR_BRINGORCELITERING = LOG_SUCCESS;
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Co mo�esz mi zaoferowa�?",dia_dar_bringorcelitering_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_dar_bringorcelitering,"Daj mi z�oto.",dia_dar_bringorcelitering_geld);
	};
};

func void dia_dar_bringorcelitering_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Daj mi z�oto.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//Hm. 600 z�otych monet?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//O co chodzi?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//Dobrze. Dam ci za niego 1200 z�otych monet.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//We� pieni�dze albo zatrzymaj sobie pier�cie�.
	};
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"To za ma�o.",dia_dar_bringorcelitering_geld_no);
	Info_AddChoice(dia_dar_bringorcelitering,"Umowa stoi.",dia_dar_bringorcelitering_geld_ok);
};

func void dia_dar_bringorcelitering_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Umowa stoi. Oto pier�cie�.
	b_giveinvitems(other,self,itri_orcelitering,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//Dzi�ki. Ju� si� nie mog� doczeka�, co powiedz� na to inni.
	CreateInvItems(self,itmi_gold,1200);
	b_giveinvitems(self,other,itmi_gold,1200);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//To za ma�o.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//A ja uwa�am, �e to za du�o. Bez obrazy, ale jak dla mnie to jaki� podejrzany interes.
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Co mo�esz mi zaoferowa�?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Mo�esz przyj�� pieni�dze albo ten amulet, kt�ry... hm, powiedzmy, �e wpad� mi w r�ce jaki� czas temu.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Podnosi zr�czno��. Wypr�bowa�em go ju� par� razy.
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Daj mi z�oto.",dia_dar_bringorcelitering_geld);
	Info_AddChoice(dia_dar_bringorcelitering,"Daj mi amulet.",dia_dar_bringorcelitering_was_am);
};

func void dia_dar_bringorcelitering_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Daj mi amulet.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Jasne. Mi�ej zabawy. A teraz poprosz� pier�cie�.
	b_giveinvitems(other,self,itri_orcelitering,1);
	CreateInvItems(self,itam_dex_01,1);
	b_giveinvitems(self,other,itam_dex_01,1);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//Interesy z tob� to sama przyjemno��.
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

