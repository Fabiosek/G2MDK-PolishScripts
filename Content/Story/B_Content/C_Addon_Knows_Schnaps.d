
func int c_addon_knows_schnaps()
{
	if((KNOWS_LOUSHAMMER == TRUE) || (KNOWS_RUEBENSCHNAPS == TRUE) || (KNOWS_VINOSCHNAPS == TRUE) || (KNOWS_PIRATENSCHNAPS == TRUE) || (KNOWS_MAGIERSCHNAPS == TRUE) || (KNOWS_SUMPFKRAUTSCHNAPS == TRUE))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

