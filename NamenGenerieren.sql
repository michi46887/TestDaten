create table T003_Personen (ID int identity not null , Vorname varchar(100), Nachname varchar(100))


DECLARE @counter SMALLINT;  
SET @counter = 1;  
WHILE @counter < 5000  
   BEGIN  
	insert into T003_Personen (Vorname, Nachname) 
      SELECT 
	  (select name from T002_Vorname where ID =  cast(RAND() * (select count(*) from T002_Vorname)   as int)) as Vorame
	  ,(select nachname from T001_Nachname where ID =  cast(RAND() * (select count(*) from T001_Nachname)   as int)) as name
	   SET @counter = @counter + 1  
   END;  
GO