
instance DIA_LEE_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_exit_condition;
	information = dia_lee_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lee_teleport;

func void b_lee_teleport()
{
	AI_Output(self,other,"DIA_Lee_Add_04_05");	//Aaa... Dobrze, �e jeste�.
	AI_Output(other,self,"DIA_Lee_Add_15_06");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Lee_Add_04_07");	//Zobacz, co znalaz�em w starej kaplicy.
	b_giveinvitems(self,other,itru_teleportfarm,1);
	AI_Output(self,other,"DIA_Lee_Add_04_08");	//To magiczna runa. Je�li si� nie myl�, przeniesie ci� z powrotem na t� farm�.
	AI_Output(self,other,"DIA_Lee_Add_04_09");	//Pomy�la�em, �e mo�e ci si� przyda�.
	LEE_TELEPORT = TRUE;
};


var int lee_lastpetzcounter;
var int lee_lastpetzcrime;

instance DIA_LEE_PMSCHULDEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_pmschulden_condition;
	information = dia_lee_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (LEE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= LEE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_lee_pmschulden_info()
{
	var int diff;
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Masz pieni�dze dla Onara?
	if(b_gettotalpetzcounter(self) > LEE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//Ostrzega�em ci�, �eby� nie robi� nic g�upiego.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Onar dowiedzia� si�, �e troch� w mi�dzyczasie nabroi�e�.
		if(LEE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Teraz chce wi�cej pieni�dzy.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Ile?
			diff = b_gettotalpetzcounter(self) - LEE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				LEE_SCHULDEN = LEE_SCHULDEN + (diff * 50);
			};
			if(LEE_SCHULDEN > 1000)
			{
				LEE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,LEE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//My�la�em, �e jeste� m�drzejszy.
		};
	}
	else if(b_getgreatestpetzcrime(self) < LEE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//No to mam dla ciebie dobr� wiadomo��.
		if(LEE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Wygl�da na to, �e nie uchowa� si� �aden �wiadek morderstwa.
		};
		if((LEE_LASTPETZCRIME == CRIME_THEFT) || ((LEE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Nikt nie chce ju� zeznawa�, �e widzia� ci� podczas kradzie�y.
		};
		if((LEE_LASTPETZCRIME == CRIME_ATTACK) || ((LEE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//Nie ma �wiadk�w, kt�rzy WIDZIELI, jak pobi�e� tego wie�niaka.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Wygl�da na to, �e wszystkie zarzuty wobec ciebie zosta�y wycofane.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//Jest to jaki� spos�b na wypl�tanie si� z tarapat�w.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Tak czy siak - nie musisz ju� nic p�aci�.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//Tylko na przysz�o�� lepiej uwa�aj!
			LEE_SCHULDEN = 0;
			LEE_LASTPETZCOUNTER = 0;
			LEE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Jedno jest pewne: i tak musisz zap�aci� grzywn�.
			b_say_gold(self,other,LEE_SCHULDEN);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//No i co?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_lee_pmschulden);
		Info_ClearChoices(dia_lee_petzmaster);
		Info_AddChoice(dia_lee_pmschulden,"Nie mam dostatecznie du�o z�ota!",dia_lee_petzmaster_paylater);
		Info_AddChoice(dia_lee_pmschulden,"Ile to mia�o by�?",dia_lee_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
		{
			Info_AddChoice(dia_lee_pmschulden,"Chc� zap�aci� grzywn�!",dia_lee_petzmaster_paynow);
		};
	};
};

func void dia_lee_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Ile mam zap�aci�?
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_pmschulden,"Nie mam dostatecznie du�o z�ota!",dia_lee_petzmaster_paylater);
	Info_AddChoice(dia_lee_pmschulden,"Ile to mia�o by�?",dia_lee_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_pmschulden,"Chc� zap�aci� grzywn�!",dia_lee_petzmaster_paynow);
	};
};


instance DIA_LEE_PETZMASTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_petzmaster_condition;
	information = dia_lee_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > LEE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_info()
{
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	LEE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Kto ci� tu do cholery... To TY jeste� tym nowym, kt�ry stwarza� tyle k�opot�w?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//S�ysza�em od Gorna, �e wci�� �yjesz.. ale �e tu przyszed�e�... mniejsza z tym...
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Dobrze, �e przyszed�e� do mnie, zanim sytuacja sta�a si� naprawd� paskudna.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//Najemnicy to twarde sztuki, a ch�opi te� nie dadz� sobie w kasz� dmucha�. Nie mo�esz tak po prostu zabija� kogo popadnie.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		LEE_SCHULDEN = LEE_SCHULDEN + 500;
		if((PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//Nie wspominaj�c ju� o twoich pozosta�ych wyczynach.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//Je�li chcesz, mog� ci pom�c wydosta� si� z tego bagna...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//...ale to ci� b�dzie kosztowa�. Onar to chciwy cz�owiek, a spraw� mo�na za�atwi� tylko wtedy, je�li ON przymknie na ni� oko.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Dobrze, �e si� spotykamy. Podobno co� st�d ukrad�e�.
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//I poturbowa�e� paru wie�niak�w.
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//I zabi�e� kilka owiec.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//Nie mo�esz tu odstawia� takich numer�w. Onar naciska na mnie, �ebym wreszcie rozliczy� si� z winowajc�.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//Wniosek: ty p�acisz, Onar chowa z�oto do kieszeni i wszyscy zapominaj� o sprawie.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Gdyby� wda� si� w b�jk� z najemnikami, nie ma sprawy...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//...ale jak ruszysz wie�niaka, od razu pobiegnie na skarg� do Onara. A potem ja musz� co� z tym zrobi�.
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Nie m�wi� nawet, jak si� Onar wkurza, kiedy kto� zabije par� owiec.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Musisz wysup�a� par� groszy. Pieni�dze zgarnie Onar, ale potem wszyscy zapomn� o sprawie.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Onar p�aci mi za ochron� farmy. A to oznacza te� ochron� owiec.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Musisz zap�aci� mu odpowiednie odszkodowanie.
		LEE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Ile?
	if(LEE_SCHULDEN > 1000)
	{
		LEE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_petzmaster,"Nie mam dostatecznie du�o z�ota!",dia_lee_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_petzmaster,"Chc� zap�aci� grzywn�!",dia_lee_petzmaster_paynow);
	};
};

func void dia_lee_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Chc� zap�aci� grzywn�!
	b_giveinvitems(other,self,itmi_gold,LEE_SCHULDEN);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//M�dry ch�opiec. Dopilnuj�, �eby pieni�dze trafi�y do Onara. Spraw� mo�emy uzna� za za�atwion�.
	b_grantabsolution(LOC_FARM);
	LEE_SCHULDEN = 0;
	LEE_LASTPETZCOUNTER = 0;
	LEE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_lee_petzmaster);
	Info_ClearChoices(dia_lee_pmschulden);
};

func void dia_lee_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//Nie mam tyle pieni�dzy!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//No to postaraj si� je zdoby�, i to szybko!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Tylko nie pr�buj okrada� kogo� na farmie! Je�li ci� z�api�, wpadniesz w g�wno po uszy.
	LEE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	LEE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LEE_HALLO(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_hallo_condition;
	information = dia_lee_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_hallo_info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Kto ci� tu do diab�a... TY?! Co ty tu robisz? My�la�em, �e nie �yjesz!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//Sk�d to przypuszczenie?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Gorn powiedzia�, �e to ty zniszczy�e� Barier�.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Tak, to prawda.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//No, no. Kto by pomy�la�, �e wyjdziesz z tego ca�o. Co ci� tu sprowadza? Nie wpad�e� chyba powspomina� dawnych dziej�w?
};


instance DIA_LEE_PALADINE(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_paladine_condition;
	information = dia_lee_paladine_info;
	permanent = FALSE;
	description = "Musz� koniecznie porozmawia� z paladynami w mie�cie...";
};


func int dia_lee_paladine_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_paladine_info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Musz� koniecznie porozmawia� z paladynami w mie�cie. Pomo�esz mi jako� si� do nich dosta�?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//A co ci� tak ci�gnie do paladyn�w?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//To d�uga historia...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//Mam mn�stwo czasu.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//Xardas wys�a� mnie z kolejn� misj�. Mam zdoby� pot�ny amulet zwany Okiem Innosa.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Czyli dalej kumplujesz si� z tym nekromant�? Rozumiem. A amulet maj� paladyni, tak?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//O ile mi wiadomo - tak.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Pomog� ci dosta� si� do paladyn�w, ale najpierw musisz zosta� jednym z nas.
};


instance DIA_LEE_PALADINEHOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_paladinehow_condition;
	information = dia_lee_paladinehow_info;
	permanent = FALSE;
	description = "W jaki spos�b mo�esz mi pom�c w skontaktowaniu si� z paladynami?";
};


func int dia_lee_paladinehow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_paladine))
	{
		return TRUE;
	};
};

func void dia_lee_paladinehow_info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//W jaki spos�b mo�esz mi pom�c w skontaktowaniu si� z paladynami?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Zaufaj mi. Mam plan, i my�l�, �e si� do niego znakomicie nadajesz...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Zaprowadz� ci� do paladyn�w, a ty wy�wiadczysz mi drobn� przys�ug�. Ale najpierw musisz do nas do��czy�!
};


instance DIA_LEE_LEESPLAN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leesplan_condition;
	information = dia_lee_leesplan_info;
	permanent = FALSE;
	description = "Co ty tu w�a�ciwie robisz?";
};


func int dia_lee_leesplan_condition()
{
	if(LEE_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_leesplan_info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//Co ty tu w�a�ciwie robisz?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Proste: kombinuj�, jak nas wyrwa� z tej przekl�tej wyspy.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Onar wynaj�� nas, by�my bronili tej farmy, i w�a�nie to zamierzamy robi�.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Ale nie tylko dla pieni�dzy! Pomagaj�c ch�opom, odcinamy miasto od dostaw �ywno�ci.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//A im bardziej paladyni zg�odniej�, tym ch�tniej wys�uchaj� mojej propozycji ugody.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Wielka szkoda, �e musia�e� si� spikn�� akurat z nimi.
	};
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//A jak b�dzie wygl�da� twoja propozycja?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//Najog�lniej m�wi�c: b�dziemy si� domaga� zwolnienia i prawa powrotu na kontynent. Szczeg�y poznasz, gdy nadejdzie odpowiednia pora.
};


instance DIA_LEE_WANNAJOIN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_wannajoin_condition;
	information = dia_lee_wannajoin_info;
	permanent = FALSE;
	description = "Chc� do was do��czy�!";
};


func int dia_lee_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//Chc� do was do��czy�!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Mia�em nadziej�, �e to powiesz! Przyda mi si� ka�dy pewny cz�owiek.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//Ostatni najemnicy, kt�rych przyj��em, narobili tylko k�opot�w!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//W zasadzie mo�esz zaczyna� od zaraz. Chocia�... musimy najpierw wyja�ni� par� spraw, ale to nic wielkiego...
};


instance DIA_LEE_CLEARWHAT(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_clearwhat_condition;
	information = dia_lee_clearwhat_info;
	permanent = FALSE;
	description = "Co dok�adnie mam 'wyja�ni�', �eby m�c do was do��czy�?";
};


func int dia_lee_clearwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_clearwhat_info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//Co dok�adnie mam 'wyja�ni�', �eby m�c do was do��czy�?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Naszym szefem jest Onar, zarz�dca tych ziem. Mo�esz zosta� na farmie tylko wtedy, je�li on si� na to zgodzi.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//No i s� jeszcze ch�opcy. Mog� ci� przyj��, je�li wstawi si� za tob� wi�kszo�� najemnik�w.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Tylko nie id� do Onara, zanim wszystko si� nie wyja�ni. To bardzo niecierpliwy cz�owiek...
	Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
	b_logentry(TOPIC_BECOMESLD,"Aby m�c zosta� najemnikiem, musz� przekona� do tego pomys�u pozosta�ych najemnik�w i uzyska� zgod� Onara.");
};


instance DIA_LEE_OTHERSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 7;
	condition = dia_lee_othersld_condition;
	information = dia_lee_othersld_info;
	permanent = FALSE;
	description = "Jak mam przekona� najemnik�w, �eby mnie poparli?";
};


func int dia_lee_othersld_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_othersld_info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Jak mam przekona� najemnik�w, �eby mnie poparli?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//Najlepiej udowodnij im, �e nadajesz si� do tej roboty.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Pogadaj z Torlofem. Zwykle kr�ci si� gdzie� przed domem. On podda ci� pr�bie.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Je�li j� przejdziesz, b�dziesz ju� prawie jednym z nas.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//Torlof powie ci wszystko, co musisz wiedzie�.
	b_logentry(TOPIC_BECOMESLD,"Aby m�c zosta� najemnikiem, musz� podda� si� pr�bie Torlofa i zyska� szacunek pozosta�ych najemnik�w.");
};


instance DIA_ADDON_LEE_RANGER(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_addon_lee_ranger_condition;
	information = dia_addon_lee_ranger_info;
	description = "Co wiesz o Wodnym Kr�gu?";
};


func int dia_addon_lee_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_othersld) && (SC_KNOWSRANGER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_lee_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//Co wiesz o Wodnym Kr�gu?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//Mo�na si� by�o domy�li�... To nie twoja sprawa.
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Ej�e. Powiedz mi!
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//Nie dotyczy mnie to bezpo�rednio - wiem tylko, �e to jaka� tajna gildia, za kt�r� stoj� Magowie Wody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Od chwili upadku Bariery nie obowi�zuje mnie ju� umowa z Magami Wody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Oczywi�cie spr�buj� ci pom�c, je�li czegokolwiek ci potrzeba. Nie mam jednak zbyt wiele czasu - musz� si� troszczy� przede wszystkim o swoje sprawy.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//Je�li chcesz zdoby� wi�cej informacji o tym kr�gu, to pogadaj z Cordem. On nale�y do tej organizacji, o ile mi wiadomo.
	RANGERHELP_GILDESLD = TRUE;
	SC_KNOWSCORDASRANGERFROMLEE = TRUE;
};


var int lee_probeok;
var int lee_stimmenok;
var int lee_onarok;

instance DIA_LEE_JOINNOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 8;
	condition = dia_lee_joinnow_condition;
	information = dia_lee_joinnow_info;
	permanent = TRUE;
	description = "Jestem gotowy, by do was do��czy�!";
};


func int dia_lee_joinnow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_othersld) && (LEE_ONAROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_joinnow_info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Jestem gotowy, by do was do��czy�!
	if(LEE_PROBEOK == FALSE)
	{
		if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Nie przeszed�e� jeszcze testu Torlofa.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Czyli przeszed�e� ju� pr�b� Torlofa?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Tak.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//Bardzo dobrze.
			LEE_PROBEOK = TRUE;
		};
	};
	if((LEE_PROBEOK == TRUE) && (LEE_STIMMENOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//Co s�dz� o tobie pozostali najemnicy?
		if(TORLOF_GENUGSTIMMEN == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Nie jestem pewien, czy wystarczaj�co wielu z nich jest po mojej stronie.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//No to pogadaj z Torlofem. On wie o wszystkim, o czym si� m�wi na farmie.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Wi�kszo�� z nich jest po mojej stronie.
			LEE_STIMMENOK = TRUE;
		};
	};
	if((LEE_STIMMENOK == TRUE) && (LEE_ONAROK == FALSE))
	{
		if(ONAR_APPROVED == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//W takim razie id� do Onara. Ja ju� z nim rozmawia�em.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//Ale wynagrodzenie musisz sam sobie wynegocjowa�.
			LEE_SENDTOONAR = TRUE;
			b_logentry(TOPIC_BECOMESLD,"Teraz potrzebuj� tylko zgody Onara.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Rozmawia�e� z Onarem?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Tak. Zgodzi� si�.
			LEE_ONAROK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//No to witamy na pok�adzie!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Masz tu przyzwoity pancerz. Przyda ci si�.
			Npc_SetTrueGuild(other,GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine(lothar,"START");
			CreateInvItems(other,itar_sld_l,1);
			AI_EquipArmor(other,itar_sld_l);
			Snd_Play("LEVELUP");
			KDF_AUFNAHME = LOG_OBSOLETE;
			SLD_AUFNAHME = LOG_SUCCESS;
			MIL_AUFNAHME = LOG_OBSOLETE;
			b_giveplayerxp(XP_BECOMEMERCENARY);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Ciesz� si�, �e jeste� z nami.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//Mam ju� dla ciebie pierwsze zadanie.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//Chodzi o paladyn�w. Pora, by� z�o�y� im wizyt�.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//I tak chcia�e� tam i��, nie?
		};
	};
};


instance DIA_LEE_KEINSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_keinsld_condition;
	information = dia_lee_keinsld_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_keinsld_condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (LEE_ISONBOARD == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lee_keinsld_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Widz�, �e wst�pi�e� na s�u�b� do paladyn�w.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//By�e� w klasztorze? Wszystkiego bym si� spodziewa�, tylko nie tego.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//C�, najemnikiem ju� raczej nie zostaniesz.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Ale kto wie, mo�e m�g�by� mi wy�wiadczy� przys�ug� czy dwie... albo ja tobie...
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Tak czy siak - �ycz� ci powodzenia.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//Tylko nie pr�buj ze mn� �adnych numer�w, jasne?
};


instance DIA_LEE_TOHAGEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_tohagen_condition;
	information = dia_lee_tohagen_info;
	permanent = FALSE;
	description = "Jak mam si� teraz dosta� do paladyn�w?";
};


func int dia_lee_tohagen_condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_lee_tohagen_info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//Jak mam si� teraz dosta� do paladyn�w?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//To proste. Zaniesiesz im moj� propozycj� pokojow�.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Znam Lorda Hagena, dow�dc� paladyn�w, jeszcze z kr�lewskiej armii.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//Wiem, co sobie teraz my�li: ma zbyt ma�o ludzi. Przyjmie wi�c moje warunki. A w ka�dym razie na pewno ci� wys�ucha.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Napisa�em do niego list. Masz.
	b_giveinvitems(self,other,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//Dzi�ki niemu dopuszcz� ci� przed dow�dc� paladyn�w.
	MIS_LEE_FRIEDENSANGEBOT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FRIEDEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FRIEDEN,LOG_RUNNING);
	b_logentry(TOPIC_FRIEDEN,"Lee wys�a� mnie z ofert� pokojow� do Lorda Hagena. W ten spos�b dotr� do paladyn�w.");
};


instance DIA_LEE_ANGEBOTSUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_angebotsuccess_condition;
	information = dia_lee_angebotsuccess_info;
	permanent = FALSE;
	description = "Zanios�em twoj� propozycj� Lordowi Hagenowi.";
};


func int dia_lee_angebotsuccess_condition()
{
	if(HAGEN_FRIEDENABGELEHNT == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_angebotsuccess_info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Zanios�em twoj� propozycj� Lordowi Hagenowi.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//I co odpowiedzia�?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//Jest sk�onny u�askawi� ciebie, ale nie twoich ludzi.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Nad�ty g�upiec. Moi ludzie to baranki w por�wnaniu z niekt�rymi oprychami z kr�lewskiej armii.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Co teraz zrobisz?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Znajd� jaki� inny spos�b... Je�li b�dzie trzeba, uprowadz� kr�lewski okr�t. Musz� troch� pomy�le�.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Nie zostawi� moich ludzi w tym bagnie. To wykluczone.
	MIS_LEE_FRIEDENSANGEBOT = LOG_SUCCESS;
};


instance DIA_LEE_BACKGROUND(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_background_condition;
	information = dia_lee_background_info;
	permanent = FALSE;
	description = "Dlaczego tak bardzo chcesz si� dosta� na kontynent?";
};


func int dia_lee_background_condition()
{
	if(MIS_LEE_FRIEDENSANGEBOT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_background_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Dlaczego tak bardzo chcesz si� dosta� na kontynent?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Jak zapewne pami�tasz, s�u�y�em kiedy� w kr�lewskiej armii, w randze genera�a.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Ale grupa dworskich przydupas�w postanowi�a si� mnie pozby�, bo za du�o wiedzia�em.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Wtr�cili mnie do Kolonii, a Kr�l nawet nie kiwn�� palcem, �eby ich powstrzyma�.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//Mia�em mn�stwo czasu, �eby to sobie przemy�le�.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//Zamierzam si� zem�ci�.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//Na Kr�lu?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//Tak, na Kr�lu i na wszystkich dwuj�zycznych pochlebcach. Zap�ac� mi za piek�o, przez kt�re musia�em przej��!
};


instance DIA_LEE_RESCUEGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_rescuegorn_condition;
	information = dia_lee_rescuegorn_info;
	permanent = FALSE;
	description = "Zamierzam wyruszy� do G�rniczej Doliny.";
};


func int dia_lee_rescuegorn_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_rescuegorn_info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Zamierzam wyruszy� do G�rniczej Doliny.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Wiedzia�em, �e nie wysiedzisz za d�ugo na farmie!
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//W takim razie rozejrzyj si� troch� za Gornem. Paladyni zawlekli go z powrotem do Kolonii.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Gorn to r�wny facet. Przyda�by mi si� tutaj kto� taki jak on. Gdyby� mia� okazj� go uwolni� - zr�b to.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_LEE_SUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_success_condition;
	information = dia_lee_success_info;
	permanent = FALSE;
	description = "Uwolni�em Gorna.";
};


func int dia_lee_success_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_success_info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Uwolni�em Gorna.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Tak, ju� mi m�wi�e�. Dobra robota.
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Ten facet jest wi�cej wart, ni� Sylvio i jego ch�opcy razem wzi�ci.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_ABOUTGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_aboutgorn_condition;
	information = dia_lee_aboutgorn_info;
	permanent = FALSE;
	description = "Rozmawia�e� z Gornem? Co si� z nim dzieje?";
};


func int dia_lee_aboutgorn_condition()
{
	if((KAPITEL < 3) && (Npc_KnowsInfo(other,dia_lee_rescuegorn) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_aboutgorn_info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Rozmawia�e� z Gornem? Co si� z nim dzieje?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Chyba go jeszcze pami�tasz?
	Info_ClearChoices(dia_lee_aboutgorn);
	Info_AddChoice(dia_lee_aboutgorn,"Niech pomy�l�...",dia_lee_aboutgorn_who);
	Info_AddChoice(dia_lee_aboutgorn,"Jasne.",dia_lee_aboutgorn_yes);
};

func void dia_lee_aboutgorn_yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Jasne.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Z�apali go paladyni i wys�ali z powrotem do G�rniczej Doliny, w karnym konwoju.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Gdyby drogi do Doliny nie roi�y si� od paladyn�w i ork�w, wys�a�bym paru moich ch�opc�w, �eby go wyci�gn�li.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Ale nie mog� ryzykowa�. Szkoda cz�owieka.
	Info_ClearChoices(dia_lee_aboutgorn);
};

func void dia_lee_aboutgorn_who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Niech pomy�l�...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Du�y, ciemnow�osy, z wielkim toporem... Pom�g� ci odbi� nasz� kopalni� w Kolonii.
};


instance DIA_LEE_WEGENBULLCO(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_wegenbullco_condition;
	information = dia_lee_wegenbullco_info;
	permanent = FALSE;
	description = "Onar straci� w�a�nie kilka owiec. Wszystko przez Bullka...";
};


func int dia_lee_wegenbullco_condition()
{
	if((KAPITEL < 4) && (MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_wegenbullco_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//Onar straci� w�a�nie kilka owiec. Wszystko przez Bullka...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//A daj mi spok�j z tym g�wnem! Mam do�� k�opot�w i bez tego.
	if((BULLCO_SCHARF == TRUE) && !Npc_IsDead(bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//Ja te�. Bullko chyba za mn� nie przepada. Chce, �ebym opu�ci� farm�...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//I co z tego? Postaw mu si�.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//I powiedz mu, �e jak si� nie uspokoi, potr�c� koszt zaginionych owiec z jego wyp�aty.
	};
};


instance DIA_LEE_REPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_report_condition;
	information = dia_lee_report_info;
	permanent = TRUE;
	description = "Wracam z G�rniczej Doliny...";
};


func int dia_lee_report_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_lee_report_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Wracam z G�rniczej Doliny. Tamtejszy zamek zosta� zaatakowany przez smoki!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//A wi�c to prawda! Lares wspomina� co� o smokach, kt�re mia�y si� kr�ci� wok� miasta... Prawd� m�wi�c, nie dawa�em temu wiary...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//Co si� sta�o z paladynami?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Rozbici. Zdziesi�tkowani.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//I BARDZO dobrze! Mo�e Lord Hagen przemy�li jeszcze raz moj� propozycj�...
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//A je�li nie... Znajdziemy inny spos�b na wydostanie si� st�d...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//�wietnie! Mo�e Lord Hagen wyprawi si� teraz do G�rniczej Doliny ze swoimi lud�mi...
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//Im mniej paladyn�w zostanie na miejscu, tym lepiej.
	};
};


var int lee_give_sld_m;

instance DIA_LEE_ARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorm_condition;
	information = dia_lee_armorm_info;
	permanent = TRUE;
	description = "Przyda�aby mi si� lepsza zbroja.";
};


func int dia_lee_armorm_condition()
{
	if((KAPITEL == 2) && (other.guild == GIL_SLD) && (LEE_GIVE_SLD_M == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_armorm_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//Przyda�aby mi si� lepsza zbroja.
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//Wype�ni�e� swoje zadanie.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//Mam dla ciebie solidniejsz� zbroj�. Oczywi�cie, je�li masz odpowiedni� ilo�� kruszcu.
		LEE_GIVE_SLD_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//Torlof dosta� od Onara pewne zlecenie, kt�re powinno zosta� za�atwione jaki� czas temu.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//Zajmij si� tym, to porozmawiamy o lepszej zbroi.
	};
};


var int lee_sldmgiven;

instance DIA_LEE_BUYARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorm_condition;
	information = dia_lee_buyarmorm_info;
	permanent = TRUE;
	description = "Kup �redni pancerz najemnika. Ochrona (bro� i strza�y) 50, 1000 sztuk z�ota.";
};


func int dia_lee_buyarmorm_condition()
{
	if((LEE_GIVE_SLD_M == TRUE) && (LEE_SLDMGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorm_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Daj mi jak�� zbroj�.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Prosz�, to dobry pancerz.
		CreateInvItems(other,itar_sld_m,1);
		AI_EquipArmor(other,itar_sld_m);
		LEE_SLDMGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Ale ja nie rozdaj� prezent�w. Najpierw chc� zobaczy� z�oto!
	};
};


instance DIA_LEE_KAP3_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap3_exit_condition;
	information = dia_lee_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lee_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_TELEPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_teleport_condition;
	information = dia_lee_teleport_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_teleport_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && (LEE_TELEPORT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_teleport_info()
{
	b_lee_teleport();
};


instance DIA_LEE_ARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorh_condition;
	information = dia_lee_armorh_info;
	permanent = FALSE;
	description = "Nie masz dla mnie jakiej� lepszej zbroi?";
};


func int dia_lee_armorh_condition()
{
	if((KAPITEL == 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_armorh_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//Nie masz dla mnie jakiej� lepszej zbroi?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//Jasne, �e mam!
};


var int lee_sldhgiven;

instance DIA_LEE_BUYARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorh_condition;
	information = dia_lee_buyarmorh_info;
	permanent = TRUE;
	description = "Kup ci�ki pancerz najemnika. Ochrona (bro� i strza�y) 80, 2500 sztuk z�ota.";
};


func int dia_lee_buyarmorh_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_armorh) && (LEE_SLDHGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorh_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Daj mi ci�k� zbroj�.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Prosz�. To solidny pancerz. Sam taki nosz�.
		CreateInvItems(other,itar_sld_h,1);
		AI_EquipArmor(other,itar_sld_h);
		LEE_SLDHGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//Znasz zasady. Najpierw z�oto.
	};
};


instance DIA_LEE_RICHTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richter_condition;
	information = dia_lee_richter_info;
	permanent = FALSE;
	description = "Nie masz dla mnie �adnej roboty?";
};


func int dia_lee_richter_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(richter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_richter_info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//Nie masz dla mnie �adnej roboty?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Ci�gle ci ma�o, co? I tak siedzisz w niez�ym bagnie. Czego jeszcze chcesz?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Kolejnego zlecenia. W ko�cu jestem najemnikiem, prawda?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//W porz�dku. Mam co� w sam raz dla ciebie.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Mam pewien rachunek do wyr�wnania z miejskim s�dzi�. Najch�tniej sam bym si� tym zaj��...
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//...ale paladyni nie dopuszcz� mnie do jego domu nawet na odleg�o�� celnego rzutu kamieniem.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Sprawa jest do�� delikatna, wi�c uwa�aj: p�jdziesz do s�dziego i zaoferujesz mu swoje us�ugi.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Spr�bujesz zdoby� jego zaufanie i wykonasz dla niego kilka szemranych zlece�, p�ki nie znajdziesz na niego jakiego� haka.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Ten wieprz tapla si� w takim bagnie, �e nie powinno to by� trudne.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Tylko przynie� mi SOLIDNE dowody. Chc�, �eby po ich ujawnieniu facet trafi� do paki na reszt� swojego �ycia.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//I pod �adnym pozorem go nie zabijaj! To by by�o zbyt proste. On ma najpierw troch� pocierpie�, zrozumiano?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//I jak my�lisz? Dasz rad�?
	Log_CreateTopic(TOPIC_RICHTERLAKAI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RICHTERLAKAI,LOG_RUNNING);
	b_logentry(TOPIC_RICHTERLAKAI,"Lee chce, abym znalaz� jakie� dowody przeciwko s�dziemu Khorinis. Musz� tylko zaoferowa� temu ostatniemu swoje us�ugi i mie� oczy szeroko otwarte.");
	MIS_LEE_JUDGERICHTER = LOG_RUNNING;
	Info_ClearChoices(dia_lee_richter);
	Info_AddChoice(dia_lee_richter,"Wykluczone.",dia_lee_richter_nein);
	Info_AddChoice(dia_lee_richter,"Nie ma sprawy. Ile?",dia_lee_richter_wieviel);
};

func void dia_lee_richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Nie ma sprawy. Ile?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Twoja nagroda zale�y od tego, co mi przyniesiesz, wi�c dobrze si� postaraj.
	Info_ClearChoices(dia_lee_richter);
};

func void dia_lee_richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Wykluczone. Nie b�d� si� korzy� przed �adn� �wini�.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//No, no. Nie uno� mi si� tu honorem. To on kaza� ci� zamkn�� i wrzuci� za Barier�, pami�tasz?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Zreszt�, r�b jak chcesz. Moim zdaniem pope�niasz b��d.
	Info_ClearChoices(dia_lee_richter);
};


instance DIA_LEE_RICHTERBEWEISE(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richterbeweise_condition;
	information = dia_lee_richterbeweise_info;
	description = "Mam dla ciebie dowody obci��aj�ce s�dziego.";
};


func int dia_lee_richterbeweise_condition()
{
	if((KAPITEL >= 3) && (MIS_LEE_JUDGERICHTER == LOG_RUNNING) && Npc_HasItems(other,itwr_richterkomprobrief_mis) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_richterbeweise_info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Mam dla ciebie dowody obci��aj�ce s�dziego.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Serio? Co znalaz�e�?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Pan s�dzia wynaj�� kilku oprych�w, by zastraszyli gubernatora Khorinis.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Gdy wykonali brudn� robot�, kaza� ich aresztowa� i odebra� im swoje z�oto.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Mam przy sobie pismo, w kt�rym s�dzia opisuje bandziorom ich zadanie.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Poka�.
	b_giveinvitems(other,self,itwr_richterkomprobrief_mis,1);
	b_usefakescroll();
	if(Npc_IsDead(richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//Nareszcie! No, panie s�dzio - pora wyr�wna� rachunki. Dobra robota!
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Zas�u�y�e� na sowite wynagrodzenie. Prosz�, oto twoja nagroda.
		CreateInvItems(self,itmi_gold,500);
		b_giveinvitems(self,other,itmi_gold,500);
		MIS_LEE_JUDGERICHTER = LOG_SUCCESS;
		b_giveplayerxp(XP_JUDGERICHTER);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//Tylko nikomu ani s�owa, jasne?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//To �wietnie, ale sprawa sama si� rozwi�za�a. S�dzia nie �yje.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Jaki� idiota go rozwali�. Ech, trudno. Nie b�d� po nim p�aka�.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Masz tu par� monet. Na wy�sz� nagrod� nie mo�esz teraz liczy�.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		MIS_LEE_JUDGERICHTER = LOG_FAILED;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_LEE_TALKABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_talkaboutbennet_condition;
	information = dia_lee_talkaboutbennet_info;
	permanent = FALSE;
	description = "Co z Bennetem?";
};


func int dia_lee_talkaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lee_talkaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Co z Bennetem?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Ach, ju� s�ysza�e�? Sukinsyny zamkn�y go w pace!
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Jakbym nie mia� do�� problem�w ze swoimi lud�mi, teraz musz� jeszcze zaj�� si� paladynami!
	};
};


instance DIA_LEE_DOABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_doaboutbennet_condition;
	information = dia_lee_doaboutbennet_info;
	permanent = FALSE;
	description = "Co zamierzasz zrobi� w sprawie Benneta?";
};


func int dia_lee_doaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_talkaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_doaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Co zamierzasz zrobi� w sprawie Benneta?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Jeszcze nie wiem. Moi ch�opcy najch�tniej pobiegliby od razu do miasta, �eby wbi� Hagenowi z�by do gard�a.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//Na szcz�cie mamy za ma�o ludzi, �eby przeprowadzi� tak� operacj�. Prawd� m�wi�c, to nie w moim stylu.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//A wi�c zamierzasz tu czeka� na rozw�j wydarze�?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//W �adnym wypadku!
	b_logentry(TOPIC_RESCUEBENNET,"Nie zdo�am na czas udowodni� niewinno�ci Benneta. Ludzie Lee nie zawahaj� si� zaatakowa� miasta i odbi� Benneta si��.");
	if(!Npc_IsDead(lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Lares wci�� siedzi w mie�cie i pr�buje wykombinowa�, jak wyci�gn�� Benneta.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//P�ki co, pr�buj� jako� utrzyma� moich ludzi w ryzach. Mam tylko nadziej�, �e Lares si� po�pieszy.
	};
	if(!Npc_IsDead(buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//A, zanim zapomn�! Buster chce z tob� porozmawia�. Nie chcia� mi powiedzie�, o co chodzi. Mo�e powiniene� do niego zajrze�?
	};
};


instance DIA_LEE_CANHELPYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_canhelpyou_condition;
	information = dia_lee_canhelpyou_info;
	permanent = FALSE;
	description = "Mog� ci jako� pom�c w tej sprawie z Bennetem?";
};


func int dia_lee_canhelpyou_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_doaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_canhelpyou_info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Mog� ci jako� pom�c w tej sprawie z Bennetem?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Jasne. Odrobina sprytu i rozs�dku na pewno nie zaszkodzi.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Innos �wiadkiem, �e p�ta si� tu wystarczaj�co wielu idiot�w.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//Id� do miasta i postaraj si� wyci�gn�� stamt�d Benneta.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Tylko si� pospiesz! Nie wiem, jak d�ugo zdo�am utrzyma� moich ludzi w ryzach!
};


var int dia_lee_anynews_onetime;

instance DIA_LEE_ANYNEWS(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_anynews_condition;
	information = dia_lee_anynews_info;
	permanent = TRUE;
	description = "Jakie� wie�ci w sprawie Benneta?";
};


func int dia_lee_anynews_condition()
{
	if((MIS_RESCUEBENNET != FALSE) && Npc_KnowsInfo(other,dia_lee_doaboutbennet) && (DIA_LEE_ANYNEWS_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_anynews_info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Jakie� wie�ci w sprawie Benneta?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Wygl�da na to, �e nie poturbowali go za bardzo w wi�zieniu.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Dobra robota.
		if(DIA_LEE_ANYNEWS_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_LEE_ANYNEWS_ONETIME = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Nie, nadal wiemy za ma�o.
	};
};


instance DIA_LEE_SYLVIO(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_sylvio_condition;
	information = dia_lee_sylvio_info;
	description = "Co si� tu dzia�o?";
};


func int dia_lee_sylvio_condition()
{
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_sylvio_info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Co si� tu dzia�o?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Ten sukinsyn, Sylvio, dowiedzia� si� o smokach w G�rniczej Dolinie i namiesza� w g�owach wszystkim na farmie.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Przekonywa� ch�opak�w, �eby poszli z nim do Doliny. Obiecywa� bogactwa, s�aw�, zaszczyty...
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Niekt�rzy nie chcieli go nawet s�ucha�, ale znalaz�o si� paru idiot�w, kt�rzy dali si� nabra�.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Kazali Bennetowi przygotowa� dla siebie odpowiednie wyposa�enie i wyruszyli w drog�.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//Ech, prawd� m�wi�c, ciesz� si�, �e Sylvio poszed� wreszcie do diab�a.
};


instance DIA_LEE_KAP4_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap4_exit_condition;
	information = dia_lee_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_CANTEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_canteach_condition;
	information = dia_lee_canteach_info;
	permanent = TRUE;
	description = "Czy mo�esz mnie wyszkoli�?";
};


func int dia_lee_canteach_condition()
{
	if((KAPITEL >= 4) && (LEE_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_canteach_info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//Mog� ci pokaza�, jak pos�ugiwa� si� dwur�cznym.
	if(other.hitchance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Ale nie mam czasu, �eby wbija� ci do g�owy podstawy.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//Poducz si� troch� u kogo� innego. Jak b�dziesz gotowy, poka�� ci par� ciekawych sztuczek.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//S�ysza�em, �e jeste� ca�kiem niez�y, ale mog� ci pokaza� par� nowych sztuczek.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			LEE_TEACHPLAYER = TRUE;
			Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
			b_logentry(TOPIC_SOLDIERTEACHER,"Lee nauczy mnie walki or�em dwur�cznym.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Wi�c je�li chcesz, mog� ci� uczy�. Ale to b�dzie kosztowa�o...
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Ile?
			AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 sztuk z�ota i mo�emy zaczyna�.
			Info_ClearChoices(dia_lee_canteach);
			Info_AddChoice(dia_lee_canteach,"To troch� za drogo.",dia_lee_canteach_no);
			if(Npc_HasItems(other,itmi_gold) >= 1000)
			{
				Info_AddChoice(dia_lee_canteach,"Umowa stoi. Oto twoje z�oto.",dia_lee_canteach_yes);
			};
		};
	};
};

func void dia_lee_canteach_no()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//To troch� za drogo.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Zastan�w si�. Trudno o drugiego takiego nauczyciela jak ja.
	Info_ClearChoices(dia_lee_canteach);
};

func void dia_lee_canteach_yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Umowa stoi. Oto twoje z�oto.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//�wietnie. Nie po�a�ujesz tego.
	b_giveinvitems(other,self,itmi_gold,1000);
	LEE_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_lee_canteach);
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Lee nauczy mnie walki or�em dwur�cznym.");
};


instance DIA_LEE_TEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_teach_condition;
	information = dia_lee_teach_info;
	permanent = TRUE;
	description = "Dobra. Bierzmy si� do nauki.";
};


func int dia_lee_teach_condition()
{
	if(LEE_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_teach_info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Dobra. Bierzmy si� do nauki.
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_back()
{
	Info_ClearChoices(dia_lee_teach);
};

func void dia_lee_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Teraz jeste� prawdziwym mistrzem walki dwur�cznym or�em.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//Nie potrzebujesz ju� nauczyciela.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Teraz jeste� prawdziwym mistrzem walki dwur�cznym or�em.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//Nie potrzebujesz ju� nauczyciela.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};


instance DIA_LEE_DRACHENEI(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_drachenei_condition;
	information = dia_lee_drachenei_info;
	description = "Jaszczuroludzie roznosz� smocze jaja po ca�ym kraju.";
};


func int dia_lee_drachenei_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_lee_drachenei_info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Jaszczuroludzie roznosz� smocze jaja po ca�ym kraju.
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//Mo�na si� by�o tego spodziewa�. Najwy�szy czas, �eby�my si� st�d wynie�li.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//To co mam z nimi zrobi�?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Rozwali� je, a co innego?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Mo�e skorupy da si� wykorzysta� do sporz�dzania zbroi, albo czego� w tym stylu.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Wygl�daj� na do�� solidne. Pogadaj o tym z Bennetem.
		b_logentry(TOPIC_DRACHENEIER,"Lee nie zdo�a� zrobi� zbyt wiele ze smoczym jajem. Wys�a� mnie do kowala Benneta.");
	};
};


instance DIA_LEE_KAP4_PERM(C_INFO)
{
	npc = sld_800_lee;
	nr = 49;
	condition = dia_lee_kap4_perm_condition;
	information = dia_lee_kap4_perm_info;
	permanent = TRUE;
	description = "Co s�ycha� na farmie?";
};


func int dia_lee_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Co s�ycha� na farmie?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//C�, odk�d odszed� Sylvio, mamy tu wzgl�dny spok�j.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//To chyba dobrze?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Niby tak, ale pracy nam przez to nie uby�o. Moi ch�opcy marudz� coraz bardziej, bo teraz musz� pracowa� za siebie i za ludzi, kt�rych wyci�gn�� Sylvio.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Ale to ju� m�j problem. Jako� sobie poradz�.
};


instance DIA_LEE_KAP5_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap5_exit_condition;
	information = dia_lee_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lee_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_GETSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_getship_condition;
	information = dia_lee_getship_info;
	description = "Wiesz mo�e, jak m�g�bym przej�� okr�t paladyn�w?";
};


func int dia_lee_getship_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_getship_info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Wiesz mo�e, jak m�g�bym przej�� okr�t paladyn�w?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//A my�lisz, �e siedzia�bym tu, gdybym wiedzia�, jak to zrobi�? Ten okr�t jest lepiej strze�ony ni� konwoje z rud� w Starym Obozie.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Musi by� jaki� spos�b, �eby dosta� si� na pok�ad.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Dostanie si� na pok�ad to akurat pestka.
	Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
	if((MIS_LEE_JUDGERICHTER == LOG_SUCCESS) && (Npc_IsDead(richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Przecie� mamy w gar�ci s�dziego! Id� do niego i wydu� odpowiednie pismo uprawniaj�ce do zaj�cia okr�tu.
		MIS_RICHTERSPERMISSIONFORSHIP = LOG_RUNNING;
		b_logentry(TOPIC_SHIP,"Lee uwa�a, �e aby dosta� si� na statek, najlepiej by�oby mie� upowa�nienie od s�dziego. W�tpi� jednak, aby ten ostatni wyda� mi przepustk� z w�asnej, nieprzymuszonej woli.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//Mam tu sfa�szowane pe�nomocnictwo. Dzi�ki niemu stra�nicy powinni wpu�ci� ci� na pok�ad.
		b_logentry(TOPIC_SHIP,"Poczciwy Lee, zawsze mo�na na nim polega�. Podrobi� list, dzi�ki kt�remu zostan� wpuszczony na okr�t paladyn�w.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Ale to jeszcze nie wszystko. Musisz najpierw znale�� kapitana, za�og�, i takie tam.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//Sam okr�t to za ma�o. Jest jeszcze mn�stwo spraw, kt�re trzeba za�atwi�.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	Info_ClearChoices(dia_lee_getship);
	Info_AddChoice(dia_lee_getship,DIALOG_BACK,dia_lee_getship_back);
	Info_AddChoice(dia_lee_getship,"Kogo powinienem wzi�� do za�ogi?",dia_lee_getship_crew);
	if(Npc_IsDead(torlof) == FALSE)
	{
		Info_AddChoice(dia_lee_getship,"Znasz kogo�, kto m�g�by stan�� za sterem statku?",dia_lee_getship_torlof);
	};
};

func void dia_lee_getship_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Znasz kogo�, kto m�g�by stan�� za sterem statku?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Je�li dobrze pami�tam, Torlof kiedy� sporo �eglowa�. On b�dzie wiedzia� co i jak.
	b_logentry(TOPIC_CAPTAIN,"Torlof to stary wilk morski, mo�e zechce zosta� kapitanem na moim statku.");
};

func void dia_lee_getship_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//Kogo powinienem wzi�� do za�ogi?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//To ju� twoja decyzja. Na twoim miejscu bra�bym tylko ludzi, kt�rym m�g�bym zaufa�. Masz wystarczaj�c� ilo�� zaufanych ludzi?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Je�li potrzebujesz kowala, pogadaj koniecznie z Bennetem. Lepszego ni� on nie znajdziesz.
	b_logentry(TOPIC_CREW,"Lee nie pom�g� mi zbytnio w skompletowaniu za�ogi, jednak poradzi� mi, abym wzi�� jedynie osoby godne zaufania. Powinienem si� uda� do Benneta, mo�e on b�dzie zainteresowany.");
};

func void dia_lee_getship_back()
{
	Info_ClearChoices(dia_lee_getship);
};


instance DIA_LEE_GOTRICHTERSPERMISSIONFORSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_gotrichterspermissionforship_condition;
	information = dia_lee_gotrichterspermissionforship_info;
	description = "Sztuczka z pisemnym upowa�nieniem zadzia�a�a!";
};


func int dia_lee_gotrichterspermissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_gotrichterspermissionforship_info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//Sztuczka z pisemnym upowa�nieniem zadzia�a�a! Statek nale�y teraz do mnie. Pan s�dzia by� bardzo... pomocny.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//A nie m�wi�em? Wiedzia�em, �e ten sukinsyn jeszcze si� do czego� przyda.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_STEALSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stealship_condition;
	information = dia_lee_stealship_info;
	permanent = FALSE;
	description = "Zamierzam ukra�� okr�t.";
};


func int dia_lee_stealship_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_getship) && (hero.guild == GIL_DJG) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_lee_stealship_info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Zamierzam ukra�� okr�t.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//A jak niby chcesz tego dokona�?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//To proste - p�jd� na przysta�, poka�� im twoje papiery i zajm� statek.
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Jak chcesz. Mam nadziej�, �e wiesz w co si� pakujesz.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
};


instance DIA_LEE_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_knowwhereenemy_condition;
	information = dia_lee_knowwhereenemy_info;
	permanent = TRUE;
	description = "Pop�yniesz ze mn�?";
};


func int dia_lee_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LEE_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_lee_getship))
	{
		return TRUE;
	};
};

func void dia_lee_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Pop�yniesz ze mn�?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//�artujesz? Jasne, �e tak! Mam par� rachunk�w do wyr�wnania na kontynencie.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//No i mog� ci pokaza� kilka sztuczek w walce dwur�cznym or�em. Mog� ci si� przyda�.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Lee chce jak najpr�dzej wr�ci� na kontynent. Zaoferowa� mi swoj� pomoc. Z pewno�ci� nigdzie nie znajd� lepszego trenera.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Narazie mam ju� za�og�, ale dam ci zna�, gdyby co� si� zwolni�o.
	}
	else
	{
		Info_ClearChoices(dia_lee_knowwhereenemy);
		Info_AddChoice(dia_lee_knowwhereenemy,"Dam ci zna�, kiedy b�dziesz mi potrzebny.",dia_lee_knowwhereenemy_no);
		Info_AddChoice(dia_lee_knowwhereenemy,"W takim razie pakuj si�!",dia_lee_knowwhereenemy_yes);
	};
};

func void dia_lee_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//W takim razie pakuj si�!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Co? Ju�? Teraz?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Tak, podnosimy �agle. Je�li chcesz si� ze mn� zabra�, przyjd� na przysta�. Spotkamy si� na statku.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//D�ugo czeka�em na t� chwil�. Mo�esz na mnie liczy�.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LEE_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lee_knowwhereenemy);
};

func void dia_lee_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//Dam ci zna�, kiedy b�dziesz mi potrzebny.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//C�, ty wiesz najlepiej. Ale dobrych �o�nierzy nigdy nie za wielu.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//No, chyba �e to idioci pokroju Sylvio.
	LEE_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lee_knowwhereenemy);
};


instance DIA_LEE_LEAVEMYSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leavemyship_condition;
	information = dia_lee_leavemyship_info;
	permanent = TRUE;
	description = "Chyba jednak mi si� nie przydasz!";
};


func int dia_lee_leavemyship_condition()
{
	if((LEE_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//Chyba jednak mi si� nie przydasz!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Jak chcesz. Wiesz, gdzie mnie szuka�, prawda?
	LEE_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LEE_STILLNEEDYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stillneedyou_condition;
	information = dia_lee_stillneedyou_info;
	permanent = TRUE;
	description = "Chyba jednak b�d� ci� potrzebowa�!";
};


func int dia_lee_stillneedyou_condition()
{
	if(((LEE_ISONBOARD == LOG_OBSOLETE) || (LEE_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lee_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//Chyba jednak b�d� ci� potrzebowa�!
	if(LEE_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//Wiedzia�em, �e tak b�dzie! Do zobaczenia na statku!
		LEE_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//Wiesz co? Niech ci�! Najpierw ka�esz mi przyj��, potem mnie odsy�asz...
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Poszukaj sobie innego jelenia.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_KAP6_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap6_exit_condition;
	information = dia_lee_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lee_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

