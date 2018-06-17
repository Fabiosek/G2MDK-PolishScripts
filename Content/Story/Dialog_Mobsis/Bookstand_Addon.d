
func void use_bookstand_addon_bl_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Kopalnia");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Crimson: otrzyma³ i przetopi³ 79 samorodków z³ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Scatty: otrzyma³ towary wartoœci 250 sztuk z³ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Garaz: otrzyma³ 6 samorodków z³ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Wszyscy stra¿nicy: otrzymali 9 samorodków z³ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Obóz:");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Stra¿ Kruka: 25 sztuk z³ota");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Finn: 60 sztuk z³ota");
		Doc_PrintLines(ndocid,1,"Lennar: 40 sztuk z³ota");
		Doc_PrintLines(ndocid,1,"Emilio: 50 sztuk z³ota");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Inni: 20 sztuk z³ota");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Huno, Fisk, Snaf: w zale¿noœci od towaru");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Myœliwi: Szef powinien to wyjaœniæ! Franko otrzyma³ 7 sztuk z³ota");
		Doc_Show(ndocid);
	};
};


var int bookstandmayahierchary_1_permanent;
var int bookstandmayahierchary_2_permanent;
var int bookstandmayahierchary_3_permanent;
var int bookstandmayahierchary_4_permanent;
var int bookstandmayahierchary_5_permanent;
var int bookstandmayaart;

func int c_canreadbookstand()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};
};

func void use_bookstandmaya()
{
	if(BOOKSTANDMAYAART == 1)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"...gdy¿ jedynie STRA¯NICY UMAR£YCH byli zdolni przywo³aæ przodków.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Ich nieobecnoœæ g³êboko rani. Bez rady przodków jesteœmy na ³asce naszego ludu.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"UZDROWICIELE zostali wys³ani, aby zapieczêtowaæ portal i zniszczyæ klucz. Jedynie Adanos wie, co siê z nimi sta³o, i czy zdo³ali wykonaæ powierzone im zadanie.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"KASTA WOJOWNIKÓW zosta³a zniszczona przez gniew Adanosa. Pêk³o serce starego ksiêcia wojowników.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Jedynie pozostali KAP£ANI podsycaj¹ nadziejê i bezustannie g³osz¹ kazania o odrodzeniu naszego miasta.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Ale my, UCZENI, znamy gorzk¹ prawdê. JARKENDAR upad³ i wkrótce zniknie w odmêtach czasu.");
		Doc_PrintLines(STPL_NDOCID,1,"");
	}
	else if(BOOKSTANDMAYAART == 2)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RADEMESA pogrzebano w œwi¹tyni Adanosa, ale moc miecza nie zosta³a zniszczona.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jego wp³yw sta³ siê zbyt wielki. Nie by³o koñca rzeziom na ulicach.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jednak gniew ADANOSA po³o¿y³ temu kres. Morze wznios³o siê ponad JARKENDAR i zatopi³o ca³e miasto.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"W wiêkszoœci nietkniête pozosta³y jedynie œwi¹tynie i budynki na wzniesieniach.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Niewielka grupa ocala³ych z katastrofy nie ma ju¿ si³y potrzebnej do odbudowy miasta.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"I tak los JARKENDARU zosta³ przypieczêtowany.");
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			SC_KNOWS_WEAPONINADANOSTEMPEL = TRUE;
		};
	}
	else if(BOOKSTANDMAYAART == 3)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Podesz³y wiek QUARHODRONA uniemo¿liwia³ mu dowodzenie armi¹. Dlatego kap³ani domagali siê przejêcia jego kompetencji.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Rozkazali mu zrzec siê tytu³u, a tak¿e oddaæ miecz.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Na jego miejsce powo³ano Radê Piêciu. Ale sprzeciwi³a siê temu Kasta Wojowników.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Wojownicy nie chcieli podporz¹dkowaæ siê Radzie Piêciu i wybrali na swego przywódcê RADEMESA, syna QUARHODRONA.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON przysta³ na to z powodu dumy i zaufania do swego potomka.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Przekaza³ miecz swojemu synowi, z nadziej¹, ¿e bêdzie nim w³ada³ równie pewnie, jak niegdyœ on sam.");
	}
	else if(BOOKSTANDMAYAART == 4)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RADEMES by³ s³aby. Miecz przej¹³ nad nim kontrolê i uczyni³ z niego swe narzêdzie.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Opêtany przez miecz, sprowadzi³ tyle cierpienia i okrucieñstw na swój lud, ¿e nawet uzdrowiciele nie byli w stanie uœmierzyæ bólu.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Miecz wkrótce zrozumia³, ¿e ludzie s¹ zbyt s³abi, by zapobiec jego planom.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Zagroziæ mu mog³a jedynie moc naszych przodków.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Dlatego RADEMES kaza³ wygnaæ lub straciæ wszystkich Stra¿ników Umar³ych i w ten sposób odebra³ ca³¹ nadziejê na ocalenie przed z³em.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Nie by³o ju¿ ¿adnego Stra¿nika Umar³ych, kiedy pozosta³a czwórka dawnych przywódców naszego ludu podjê³a gorzk¹ decyzjê poddania JARKENDARU.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Na ulicach szala³a wojna, gdy uzdrowiciele wyruszyli, by na zawsze zamkn¹æ wejœcie do naszej doliny.");
	}
	else if(BOOKSTANDMAYAART == 5)
	{
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON, najwy¿szy kap³an KHARDIMON i ja dyskutowaliœmy w tych salach o tym, jak pokonaæ RADEMESA i jego miecz.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON i KHARDIMON uwa¿ali, ¿e najlepiej zjednoczyæ siê, zaatakowaæ RADEMESA i pokonaæ go w otwartej walce. Ale ja zbyt dobrze zna³em moc miecza, by wierzyæ, ¿e przyniesie to po¿¹dany skutek.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Wykorzysta³em swoje prawo do uniewa¿nienia decyzji pozosta³ej dwójki. Zdecydowa³em pokonaæ RADEMESA za pomoc¹ podstêpu.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON podporz¹dkowa³ siê decyzji rady. Wyruszy³ do œwi¹tyni Adanosa i wys³a³ wiadomoœæ do swojego syna.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Nienawiœæ RADEMESA przybra³a takie rozmiary, ¿e w furii wpad³ do œwi¹tyni, aby zabiæ swojego ojca.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Gdy zorientowa³ siê, jaki mamy plan, by³o ju¿ za póŸno.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON zamkn¹³ za nimi komnaty œwi¹tyni i RADEMES zosta³ w nich uwiêziony na ca³¹ wiecznoœæ.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"");
	};
};

func void inituse_bookstandmaya()
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(c_canreadbookstand() == FALSE)
		{
			STPL_NDOCID = Doc_Create();
			Doc_SetPages(STPL_NDOCID,2);
			Doc_SetPage(STPL_NDOCID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(STPL_NDOCID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(STPL_NDOCID,-1,FONT_BOOK);
			Doc_SetMargins(STPL_NDOCID,0,275,20,30,20,1);
			Doc_Show(STPL_NDOCID);
			b_say(self,self,"$CANTREADTHIS");
		}
		else if(c_canreadbookstand())
		{
			STPL_NDOCID = Doc_Create();
			Doc_SetPages(STPL_NDOCID,2);
			Doc_SetPage(STPL_NDOCID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(STPL_NDOCID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(STPL_NDOCID,-1,FONT_BOOK);
			Doc_SetMargins(STPL_NDOCID,0,275,20,30,20,1);
			use_bookstandmaya();
			Doc_Show(STPL_NDOCID);
		};
	};
	BOOKSTANDMAYAART = 0;
};

func void use_bookstandmayahierchary_01_s1()
{
	BOOKSTANDMAYAART = 1;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_1_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_1_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_02_s1()
{
	BOOKSTANDMAYAART = 2;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_2_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_2_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_03_s1()
{
	BOOKSTANDMAYAART = 3;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_3_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_3_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_04_s1()
{
	BOOKSTANDMAYAART = 4;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_4_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_4_PERMANENT = TRUE;
	};
};

func void use_bookstandmayahierchary_05_s1()
{
	BOOKSTANDMAYAART = 5;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_5_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_5_PERMANENT = TRUE;
	};
};

