// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: clientFlagHandler.sqf
//	@file Author: AgentRev
//	@file Created: 014/07/2013 13:56

if (isDedicated) exitWith {};

if (typeName _this == "ARRAY" && {count _this > 1}) then
{
	private ["_sentChecksum", "_playerUID"];
	_playerUID = param [0, "", [""]];
	_sentChecksum = param [1, "", [""]];

	if (_sentChecksum == _flagChecksum && {_playerUID == getPlayerUID player}) then
	{
		waitUntil {time > 0.1};

		disableUserInput true;
		setPlayerRespawnTime 1e11;

		if (damage player < 1) then // if check required to prevent "Killed" EH from getting triggered twice
		{
			player setVariable ["A3W_deathCause_local", ["forcekill"]];
			player setDamage 1;
		};

		1 fadeSound 0;
		sleep 1;

		0 fadeMusic 0;
		2 fadeMusic 1;
		playMusic "RadioAmbient1";

		999999 cutText ["", "BLACK", 5];
		sleep 5;

		// baibai hacker
		call compile preprocessFile "client\functions\quit.sqf";
	};
};
