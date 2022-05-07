![1 001 001](https://user-images.githubusercontent.com/104857185/167037090-9cd548c0-9643-4903-adce-13e2a039226d.jpg)
# LoadWorkDataAirFlightsDBNew

Наработки по:
 - авиационному процессингу,
 - телематике,
 - телеметрии.

Справочные, рабочие и оперативные SQL-ные базы данных в инфраструктуре с СУБД MS SQL согласно имен входа и их прав доступа.

Для записи рабочих и оперативных данных на клиентах в источниках данных необходимо настроить системный DSN

Справочные данные по:
  - объектам (аэропорты, аэродромы, авиабазы, взлетные полосы и хелипады),
  - авиакомпаниям,
  - летательным аппаратам
 
Уход от взаимоблокировок при чтения/записи СУБД сделан с помощью обертывания цикла с нарастающей задержкой в обработку исключения, потому что сервер СУБД на дает обратные вызовы (хуки или паузы до прерывания) клиентам на повторную попытку. Поэтому при интенсивных запросах к СУБД теряется время. Начально значение и шаг увеличения задержки выбран экспериментально по результататм тестов.

Доработать базу по летательным аппаратам таким образом, чтобы писать в нее:
 - арендодателей (необязательно),
 - арендаторов (владельцев),
 - операторов
в XML-ных полях и парсить их как DOM по веткам и подветкам, чтобы писать подветки по указанной в аттребуте дате.

Сделать графическую формочку для правки данных по ним.
 
Летательные аппараты, авиакомпании, объекты (аэропорты, аэродромы, авиабазы)
----
Текущие задачи:
 - Надо найти способ применить комплектый с MS SQL функционал XPath & XQuery, чтобы 
нормально парсить XML-ное поле как DOM по веткам и по подветкам с указанными атрубутами и вставлять новые подветки с датами
 - Сделать графическую формочку для правки свойств альянсов (или делать это внутри Management Studio из-под учетки sysadmin)
 - Добавить виджетов на вкладке свойств объекта
 - Уточнить набор свойств и сделать их вывод набором виджетов на вкладках
 - Сделать удостоверение пользователей по сертификату (ЭЦП) на USB-ом токене
 - Сделать отдельную вкладку ВПП со всеми свойствами (широта, долгота, абс. отметка, длина, ширина и т. д.)

Замечания в исходниках см. по тэгам todo и fixme
----
Предусмотрена работа на инфраструктуре с СУБД по учеткам Windows Server-а и с заранее сделанной конфигой сервера СУБД через терминальный сервер
 - все пользователи работают с одной версией интерпретатора,
 - все пользователи работают с одним набором библиотек,
 - экономия ресурса серверов
