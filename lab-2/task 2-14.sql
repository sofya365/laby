/* Выберите самый дорогой и самый дешевый объект.*/
SELECT max(initialoutlay), 'дорогой' FROM facilities;
SELECT facility,'дешевый' FROM facilities WHERE initialoutlay = (SELECT max(initialoutlay) FROM facilities)
OR initialoutlay = (SELECT min(initialoutlay) FROM facilities);