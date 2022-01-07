/*
ENG : This Gamemode Create by TimeBaby
DONT RENAME NAME OF AUTHOR

INDO : gamemode ini dibuat oleh TimeBaby



MAFIA TDM ERA 80


ENKJOY
*/
#include <a_samp>
#include <dini>
#include <dudb>
#include <sscanf2>
#include <streamer>
#include <izcmd>


// Dialog

#define Register 1
#define Login    2
#define Info     3
#define Team     4
#define Fraksi   5
#define Police   6
#define Radio    7
#define Mode     8
#define STM      9
#define STMSHOP  10



// Colors

#define RED 0xFF0000FF
#define GREEN 0x00FF00FF
#define YELLOW 0xFFFF00FF
#define PURPLE 0x7F00FFFF

// icon
#define Shop 2099.1760, 2223.9536, 11.3617
#define Pizza 2102.5352, 2227.8059, 11.3617
#define Pizza1 2084.5171, 2224.3926, 11.3617
#define Steak 1699.1902, 2205.8503, 9.8200
#define Burger 1872.4868,2070.5535,10.8203
#define Burger1 1160.0311,2070.8623,10.8203
// DB

#define ACC  "LoggedUsersV/%s.ini"
#define Lists "List/%s.ini"

new File[256];
new List[256];
new Name[MAX_PLAYER_NAME];

enum pInfo
{
	pPass,
	pScore,
	pCash
}

new PlayerInfo[MAX_PLAYERS];

new gPlayerLogged[MAX_PLAYERS];

#pragma unused ret_memcpy

// Pickup

new Weapon1;
// Zone

new leonefamilybase;
new radar;
new radars;

// VEH
new stm;
new stm1;
new stm2;
new stm3;
new stm4;
new stm5;
new stm6;
new stm7;
new stm8;
new stm9;
// Delay;
new delayrob = 1;



main()
{
	print("\n----------------------------------");
	print(" MAFIA TDM ");
	print("----------------------------------\n");
}


public OnGameModeInit()
{
	// label
    Create3DTextLabel("/rob", RED, 372.2035, -6.1020, 1001.8664, 30.0, 0, 0);
    Create3DTextLabel("/rob", RED, 379.8367, -118.7297, 1001.4868, 30.0, 0, 0);
    Create3DTextLabel("/rob", RED, -23.1167,-55.6360,1003.5469, 30.0, 0, 0);
    Create3DTextLabel("/rob", RED, 161.6957,-83.2530,1001.8047, 30.0, 0, 0);
	// Timer 
   // remove building

	// Gangzone
    leonefamilybase = GangZoneCreate(1867, 1808, 2106, 2025);
	radar = GangZoneCreate(-3000, -3000, 3000, 543);
	radars = GangZoneCreate(-3000, 539, -1038, 1265);
	// mode
	CreateVehicle(445, 2611.5518, 2269.7954, 11.8107, 92.0000, -1, -1, 100);
    CreateVehicle(445, 2611.5425, 2277.2844, 11.8107, 92.0000, -1, -1, 100);
    CreateVehicle(445, 2611.3079, 2261.8245, 11.8107, 92.0000, -1, -1, 100);
    CreateVehicle(440, 2610.8853, 2281.6096, 12.4543, 91.0000, -1, -1, 100);
    CreateVehicle(440, 2611.0840, 2273.8992, 12.4543, 91.0000, -1, -1, 100);
    CreateVehicle(440, 2611.0862, 2266.1204, 12.4543, 91.0000, -1, -1, 100);
    CreateVehicle(440, 2610.5500, 2258.9517, 12.4543, 91.0000, -1, -1, 100);
    CreateVehicle(504, 2594.5332, 2280.2974, 12.8160, -91.0000, -1, -1, 100);
    CreateVehicle(504, 2594.8289, 2273.7849, 12.8160, -91.0000, -1, -1, 100);
    CreateVehicle(504, 2594.6636, 2270.2339, 12.8160, -91.0000, -1, -1, 100);
    CreateVehicle(504, 2594.1792, 2266.1646, 12.8160, -91.0000, -1, -1, 100);
    CreateVehicle(563, 2583.4802, 2271.3276, 12.6324, 0.0000, -1, -1, 100);
    CreateVehicle(563, 2567.2385, 2271.4302, 12.6324, 0.0000, -1, -1, 100);
	SetGameModeText("Mafia TDM");
	// pickup
	Weapon1 = CreatePickup(2061,1,2062.0234, 1916.2578, 10.8125);
	// Vehicle
	
	CreateVehicle(551, 2031.6340, 1920.4998, 12.0912, 0.0000, -1, -1, 100);
    CreateVehicle(551, 2032.1274, 1929.4791, 12.0912, 0.0000, -1, -1, 100);
    CreateVehicle(551, 2032.2893, 1912.9312, 12.0912, 0.0000, -1, -1, 100);
    CreateVehicle(551, 2032.0688, 1904.1166, 12.0912, 10.0000, -1, -1, 100);
    // Yakuza
    CreateVehicle(487, -2225.9663, 2327.7048, 8.2941, 0.0000, -1, -1, 100);
    CreateVehicle(421, -2252.7051, 2323.8403, 4.5761, 88.0000, -1, -1, 100);
    CreateVehicle(421, -2252.7061, 2308.8811, 4.5761, 88.0000, -1, -1, 100);
    CreateVehicle(421, -2252.6716, 2291.1104, 4.5761, 88.0000, -1, -1, 100);
    CreateVehicle(421, -2252.6370, 2336.3137, 4.5761, 88.0000, -1, -1, 100);
    CreateVehicle(468, -2271.4424, 2336.0771, 4.4118, 84.0000, -1, -1, 100);
    CreateVehicle(468, -2271.5867, 2327.6318, 4.4118, 84.0000, -1, -1, 100);
    CreateVehicle(468, -2271.3735, 2318.2727, 4.4118, 84.0000, -1, -1, 100);
    CreateVehicle(468, -2271.4885, 2309.5527, 4.4118, 84.0000, -1, -1, 100);
    CreateVehicle(473, -2218.0984, 2418.5166, 0.1575, -137.0000, -1, -1, 100);
    CreateVehicle(473, -2255.2437, 2416.3328, 0.1575, -133.0000, -1, -1, 100);
    CreateVehicle(473, -2233.8318, 2435.4119, 0.1575, -133.0000, -1, -1, 100);
    CreateVehicle(473, -2237.8621, 2397.9355, 0.1575, -133.0000, -1, -1, 100);
	// maara
    CreateVehicle(560, 2033.5284, 1010.5071, 10.4520, 0.0000, -1, -1, 100);
    CreateVehicle(560, 2033.6870, 1018.3671, 10.4520, 0.0000, -1, -1, 100);
    CreateVehicle(560, 2033.8606, 1000.3713, 10.4520, 0.0000, -1, -1, 100);
    CreateVehicle(560, 2033.6138, 989.5322, 10.4520, 0.0000, -1, -1, 100);
    CreateVehicle(560, 2033.9491, 1028.2086, 10.4520, 0.0000, -1, -1, 100);
    CreateVehicle(579, 2040.0958, 1011.3746, 11.8207, 0.0000, -1, -1, 100);
    CreateVehicle(579, 2040.1981, 1027.2240, 11.8207, 0.0000, -1, -1, 100);
    CreateVehicle(579, 2039.2352, 992.1445, 11.8207, 0.0000, -1, -1, 100);
    // police
    CreateVehicle(598, 2279.3979, 2420.9900, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2286.6602, 2420.7515, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2294.0752, 2420.1868, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2301.6438, 2420.1499, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(601, 2304.8611, 2452.5046, 13.5999, 0.0000, -1, -1, 100);
    CreateVehicle(601, 2304.8865, 2437.4614, 13.5999, 0.0000, -1, -1, 100);
    CreateVehicle(601, 2313.0918, 2438.0093, 13.5999, 0.0000, -1, -1, 100);
    CreateVehicle(601, 2311.6245, 2452.7749, 13.5999, 0.0000, -1, -1, 100);
    CreateVehicle(598, 2310.5935, 2419.7058, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2319.5242, 2419.9636, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2331.3428, 2419.8511, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2340.1541, 2419.5942, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2349.0066, 2419.0969, 11.7983, 89.0000, -1, -1, 100);
    CreateVehicle(598, 2355.8291, 2419.0720, 11.7983, 89.0000, -1, -1, 100);
	
	stm = CreateVehicle(510, 1231.6427, -1723.0697, 13.5660, 0.0000, -1, -1, 100);
    stm2 = CreateVehicle(510, 1230.2786, -1722.9280, 13.5660, 0.0000, -1, -1, 100);
    stm3 = CreateVehicle(510, 1228.8781, -1722.8622, 13.5660, 0.0000, -1, -1, 100);
    stm4 = CreateVehicle(510, 1227.4204, -1722.7526, 13.5660, 0.0000, -1, -1, 100);
    stm5 = CreateVehicle(510, 1225.9846, -1722.9540, 13.5660, 0.0000, -1, -1, 100);
    stm6 = CreateVehicle(462, 1228.2858, -1726.5627, 13.0943, 0.0000, -1, -1, 100);
    stm7 = CreateVehicle(462, 1230.1686, -1726.5715, 13.0943, 0.0000, -1, -1, 100);
    stm8 = CreateVehicle(462, 1232.0814, -1726.7023, 13.0943, 0.0000, -1, -1, 100);
    stm9 = CreateVehicle(462, 1226.3625, -1726.4507, 13.0943, 0.0000, -1, -1, 100);
    
  
    SetVehicleVirtualWorld(stm1,3);
    SetVehicleVirtualWorld(stm2,3);
    SetVehicleVirtualWorld(stm3,3);
    SetVehicleVirtualWorld(stm4,3);
    SetVehicleVirtualWorld(stm5,3);
    SetVehicleVirtualWorld(stm6,3);
    SetVehicleVirtualWorld(stm7,3);
    SetVehicleVirtualWorld(stm8,3);
    SetVehicleVirtualWorld(stm9,3);
    SetVehicleVirtualWorld(stm,3);

	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	//ICON
	// Remove Building
    SetPlayerTeam(playerid, dini_Int(File, "Team"));
    RemoveBuildingForPlayer(playerid, 10821, -1505.2578, 715.2422, 64.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 10822, -1336.8125, 892.7578, 57.9141, 0.25);
    RemoveBuildingForPlayer(playerid, 11250, -1505.2578, 715.2422, 64.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 11251, -1336.8125, 892.7578, 57.9141, 0.25);
    RemoveBuildingForPlayer(playerid, 11252, -1078.7656, 891.0781, 35.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 11253, -1385.7188, 670.8047, 42.9766, 0.25);
    RemoveBuildingForPlayer(playerid, 11255, -1558.5469, 546.3203, 14.9219, 0.25);
    RemoveBuildingForPlayer(playerid, 11256, -1432.6094, 639.4844, 35.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 11258, -1319.5938, 716.7813, 42.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 11260, -1198.3984, 808.6328, 42.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 11262, -1558.5469, 546.3203, 14.9219, 0.25);
    RemoveBuildingForPlayer(playerid, 11263, -1385.7188, 670.8047, 42.9766, 0.25);
    RemoveBuildingForPlayer(playerid, 11264, -1432.6094, 639.4844, 35.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 11265, -1319.5938, 716.7813, 42.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 11266, -1198.3984, 808.6328, 42.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 11267, -1078.7656, 891.0781, 35.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 11380, -1499.9609, 720.6875, 42.0547, 0.25);
    RemoveBuildingForPlayer(playerid, 11381, -1349.3281, 879.4219, 43.0313, 0.25);
    RemoveBuildingForPlayer(playerid, 11622, -915.6563, 1012.4453, 32.1953, 0.25);
    RemoveBuildingForPlayer(playerid, 11464, -915.6563, 1012.4453, 32.1953, 0.25);
    RemoveBuildingForPlayer(playerid, 3332, 583.0859, 368.8750, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 3332, 537.1953, 434.4063, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 3332, 445.4219, 565.4688, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 3333, -178.7188, 326.5391, -3.5391, 0.25);
    RemoveBuildingForPlayer(playerid, 3333, -158.3516, 403.9063, -3.5391, 0.25);
    RemoveBuildingForPlayer(playerid, 3333, 521.1172, 471.7891, 3.3203, 0.25);
    RemoveBuildingForPlayer(playerid, 3333, 567.0078, 406.2500, 3.3203, 0.25);
    RemoveBuildingForPlayer(playerid, 3333, 475.2344, 537.3203, 3.3203, 0.25);
    RemoveBuildingForPlayer(playerid, 3332, 491.3125, 499.9375, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 16431, 475.1250, 537.4375, 17.5859, 0.25);
    RemoveBuildingForPlayer(playerid, 16432, 566.8984, 406.3750, 17.5859, 0.25);
    RemoveBuildingForPlayer(playerid, 3382, -176.3516, 367.5234, 17.6953, 0.25);
    RemoveBuildingForPlayer(playerid, 3382, -196.7891, 290.1797, 17.6953, 0.25);
    RemoveBuildingForPlayer(playerid, 3382, -155.9844, 444.8906, 17.6953, 0.25);
    RemoveBuildingForPlayer(playerid, 16688, -168.3203, 367.2422, 10.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 3381, -196.7891, 290.1797, 17.6953, 0.25);
    RemoveBuildingForPlayer(playerid, 3330, -178.7188, 326.5391, -3.5391, 0.25);
    RemoveBuildingForPlayer(playerid, 3381, -176.3516, 367.5234, 17.6953, 0.25);
    RemoveBuildingForPlayer(playerid, 16358, -168.3203, 367.2422, 10.6641, 0.25);
    RemoveBuildingForPlayer(playerid, 3330, -158.3516, 403.9063, -3.5391, 0.25);
    RemoveBuildingForPlayer(playerid, 3381, -155.9844, 444.8906, 17.6953, 0.25);
    RemoveBuildingForPlayer(playerid, 3331, 445.4219, 565.4688, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 16357, 475.1250, 537.4375, 17.5859, 0.25);
    RemoveBuildingForPlayer(playerid, 3330, 475.2344, 537.3203, 3.3203, 0.25);
    RemoveBuildingForPlayer(playerid, 3331, 491.3125, 499.9375, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 3330, 521.1172, 471.7891, 3.3203, 0.25);
    RemoveBuildingForPlayer(playerid, 3331, 537.1953, 434.4063, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 3330, 567.0078, 406.2500, 3.3203, 0.25);
    RemoveBuildingForPlayer(playerid, 16430, 566.8984, 406.3750, 17.5859, 0.25);
    RemoveBuildingForPlayer(playerid, 3331, 583.0859, 368.8750, 24.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 4514, 440.0469, 587.4453, 19.7344, 0.25);
    RemoveBuildingForPlayer(playerid, 4516, -141.3359, 468.6484, 12.9141, 0.25);
    RemoveBuildingForPlayer(playerid, 4517, -193.8281, 269.5078, 12.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 7995, 1784.6797, 721.8359, 12.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 8028, 1735.8594, 519.1563, 25.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 8029, 1784.6797, 721.8359, 12.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 8056, 1735.8594, 519.1563, 25.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 8128, 1735.8750, 519.0078, 4.3594, 0.25);
    RemoveBuildingForPlayer(playerid, 8129, 1735.8750, 519.0078, 4.3594, 0.25);
    RemoveBuildingForPlayer(playerid, 8380, 1785.1641, 723.3672, 14.9609, 0.25);
    RemoveBuildingForPlayer(playerid, 8381, 1785.1641, 723.3672, 14.9609, 0.25);
    RemoveBuildingForPlayer(playerid, 1290, 1777.5938, 653.3594, 23.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 9687, -2681.4922, 1684.4609, 120.4531, 0.25);
    RemoveBuildingForPlayer(playerid, 9688, -2681.5000, 1764.8438, 113.1172, 0.25);
    RemoveBuildingForPlayer(playerid, 9689, -2681.4922, 1684.4609, 120.4531, 0.25);
    RemoveBuildingForPlayer(playerid, 9691, -2681.4922, 1847.9375, 120.0859, 0.25);
    RemoveBuildingForPlayer(playerid, 9692, -2681.4922, 1933.8672, 109.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 9693, -2681.4922, 1847.9375, 120.0859, 0.25);
    RemoveBuildingForPlayer(playerid, 9694, -2681.4922, 1933.8672, 109.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 9695, -2681.4922, 2042.1563, 86.7188, 0.25);
    RemoveBuildingForPlayer(playerid, 9696, -2681.4922, 2042.1563, 86.7188, 0.25);
    RemoveBuildingForPlayer(playerid, 9837, -2681.4922, 1933.8672, 109.4375, 0.25);
	// Gangzone
	
	
    GetPlayerName(playerid, Name, sizeof(Name));
    format(File, sizeof(File), ACC, Name);
	format(List, sizeof(List), Lists, Name);

    if(!dini_Exists(File))
	{
	PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
	new Str[256];
	new Y, M, D;
	new H, G, S;
	getdate(Y, M, D);
	gettime(H, G, S);
	format(Str, sizeof(Str), "{FFFFFF}Welcome ({00FFFF}%s{FFFFFF}) Please Register {FF0000}! \n{FFFFFF}Date : {00FFFF}%02d/%02d/%02d \n{FFFFFF}Time : %02d:%02d:%02d\n{FFFF00}Rules\n{FFFF00}1.No Hacking That's It Its!", Name, Y, M, D, H, G, S);
	ShowPlayerDialog(playerid, Register, DIALOG_STYLE_PASSWORD, "{FFFF00}Register!", Str, "Register", "Quit");
    }
    if(fexist(File))
    {
	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    new Str[256];
	new Y, M, D;
	new H, G, S;
	getdate(Y, M, D);
	gettime(H, G, S);
	format(Str, sizeof(Str), "{FFFFFF}Welcome Back ({00FFFF}%s{FFFFFF}) Please Login {FFFF00} !!! \n{FFFFFF}Date : {FFFF00}%02d/%02d/%02d \n{FFFFFF}Time : %02d:%02d:%02d\n{FFFF00}Rules\n{00FFFF}1.No Hacking That's It!", Name, Y, M, D, H, G, S);
	ShowPlayerDialog(playerid, Login, DIALOG_STYLE_PASSWORD, "{FFFF00FF}Login!!!", Str, "Login!", "Quit");
	}
	
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	gPlayerLogged[playerid] = 1;
	GetPlayerName(playerid, Name, sizeof(Name));
	format(File, sizeof(File), ACC, Name);
	{
        new F, J, L;
	    new G, M, X;
	    new JDate[256];
	    getdate(F, J, L);
	    gettime(G, M, X);
	    format(JDate, sizeof(JDate), "%02d/%02d/%02d , Time : %02d:%02d:%02d", F, J, L, G, M, X);
	    dini_Set(File, "Last Visited", JDate);
		dini_IntSet(File, "Score", GetPlayerScore(playerid));
		dini_IntSet(File, "Cash", GetPlayerMoney(playerid));
		dini_IntSet(File, "Team", GetPlayerTeam(playerid));
	}
	gPlayerLogged[playerid] = 0;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	
	if(GetPlayerTeam(playerid) == 1)
	{
       SetPlayerPos(playerid,2030.3401, 1921.0883, 13.3316);
       GivePlayerWeapon(playerid,5,1);
	   GivePlayerWeapon(playerid,25,100);
	   GivePlayerWeapon(playerid,28,1000);
	   GivePlayerWeapon(playerid,30,1000);
	   SetPlayerSkin(playerid,126);
	   SetPlayerColor(playerid,0x7F00FFFF);
	}
	else if(GetPlayerTeam(playerid) == 2)
	{
       SetPlayerPos(playerid,-2251.0571, 2358.6008, 6.2885);
       GivePlayerWeapon(playerid,8,1);
	   GivePlayerWeapon(playerid,25,100);
	   GivePlayerWeapon(playerid,28,1000);
	   GivePlayerWeapon(playerid,30,1000);
	   SetPlayerSkin(playerid,122);
       SetPlayerColor(playerid,0xffff00);
	}
	else if(GetPlayerTeam(playerid) == 3)
	{
       SetPlayerPos(playerid,2029.6007, 1012.7745, 12.0977);
       SetPlayerSkin(playerid,116);
	   GivePlayerWeapon(playerid,8,1);
	   GivePlayerWeapon(playerid,25,100);
	   GivePlayerWeapon(playerid,28,1000);
	   GivePlayerWeapon(playerid,30,1000);
	   SetPlayerColor(playerid,0x7cfc00);
	}
	else if(GetPlayerTeam(playerid) == 4)
	{
       SetPlayerPos(playerid,2636.3027, 2344.5254, 10.7488);
       SetPlayerSkin(playerid,113);
	   GivePlayerWeapon(playerid,8,1);
	   GivePlayerWeapon(playerid,24,100);
	   GivePlayerWeapon(playerid,28,1000);
	   GivePlayerWeapon(playerid,30,1000);
       SetPlayerColor(playerid,0x0000ff);
	}
	else if(GetPlayerTeam(playerid) == 5)
	{
       SetPlayerPos(playerid,2335.7957,2455.0149,14.9688);
       SetPlayerSkin(playerid,280);
	   GivePlayerWeapon(playerid,8,1);
	   GivePlayerWeapon(playerid,25,100);
	   GivePlayerWeapon(playerid,28,1000);
	   GivePlayerWeapon(playerid,30,1000);
	   SetPlayerColor(playerid,RED);

	}
	else if(GetPlayerTeam(playerid) == 6)
	{
		SetPlayerPos(playerid,-244.7369,2599.3711,70.7031);
		SetPlayerSkin(playerid,0);
		GivePlayerWeapon(playerid,35,1000);
		SetPlayerVirtualWorld(playerid, 1);

	}
	else if(GetPlayerTeam(playerid) == 7)
	{
		SetPlayerPos(playerid,193.2739,1890.9883,17.6406);
		SetPlayerSkin(playerid,0);
		GivePlayerWeapon(playerid,38,1000);
		SetPlayerVirtualWorld(playerid, 2);

	}
	else if(GetPlayerTeam(playerid) == 8)
	{
		SetPlayerVirtualWorld(playerid, 3);
		SetPlayerSkin(playerid,29);
		SetPlayerPos(playerid,1243.4094,-1699.7384,14.8672);

	}
	else if(GetPlayerTeam(playerid) == 9)
	{
		SetPlayerVirtualWorld(playerid, 3);
		SetPlayerSkin(playerid,46);
		SetPlayerPos(playerid,1551.4368,-1676.5551,15.8547);
	}
	else if(GetPlayerTeam(playerid) == 10)
	{
		SetPlayerVirtualWorld(playerid, 3);
		

	}
	else
	{
       ShowPlayerDialog(playerid,Mode,DIALOG_STYLE_LIST,"Mode","Mafia War\nRPG Dm\nMinigun Dm\nSTM VS SMK","Choose","Exit");
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(GetPlayerWeapon(killerid) == 50)
	{
		Ban(killerid);
	}
	GivePlayerMoney(killerid, 1000);
	SetPlayerWantedLevel(killerid, 3);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	
	if(GetPlayerWeapon(killerid) == 50)
	{
		Ban(killerid);
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid,cmdtext[])
{
	if (strcmp("/ban", cmdtext, true, 10) == 0)
	{
		
		return 1;
	}
	if (strcmp("/rob", cmdtext, true, 10) == 0)
	{
		
        
		return 1;
	}

	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    ShowPlayerDialog(playerid,Radio,DIALOG_STYLE_LIST,"Radio","Closer\nRadio Gaga\nSoviet Anthem\nInternationale","Choose","Exit");
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	StopAudioStreamForPlayer(playerid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == Weapon1)
	{
       GivePlayerWeapon(playerid,5,1);
	   GivePlayerWeapon(playerid,24,100);
	   GivePlayerWeapon(playerid,28,1000);
	   GivePlayerWeapon(playerid,31,1000);
	 }
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_CTRL_BACK)
	{
		SetPlayerTeam(playerid,0); 
		SetPlayerHealth(playerid,0);
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == STM)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
				  SetPlayerTeam(playerid,8);
				  SetPlayerHealth(playerid,0);
				}
				case 1:
				{
                  SetPlayerTeam(playerid,9);
	              SetPlayerHealth(playerid,0);
				}
			}
		}
	}
	if(dialogid == STMSHOP)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(GetPlayerMoney(playerid) > 100)
				    {
						GivePlayerWeapon(playerid, 8, 1);
						GivePlayerMoney(playerid, -100);
					}
				}
			}
		}
	}
	if(dialogid == Mode)
	{
       if(!response) return Kick(playerid);
	   if(response)
	   {
		   switch(listitem)
		   {
			   case 0:
			   {
				   SetPlayerVirtualWorld(playerid, 0);
				   GangZoneShowForPlayer(playerid,radar, 0x11FF0000FF);
	               GangZoneShowForPlayer(playerid,radars, 0xFF0000FF);
	               GangZoneShowForPlayer(playerid,leonefamilybase,0x7F00FFFF);
				   ShowPlayerDialog(playerid,Fraksi,DIALOG_STYLE_LIST,"Fraksi","Good\nBad","Yes","No");
			   }
			   case 1:
			   {
				   SetPlayerTeam(playerid,6);
				   SetPlayerHealth(playerid,0);
			   }
			   case 2:
			   {
			       SetPlayerTeam(playerid,7);
			       SetPlayerHealth(playerid,0);
			   }
			   case 3:
			   {
				   ShowPlayerDialog(playerid, STM, DIALOG_STYLE_LIST, "STM TEAM","STM\nSMK\nPolice", "Choose", "Exit");
			   }
		   }
	   }

	}
	if(dialogid == Police)
	{
	    if(!response) return ShowPlayerDialog(playerid,Fraksi,DIALOG_STYLE_LIST,"Fraksi","Good\nBad","Yes","No");
		if(response)
		{
			switch(listitem)
			{
			
				 case 0:
				 {
				    SetPlayerTeam(playerid,5);
				    SetPlayerHealth(playerid,0);
				 
				 }
			}

		}
	}
    if(dialogid == Radio)
	{
		if(!response) return SendClientMessage(playerid, -1, "Oke");
		if(response)
		{
			switch(listitem)
			{
                case 0:
				{
                   Closer(playerid);
				} 
				case 1:
				{
					Radiogaga(playerid);
				}
				case 2:
				{
                    Soviet(playerid);
				}
				case 3:
				{
					Internationale(playerid);
				}
			}
		}
	}
    if(dialogid == Team)
	{
        if(!response) return Kick(playerid);
		if(response)
		{
			switch(listitem)
			{
			   case 0:
			   {

				 SendClientMessage(playerid, -1, "Kamu masuk sebagai anggota Leone Family");
				 GivePlayerWeapon(playerid,30,1000);
				 SetPlayerTeam(playerid,1);
				 SetPlayerPos(playerid,2030.3401, 1921.0883, 13.3316);
				 SetPlayerHealth(playerid,0);
				 
			   }
			   case 1:
			   {
                   SendClientMessage(playerid, -1, "Kamu masuk sebagai anggota Yakuza");
                   GivePlayerWeapon(playerid,31,1000);
                   SetPlayerTeam(playerid,2);
                   SetPlayerHealth(playerid,0);
			   }
			   case 2:
			   {

                   SendClientMessage(playerid, -1, "Kamu masuk sebagai anggota Mara Salvarucha ");
                   GivePlayerWeapon(playerid,32,1000);
                   SetPlayerTeam(playerid,3);
                   SetPlayerHealth(playerid,0);
			   }
			   case 3:
			   {
                   SendClientMessage(playerid, -1, "Kamu Masuk Sebagai Anggota Diablos");
                   SetPlayerTeam(playerid,4);
                   SetPlayerHealth(playerid,0);
			   }
			   case 4:
			   {
                   SendClientMessage(playerid, -1, "Kamu Masuk sebagai Sisilian Family");
                   SetPlayerTeam(playerid,5);
				   SetPlayerHealth(playerid,0);
			   }

			}
		}
	}
    if(dialogid == Fraksi)
	{
        if(!response) return Kick(playerid);
		if(response)
		{
			switch(listitem)
			{
			   case 0:
			   {

				   DialogPolice(playerid);
			   }
			   case 1:
			   {
                   DialogMafia(playerid);
			   }
			   
			}
		}
	}

	if(dialogid == Register)
	{
	   new Str[256];
	   new Date[256];
	   new JTime[256];
	   new Y, M, D;
	   new H, G, S;
	   getdate(Y, M, D);
	   gettime(H, G, S);
	   GetPlayerName(playerid, Name, sizeof(Name));
	   format(File, sizeof(File), ACC, Name);
	   if(!response) return Kick(playerid);
	   if(!strlen (inputtext)) return ShowPlayerDialog(playerid, Register, DIALOG_STYLE_PASSWORD, "{FF0000}Register!!!", "You Need To Create A Password Please Register To Join {FF0000}! ! !", "Register", "Quit");
	   dini_Create(File);
	   dini_IntSet(File, "Password", udb_hash(inputtext));
	   format(Str, sizeof(Str), "{00FF00}Registered In Succes Fully {00FFFF}! ! ! {FFFFFF} With Name : ({00FFFF}%s{FFFFFF}) \n{00FFFF}Password : {FFFFFF}({00FFFF}%s{FFFFFF}) \n{00FFFF}Thx For Registration {00FF00}Enjoey The Server!! !! !!.......\n{FFFFFF}Date Joining : %02d/%02d/%02d\nTime Joining : %02d:%02d:%02d\n{00FFFF}Thx For {00FFFF}Joining Our {00FF00}Server Man ! ! !!!!!!!!!!...................", Name, inputtext, Y, M, D, H, G, S);
       ShowPlayerDialog(playerid, Info, DIALOG_STYLE_MSGBOX, "{00FF00}Account Created Succes-Fully!", Str, "Ok", "");
	   format(Date, sizeof(Date), "%02d/%02d/%02d", Y, M, D);
	   format(JTime, sizeof(JTime), "%02d:%02d:%02d", H, G, S);
	   dini_Set(File, "Joining Date", Date);
	   dini_Set(File, "Joining Time", JTime);
	   GivePlayerMoney(playerid,10000);

	   

	}
	if(dialogid == Login)
	{
	   new tmp;
	   GetPlayerName(playerid, Name, sizeof(Name));
	   format(File, sizeof(File), ACC, Name);
	   if(!response) Kick(playerid);
	   if(!strlen (inputtext)) return ShowPlayerDialog(playerid, Login, DIALOG_STYLE_PASSWORD, "{FF0000}Login!!!", "{FF0000}You Need To Type SomeThing And Thats Your Password Login!!!", "Login!", "Quit");
	   tmp = dini_Int(File, "Password");
	   if(udb_hash (inputtext) != tmp) {
	   PlayerPlaySound(playerid, 1058,0.0,0.0,0.0);
	   SendClientMessage(playerid, RED, "Wrong Password!");
	   ShowPlayerDialog(playerid, Login, DIALOG_STYLE_PASSWORD, "{FF0000}Login!!!", "{FF0000}Wrong Password Man try Again Man Or Leave Man!", "Login!", "Quit");
	}
	else
	{
       gPlayerLogged[playerid] = 1;
	   PlayerPlaySound(playerid, 1057,0.0,0.0,0.0);
	   GivePlayerMoney(playerid, dini_Int(File, "Cash"));
	   SetPlayerScore(playerid, dini_Int(File, "Score"));
	   

	   SendClientMessage(playerid, GREEN, "Logged In Succes Fully!!!");
       
	  
	   
	}
 }
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(GetPlayerWantedLevel(playerid) > 0)
	{
	    if(GetPlayerTeam(playerid) == 5)
	    {
		    if(GetPlayerWeapon(playerid) == 24)
	        {
            SetPlayerPos(hitid,-10.5125, 2328.4861, 24.5588);
			SetTimerEx("JailTime", 30000, false, "i",hitid);
	        }

	    }
    }
	return 1;
}
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    if(bodypart == 9)
	{
		SetPlayerHealth(playerid,0);
	}
	return 1;
}
// command
CMD:admin1234567890(playerid,params[])
{

   SetPlayerTeam(playerid,10);
   return 1;
}
CMD:ban(playerid,params[])
{
   if(GetPlayerTeam(playerid) == 10)
   {
   
   new playerb;
   if(sscanf(params, "u", playerb))
   return SendClientMessage(playerid,RED, "Usage: /kick playerid");

   SendClientMessage(playerid, YELLOW, "You've just kicked: %s");
   SendClientMessage(playerb, YELLOW, "You've just been kicked by: %s");

   Ban(playerb);
   }
   return 1;
}
CMD:rob(playerid,params[])
{
	
      if((delayrob) == 1)
      {    
		   if(GetPlayerTeam(playerid) == 4)
	       {
			
              SendClientMessage(playerid,-1,"Kamu Polisi Kocak Gaming");

		   }
		   else
		   {
               if(IsPlayerInRangeOfPoint(playerid,7.0,372.2035, -6.1020, 1001.8664))
               {
               ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 10000, 0);
               SetTimerEx("RobTime",10000,false,"i",playerid);
               TogglePlayerControllable(playerid,false);
               SetPlayerScore(playerid,1);
               SetPlayerWantedLevel(playerid, 2);
               delayrob = 0;
               }
               else if(IsPlayerInRangeOfPoint(playerid,7.0,379.8367, -118.7297, 1001.4868))
               {   
               ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 10000, 0);
               SetTimerEx("RobTime",10000,false,"i",playerid);
               TogglePlayerControllable(playerid,false);
               SetPlayerScore(playerid,1);
               delayrob = 0;
               SetPlayerWantedLevel(playerid, 2);

               }
               else if(IsPlayerInRangeOfPoint(playerid,7.0,-23.1167,-55.6360,1003.5469))
               {
               ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 10000, 0);
               SetTimerEx("RobTime",10000,false,"i",playerid);
               TogglePlayerControllable(playerid,false);
               SetPlayerScore(playerid,1);
               delayrob = 0;
               SetPlayerWantedLevel(playerid, 2);
               }
               else if(IsPlayerInRangeOfPoint(playerid,7.0,161.6957,-83.2530,1001.8047))
               {
               ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 10000, 0);
               SetTimerEx("RobTime",10000,false,"i",playerid);
               TogglePlayerControllable(playerid,false);
               SetPlayerScore(playerid,1);
               delayrob = 0;
               SetPlayerWantedLevel(playerid, 2);
               }
		   }
           

      }
      return 1;
}
CMD:shop(playerid,params[])
{
    if(IsPlayerInRangeOfPoint(playerid,1243.4094,-1699.7384,14.8672))
	{
		ShowPlayerDialog(playerid, STMSHOP, DIALOG_STYLE_LIST, "SHOP", "Katana\nBaseball\nGergaji\nPisau", "Choose", "Exit");
	}
	return 1;
}
// unoficial function

forward JailTime(hitid);
forward DialogPolice(playerid);
forward PayDay(playerid);
forward DialogMafia(playerid);
forward Closer(playerid);
forward Radiogaga(playerid);
forward Soviet(playerid);
forward Internationale(playerid);
forward RobTime(playerid);
forward DelayRob(playerid);

public JailTime(hitid)
{
    SetPlayerPos(hitid,2335.7957,2455.0149,14.9688);
    
	return 1;
}
public DelayRob(playerid)
{
	delayrob = 1;
	return 1;
}
public RobTime(playerid)
{
    ClearAnimations(playerid, 0);
    GivePlayerMoney(playerid,5000);
    TogglePlayerControllable(playerid,true);
	return 1;
}

public Internationale(playerid)
{
    PlayAudioStreamForPlayer(playerid, "https://www.mboxdrive.com/a.mp3");
	return 1;
}

public Soviet(playerid)
{
	PlayAudioStreamForPlayer(playerid, "https://www.mboxdrive.com/b.mp3");
	return 1;
}
public Radiogaga(playerid)
{
	PlayAudioStreamForPlayer(playerid, "https://www.mboxdrive.com/c.mp3");
	return 1;
}
public Closer(playerid)
{
     PlayAudioStreamForPlayer(playerid, "https://www.mboxdrive.com/d.mp3");
	 return 1;
}

public DialogPolice(playerid)
{
	ShowPlayerDialog(playerid,Police,DIALOG_STYLE_LIST,"Good Side","Police\n","Choose","Exit");
	return 1;
}
public PayDay(playerid)
{
	GivePlayerMoney(playerid,5000);

	return 1;
}

public DialogMafia(playerid)
{

    ShowPlayerDialog(playerid,Team,DIALOG_STYLE_LIST,"Mafia","Leone Family\nYakuza\nMara Salvarucha\nSisilian Family","Choose","Exit");
	return 1;
}

//Line
//Register Login System V1.0

/*public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_TEAM)
	{
		if(response)
		{
			switch(listitem)
			{
			   case 1:
			   {

				 SendClientMessage(playerid, -1, "Kamu Memilih Grove street");
				 GivePlayerWeapon(playerid,30,1000);
			   }
			   case 2:
			   {
                   SendClientMessage(playerid, -1, "Kamu Memilih Gang Ballas");
                   GivePlayerWeapon(playerid,31,1000);
			   }
			   case 3:
			   {

                   SendClientMessage(playerid, -1, "Kamu Memilih Gang Vagos");
                   GivePlayerWeapon(playerid,32,1000);
			   }
			}
		}
	}
	return 1;
}
*/


// end on 100k line

