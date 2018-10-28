params ["_callerPhoneObject", "_receiverPhoneObject"];

// prevent calling yourself
if (_callerPhoneObject isEqualTo _receiverPhoneObject) exitWith {
    hint "cant call yourself, dumbass";

    [_callerPhoneObject, "waiting"] call GRAD_landline_fnc_callSetStatus;
    [_callerPhoneObject] call GRAD_landline_fnc_soundWaiting;

    systemChat "callStart - wait";
};

private _callerNumber = _callerPhoneObject getVariable ["GRAD_LANDLINE_NUMBER_ASSIGNED", "no number"];

// caching for easy access
player setVariable ["GRAD_landline_objReceiver", _receiverPhoneObject];

// if no number is assigned
if (count _callerNumber isEqualTo 0) exitWith { diag_log "error, no number"; };

// go to calling, if receiver can receive
if ([_receiverPhoneObject, "idle"] call GRAD_landline_fnc_callGetStatus) then {
    // self assign status
    [_callerPhoneObject, "calling"] call GRAD_landline_fnc_callSetStatus;
    _receiverPhoneObject setVariable ["GRAD_landline_calledBy", player, true];

    // let server handle receiver status
    [_receiverPhoneObject] remoteExec ["GRAD_landline_fnc_callRinging", 2];

    systemChat "callStart - calling";

    // activate tfar stuff
    [_callerPhoneObject, _callerNumber] call GRAD_landline_fnc_callPluginActivate;
} else {
    [_callerPhoneObject, "waiting"] call GRAD_landline_fnc_callSetStatus;
    [_callerPhoneObject] call GRAD_landline_fnc_soundWaiting;

    systemChat "callStart - wait";
};
