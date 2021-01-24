{
	if(_x inArea thisTrigger) then {
		respawn = true;
		bodyPlayers select(bodyAgents find _x) publicVariableClient 'respawn';
		deleteVehicle _x;
		{
			_x playActionNow '';
		} forEach thisList;
	};
} forEach bodyAgents;
// {
// 	if(_x in bodyAgents) then {
// 		respawn = true;
// 		bodyPlayers select(bodyAgents find _x) publicVariableClient 'respawn';
//  		deleteVehicle _x;
// 	} else {
		
// 	};
// } forEach thisList;