
instance DIA_BUSTER_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_exit_condition;
	information = dia_buster_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_buster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_HELLO(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_hello_condition;
	information = dia_buster_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_hello_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_hello_info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//Co my tu mamy? Czy ja ci� nie znam?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Skoro tak m�wisz. Id� si� zobaczy� z w�a�cicielem tej ziemi.",dia_buster_hello_goingtofarm);
	Info_AddChoice(dia_buster_hello,"A kto pyta?",dia_buster_hello_whoareyou);
};

func void dia_buster_hello_whoareyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//A kto pyta?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//Jestem Buster, jeden z najemnik�w Lee!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//I LEPIEJ zachowuj si� grzeczniej, bo inaczej zbierzesz ci�gi!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//Dobra, czego tu szukasz?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Nie tw�j interes.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Znam Lee!",dia_buster_hello_iknowlee);
	Info_AddChoice(dia_buster_hello,"Jestem tylko podr�nikiem w drodze do posiadacza ziemskiego.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_iknowlee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//Znam Lee!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//Wszyscy znaj� Lee. To nic nie znaczy, kole�. Teraz rozmawiasz ze MN�!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//Dok�d zmierzasz?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Nie tw�j interes.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"Jestem tylko podr�nikiem w drodze do posiadacza ziemskiego.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//Nie tw�j interes.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//Nikt tak do mnie nie m�wi, robaku! My�l�, �e czas porachowa� ci gnaty.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_goingtofarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//Skoro tak m�wisz. Id� si� zobaczy� z w�a�cicielem tej ziemi.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//W rzeczy samej... Hmmm - nie wygl�dasz na niebezpiecznego.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Chcesz si� przekona�?",dia_buster_hello_wannatestit);
	Info_AddChoice(dia_buster_hello,"Zdarzy�o mi si� zabi� besti� czy dwie.",dia_buster_hello_slewbeasts);
	Info_AddChoice(dia_buster_hello,"Tu masz racj�.",dia_buster_hello_imnodanger);
};

func void dia_buster_hello_imnodanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//Tu masz racj�.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//Taa kole�, po latach uczysz si� wy�apywa� takie rzeczy.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//Tutaj cz�sto walczymy z orkami. Albo ze stra�nikami z miasta. Strasznie uparte z nich gnojki.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Masz na my�li PRAWDZIWYCH ork�w? Tych wielkolud�w?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"No i?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Imponuj�ce.",dia_buster_hello_impressive);
};

func void dia_buster_hello_slewbeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//Zdarzy�o mi si� zabi� besti� czy dwie.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//Ha! Pewnie uda�o ci si� rozsmarowa� par� �uk�w na polu i przegoni� z nor kilka szczur�w.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//Mamy tu do czynienia z orkami! No i jeszcze z tymi szumowinami - stra�nikami miejskimi.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Masz na my�li PRAWDZIWYCH ork�w? Tych wielkolud�w?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"No i?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Imponuj�ce.",dia_buster_hello_impressive);
};

func void dia_buster_hello_wannatestit()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//Chcesz si� przekona�?
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//Ojej! Wybra�em sobie nie tego go�cia, co?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//Mo�na tak powiedzie�.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//No to chod�, poka� mi, co umiesz.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//Imponuj�ce.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//To nasza bran�a, ma�y! Robimy nawet bro� i pancerze!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//Codziennie zmagamy si� ze �mierci�. Ale taki wiejski kmiot jak ty nie mo�e o tym wiedzie�.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Chyba b�d� musia� ci pokaza�, co o tym wiem!",dia_buster_hello_letmeshowyou);
	Info_AddChoice(dia_buster_hello,"Jak chcesz.",dia_buster_hello_ifyousayso);
};

func void dia_buster_hello_ifyousayso()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//Jak chcesz.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//Ruszaj si�, mi�czaku!
	AI_StopProcessInfos(self);
};

func void dia_buster_hello_letmeshowyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//Chyba b�d� musia� ci pokaza�, co o tym wiem!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//Przeprowadzasz wi�c jednoosobowe powstanie ch�opskie?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//Dobrze wi�c, poka�, co masz.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_sowhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//Wi�c?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//Jak gdyby� wiedzia� o czym m�wi�. Wydaje ci si�, �e jeste� nadludzko silny, co?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//Mo�e pora, �eby kto� da� ci lekcj�!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"W ka�dej chwili.",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Tylko �artowa�em....",dia_buster_hello_justjoking);
};

func void dia_buster_hello_realorcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//Masz na my�li PRAWDZIWYCH ork�w? Tych wielkolud�w?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//Jedn� chwilk�! Stroisz sobie ze mnie �arty?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//Ale� sk�d.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//Ty robaku! Naprawd� si� o to prosisz, co?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//No to chod� i poka� mi, co umiesz, bohaterze.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"W ka�dej chwili.",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Tylko �artowa�em....",dia_buster_hello_justjoking);
};

func void dia_buster_hello_whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//W ka�dej chwili.
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//No to podejd� bli�ej, kole�!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_justjoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//Tylko �artowa�em....
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//Taak, racja. Uspok�j si� troch�! Zejd� mi z oczu.
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_FIGHTNONE(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_fightnone_condition;
	information = dia_buster_fightnone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_fightnone_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_hello) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_buster_fightnone_info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//Czego chcesz, mi�czaku?
};


instance DIA_BUSTER_DUELL(C_INFO)
{
	npc = sld_802_buster;
	nr = 3;
	condition = dia_buster_duell_condition;
	information = dia_buster_duell_info;
	permanent = TRUE;
	description = "Wyzywam ci� na pojedynek.";
};


func int dia_buster_duell_condition()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void dia_buster_duell_info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//Wyzywam ci� na pojedynek.
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//Ha! Chyba nie my�lisz, �e to b�dzie �atwe, co? Dobra, chod� tu!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//Chcesz spr�bowa� jeszcze raz? No dobra - chod� tu niezno�ny g�wniarzu!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//Tylko znowu nie uciekaj!
		};
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BUSTER_WANNAJOIN(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_wannajoin_condition;
	information = dia_buster_wannajoin_info;
	permanent = TRUE;
	description = "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
};


func int dia_buster_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && (BUSTER_DUELL == FALSE))
	{
		return TRUE;
	};
};

func void dia_buster_wannajoin_info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//Chc� do��czy� do najemnik�w!
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//Ka�dy, kto potrafi przywali� tak mocno jak ty, nie powinien mie� tutaj wi�kszych k�opot�w.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//Nie jeste� mo�e najlepszym z wojownik�w, ale trudno nazwa� ci� tch�rzem.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//M�j g�os nie ma wielkiego znaczenia, bo jestem tu od niedawna, ale kiedy Lee mnie zapyta, b�d� g�osowa� na ciebie.
		BUSTER_DUELL = TRUE;
		Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
		b_logentry(TOPIC_SLDRESPEKT,"Od kiedy pokona�em Bustera, nie ma nic przeciwko mojemu przy��czeniu si� do najemnik�w.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//Ty? Nie przypominam sobie, �eby kiedykolwiek przyj�li do najemnik�w jakiego� tch�rza...
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//Ucieczka z pojedynku - w taki spos�b daleko tu nie zajdziesz!
		};
	};
};


var int buster_sentenzatip;

instance DIA_BUSTER_OTHERSLD(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_othersld_condition;
	information = dia_buster_othersld_info;
	permanent = FALSE;
	description = "Chc� si� dowiedzie� czego� wi�cej o najemnikach i okolicznych terenach.";
};


func int dia_buster_othersld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_buster_othersld_info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//Chc� si� dowiedzie� czego� wi�cej o najemnikach i okolicznych terenach.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//Niewiele mog� ci powiedzie� o tej okolicy. Lepiej popytaj wie�niak�w.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//A je�li chodzi o nas, najemnik�w - mamy bardzo prost� zasad�: je�eli potrafisz dotrzyma� pola, jeste� z nami.
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//Wydaje mi si�, �e nadajesz si� na jednego z nas.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//Nie my�l se jednak, �e w naszej ostatniej walce brak�o ci szcz�cia.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//Na farmie jest mn�stwo ch�opak�w, kt�rzy s� lepsi ode mnie...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//Na przyk�ad Sentenza. Pilnuje wej�cia na farm�. Nie zaczynaj z nim walki.
		BUSTER_SENTENZATIP = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//Ale po co m�wi� to TOBIE, mi�czaku!
		AI_StopProcessInfos(self);
	};
};


var int buster_goldzumbrennen;
var int buster_bonus;

instance DIA_BUSTER_ABOUTSENTENZA(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_aboutsentenza_condition;
	information = dia_buster_aboutsentenza_info;
	permanent = FALSE;
	description = "A co z tym Sentenz�?";
};


func int dia_buster_aboutsentenza_condition()
{
	if(BUSTER_SENTENZATIP == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_aboutsentenza_info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//A co z tym Sentenz�?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//Kiedy przyjdziesz na farm�, b�dzie chcia� wyci�gn�� od ciebie troch� z�ota - robi tak z wszystkimi nowymi.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//Na twoim miejscu bym zap�aci�. Ja tak zrobi�em, a potem on na mnie g�osowa�.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//Powiedzia�, �e przys�uga za przys�ug�. Straci�em ca�e moje z�oto, ale nie by�o tego za wiele. A ostatecznie by�em z tego zadowolony.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//Widzia�em kiedy�, jak pobi� kolesia, kt�ry postanowi� mu NIE p�aci�.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//Dzi�ki za wskaz�wk�.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//W rzeczy samej. Ma dla ciebie jak�� warto��?
	Info_ClearChoices(dia_buster_aboutsentenza);
	Info_AddChoice(dia_buster_aboutsentenza,"Nie.",dia_buster_aboutsentenza_no);
	Info_AddChoice(dia_buster_aboutsentenza,"Prosz� � 5 sztuk z�ota.",dia_buster_aboutsentenza_give);
};

func void dia_buster_aboutsentenza_give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//Trzymaj - 5 sztuk z�ota.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//Dzi�ki. Koniec ko�c�w wygl�da na to, �e jednak mog� dzisiaj wieczorem co� �ykn��. Nie zapomn� ci tego.
	BUSTER_GOLDZUMBRENNEN = TRUE;
	BUSTER_BONUS = 50;
	Info_ClearChoices(dia_buster_aboutsentenza);
};

func void dia_buster_aboutsentenza_no()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//Nie.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//Tak w�a�nie my�la�em.
	Info_ClearChoices(dia_buster_aboutsentenza);
};


instance DIA_BUSTER_LEELEADER(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_leeleader_condition;
	information = dia_buster_leeleader_info;
	permanent = FALSE;
	description = "Lee jest dow�dc� najemnik�w, tak?";
};


func int dia_buster_leeleader_condition()
{
	if(BUSTER_DUELL == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_leeleader_info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//Lee jest dow�dc� najemnik�w, tak?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//Dobra - hej, przypominam sobie, sk�d ci� znam! Te� by�e� w Kolonii.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//Tak, by�em.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//Nie widzia�em ci�, gdy to si� wszystko sta�o. Przedtem zreszt� te�.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//Mia�em inne k�opoty.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//Sporo ci� omin�o - od czasu jak siedzieli�my razem w Kolonii.
};


instance DIA_BUSTER_WHATHAPPENED(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_whathappened_condition;
	information = dia_buster_whathappened_info;
	permanent = FALSE;
	description = "Co si� sta�o z najemnikami z Kolonii?";
};


func int dia_buster_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_leeleader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_whathappened_info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//Co si� sta�o z najemnikami z Kolonii?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//Kiedy Bariera pad�a, Lee wyprowadzi� nas z Kolonii. Powiedzia�, �e je�li b�dziemy si� trzyma� razem, nic nam si� nie stanie. Mia� racj�.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//Kr�tko potem znale�li�my sobie tutaj przytulne miejsce. W�a�ciciel tej ziemi p�aci nam za pranie ch�opak�w ze stra�y miejskiej.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//A wi�kszo�� z nas i tak robi�aby to za darmo.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//Onar karmi nas wszystkich i mo�emy czeka� na dobr� okazj�, �eby wyjecha� z tej przekl�tej wyspy.
};


instance DIA_BUSTER_TEACH(C_INFO)
{
	npc = sld_802_buster;
	nr = 8;
	condition = dia_buster_teach_condition;
	information = dia_buster_teach_info;
	permanent = TRUE;
	description = "Mo�esz mnie nauczy� lepiej walczy�?";
};


func int dia_buster_teach_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 60)
	{
		return TRUE;
	};
};

func void dia_buster_teach_info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//Mo�esz mnie nauczy� lepiej walczy�?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//Mo�e b�d� m�g� da� ci wskaz�wk� czy dwie...
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//Nie jeste� tak t�py na jakiego wygl�dasz. Dobrze, powiem ci, co wiem. Wtedy mo�e b�dziesz mia� ze mn� jakie� szanse...
	};
	if(BUSTERLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Buster mo�e mnie nauczy� walki or�em jednor�cznym.");
		BUSTERLOG = TRUE;
	};
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_back()
{
	Info_ClearChoices(dia_buster_teach);
};

func void dia_buster_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};


instance DIA_BUSTER_KAP3_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap3_exit_condition;
	information = dia_buster_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_buster_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_SHADOWBEASTS(C_INFO)
{
	npc = sld_802_buster;
	nr = 30;
	condition = dia_buster_shadowbeasts_condition;
	information = dia_buster_shadowbeasts_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_shadowbeasts_condition()
{
	if(((KAPITEL == 3) || (KAPITEL == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void b_dia_buster_shadowbeasts_ok()
{
	AI_StopProcessInfos(self);
};

func void dia_buster_shadowbeasts_info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//Hej ty, kole�!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//Przez ostatnie kilka dni my�la�em, jak mogliby�my szybko zarobi� w tej norze troch� kasy.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//No i?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//Wydaje mi si�, �e wpad�em na pomys�, jak si� szybko wzbogaci�.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//Jest taki kupiec w mie�cie, kt�ry zap�aci kup� kasy za pewn� rzecz.
	Info_ClearChoices(dia_buster_shadowbeasts);
	Info_AddChoice(dia_buster_shadowbeasts,"Kim jest ten kupiec, o kt�rym m�wisz?",dia_buster_shadowbeasts_wer);
	Info_AddChoice(dia_buster_shadowbeasts,"O co chodzi?",dia_buster_shadowbeasts_was);
	Info_AddChoice(dia_buster_shadowbeasts,"Dlaczego mi to m�wisz?",dia_buster_shadowbeasts_ich);
};

func void dia_buster_shadowbeasts_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//Dlaczego mi to m�wisz?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//Sam nie mog� tego zrobi�. Musz� tu siedzie� i pilnowa� tych g�upich owiec.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//Chodzi ci o farmer�w?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//To w�a�nie mam na my�li.
};

func void dia_buster_shadowbeasts_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//O co chodzi?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//�w kupiec twierdzi, �e potrafi z du�ym zyskiem sprzeda� rogi cieniostwor�w.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//Kto� musia�by uda� si� do lasu i zapolowa� na te bestie. To w�a�nie twoje zadanie.
	Info_AddChoice(dia_buster_shadowbeasts,"Ile mo�na na tym zarobi�?",dia_buster_shadowbeasts_was_wieviel);
};

func void dia_buster_shadowbeasts_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//Ile mo�na na tym zarobi�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//Kupa kasy, powiadam ci. Wystarczy dla nas dw�ch.
	if(BUSTER_GOLDZUMBRENNEN == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//A skoro odda�e� mi wtedy ca�e z�oto, za�atwi� ci specjaln� cen�.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//Brzmi nie�le! Dam ci zna�, jak tylko zdo�am zebra� troch� rog�w.
	MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_RUNNING);
	b_logentry(TOPIC_BUSTER_KILLSHADOWBEASTS,"Buster zap�aci mi za ka�dy r�g cieniostwora, kt�ry mu przynios�.");
	Info_ClearChoices(dia_buster_shadowbeasts);
};

func void dia_buster_shadowbeasts_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//Kim jest ten kupiec, o kt�rym m�wisz?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//Nie mog�, ch�opie. Musia�bym by� naprawd� g�upi, �eby powiedzie� ci o moim �r�dle. Chcesz mnie wykiwa�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//Zrobisz interes ze MN� albo w og�le, capisce?
};


instance DIA_BUSTER_BRINGTROPHYSHADOWBEAST(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_bringtrophyshadowbeast_condition;
	information = dia_buster_bringtrophyshadowbeast_info;
	permanent = TRUE;
	description = "Co do tych rog�w cieniostwor�w...";
};


func int dia_buster_bringtrophyshadowbeast_condition()
{
	if((MIS_BUSTER_KILLSHADOWBEASTS_DJG == LOG_RUNNING) && (Npc_HasItems(other,itat_shadowhorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int bustertrophyshadowbeastcounter;

func void dia_buster_bringtrophyshadowbeast_info()
{
	var int bustertrophyshadowbeastcount;
	var int xp_bringbustertrophyshadowbeast;
	var int xp_bringbustertrophyshadowbeasts;
	var int bustersbustertrophyshadowbeastoffer;
	var int bustertrophyshadowbeastgeld;
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//M�j kupiec wyjecha� z miasta.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//Co to ma znaczy�?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//Nie �yje. Mo�esz zatrzyma� rogi. Nie wiem, co z nimi teraz zrobi�.
		MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//Jak wypatroszy� cieniostwora?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//Nie wiesz? Oj ch�opie, spodziewa�em si� po tobie wi�cej.
		Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,"Jeszcze do tego wr�cimy.",dia_buster_bringtrophyshadowbeast_back);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,b_buildlearnstring("Naucz mnie.",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_buster_bringtrophyshadowbeast_teach);
	}
	else
	{
		bustertrophyshadowbeastcount = Npc_HasItems(other,itat_shadowhorn);
		xp_bringbustertrophyshadowbeast = shadowbeast.level * XP_PER_VICTORY;
		bustersbustertrophyshadowbeastoffer = VALUE_SHADOWHORN + BUSTER_BONUS;
		if(bustertrophyshadowbeastcount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//Mam dla ciebie r�g cieniostwora.
			b_giveplayerxp(xp_bringbustertrophyshadowbeast);
			b_giveinvitems(other,self,itat_shadowhorn,1);
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//Mam wi�cej rog�w cieniostwor�w dla twojego kupca.
			b_giveinvitems(other,self,itat_shadowhorn,bustertrophyshadowbeastcount);
			xp_bringbustertrophyshadowbeasts = bustertrophyshadowbeastcount * xp_bringbustertrophyshadowbeast;
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + bustertrophyshadowbeastcount;
			b_giveplayerxp(xp_bringbustertrophyshadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//�wietnie. Daj je tutaj. I przynie� wi�cej. Kto wie, jak d�ugo jeszcze ten kupiec b�dzie chcia� te rzeczy.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Oto twoja dzia�ka.
		bustertrophyshadowbeastgeld = bustertrophyshadowbeastcount * bustersbustertrophyshadowbeastoffer;
		CreateInvItems(self,itmi_gold,bustertrophyshadowbeastgeld);
		b_giveinvitems(self,other,itmi_gold,bustertrophyshadowbeastgeld);
	};
};

func void dia_buster_bringtrophyshadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//Naucz mnie.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//No to s�uchaj. Zabijasz cieniostwora, a potem �apiesz praw� r�k� za r�g, najmocniej jak potrafisz.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//Potem wbijasz n� w jego czo�o i wycinasz bruzd� w ciele dooko�a rogu.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//Potem u�ywasz no�a jak d�wigni, �eby wyrwa� r�g z czaszki i ju� jest tw�j.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//No, a potem musisz go przynie�� do mnie. Nie powiniene� mie� z tym problem�w.
	};
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};

func void dia_buster_bringtrophyshadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//Jeszcze do tego wr�cimy.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//Mam nadziej�.
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};


instance DIA_BUSTER_KAP4_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap4_exit_condition;
	information = dia_buster_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_buster_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PERM4(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_perm4_condition;
	information = dia_buster_perm4_info;
	permanent = TRUE;
	description = "Co my�lisz o tym ca�ym polowaniu na smoki?";
};


func int dia_buster_perm4_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_buster_perm4_info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//Co my�lisz o tym ca�ym polowaniu na smoki?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//Ch�opaki mog� z tego wyj�� objuczeni z�otem - je�li nie odwal� wcze�niej kity.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//Ja tam wol� si� trzyma� z Lee.
};


instance DIA_BUSTER_KAP5_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap5_exit_condition;
	information = dia_buster_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_buster_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_KAP6_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap6_exit_condition;
	information = dia_buster_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_buster_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PICKPOCKET(C_INFO)
{
	npc = sld_802_buster;
	nr = 900;
	condition = dia_buster_pickpocket_condition;
	information = dia_buster_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_buster_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_buster_pickpocket_info()
{
	Info_ClearChoices(dia_buster_pickpocket);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_BACK,dia_buster_pickpocket_back);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_PICKPOCKET,dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back()
{
	Info_ClearChoices(dia_buster_pickpocket);
};

