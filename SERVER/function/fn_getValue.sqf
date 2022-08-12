params ["_v"];

private _skill = switch _v do {
    case 1:{0.1};
    case 2:{0.15};
    case 3:{0.2};
    case 4:{0.25};
    case 5:{0.3};
    case 6:{0.35};
    case 7:{0.4};
    case 8:{0.45};
    case 9:{0.5};
    case 10:{0.55};
    case 11:{0.6};
    case 12:{0.65};
    case 13:{0.7 };
    case 14:{0.75 };
    case 15:{0.8};
    case 16:{0.85};
    case 17:{0.9};
    case 18:{0.95};
    case 19:{1};
};

if(true) exitWith {_skill};
 