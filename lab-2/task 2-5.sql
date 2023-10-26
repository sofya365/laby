/* Выбрать объекты, которые платны для членов клуба, но стоимость 
использование не превышает 1/50 от стоимость месячного обслуживания 
(monthlymaintenance).*/ 
SELECT facility FROM facilities WHERE guestcost < (monthlymaintenance/50) OR membercost < (monthlymaintenance/50) AND membercost!=0;