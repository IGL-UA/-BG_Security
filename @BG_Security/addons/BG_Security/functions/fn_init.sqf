/*
	Author: IGL

	Опис:
    При заході на сервер зрівнюються дані гравця з базою даних на сайті.
*/

//if (!isServer) exitWith {};

// Define global vars
#include "\userconfig\BG_Security\config.hpp"; 

onPlayerConnected {
			// Ідентифікація гравця
_INFplayer = [];
   {
        if !(_uid == _x select 1) then { 
        systemChat format ["%1 - відсутня реєстрація на Arma 3 Big Game!", _name];  
        ps serverCommand format ["#kick %1 %2 - відсутня реєстрація на Arma 3 Big Game!", _uid, _name];
        diag_log text ("BG_Security: " + format ["#kick %1 %2 - відсутня реєстрація на Arma 3 Big Game! (Перевірка по GUID)", _uid, _name]);		
        } else { 
                 _INFplayer append [_x];		
               }; 
   } foreach IDplayers;
waitUntil {count _INFplayer > 0};
 {
    if !("false" == _x select 2) then { 
                systemChat format ["%1 - доступ заблокований!", _name]; 
                ps serverCommand format ["#kick %1 %2 - доступ заблокований!", _uid, _name];
                diag_log text ("BG_Security: " + format ["#kick %1 %2 - доступ заблокований! (ЗАБАНЕНИЙ)", _uid, _name]);				
                } else { 
                        if !(_name == _x select 0) then { 
                        systemChat format ["%1 - ім'я не збігається! (Зареєстрований як %2)", _name, _x select 0]; 
                        ps serverCommand format ["#kick %1 %2 - ім'я не збігається! (Зареєстрований як %3)", _uid, _name, _x select 0];
                        diag_log text ("BG_Security: " + format ["#kick %1 %2 - ім'я не збігається! (Зареєстрований в базі як - %3)", _uid, _name, _x select 0]);						
                        } else {systemChat format ["BG_Security: %1 - Підтверджено.", _name];}; 
                        }; 
  } foreach _INFplayer; 
};  