# -BG_Security
WiteList for Server<br/>
(Серверний аддон для проекта Arma 3 Ukraine "Великі Ігри")
Встановлення:
1. Закинути папку з аддоном @BG_Security в корінь сервера
2. Прописати у файлі запуску його запуск як серверного мода ---  "-serverMod=@BG_Security"
3. Для клієнтів він не потрібен!
4. Перекинути папку userconfig в корінь серверу та налаштувати файл config.hpp
В самому файлі config.hpp всього два рядка:
- масив з користувачами і інформацією по ним
- пароль адміністратора
- Наприклад:
IDplayers = [["IGL", "77777777777777777", "false"],["DAS", "22222222222222227", "false"],["MAD", "7333333333333377", "false"]];
ps = "010101";
5. Не забудьте в конфігу сервера задати пароль командою
serverCommandPassword = "010101";

Як це працює:
При старті в гру гравця перевіряється по трьом параметрам GUID, NickName, Status Ban
Якщо не проходить етап перевірки гравець викидається з сервера з зазначенням причини.
Також все записується в лог сервера з приставкою "BG_Security:"
