/*

    server manages ringing state

*/

params ["_receiverObject"];

[_receiverObject, "ringing"] call GRAD_landline_fnc_callSetStatus;

private _position = getPos _receiverObject;
private _boundingBox = boundingBoxReal vehicle player;
_boundingBox params ["_p1", "_p2"];
private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

// set sound to middle bounding box of phone object, best possible estimation of actual phone
_position set [2, _maxHeight/2];


private _dummy = createVehicle ["Sign_Sphere25cm_Geometry_F", _position, [], 0, "CAN_COLLIDE"];

// todo hide dummy visually

[_dummy] remoteExec ["GRAD_landline_fnc_soundRing", [0,-2] select isDedicated];

waitUntil { !([_receiverObject, "ringing"] call GRAD_landline_fnc_callGetStatus) };

deleteVehicle _dummy;