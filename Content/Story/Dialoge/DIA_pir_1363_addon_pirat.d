
instance DIA_ADDON_BENCHPIRATE_EXIT(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 999;
	condition = dia_addon_benchpirate_exit_condition;
	information = dia_addon_benchpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_benchpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_benchpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BENCHPIRATE_HELLO(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 1;
	condition = dia_addon_benchpirate_hello_condition;
	information = dia_addon_benchpirate_hello_info;
	permanent = TRUE;
	description = "Co siê dzieje?";
};


func int dia_addon_benchpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_benchpirate_hello_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//Co siê dzieje?
	randy = Hlp_Random(3);
	if(GREGISBACK == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//Greg wróci³. W sam¹ porê.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//Francis powinien zorganizowaæ trochê drewna na palisadê. Nawet on da sobie z tym radê.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//Jeœli chodzi o mnie, to bandyci mog¹ sobie przychodziæ. Z kapitanem u naszego boku nic nam nie grozi.
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//Francis, szef obozu, jest zwyk³ym b³aznem. Dlatego nikt nie bierze go na powa¿nie.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//Greg ufa Francisowi, bo ten jest zbyt g³upi, ¿eby kogokolwiek oszukaæ. Ale ¿eby zaraz mianowaæ go swoj¹ praw¹ rêk¹...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//Jeœli Greg szybko nie wróci i nie zabierze mnie na kolejny rejs, dostanê choroby l¹dowej.
	};
};


instance DIA_ADDON_BENCHPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 11;
	condition = dia_addon_benchpirate_anheuern_condition;
	information = dia_addon_benchpirate_anheuern_info;
	permanent = FALSE;
	description = "Powinieneœ mi pomóc.";
};


func int dia_addon_benchpirate_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//Powinieneœ mi pomóc.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//To rozkaz Grega?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//Jasne.
};


instance DIA_ADDON_BENCHPIRATE_COMEON(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 12;
	condition = dia_addon_benchpirate_comeon_condition;
	information = dia_addon_benchpirate_comeon_info;
	permanent = TRUE;
	description = "Kanion czeka.";
};


func int dia_addon_benchpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_benchpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//Kanion czeka.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//Doskonale! Tak, wracam tam...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//Tak jest, kapitanie!
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,other);
		};
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_BENCHPIRATE_GOHOME(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 13;
	condition = dia_addon_benchpirate_gohome_condition;
	information = dia_addon_benchpirate_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};


func int dia_addon_benchpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//Bêdê czekaæ w obozie, kapitanie!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BENCHPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 14;
	condition = dia_addon_benchpirate_toofar_condition;
	information = dia_addon_benchpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_benchpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//Za bardzo oddaliliœmy siê od obozu.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//Nie podoba mi siê to.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//Wracam do obozu!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//Biorê ch³opaków i wracamy do obozu!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

