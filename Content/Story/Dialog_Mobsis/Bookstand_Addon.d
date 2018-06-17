
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
		Doc_PrintLines(ndocid,0,"Crimson: otrzyma� i przetopi� 79 samorodk�w z�ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Scatty: otrzyma� towary warto�ci 250 sztuk z�ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Garaz: otrzyma� 6 samorodk�w z�ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Wszyscy stra�nicy: otrzymali 9 samorodk�w z�ota");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Ob�z:");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Stra� Kruka: 25 sztuk z�ota");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Finn: 60 sztuk z�ota");
		Doc_PrintLines(ndocid,1,"Lennar: 40 sztuk z�ota");
		Doc_PrintLines(ndocid,1,"Emilio: 50 sztuk z�ota");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Inni: 20 sztuk z�ota");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Huno, Fisk, Snaf: w zale�no�ci od towaru");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"My�liwi: Szef powinien to wyja�ni�! Franko otrzyma� 7 sztuk z�ota");
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
		Doc_PrintLines(STPL_NDOCID,0,"...gdy� jedynie STRA�NICY UMAR�YCH byli zdolni przywo�a� przodk�w.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Ich nieobecno�� g��boko rani. Bez rady przodk�w jeste�my na �asce naszego ludu.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"UZDROWICIELE zostali wys�ani, aby zapiecz�towa� portal i zniszczy� klucz. Jedynie Adanos wie, co si� z nimi sta�o, i czy zdo�ali wykona� powierzone im zadanie.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"KASTA WOJOWNIK�W zosta�a zniszczona przez gniew Adanosa. P�k�o serce starego ksi�cia wojownik�w.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Jedynie pozostali KAP�ANI podsycaj� nadziej� i bezustannie g�osz� kazania o odrodzeniu naszego miasta.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Ale my, UCZENI, znamy gorzk� prawd�. JARKENDAR upad� i wkr�tce zniknie w odm�tach czasu.");
		Doc_PrintLines(STPL_NDOCID,1,"");
	}
	else if(BOOKSTANDMAYAART == 2)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RADEMESA pogrzebano w �wi�tyni Adanosa, ale moc miecza nie zosta�a zniszczona.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jego wp�yw sta� si� zbyt wielki. Nie by�o ko�ca rzeziom na ulicach.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Jednak gniew ADANOSA po�o�y� temu kres. Morze wznios�o si� ponad JARKENDAR i zatopi�o ca�e miasto.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"W wi�kszo�ci nietkni�te pozosta�y jedynie �wi�tynie i budynki na wzniesieniach.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Niewielka grupa ocala�ych z katastrofy nie ma ju� si�y potrzebnej do odbudowy miasta.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"I tak los JARKENDARU zosta� przypiecz�towany.");
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			SC_KNOWS_WEAPONINADANOSTEMPEL = TRUE;
		};
	}
	else if(BOOKSTANDMAYAART == 3)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Podesz�y wiek QUARHODRONA uniemo�liwia� mu dowodzenie armi�. Dlatego kap�ani domagali si� przej�cia jego kompetencji.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Rozkazali mu zrzec si� tytu�u, a tak�e odda� miecz.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Na jego miejsce powo�ano Rad� Pi�ciu. Ale sprzeciwi�a si� temu Kasta Wojownik�w.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Wojownicy nie chcieli podporz�dkowa� si� Radzie Pi�ciu i wybrali na swego przyw�dc� RADEMESA, syna QUARHODRONA.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON przysta� na to z powodu dumy i zaufania do swego potomka.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Przekaza� miecz swojemu synowi, z nadziej�, �e b�dzie nim w�ada� r�wnie pewnie, jak niegdy� on sam.");
	}
	else if(BOOKSTANDMAYAART == 4)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RADEMES by� s�aby. Miecz przej�� nad nim kontrol� i uczyni� z niego swe narz�dzie.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Op�tany przez miecz, sprowadzi� tyle cierpienia i okrucie�stw na sw�j lud, �e nawet uzdrowiciele nie byli w stanie u�mierzy� b�lu.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Miecz wkr�tce zrozumia�, �e ludzie s� zbyt s�abi, by zapobiec jego planom.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Zagrozi� mu mog�a jedynie moc naszych przodk�w.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Dlatego RADEMES kaza� wygna� lub straci� wszystkich Stra�nik�w Umar�ych i w ten spos�b odebra� ca�� nadziej� na ocalenie przed z�em.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Nie by�o ju� �adnego Stra�nika Umar�ych, kiedy pozosta�a czw�rka dawnych przyw�dc�w naszego ludu podj�a gorzk� decyzj� poddania JARKENDARU.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Na ulicach szala�a wojna, gdy uzdrowiciele wyruszyli, by na zawsze zamkn�� wej�cie do naszej doliny.");
	}
	else if(BOOKSTANDMAYAART == 5)
	{
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON, najwy�szy kap�an KHARDIMON i ja dyskutowali�my w tych salach o tym, jak pokona� RADEMESA i jego miecz.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON i KHARDIMON uwa�ali, �e najlepiej zjednoczy� si�, zaatakowa� RADEMESA i pokona� go w otwartej walce. Ale ja zbyt dobrze zna�em moc miecza, by wierzy�, �e przyniesie to po��dany skutek.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Wykorzysta�em swoje prawo do uniewa�nienia decyzji pozosta�ej dw�jki. Zdecydowa�em pokona� RADEMESA za pomoc� podst�pu.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON podporz�dkowa� si� decyzji rady. Wyruszy� do �wi�tyni Adanosa i wys�a� wiadomo�� do swojego syna.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Nienawi�� RADEMESA przybra�a takie rozmiary, �e w furii wpad� do �wi�tyni, aby zabi� swojego ojca.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Gdy zorientowa� si�, jaki mamy plan, by�o ju� za p�no.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON zamkn�� za nimi komnaty �wi�tyni i RADEMES zosta� w nich uwi�ziony na ca�� wieczno��.");
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

