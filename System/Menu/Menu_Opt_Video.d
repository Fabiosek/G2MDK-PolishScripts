
instance MENU_OPT_VIDEO(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_VID_HEADLINE";
	items[1] = "MENUITEM_VID_DEVICE";
	items[2] = "MENUITEM_VID_DEVICE_CHOICE";
	items[3] = "MENUITEM_VID_RESOLUTION";
	items[4] = "MENUITEM_VID_RESOLUTION_CHOICE";
	items[5] = "MENUITEM_VID_BRIGHTNESS";
	items[6] = "MENUITEM_VID_BRIGHTNESS_SLIDER";
	items[7] = "MENUITEM_VID_CONTRAST";
	items[8] = "MENUITEM_VID_CONTRAST_SLIDER";
	items[9] = "MENUITEM_VID_GAMMA";
	items[10] = "MENUITEM_VID_GAMMA_SLIDER";
	items[11] = "MENUITEM_VID_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_VID_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "USTAWIENIA OBRAZU";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8100;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_VID_DEVICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Karta graficzna";
	text[1] = "Wymaga ponownego uruchomienia gry.";
	posx = 700;
	posy = MENU_START_Y + (MENU_DY * 0);
	dimx = 3200;
	dimy = 600;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_DEVICE_CHOICE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	fontname = MENU_FONT_SMALL;
	posx = 4000;
	posy = MENU_START_Y + (MENU_DY * 0) + MENU_CHOICE_YPLUS;
	dimx = 3700;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "zVidDevice";
	onchgsetoptionsection = "VIDEO";
	oneventaction[6] = update_videooptions;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

instance MENUITEM_VID_RESOLUTION(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Rozdzielczoœæ";
	text[1] = "Wybierz po¿¹dan¹ rozdzielczoœæ i wciœnij klawisz [Enter]";
	posx = 700;
	posy = MENU_START_Y + (MENU_DY * 1);
	dimx = 3200;
	dimy = 600;
	onselaction[0] = SEL_ACTION_UNDEF;
	oneventaction[1] = apply_videoresolution;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_RESOLUTION_CHOICE(C_MENU_ITEM_DEF)
{
	text[0] = "";
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	fontname = MENU_FONT_SMALL;
	posx = 4000;
	posy = MENU_START_Y + (MENU_DY * 1) + MENU_CHOICE_YPLUS;
	dimx = 3700;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "vidResIndex";
	onchgsetoptionsection = "INTERNAL";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_NEEDS_APPLY;
};

instance MENUITEM_VID_BRIGHTNESS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Jasnoœæ";
	text[1] = "Jasnoœæ";
	posx = 700;
	posy = MENU_START_Y + (MENU_DY * 3);
	dimx = 3200;
	dimy = 600;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_BRIGHTNESS_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 4000;
	posy = MENU_START_Y + (MENU_DY * 3) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "zVidBrightness";
	onchgsetoptionsection = "VIDEO";
	userfloat[0] = 35;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_VID_CONTRAST(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Kontrast";
	text[1] = "Kontrast";
	posx = 700;
	posy = MENU_START_Y + (MENU_DY * 4);
	dimx = 3200;
	dimy = 600;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_CONTRAST_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 4000;
	posy = MENU_START_Y + (MENU_DY * 4) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "zVidContrast";
	onchgsetoptionsection = "VIDEO";
	userfloat[0] = 35;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_VID_GAMMA(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Gamma";
	text[1] = "Gamma";
	posx = 700;
	posy = MENU_START_Y + (MENU_DY * 5);
	dimx = 3200;
	dimy = 600;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_VID_GAMMA_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 4000;
	posy = MENU_START_Y + (MENU_DY * 5) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "zVidGamma";
	onchgsetoptionsection = "VIDEO";
	userfloat[0] = 35;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_VID_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Wróæ";
	posx = 1000;
	posy = MENU_BACK_Y;
	dimx = 6192;
	dimy = MENU_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};


func int update_videooptions()
{
	Update_ChoiceBox("MENUITEM_VID_DEVICE_CHOICE");
	Update_ChoiceBox("MENUITEM_VID_RESOLUTION_CHOICE");
	return 1;
};

func int apply_videoresolution()
{
	Apply_Options_Video();
	return 0;
};

