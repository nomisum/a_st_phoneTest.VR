class GRAD_landline {

    class client_actions {
        file = grad-landline\functions\client\actions;

        class addAction;
        class cleanPhoneBookMap;
        class createPhoneList;
        class onPhoneBookEntrySelect;
        class onPhoneBookMapClick;
    };

    class client_calls {
        file = grad-landline\functions\client\calls;

        class callAccept;
        class callEnd;
        class callGetStatus;
        class callPluginActivate;
        class callPluginDeactivate;
        class callSetStatus;
        class callStart;
        class callWaitEnd;
        class callWaiting;

    };

    class client_sounds {
        file = grad-landline\functions\client\sounds;

        class soundHangUp;
        class soundHookIn;
        class soundInterrupted;
        class soundRing;
        class soundWaiting;
    };

    class client_far {
        file = grad-landline\functions\client\tfar;

      class setTFARfakeRadio;
    }




    class server_calls {
       file = grad-landline\functions\server\calls;

       class callRegister;
       class callRinging;
       class callUnregister;
    };

    class server_core {
       file = grad-landline\functions\server\core;

       class addPhone;
       class distributePhones;
       class initServer { preInit = 1; };
    };

    class server_number {
       file = grad-landline\functions\server\number;

       class assignPhoneNumber;
       class extractNumberFromPrefix;
       class generateBaseNumber;
       class generatePhoneNumber;
    };
    
};