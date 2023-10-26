/* Выбрать имена объектов с их качественной стоимостью 
(качественной стоимостью == ‘дешевый’ если monthlymaintenance < 100 и 
‘дорогой’ в противном случае*/
SELECT facility,'дешевый' FROM facilities WHERE monthlymaintenance < 100
UNION
SELECT facility,'дорогой' FROM facilities WHERE monthlymaintenance >= 100;