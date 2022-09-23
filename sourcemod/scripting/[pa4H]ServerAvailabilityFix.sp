#include <sourcemod>
#include <left4dhooks>
//bool someoneConnected = false;

//{"{default}", "{green}", "{lightgreen}", "{red}", "{blue}", "{olive}"};
//{"default", "orange",                             "olive",  "green"};   // Настоящие цвета
//{"\x01", 		"\x04",    "\x03", 		   "\x03",  "\x03",   "\x05"};

public Plugin:myinfo = 
{
	name = "ServerAvailabilityFix", 
	author = "pa4H", 
	description = "", 
	version = "1.0", 
	url = "vk.com/pa4h1337"
}

public OnPluginStart()
{
	//RegConsoleCmd("sm_test", debb, "");
	//HookEvent("round_start", round_start, EventHookMode_Pre);
}

public OnClientConnected()
{
	//someoneConnected = true;
	ServerCommand("sv_allow_lobby_connect_only 0");
	if (L4D_LobbyIsReserved())
	{
		L4D_LobbyUnreserve();
	}
}
/*public round_start(Handle:event, const String:name[], bool:dontBroadcast)
{
	if (someoneConnected)
	{
		ServerCommand("sv_allow_lobby_connect_only 0");
		if (L4D_LobbyIsReserved())
		{
			L4D_LobbyUnreserve();
		}
	}
}
*/
stock Action debb(int client, int args) // DEBUG
{
	if (L4D_LobbyIsReserved())
	{
		PrintToChat(client, "Reserved");
	}
	else
	{
		PrintToChat(client, "unReserved");
	}
	char a[20];
	L4D_GetLobbyReservation(a, 20);
	PrintToChat(client, a);
	
	//PrintCenterText(client, "PrintCenterText");
	//PrintToChat(client, "\x01P\x04r\x03i\x05ntToChat");
	//PrintHintText(client, "PrintHintText");
	return Plugin_Handled;
} 