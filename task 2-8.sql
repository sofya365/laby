/* Выбрать имена объектов с их качественной стоимостью 
(качественной стоимостью == ‘дешевый’ если monthlymaintenance < 100 и 
‘дорогой’ в противном случае*/
select facility,'дешевый' from facilities where monthlymaintenance < 100
union
select facility,'дорогой' from facilities where monthlymaintenance >= 100;