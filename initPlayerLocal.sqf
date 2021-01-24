[player, -999] call BIS_fnc_respawnTickets;
setCurrentChannel 5;
0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
3 enableChannel false;
4 enableChannel false;
6 enableChannel false;

_bodyTrigger = createTrigger ["EmptyDetector", getPos basemedica, true];
_bodyTrigger setTriggerActivation ["CIV", "PRESENT", true];
_bodyTrigger setTriggerArea [10, 8, getDir basemedica, true];
_bodyTrigger setTriggerStatements
[
	"this",
	"
	{
		if(!((_x getVariable ['clientId', '']) isEqualTo '')) then {
			{
				[player, -999] call BIS_fnc_respawnTickets;
				[player, 1] call BIS_fnc_respawnTickets;
			} remoteExec ['bis_fnc_call', _x getVariable ['clientId','']];
			_x remoteExec ['deleteVehicle', 0];

			{
				if(isPlayer _x) then {
					{player switchMove '';} remoteExec ['bis_fnc_call', _x];
				};
			} forEach (getPos thisTrigger nearEntities 10);
		};
	} forEach thisList;
	",
	""
];

_bodyTrigger triggerAttachVehicle [veiculomedico];