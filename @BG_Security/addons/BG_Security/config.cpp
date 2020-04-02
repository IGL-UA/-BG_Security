class CfgPatches
{
	class BG_Security
	{
		name = "BG_Security";
		author = "IGL";
		requiredAddons[] = {"A3_Functions_F"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class BG_Security
	{
		class preInit
		{
			file = "BG_Security\functions";
			class init {preInit = 1;};
		};
	};
};