
var int playermapinstance;

func int b_getplayermap()
{
	return PLAYERMAPINSTANCE;
};

func int b_setplayermap(var int mapinstance)
{
	PLAYERMAPINSTANCE = mapinstance;
	return PLAYERMAPINSTANCE;
};

