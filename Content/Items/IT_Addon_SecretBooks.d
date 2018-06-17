
const int BOOKLP2 = 2;
const int BOOKLP3 = 3;
const int BOOKLP5 = 5;
const int BOOKLP8 = 8;
const int BOOKXP250 = 250;
const int BOOKXP500 = 500;
const int BOOKXP1000 = 1000;
const int LPMULTIPLIER = 1000;
const int XPMULTIPLIER = 5;

func void uselpbook(var int constanze)
{
	var int wert;
	var string concattext;
	wert = constanze;
	if(Npc_IsPlayer(self))
	{
		b_say_overlay(self,self,"$VERSTEHE");
		Snd_Play("Levelup");
		self.lp = self.lp + constanze;
		concattext = ConcatStrings(PRINT_LEARNLP,IntToString(constanze));
		Print(concattext);
	};
};

func void usexpbook(var int constanze)
{
	var int wert;
	var string concattext;
	wert = constanze;
	if(Npc_IsPlayer(self))
	{
		b_say_overlay(self,self,"$VERSTEHE");
		Snd_Play("Levelup");
		self.exp = self.exp + constanze;
		concattext = ConcatStrings(PRINT_XPGAINED,IntToString(constanze));
		Print(concattext);
	};
};


prototype ITWR_ADDON_XPBOOK(C_ITEM)
{
	name = "Zebrane doœwiadczenie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	text[0] = PRINT_XPGAINED;
	text[5] = NAME_VALUE;
};

instance ITWR_ADDON_BOOKXP250(ITWR_ADDON_XPBOOK)
{
	value = BOOKXP250 * XPMULTIPLIER;
	count[0] = BOOKXP250;
	on_state[0] = usebookxp250;
	count[5] = value;
};


func void usebookxp250()
{
	usexpbook(BOOKXP250);
};


instance ITWR_ADDON_BOOKXP500(ITWR_ADDON_XPBOOK)
{
	value = BOOKXP500 * XPMULTIPLIER;
	count[0] = BOOKXP500;
	on_state[0] = usebookxp500;
	count[5] = value;
};


func void usebookxp500()
{
	usexpbook(BOOKXP500);
};


instance ITWR_ADDON_BOOKXP1000(ITWR_ADDON_XPBOOK)
{
	value = BOOKXP1000 * XPMULTIPLIER;
	count[0] = BOOKXP1000;
	on_state[0] = usebookxp1000;
	count[5] = value;
};


func void usebookxp1000()
{
	usexpbook(BOOKXP1000);
};


prototype ITWR_ADDON_LPBOOK(C_ITEM)
{
	name = "Ksiêga wiedzy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	text[0] = PRINT_LEARNLP;
	text[5] = NAME_VALUE;
};

instance ITWR_ADDON_BOOKLP2(ITWR_ADDON_LPBOOK)
{
	value = BOOKLP2 * LPMULTIPLIER;
	count[0] = BOOKLP2;
	on_state[0] = usebooklp2;
	count[5] = value;
};


func void usebooklp2()
{
	uselpbook(BOOKLP2);
};


instance ITWR_ADDON_BOOKLP3(ITWR_ADDON_LPBOOK)
{
	value = BOOKLP3 * LPMULTIPLIER;
	count[0] = BOOKLP3;
	on_state[0] = usebooklp3;
	count[5] = value;
};


func void usebooklp3()
{
	uselpbook(BOOKLP3);
};


instance ITWR_ADDON_BOOKLP5(ITWR_ADDON_LPBOOK)
{
	value = BOOKLP5 * LPMULTIPLIER;
	count[0] = BOOKLP5;
	on_state[0] = usebooklp5;
	count[5] = value;
};


func void usebooklp5()
{
	uselpbook(BOOKLP5);
};


instance ITWR_ADDON_BOOKLP8(ITWR_ADDON_LPBOOK)
{
	value = BOOKLP8 * LPMULTIPLIER;
	count[0] = BOOKLP8;
	on_state[0] = usebooklp8;
	count[5] = value;
};


func void usebooklp8()
{
	uselpbook(BOOKLP8);
};

