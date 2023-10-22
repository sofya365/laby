/* Выбрать объекты, которые платны для членов клуба, но стоимость 
использование не превышает 1/50 от стоимость месячного обслуживания 
(monthlymaintenance).*/ 
select facility from facilities where guestcost < (monthlymaintenance/50) or membercost < (monthlymaintenance/50) and membercost!=0;