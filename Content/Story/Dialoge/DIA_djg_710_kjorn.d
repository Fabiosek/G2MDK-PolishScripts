
instance DIA_KJORN_EXIT(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 999;
	condition = dia_kjorn_exit_condition;
	information = dia_kjorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kjorn_exit_condition()
{
	return TRUE;
};

func void dia_kjorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KJORN_HELLO(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_hello_condition;
	information = dia_kjorn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kjorn_hello_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return TRUE;
	};
};

func void dia_kjorn_hello_info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Hej, podejdŸ tu!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Czego chcesz?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//Dolina jest niebezpiecznym miejscem, bez odpowiedniego ekwipunku nie dasz tam sobie rady.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//Rozumiem, ¿e TY posiadasz w³aœciwy ekwipunek?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//Zgad³eœ. I wiesz co? Chêtnie ci go sprzedam.
};


instance DIA_KJORN_TRADE(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_trade_condition;
	information = dia_kjorn_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Co mo¿esz mi zaoferowaæ?";
};


func int dia_kjorn_trade_condition()
{
	return TRUE;
};

func void dia_kjorn_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//Co mo¿esz mi zaoferowaæ?
};


instance DIA_KJORN_SELLINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_sellinfos_condition;
	information = dia_kjorn_sellinfos_info;
	permanent = FALSE;
	description = "Czy sprzedajesz równie¿ informacje?";
};


func int dia_kjorn_sellinfos_condition()
{
	return TRUE;
};

func void dia_kjorn_sellinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//Czy sprzedajesz równie¿ informacje?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//To zale¿y. Za odpowiedni¹ cenê powiem ci wszystko, co wiem.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//Ile chcesz za informacje?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Hmmm... Sam nie wiem. 50 sztuk z³ota za ka¿d¹ udzielon¹ ci informacjê wydaje mi siê rozs¹dn¹ cen¹.
};


instance DIA_KJORN_BUYINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_buyinfos_condition;
	information = dia_kjorn_buyinfos_info;
	permanent = TRUE;
	description = "Potrzebujê paru informacji.";
};


func int dia_kjorn_buyinfos_condition()
{
	if(Npc_KnowsInfo(other,dia_kjorn_sellinfos))
	{
		return TRUE;
	};
};

func void dia_kjorn_buyinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//Potrzebujê informacji.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 sztuk z³ota!
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,"To trochê za drogo.",dia_kjorn_buyinfos_holdmoney);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"Tak, proszê.",dia_kjorn_buyinfos_givemoney);
	};
};

func void dia_kjorn_buyinfos_holdmoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//To dla mnie za drogo.
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_givemoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Proszê.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//A teraz powiedz mi...
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,DIALOG_BACK,dia_kjorn_buyinfos_back);
	if(KJORNTOLDDRAGON == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o smokach.",dia_kjorn_buyinfos_dragon1);
	}
	else if(KJORNTOLDDRAGON == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o smokach - dok³adniej.",dia_kjorn_buyinfos_dragon2);
	};
	if(KJORNTOLDCOLONY == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o Górniczej Dolinie.",dia_kjorn_buyinfos_colony1);
	}
	else if(KJORNTOLDCOLONY == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o Górniczej Dolinie - dok³adniej.",dia_kjorn_buyinfos_colony2);
	};
	if(KJORNTOLDOLDCAMP == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o zamku.",dia_kjorn_buyinfos_oldcamp1);
	};
	if(KJORNTOLDORKS == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o orkach.",dia_kjorn_buyinfos_orks1);
	}
	else if(KJORNTOLDORKS == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"...o orkach - dok³adniej.",dia_kjorn_buyinfos_orks2);
	};
};

func void dia_kjorn_buyinfos_back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//Wiesz co, zwróæ mi moje pieni¹dze, rozmyœli³em siê.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Proszê bardzo.
	b_giveinvitems(self,other,itmi_gold,50);
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//Opowiedz mi o smokach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Smoki to pradawne, niewyobra¿alnie potê¿ne istoty. Kiedyœ tysi¹ce tych stworzeñ zamieszkiwa³o ca³y œwiat.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//Jednak up³ynê³o ju¿ ponad sto lat, odk¹d widziano ostatniego smoka.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Ich krew jest gor¹ca niczym wrz¹cy olej. Jeœli spojrzysz im prosto w oczy, twoje serce obróci siê w kamieñ. Tak s³ysza³em...
	KJORNTOLDDRAGON = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//Opowiedz mi wiêcej o smokach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//Smoki ró¿ni¹ siê miêdzy sob¹.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//Niektóre z nich mog³yby pokryæ ca³y œwiat warstw¹ lodu grub¹ na kilka stóp.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Inne lubi¹ mieszkaæ na bagnach lub w wulkanach.
	b_logentry(TOPIC_DRACHENJAGD,"£owca smoków Kjorn uwa¿a, ¿e istniej¹ ró¿ne rodzaje smoków. Niektóre z nich lubi¹ zimne, wilgotne miejsca, inne wol¹ ogieñ.");
	KJORNTOLDDRAGON = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//Opowiedz mi o Górniczej Dolinie.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//Górnicza Dolina Khorinis s³ynie w ca³ym kraju ze swojej magicznej rudy.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//Mo¿na j¹ znaleŸæ tylko w tych górach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//Broñ wykuta z takiej rudy jest praktycznie niezniszczalna. Mo¿na ni¹ przeci¹æ nawet najtwardszy pancerz.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//Jeszcze parê tygodni temu ca³¹ Dolinê otacza³a magiczna Bariera. Kto raz j¹ przekroczy³, zostawa³ tam na ca³e ¿ycie.
	KJORNTOLDCOLONY = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//Opowiedz mi wiêcej o Górniczej Dolinie.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//W ci¹gu paru ostatnich dni Dolina bardzo siê zmieni³a.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//Przybyli do niej orkowie, a wraz z nimi wszelkie mo¿liwe potwory, jakie tylko mo¿na sobie wyobraziæ.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//Podobno w okolicy przebywaj¹ jacyœ myœliwi, jednak nie wiadomo nawet, czy jeszcze ¿yj¹.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//Wygl¹da to tak, jakby wszystkie stworzenia Beliara przyby³y do tej jednej Doliny.
	KJORNTOLDCOLONY = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_oldcamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//Opowiedz mi o zamku.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//Znajduje siê praktycznie w samym œrodku Górniczej Doliny.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//Kiedy jeszcze dolina by³a wykorzystywana jako wiêzienie, lokalni baronowie kontrolowali st¹d handel rud¹.
	KJORNTOLDOLDCAMP = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//Opowiedz mi o orkach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//Orkowie pojawili siê tutaj dopiero niedawno. Przynajmniej ci sprzed zamku.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//Dziwi mnie, jak dobrze s¹ zorganizowani. Orkowie przewa¿nie atakuj¹ na oœlep, niezale¿nie od okolicznoœci.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//Ci orkowie najwyraŸniej próbuj¹ zyskaæ na czasie. Czekaj¹ na coœ, nie wiemy tylko na co.
	KJORNTOLDORKS = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//Opowiedz mi wiêcej o orkach.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//Orkami dowodz¹ elitarni wojownicy. S¹ oni niezwykle silni i nosz¹ bardzo mocne zbroje. Praktycznie nie mo¿na ich pokonaæ.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//Kiedyœ widzia³em, jak jeden z nich powali³ ogromny d¹b zaledwie jednym ciosem swojego topora.
	KJORNTOLDORKS = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};


instance DIA_KJORN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_alldragonsdead_condition;
	information = dia_kjorn_alldragonsdead_info;
	permanent = FALSE;
	description = "Zabi³em wszystkie smoki!";
};


func int dia_kjorn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kjorn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//Zabi³em wszystkie smoki!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//Tak, pewnie. A ja zosta³em paladynem.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//Mog³eœ zabiæ JEDNEGO, ale WSZYSTKIE? Ciekawe kto ci w to uwierzy.
};


instance DIA_KJORN_PICKPOCKET(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 900;
	condition = dia_kjorn_pickpocket_condition;
	information = dia_kjorn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kjorn_pickpocket_condition()
{
	return c_beklauen(47,75);
};

func void dia_kjorn_pickpocket_info()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_BACK,dia_kjorn_pickpocket_back);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_PICKPOCKET,dia_kjorn_pickpocket_doit);
};

func void dia_kjorn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kjorn_pickpocket);
};

func void dia_kjorn_pickpocket_back()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
};

