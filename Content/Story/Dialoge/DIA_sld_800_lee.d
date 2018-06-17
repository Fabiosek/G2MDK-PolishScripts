
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
	AI_Output(self,other,"DIA_Lee_Add_04_05");	//Aaa... Dobrze, ¿e jesteœ.
	AI_Output(other,self,"DIA_Lee_Add_15_06");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Lee_Add_04_07");	//Zobacz, co znalaz³em w starej kaplicy.
	b_giveinvitems(self,other,itru_teleportfarm,1);
	AI_Output(self,other,"DIA_Lee_Add_04_08");	//To magiczna runa. Jeœli siê nie mylê, przeniesie ciê z powrotem na tê farmê.
	AI_Output(self,other,"DIA_Lee_Add_04_09");	//Pomyœla³em, ¿e mo¿e ci siê przydaæ.
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
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Masz pieni¹dze dla Onara?
	if(b_gettotalpetzcounter(self) > LEE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//Ostrzega³em ciê, ¿ebyœ nie robi³ nic g³upiego.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Onar dowiedzia³ siê, ¿e trochê w miêdzyczasie nabroi³eœ.
		if(LEE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Teraz chce wiêcej pieniêdzy.
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
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//Myœla³em, ¿e jesteœ m¹drzejszy.
		};
	}
	else if(b_getgreatestpetzcrime(self) < LEE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//No to mam dla ciebie dobr¹ wiadomoœæ.
		if(LEE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Wygl¹da na to, ¿e nie uchowa³ siê ¿aden œwiadek morderstwa.
		};
		if((LEE_LASTPETZCRIME == CRIME_THEFT) || ((LEE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Nikt nie chce ju¿ zeznawaæ, ¿e widzia³ ciê podczas kradzie¿y.
		};
		if((LEE_LASTPETZCRIME == CRIME_ATTACK) || ((LEE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//Nie ma œwiadków, którzy WIDZIELI, jak pobi³eœ tego wieœniaka.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Wygl¹da na to, ¿e wszystkie zarzuty wobec ciebie zosta³y wycofane.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//Jest to jakiœ sposób na wypl¹tanie siê z tarapatów.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Tak czy siak - nie musisz ju¿ nic p³aciæ.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//Tylko na przysz³oœæ lepiej uwa¿aj!
			LEE_SCHULDEN = 0;
			LEE_LASTPETZCOUNTER = 0;
			LEE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Jedno jest pewne: i tak musisz zap³aciæ grzywnê.
			b_say_gold(self,other,LEE_SCHULDEN);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//No i co?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_lee_pmschulden);
		Info_ClearChoices(dia_lee_petzmaster);
		Info_AddChoice(dia_lee_pmschulden,"Nie mam dostatecznie du¿o z³ota!",dia_lee_petzmaster_paylater);
		Info_AddChoice(dia_lee_pmschulden,"Ile to mia³o byæ?",dia_lee_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
		{
			Info_AddChoice(dia_lee_pmschulden,"Chcê zap³aciæ grzywnê!",dia_lee_petzmaster_paynow);
		};
	};
};

func void dia_lee_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Ile mam zap³aciæ?
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_pmschulden,"Nie mam dostatecznie du¿o z³ota!",dia_lee_petzmaster_paylater);
	Info_AddChoice(dia_lee_pmschulden,"Ile to mia³o byæ?",dia_lee_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_pmschulden,"Chcê zap³aciæ grzywnê!",dia_lee_petzmaster_paynow);
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
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Kto ciê tu do cholery... To TY jesteœ tym nowym, który stwarza³ tyle k³opotów?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//S³ysza³em od Gorna, ¿e wci¹¿ ¿yjesz.. ale ¿e tu przyszed³eœ... mniejsza z tym...
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Dobrze, ¿e przyszed³eœ do mnie, zanim sytuacja sta³a siê naprawdê paskudna.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//Najemnicy to twarde sztuki, a ch³opi te¿ nie dadz¹ sobie w kaszê dmuchaæ. Nie mo¿esz tak po prostu zabijaæ kogo popadnie.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		LEE_SCHULDEN = LEE_SCHULDEN + 500;
		if((PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//Nie wspominaj¹c ju¿ o twoich pozosta³ych wyczynach.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//Jeœli chcesz, mogê ci pomóc wydostaæ siê z tego bagna...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//...ale to ciê bêdzie kosztowaæ. Onar to chciwy cz³owiek, a sprawê mo¿na za³atwiæ tylko wtedy, jeœli ON przymknie na ni¹ oko.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Dobrze, ¿e siê spotykamy. Podobno coœ st¹d ukrad³eœ.
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//I poturbowa³eœ paru wieœniaków.
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//I zabi³eœ kilka owiec.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//Nie mo¿esz tu odstawiaæ takich numerów. Onar naciska na mnie, ¿ebym wreszcie rozliczy³ siê z winowajc¹.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//Wniosek: ty p³acisz, Onar chowa z³oto do kieszeni i wszyscy zapominaj¹ o sprawie.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Gdybyœ wda³ siê w bójkê z najemnikami, nie ma sprawy...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//...ale jak ruszysz wieœniaka, od razu pobiegnie na skargê do Onara. A potem ja muszê coœ z tym zrobiæ.
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Nie mówiê nawet, jak siê Onar wkurza, kiedy ktoœ zabije parê owiec.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Musisz wysup³aæ parê groszy. Pieni¹dze zgarnie Onar, ale potem wszyscy zapomn¹ o sprawie.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Onar p³aci mi za ochronê farmy. A to oznacza te¿ ochronê owiec.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Musisz zap³aciæ mu odpowiednie odszkodowanie.
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
	Info_AddChoice(dia_lee_petzmaster,"Nie mam dostatecznie du¿o z³ota!",dia_lee_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_petzmaster,"Chcê zap³aciæ grzywnê!",dia_lee_petzmaster_paynow);
	};
};

func void dia_lee_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Chcê zap³aciæ grzywnê!
	b_giveinvitems(other,self,itmi_gold,LEE_SCHULDEN);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//M¹dry ch³opiec. Dopilnujê, ¿eby pieni¹dze trafi³y do Onara. Sprawê mo¿emy uznaæ za za³atwion¹.
	b_grantabsolution(LOC_FARM);
	LEE_SCHULDEN = 0;
	LEE_LASTPETZCOUNTER = 0;
	LEE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_lee_petzmaster);
	Info_ClearChoices(dia_lee_pmschulden);
};

func void dia_lee_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//Nie mam tyle pieniêdzy!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//No to postaraj siê je zdobyæ, i to szybko!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Tylko nie próbuj okradaæ kogoœ na farmie! Jeœli ciê z³api¹, wpadniesz w gówno po uszy.
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
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Kto ciê tu do diab³a... TY?! Co ty tu robisz? Myœla³em, ¿e nie ¿yjesz!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//Sk¹d to przypuszczenie?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Gorn powiedzia³, ¿e to ty zniszczy³eœ Barierê.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Tak, to prawda.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//No, no. Kto by pomyœla³, ¿e wyjdziesz z tego ca³o. Co ciê tu sprowadza? Nie wpad³eœ chyba powspominaæ dawnych dziejów?
};


instance DIA_LEE_PALADINE(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_paladine_condition;
	information = dia_lee_paladine_info;
	permanent = FALSE;
	description = "Muszê koniecznie porozmawiaæ z paladynami w mieœcie...";
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
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Muszê koniecznie porozmawiaæ z paladynami w mieœcie. Pomo¿esz mi jakoœ siê do nich dostaæ?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//A co ciê tak ci¹gnie do paladynów?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//To d³uga historia...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//Mam mnóstwo czasu.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//Xardas wys³a³ mnie z kolejn¹ misj¹. Mam zdobyæ potê¿ny amulet zwany Okiem Innosa.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Czyli dalej kumplujesz siê z tym nekromant¹? Rozumiem. A amulet maj¹ paladyni, tak?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//O ile mi wiadomo - tak.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Pomogê ci dostaæ siê do paladynów, ale najpierw musisz zostaæ jednym z nas.
};


instance DIA_LEE_PALADINEHOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_paladinehow_condition;
	information = dia_lee_paladinehow_info;
	permanent = FALSE;
	description = "W jaki sposób mo¿esz mi pomóc w skontaktowaniu siê z paladynami?";
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
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//W jaki sposób mo¿esz mi pomóc w skontaktowaniu siê z paladynami?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Zaufaj mi. Mam plan, i myœlê, ¿e siê do niego znakomicie nadajesz...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Zaprowadzê ciê do paladynów, a ty wyœwiadczysz mi drobn¹ przys³ugê. Ale najpierw musisz do nas do³¹czyæ!
};


instance DIA_LEE_LEESPLAN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leesplan_condition;
	information = dia_lee_leesplan_info;
	permanent = FALSE;
	description = "Co ty tu w³aœciwie robisz?";
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
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//Co ty tu w³aœciwie robisz?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Proste: kombinujê, jak nas wyrwaæ z tej przeklêtej wyspy.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Onar wynaj¹³ nas, byœmy bronili tej farmy, i w³aœnie to zamierzamy robiæ.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Ale nie tylko dla pieniêdzy! Pomagaj¹c ch³opom, odcinamy miasto od dostaw ¿ywnoœci.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//A im bardziej paladyni zg³odniej¹, tym chêtniej wys³uchaj¹ mojej propozycji ugody.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Wielka szkoda, ¿e musia³eœ siê spikn¹æ akurat z nimi.
	};
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//A jak bêdzie wygl¹daæ twoja propozycja?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//Najogólniej mówi¹c: bêdziemy siê domagaæ zwolnienia i prawa powrotu na kontynent. Szczegó³y poznasz, gdy nadejdzie odpowiednia pora.
};


instance DIA_LEE_WANNAJOIN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_wannajoin_condition;
	information = dia_lee_wannajoin_info;
	permanent = FALSE;
	description = "Chcê do was do³¹czyæ!";
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
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//Chcê do was do³¹czyæ!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Mia³em nadziejê, ¿e to powiesz! Przyda mi siê ka¿dy pewny cz³owiek.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//Ostatni najemnicy, których przyj¹³em, narobili tylko k³opotów!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//W zasadzie mo¿esz zaczynaæ od zaraz. Chocia¿... musimy najpierw wyjaœniæ parê spraw, ale to nic wielkiego...
};


instance DIA_LEE_CLEARWHAT(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_clearwhat_condition;
	information = dia_lee_clearwhat_info;
	permanent = FALSE;
	description = "Co dok³adnie mam 'wyjaœniæ', ¿eby móc do was do³¹czyæ?";
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
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//Co dok³adnie mam 'wyjaœniæ', ¿eby móc do was do³¹czyæ?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Naszym szefem jest Onar, zarz¹dca tych ziem. Mo¿esz zostaæ na farmie tylko wtedy, jeœli on siê na to zgodzi.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//No i s¹ jeszcze ch³opcy. Mogê ciê przyj¹æ, jeœli wstawi siê za tob¹ wiêkszoœæ najemników.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Tylko nie idŸ do Onara, zanim wszystko siê nie wyjaœni. To bardzo niecierpliwy cz³owiek...
	Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
	b_logentry(TOPIC_BECOMESLD,"Aby móc zostaæ najemnikiem, muszê przekonaæ do tego pomys³u pozosta³ych najemników i uzyskaæ zgodê Onara.");
};


instance DIA_LEE_OTHERSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 7;
	condition = dia_lee_othersld_condition;
	information = dia_lee_othersld_info;
	permanent = FALSE;
	description = "Jak mam przekonaæ najemników, ¿eby mnie poparli?";
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
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Jak mam przekonaæ najemników, ¿eby mnie poparli?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//Najlepiej udowodnij im, ¿e nadajesz siê do tej roboty.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Pogadaj z Torlofem. Zwykle krêci siê gdzieœ przed domem. On podda ciê próbie.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Jeœli j¹ przejdziesz, bêdziesz ju¿ prawie jednym z nas.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//Torlof powie ci wszystko, co musisz wiedzieæ.
	b_logentry(TOPIC_BECOMESLD,"Aby móc zostaæ najemnikiem, muszê poddaæ siê próbie Torlofa i zyskaæ szacunek pozosta³ych najemników.");
};


instance DIA_ADDON_LEE_RANGER(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_addon_lee_ranger_condition;
	information = dia_addon_lee_ranger_info;
	description = "Co wiesz o Wodnym Krêgu?";
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
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//Co wiesz o Wodnym Krêgu?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//Mo¿na siê by³o domyœliæ... To nie twoja sprawa.
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Ej¿e. Powiedz mi!
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//Nie dotyczy mnie to bezpoœrednio - wiem tylko, ¿e to jakaœ tajna gildia, za któr¹ stoj¹ Magowie Wody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Od chwili upadku Bariery nie obowi¹zuje mnie ju¿ umowa z Magami Wody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Oczywiœcie spróbujê ci pomóc, jeœli czegokolwiek ci potrzeba. Nie mam jednak zbyt wiele czasu - muszê siê troszczyæ przede wszystkim o swoje sprawy.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//Jeœli chcesz zdobyæ wiêcej informacji o tym krêgu, to pogadaj z Cordem. On nale¿y do tej organizacji, o ile mi wiadomo.
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
	description = "Jestem gotowy, by do was do³¹czyæ!";
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
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Jestem gotowy, by do was do³¹czyæ!
	if(LEE_PROBEOK == FALSE)
	{
		if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Nie przeszed³eœ jeszcze testu Torlofa.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Czyli przeszed³eœ ju¿ próbê Torlofa?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Tak.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//Bardzo dobrze.
			LEE_PROBEOK = TRUE;
		};
	};
	if((LEE_PROBEOK == TRUE) && (LEE_STIMMENOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//Co s¹dz¹ o tobie pozostali najemnicy?
		if(TORLOF_GENUGSTIMMEN == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Nie jestem pewien, czy wystarczaj¹co wielu z nich jest po mojej stronie.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//No to pogadaj z Torlofem. On wie o wszystkim, o czym siê mówi na farmie.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Wiêkszoœæ z nich jest po mojej stronie.
			LEE_STIMMENOK = TRUE;
		};
	};
	if((LEE_STIMMENOK == TRUE) && (LEE_ONAROK == FALSE))
	{
		if(ONAR_APPROVED == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//W takim razie idŸ do Onara. Ja ju¿ z nim rozmawia³em.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//Ale wynagrodzenie musisz sam sobie wynegocjowaæ.
			LEE_SENDTOONAR = TRUE;
			b_logentry(TOPIC_BECOMESLD,"Teraz potrzebujê tylko zgody Onara.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Rozmawia³eœ z Onarem?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Tak. Zgodzi³ siê.
			LEE_ONAROK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//No to witamy na pok³adzie!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Masz tu przyzwoity pancerz. Przyda ci siê.
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
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Cieszê siê, ¿e jesteœ z nami.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//Mam ju¿ dla ciebie pierwsze zadanie.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//Chodzi o paladynów. Pora, byœ z³o¿y³ im wizytê.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//I tak chcia³eœ tam iœæ, nie?
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
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Widzê, ¿e wst¹pi³eœ na s³u¿bê do paladynów.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//By³eœ w klasztorze? Wszystkiego bym siê spodziewa³, tylko nie tego.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//Có¿, najemnikiem ju¿ raczej nie zostaniesz.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Ale kto wie, mo¿e móg³byœ mi wyœwiadczyæ przys³ugê czy dwie... albo ja tobie...
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Tak czy siak - ¿yczê ci powodzenia.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//Tylko nie próbuj ze mn¹ ¿adnych numerów, jasne?
};


instance DIA_LEE_TOHAGEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_tohagen_condition;
	information = dia_lee_tohagen_info;
	permanent = FALSE;
	description = "Jak mam siê teraz dostaæ do paladynów?";
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
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//Jak mam siê teraz dostaæ do paladynów?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//To proste. Zaniesiesz im moj¹ propozycjê pokojow¹.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Znam Lorda Hagena, dowódcê paladynów, jeszcze z królewskiej armii.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//Wiem, co sobie teraz myœli: ma zbyt ma³o ludzi. Przyjmie wiêc moje warunki. A w ka¿dym razie na pewno ciê wys³ucha.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Napisa³em do niego list. Masz.
	b_giveinvitems(self,other,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//Dziêki niemu dopuszcz¹ ciê przed dowódcê paladynów.
	MIS_LEE_FRIEDENSANGEBOT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FRIEDEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FRIEDEN,LOG_RUNNING);
	b_logentry(TOPIC_FRIEDEN,"Lee wys³a³ mnie z ofert¹ pokojow¹ do Lorda Hagena. W ten sposób dotrê do paladynów.");
};


instance DIA_LEE_ANGEBOTSUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_angebotsuccess_condition;
	information = dia_lee_angebotsuccess_info;
	permanent = FALSE;
	description = "Zanios³em twoj¹ propozycjê Lordowi Hagenowi.";
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
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Zanios³em twoj¹ propozycjê Lordowi Hagenowi.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//I co odpowiedzia³?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//Jest sk³onny u³askawiæ ciebie, ale nie twoich ludzi.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Nadêty g³upiec. Moi ludzie to baranki w porównaniu z niektórymi oprychami z królewskiej armii.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Co teraz zrobisz?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Znajdê jakiœ inny sposób... Jeœli bêdzie trzeba, uprowadzê królewski okrêt. Muszê trochê pomyœleæ.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Nie zostawiê moich ludzi w tym bagnie. To wykluczone.
	MIS_LEE_FRIEDENSANGEBOT = LOG_SUCCESS;
};


instance DIA_LEE_BACKGROUND(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_background_condition;
	information = dia_lee_background_info;
	permanent = FALSE;
	description = "Dlaczego tak bardzo chcesz siê dostaæ na kontynent?";
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
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Dlaczego tak bardzo chcesz siê dostaæ na kontynent?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Jak zapewne pamiêtasz, s³u¿y³em kiedyœ w królewskiej armii, w randze genera³a.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Ale grupa dworskich przydupasów postanowi³a siê mnie pozbyæ, bo za du¿o wiedzia³em.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Wtr¹cili mnie do Kolonii, a Król nawet nie kiwn¹³ palcem, ¿eby ich powstrzymaæ.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//Mia³em mnóstwo czasu, ¿eby to sobie przemyœleæ.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//Zamierzam siê zemœciæ.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//Na Królu?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//Tak, na Królu i na wszystkich dwujêzycznych pochlebcach. Zap³ac¹ mi za piek³o, przez które musia³em przejœæ!
};


instance DIA_LEE_RESCUEGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_rescuegorn_condition;
	information = dia_lee_rescuegorn_info;
	permanent = FALSE;
	description = "Zamierzam wyruszyæ do Górniczej Doliny.";
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
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Zamierzam wyruszyæ do Górniczej Doliny.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Wiedzia³em, ¿e nie wysiedzisz za d³ugo na farmie!
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//W takim razie rozejrzyj siê trochê za Gornem. Paladyni zawlekli go z powrotem do Kolonii.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Gorn to równy facet. Przyda³by mi siê tutaj ktoœ taki jak on. Gdybyœ mia³ okazjê go uwolniæ - zrób to.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_LEE_SUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_success_condition;
	information = dia_lee_success_info;
	permanent = FALSE;
	description = "Uwolni³em Gorna.";
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
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Uwolni³em Gorna.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Tak, ju¿ mi mówi³eœ. Dobra robota.
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Ten facet jest wiêcej wart, ni¿ Sylvio i jego ch³opcy razem wziêci.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_ABOUTGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_aboutgorn_condition;
	information = dia_lee_aboutgorn_info;
	permanent = FALSE;
	description = "Rozmawia³eœ z Gornem? Co siê z nim dzieje?";
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
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Rozmawia³eœ z Gornem? Co siê z nim dzieje?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Chyba go jeszcze pamiêtasz?
	Info_ClearChoices(dia_lee_aboutgorn);
	Info_AddChoice(dia_lee_aboutgorn,"Niech pomyœlê...",dia_lee_aboutgorn_who);
	Info_AddChoice(dia_lee_aboutgorn,"Jasne.",dia_lee_aboutgorn_yes);
};

func void dia_lee_aboutgorn_yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Jasne.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Z³apali go paladyni i wys³ali z powrotem do Górniczej Doliny, w karnym konwoju.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Gdyby drogi do Doliny nie roi³y siê od paladynów i orków, wys³a³bym paru moich ch³opców, ¿eby go wyci¹gnêli.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Ale nie mogê ryzykowaæ. Szkoda cz³owieka.
	Info_ClearChoices(dia_lee_aboutgorn);
};

func void dia_lee_aboutgorn_who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Niech pomyœlê...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Du¿y, ciemnow³osy, z wielkim toporem... Pomóg³ ci odbiæ nasz¹ kopalniê w Kolonii.
};


instance DIA_LEE_WEGENBULLCO(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_wegenbullco_condition;
	information = dia_lee_wegenbullco_info;
	permanent = FALSE;
	description = "Onar straci³ w³aœnie kilka owiec. Wszystko przez Bullka...";
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
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//Onar straci³ w³aœnie kilka owiec. Wszystko przez Bullka...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//A daj mi spokój z tym gównem! Mam doœæ k³opotów i bez tego.
	if((BULLCO_SCHARF == TRUE) && !Npc_IsDead(bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//Ja te¿. Bullko chyba za mn¹ nie przepada. Chce, ¿ebym opuœci³ farmê...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//I co z tego? Postaw mu siê.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//I powiedz mu, ¿e jak siê nie uspokoi, potr¹cê koszt zaginionych owiec z jego wyp³aty.
	};
};


instance DIA_LEE_REPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_report_condition;
	information = dia_lee_report_info;
	permanent = TRUE;
	description = "Wracam z Górniczej Doliny...";
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
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Wracam z Górniczej Doliny. Tamtejszy zamek zosta³ zaatakowany przez smoki!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//A wiêc to prawda! Lares wspomina³ coœ o smokach, które mia³y siê krêciæ wokó³ miasta... Prawdê mówi¹c, nie dawa³em temu wiary...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//Co siê sta³o z paladynami?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Rozbici. Zdziesi¹tkowani.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//I BARDZO dobrze! Mo¿e Lord Hagen przemyœli jeszcze raz moj¹ propozycjê...
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//A jeœli nie... Znajdziemy inny sposób na wydostanie siê st¹d...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//Œwietnie! Mo¿e Lord Hagen wyprawi siê teraz do Górniczej Doliny ze swoimi ludŸmi...
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//Im mniej paladynów zostanie na miejscu, tym lepiej.
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
	description = "Przyda³aby mi siê lepsza zbroja.";
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
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//Przyda³aby mi siê lepsza zbroja.
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//Wype³ni³eœ swoje zadanie.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//Mam dla ciebie solidniejsz¹ zbrojê. Oczywiœcie, jeœli masz odpowiedni¹ iloœæ kruszcu.
		LEE_GIVE_SLD_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//Torlof dosta³ od Onara pewne zlecenie, które powinno zostaæ za³atwione jakiœ czas temu.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//Zajmij siê tym, to porozmawiamy o lepszej zbroi.
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
	description = "Kup œredni pancerz najemnika. Ochrona (broñ i strza³y) 50, 1000 sztuk z³ota.";
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
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Daj mi jak¹œ zbrojê.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Proszê, to dobry pancerz.
		CreateInvItems(other,itar_sld_m,1);
		AI_EquipArmor(other,itar_sld_m);
		LEE_SLDMGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Ale ja nie rozdajê prezentów. Najpierw chcê zobaczyæ z³oto!
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
	description = "Nie masz dla mnie jakiejœ lepszej zbroi?";
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
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//Nie masz dla mnie jakiejœ lepszej zbroi?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//Jasne, ¿e mam!
};


var int lee_sldhgiven;

instance DIA_LEE_BUYARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorh_condition;
	information = dia_lee_buyarmorh_info;
	permanent = TRUE;
	description = "Kup ciê¿ki pancerz najemnika. Ochrona (broñ i strza³y) 80, 2500 sztuk z³ota.";
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
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Daj mi ciê¿k¹ zbrojê.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Proszê. To solidny pancerz. Sam taki noszê.
		CreateInvItems(other,itar_sld_h,1);
		AI_EquipArmor(other,itar_sld_h);
		LEE_SLDHGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//Znasz zasady. Najpierw z³oto.
	};
};


instance DIA_LEE_RICHTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richter_condition;
	information = dia_lee_richter_info;
	permanent = FALSE;
	description = "Nie masz dla mnie ¿adnej roboty?";
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
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//Nie masz dla mnie ¿adnej roboty?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Ci¹gle ci ma³o, co? I tak siedzisz w niez³ym bagnie. Czego jeszcze chcesz?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Kolejnego zlecenia. W koñcu jestem najemnikiem, prawda?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//W porz¹dku. Mam coœ w sam raz dla ciebie.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Mam pewien rachunek do wyrównania z miejskim sêdzi¹. Najchêtniej sam bym siê tym zaj¹³...
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//...ale paladyni nie dopuszcz¹ mnie do jego domu nawet na odleg³oœæ celnego rzutu kamieniem.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Sprawa jest doœæ delikatna, wiêc uwa¿aj: pójdziesz do sêdziego i zaoferujesz mu swoje us³ugi.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Spróbujesz zdobyæ jego zaufanie i wykonasz dla niego kilka szemranych zleceñ, póki nie znajdziesz na niego jakiegoœ haka.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Ten wieprz tapla siê w takim bagnie, ¿e nie powinno to byæ trudne.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Tylko przynieœ mi SOLIDNE dowody. Chcê, ¿eby po ich ujawnieniu facet trafi³ do paki na resztê swojego ¿ycia.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//I pod ¿adnym pozorem go nie zabijaj! To by by³o zbyt proste. On ma najpierw trochê pocierpieæ, zrozumiano?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//I jak myœlisz? Dasz radê?
	Log_CreateTopic(TOPIC_RICHTERLAKAI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RICHTERLAKAI,LOG_RUNNING);
	b_logentry(TOPIC_RICHTERLAKAI,"Lee chce, abym znalaz³ jakieœ dowody przeciwko sêdziemu Khorinis. Muszê tylko zaoferowaæ temu ostatniemu swoje us³ugi i mieæ oczy szeroko otwarte.");
	MIS_LEE_JUDGERICHTER = LOG_RUNNING;
	Info_ClearChoices(dia_lee_richter);
	Info_AddChoice(dia_lee_richter,"Wykluczone.",dia_lee_richter_nein);
	Info_AddChoice(dia_lee_richter,"Nie ma sprawy. Ile?",dia_lee_richter_wieviel);
};

func void dia_lee_richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Nie ma sprawy. Ile?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Twoja nagroda zale¿y od tego, co mi przyniesiesz, wiêc dobrze siê postaraj.
	Info_ClearChoices(dia_lee_richter);
};

func void dia_lee_richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Wykluczone. Nie bêdê siê korzy³ przed ¿adn¹ œwini¹.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//No, no. Nie unoœ mi siê tu honorem. To on kaza³ ciê zamkn¹æ i wrzuciæ za Barierê, pamiêtasz?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Zreszt¹, rób jak chcesz. Moim zdaniem pope³niasz b³¹d.
	Info_ClearChoices(dia_lee_richter);
};


instance DIA_LEE_RICHTERBEWEISE(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richterbeweise_condition;
	information = dia_lee_richterbeweise_info;
	description = "Mam dla ciebie dowody obci¹¿aj¹ce sêdziego.";
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
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Mam dla ciebie dowody obci¹¿aj¹ce sêdziego.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Serio? Co znalaz³eœ?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Pan sêdzia wynaj¹³ kilku oprychów, by zastraszyli gubernatora Khorinis.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Gdy wykonali brudn¹ robotê, kaza³ ich aresztowaæ i odebra³ im swoje z³oto.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Mam przy sobie pismo, w którym sêdzia opisuje bandziorom ich zadanie.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Poka¿.
	b_giveinvitems(other,self,itwr_richterkomprobrief_mis,1);
	b_usefakescroll();
	if(Npc_IsDead(richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//Nareszcie! No, panie sêdzio - pora wyrównaæ rachunki. Dobra robota!
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Zas³u¿y³eœ na sowite wynagrodzenie. Proszê, oto twoja nagroda.
		CreateInvItems(self,itmi_gold,500);
		b_giveinvitems(self,other,itmi_gold,500);
		MIS_LEE_JUDGERICHTER = LOG_SUCCESS;
		b_giveplayerxp(XP_JUDGERICHTER);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//Tylko nikomu ani s³owa, jasne?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//To œwietnie, ale sprawa sama siê rozwi¹za³a. Sêdzia nie ¿yje.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Jakiœ idiota go rozwali³. Ech, trudno. Nie bêdê po nim p³aka³.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Masz tu parê monet. Na wy¿sz¹ nagrodê nie mo¿esz teraz liczyæ.
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
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Ach, ju¿ s³ysza³eœ? Sukinsyny zamknê³y go w pace!
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Jakbym nie mia³ doœæ problemów ze swoimi ludŸmi, teraz muszê jeszcze zaj¹æ siê paladynami!
	};
};


instance DIA_LEE_DOABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_doaboutbennet_condition;
	information = dia_lee_doaboutbennet_info;
	permanent = FALSE;
	description = "Co zamierzasz zrobiæ w sprawie Benneta?";
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
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Co zamierzasz zrobiæ w sprawie Benneta?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Jeszcze nie wiem. Moi ch³opcy najchêtniej pobiegliby od razu do miasta, ¿eby wbiæ Hagenowi zêby do gard³a.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//Na szczêœcie mamy za ma³o ludzi, ¿eby przeprowadziæ tak¹ operacjê. Prawdê mówi¹c, to nie w moim stylu.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//A wiêc zamierzasz tu czekaæ na rozwój wydarzeñ?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//W ¿adnym wypadku!
	b_logentry(TOPIC_RESCUEBENNET,"Nie zdo³am na czas udowodniæ niewinnoœci Benneta. Ludzie Lee nie zawahaj¹ siê zaatakowaæ miasta i odbiæ Benneta si³¹.");
	if(!Npc_IsDead(lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Lares wci¹¿ siedzi w mieœcie i próbuje wykombinowaæ, jak wyci¹gn¹æ Benneta.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//Póki co, próbujê jakoœ utrzymaæ moich ludzi w ryzach. Mam tylko nadziejê, ¿e Lares siê poœpieszy.
	};
	if(!Npc_IsDead(buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//A, zanim zapomnê! Buster chce z tob¹ porozmawiaæ. Nie chcia³ mi powiedzieæ, o co chodzi. Mo¿e powinieneœ do niego zajrzeæ?
	};
};


instance DIA_LEE_CANHELPYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_canhelpyou_condition;
	information = dia_lee_canhelpyou_info;
	permanent = FALSE;
	description = "Mogê ci jakoœ pomóc w tej sprawie z Bennetem?";
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
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Mogê ci jakoœ pomóc w tej sprawie z Bennetem?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Jasne. Odrobina sprytu i rozs¹dku na pewno nie zaszkodzi.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Innos œwiadkiem, ¿e pêta siê tu wystarczaj¹co wielu idiotów.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//IdŸ do miasta i postaraj siê wyci¹gn¹æ stamt¹d Benneta.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Tylko siê pospiesz! Nie wiem, jak d³ugo zdo³am utrzymaæ moich ludzi w ryzach!
};


var int dia_lee_anynews_onetime;

instance DIA_LEE_ANYNEWS(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_anynews_condition;
	information = dia_lee_anynews_info;
	permanent = TRUE;
	description = "Jakieœ wieœci w sprawie Benneta?";
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
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Jakieœ wieœci w sprawie Benneta?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Wygl¹da na to, ¿e nie poturbowali go za bardzo w wiêzieniu.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Dobra robota.
		if(DIA_LEE_ANYNEWS_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_LEE_ANYNEWS_ONETIME = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Nie, nadal wiemy za ma³o.
	};
};


instance DIA_LEE_SYLVIO(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_sylvio_condition;
	information = dia_lee_sylvio_info;
	description = "Co siê tu dzia³o?";
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
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Co siê tu dzia³o?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Ten sukinsyn, Sylvio, dowiedzia³ siê o smokach w Górniczej Dolinie i namiesza³ w g³owach wszystkim na farmie.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Przekonywa³ ch³opaków, ¿eby poszli z nim do Doliny. Obiecywa³ bogactwa, s³awê, zaszczyty...
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Niektórzy nie chcieli go nawet s³uchaæ, ale znalaz³o siê paru idiotów, którzy dali siê nabraæ.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Kazali Bennetowi przygotowaæ dla siebie odpowiednie wyposa¿enie i wyruszyli w drogê.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//Ech, prawdê mówi¹c, cieszê siê, ¿e Sylvio poszed³ wreszcie do diab³a.
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
	description = "Czy mo¿esz mnie wyszkoliæ?";
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
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//Mogê ci pokazaæ, jak pos³ugiwaæ siê dwurêcznym.
	if(other.hitchance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Ale nie mam czasu, ¿eby wbijaæ ci do g³owy podstawy.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//Poducz siê trochê u kogoœ innego. Jak bêdziesz gotowy, poka¿ê ci parê ciekawych sztuczek.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//S³ysza³em, ¿e jesteœ ca³kiem niez³y, ale mogê ci pokazaæ parê nowych sztuczek.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			LEE_TEACHPLAYER = TRUE;
			Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
			b_logentry(TOPIC_SOLDIERTEACHER,"Lee nauczy mnie walki orê¿em dwurêcznym.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Wiêc jeœli chcesz, mogê ciê uczyæ. Ale to bêdzie kosztowa³o...
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Ile?
			AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 sztuk z³ota i mo¿emy zaczynaæ.
			Info_ClearChoices(dia_lee_canteach);
			Info_AddChoice(dia_lee_canteach,"To trochê za drogo.",dia_lee_canteach_no);
			if(Npc_HasItems(other,itmi_gold) >= 1000)
			{
				Info_AddChoice(dia_lee_canteach,"Umowa stoi. Oto twoje z³oto.",dia_lee_canteach_yes);
			};
		};
	};
};

func void dia_lee_canteach_no()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//To trochê za drogo.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Zastanów siê. Trudno o drugiego takiego nauczyciela jak ja.
	Info_ClearChoices(dia_lee_canteach);
};

func void dia_lee_canteach_yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Umowa stoi. Oto twoje z³oto.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//Œwietnie. Nie po¿a³ujesz tego.
	b_giveinvitems(other,self,itmi_gold,1000);
	LEE_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_lee_canteach);
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Lee nauczy mnie walki orê¿em dwurêcznym.");
};


instance DIA_LEE_TEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_teach_condition;
	information = dia_lee_teach_info;
	permanent = TRUE;
	description = "Dobra. Bierzmy siê do nauki.";
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
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Dobra. Bierzmy siê do nauki.
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Teraz jesteœ prawdziwym mistrzem walki dwurêcznym orê¿em.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//Nie potrzebujesz ju¿ nauczyciela.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Teraz jesteœ prawdziwym mistrzem walki dwurêcznym orê¿em.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//Nie potrzebujesz ju¿ nauczyciela.
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
	description = "Jaszczuroludzie roznosz¹ smocze jaja po ca³ym kraju.";
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
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Jaszczuroludzie roznosz¹ smocze jaja po ca³ym kraju.
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//Mo¿na siê by³o tego spodziewaæ. Najwy¿szy czas, ¿ebyœmy siê st¹d wynieœli.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//To co mam z nimi zrobiæ?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Rozwaliæ je, a co innego?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Mo¿e skorupy da siê wykorzystaæ do sporz¹dzania zbroi, albo czegoœ w tym stylu.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Wygl¹daj¹ na doœæ solidne. Pogadaj o tym z Bennetem.
		b_logentry(TOPIC_DRACHENEIER,"Lee nie zdo³a³ zrobiæ zbyt wiele ze smoczym jajem. Wys³a³ mnie do kowala Benneta.");
	};
};


instance DIA_LEE_KAP4_PERM(C_INFO)
{
	npc = sld_800_lee;
	nr = 49;
	condition = dia_lee_kap4_perm_condition;
	information = dia_lee_kap4_perm_info;
	permanent = TRUE;
	description = "Co s³ychaæ na farmie?";
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
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Co s³ychaæ na farmie?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//Có¿, odk¹d odszed³ Sylvio, mamy tu wzglêdny spokój.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//To chyba dobrze?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Niby tak, ale pracy nam przez to nie uby³o. Moi ch³opcy marudz¹ coraz bardziej, bo teraz musz¹ pracowaæ za siebie i za ludzi, których wyci¹gn¹³ Sylvio.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Ale to ju¿ mój problem. Jakoœ sobie poradzê.
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
	description = "Wiesz mo¿e, jak móg³bym przej¹æ okrêt paladynów?";
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
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Wiesz mo¿e, jak móg³bym przej¹æ okrêt paladynów?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//A myœlisz, ¿e siedzia³bym tu, gdybym wiedzia³, jak to zrobiæ? Ten okrêt jest lepiej strze¿ony ni¿ konwoje z rud¹ w Starym Obozie.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Musi byæ jakiœ sposób, ¿eby dostaæ siê na pok³ad.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Dostanie siê na pok³ad to akurat pestka.
	Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
	if((MIS_LEE_JUDGERICHTER == LOG_SUCCESS) && (Npc_IsDead(richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Przecie¿ mamy w garœci sêdziego! IdŸ do niego i wyduœ odpowiednie pismo uprawniaj¹ce do zajêcia okrêtu.
		MIS_RICHTERSPERMISSIONFORSHIP = LOG_RUNNING;
		b_logentry(TOPIC_SHIP,"Lee uwa¿a, ¿e aby dostaæ siê na statek, najlepiej by³oby mieæ upowa¿nienie od sêdziego. W¹tpiê jednak, aby ten ostatni wyda³ mi przepustkê z w³asnej, nieprzymuszonej woli.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//Mam tu sfa³szowane pe³nomocnictwo. Dziêki niemu stra¿nicy powinni wpuœciæ ciê na pok³ad.
		b_logentry(TOPIC_SHIP,"Poczciwy Lee, zawsze mo¿na na nim polegaæ. Podrobi³ list, dziêki któremu zostanê wpuszczony na okrêt paladynów.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Ale to jeszcze nie wszystko. Musisz najpierw znaleŸæ kapitana, za³ogê, i takie tam.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//Sam okrêt to za ma³o. Jest jeszcze mnóstwo spraw, które trzeba za³atwiæ.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	Info_ClearChoices(dia_lee_getship);
	Info_AddChoice(dia_lee_getship,DIALOG_BACK,dia_lee_getship_back);
	Info_AddChoice(dia_lee_getship,"Kogo powinienem wzi¹æ do za³ogi?",dia_lee_getship_crew);
	if(Npc_IsDead(torlof) == FALSE)
	{
		Info_AddChoice(dia_lee_getship,"Znasz kogoœ, kto móg³by stan¹æ za sterem statku?",dia_lee_getship_torlof);
	};
};

func void dia_lee_getship_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Znasz kogoœ, kto móg³by stan¹æ za sterem statku?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Jeœli dobrze pamiêtam, Torlof kiedyœ sporo ¿eglowa³. On bêdzie wiedzia³ co i jak.
	b_logentry(TOPIC_CAPTAIN,"Torlof to stary wilk morski, mo¿e zechce zostaæ kapitanem na moim statku.");
};

func void dia_lee_getship_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//Kogo powinienem wzi¹æ do za³ogi?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//To ju¿ twoja decyzja. Na twoim miejscu bra³bym tylko ludzi, którym móg³bym zaufaæ. Masz wystarczaj¹c¹ iloœæ zaufanych ludzi?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Jeœli potrzebujesz kowala, pogadaj koniecznie z Bennetem. Lepszego ni¿ on nie znajdziesz.
	b_logentry(TOPIC_CREW,"Lee nie pomóg³ mi zbytnio w skompletowaniu za³ogi, jednak poradzi³ mi, abym wzi¹³ jedynie osoby godne zaufania. Powinienem siê udaæ do Benneta, mo¿e on bêdzie zainteresowany.");
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
	description = "Sztuczka z pisemnym upowa¿nieniem zadzia³a³a!";
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
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//Sztuczka z pisemnym upowa¿nieniem zadzia³a³a! Statek nale¿y teraz do mnie. Pan sêdzia by³ bardzo... pomocny.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//A nie mówi³em? Wiedzia³em, ¿e ten sukinsyn jeszcze siê do czegoœ przyda.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_STEALSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stealship_condition;
	information = dia_lee_stealship_info;
	permanent = FALSE;
	description = "Zamierzam ukraœæ okrêt.";
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
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Zamierzam ukraœæ okrêt.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//A jak niby chcesz tego dokonaæ?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//To proste - pójdê na przystañ, poka¿ê im twoje papiery i zajmê statek.
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Jak chcesz. Mam nadziejê, ¿e wiesz w co siê pakujesz.
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
	description = "Pop³yniesz ze mn¹?";
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
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Pop³yniesz ze mn¹?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//¯artujesz? Jasne, ¿e tak! Mam parê rachunków do wyrównania na kontynencie.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//No i mogê ci pokazaæ kilka sztuczek w walce dwurêcznym orê¿em. Mog¹ ci siê przydaæ.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Lee chce jak najprêdzej wróciæ na kontynent. Zaoferowa³ mi swoj¹ pomoc. Z pewnoœci¹ nigdzie nie znajdê lepszego trenera.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Narazie mam ju¿ za³ogê, ale dam ci znaæ, gdyby coœ siê zwolni³o.
	}
	else
	{
		Info_ClearChoices(dia_lee_knowwhereenemy);
		Info_AddChoice(dia_lee_knowwhereenemy,"Dam ci znaæ, kiedy bêdziesz mi potrzebny.",dia_lee_knowwhereenemy_no);
		Info_AddChoice(dia_lee_knowwhereenemy,"W takim razie pakuj siê!",dia_lee_knowwhereenemy_yes);
	};
};

func void dia_lee_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//W takim razie pakuj siê!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Co? Ju¿? Teraz?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Tak, podnosimy ¿agle. Jeœli chcesz siê ze mn¹ zabraæ, przyjdŸ na przystañ. Spotkamy siê na statku.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//D³ugo czeka³em na tê chwilê. Mo¿esz na mnie liczyæ.
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
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//Dam ci znaæ, kiedy bêdziesz mi potrzebny.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//Có¿, ty wiesz najlepiej. Ale dobrych ¿o³nierzy nigdy nie za wielu.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//No, chyba ¿e to idioci pokroju Sylvio.
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
	description = "Chyba jednak mi siê nie przydasz!";
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
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//Chyba jednak mi siê nie przydasz!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Jak chcesz. Wiesz, gdzie mnie szukaæ, prawda?
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
	description = "Chyba jednak bêdê ciê potrzebowa³!";
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
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//Chyba jednak bêdê ciê potrzebowa³!
	if(LEE_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//Wiedzia³em, ¿e tak bêdzie! Do zobaczenia na statku!
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
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//Wiesz co? Niech ciê! Najpierw ka¿esz mi przyjœæ, potem mnie odsy³asz...
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

