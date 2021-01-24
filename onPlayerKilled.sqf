call BIS_fnc_respawnSpectator;
hideBody player;
params [
	"_oldUnit",
	"_killer",
	"_respawn",
	"_respawnDelay"
];
_agent = createAgent[typeOf player, getPos player, [], 0, "CAN_COLLIDE"];
[_agent, true] remoteExec ["hideObjectGlobal", 0];
[_agent, false] remoteExec ["allowDamage", 0];
[_agent, getUnitLoadout _oldUnit] remoteExec ["setUnitLoadout", 0];
[_agent, name _oldUnit] remoteExec ["setName", 0];
[_agent, face _oldUnit] remoteExec ["setFace", 0];
[[_agent, 4], ace_medical_treatment_fnc_setTriageStatus] remoteExec ["bis_fnc_call", 0];
[_agent, true] remoteExec ["setUnconscious", 0];
_agent setVariable ["ACE_isUnconscious", true, true]; 
nul = [_agent, true] execVM "\z\ace\addons\medical\functions\fnc_setUnconscious.sqf";
_agent setVariable ["clientId", clientOwner, true];
sleep 1;
[player, true] remoteExec ["hideObjectGlobal", 0];
[_agent, false] remoteExec ["hideObjectGlobal", 0];
