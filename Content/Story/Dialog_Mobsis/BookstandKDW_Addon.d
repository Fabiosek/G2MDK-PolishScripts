
func void use_runemaking_kdw_circ1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Wodny Kr¹g");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy wody i sk³adniki potrzebne do ich stworzenia.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Wir");
		Doc_PrintLine(ndocid,0,"Skrzyd³a krwiopijcy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lodowa lanca");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Gejzer");
		Doc_PrintLine(ndocid,0,"Akwamaryn");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Grom");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"Skrzyd³a krwiopijcy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Wodna piêœæ");
		Doc_PrintLine(ndocid,0,"Akwamaryn");
		Doc_PrintLine(ndocid,0,"Ska³a krystaliczna");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk³adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te¿ znaæ w³aœciwe zaklêcie, dysponowaæ zwojem, na którym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe³nieniu tych wszystkich warunków mo¿na rozpocz¹æ pracê przy stole runicznym.");
		Doc_Show(ndocid);
	};
};

func void use_runemaking_kdw_circ2_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ3_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ4_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ5_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ6_s1()
{
	use_runemaking_kdw_circ1_s1();
};

