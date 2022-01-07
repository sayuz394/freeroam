/*
	Useful functions Include (utils.inc)
	* Handy functions and usefull !

 	Author: (creator)
	* Gammix

	(c) Copyright 2015
  	* This file is provided as is (no warranties).
*/
/*
FUNCTIONS:
native isnull(str[]);
native iseven(num);
native isodd(num);
native isnegative(num);
native ispositive(num);
native isfloat(str[]);
native ishex(str[]);
native isnumeric(str[]);
native Float:floatrand(Float:min, Float:max);
native ReturnPlayerName(playerid);
native ReturnPlayerIP(playerid);
*/

stock isnull(str[])
{
    if(str[0] == 0 || (str[0] == 1 && str[1] == 0)) return true;
    return false;
}

stock iseven(num)
{
	new r = (num % 2);
 	if(r > 0) return true;
  	return false;
}

stock isodd(num)
{
	return (! iseven(num));
}

stock isnegative(num)
{
 	if(num < 0) return true;
  	return false;
}


stock ispositive(num)
{
	return (! isnegative(num));
}

stock isfloat(str[])
{
	new l = strlen(str);
	new dcount = 0;
	for(new i=0; i<l; i++)
	{
 		if(str[i] == '.')
   		{
			if(i == 0 || i == l-1) return false;
		    else
		    {
      			dcount++;
			}
		}
  		if((str[i] > '9' || str[i] < '0') && str[i] != '+' && str[i] != '-' && str[i] != '.') return false;
    	if(str[i] == '+' || str[i] == '-')
	    {
			if(i != 0 || l == 1) return false;
		}
	}
	if(dcount == 0 || dcount > 1) return false;
	return true;
}

stock ishex(str[])
{
	new i, cur;
	if (str[0] == '0' && (str[1] == 'x' || str[1] == 'X')) i = 2;
	while (str[i])
	{
		cur = str[i++];
		if (!(('0' <= cur <= '9') || ('A' <= cur <= 'F') || ('a' <= cur <= 'f'))) return false;
	}
	return true;
}

stock isnumeric(str[])
{
	new ch, i;
	while ((ch = str[i++])) if (!('0' <= ch <= '9')) return false;
	return true;
}

stock ReturnPlayerName(playerid)
{
	new player_name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, player_name, MAX_PLAYER_NAME);
	return player_name;
}

stock ReturnPlayerIP(playerid)
{
	new player_ip[18];
	GetPlayerIp(playerid, player_ip, sizeof(player_ip));
	return player_ip;
}

stock Float:floatrand(Float:min, Float:max)
{
	new new_min;
	new_min = floatround(min);
	return float(random((floatround(max) - new_min) * 100) + (new_min * 100)) / 100.0;
}