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



alter table T003_Personen add plz char(5)

-- Namen in einer Stadt erzeugen 
DECLARE @counter SMALLINT;  

declare @plz char(5) , @einwohner int

		DECLARE curPLZ CURSOR FOR  
		select * from T004_PLZ
		open curPLZ

		fetch next from curPLZ into @plz, @einwohner
	

		while @@FETCH_STATUS = 0
		begin
			print @plz

			SET @counter = 1;  
			WHILE @counter < cast(@einwohner  / 1000 as int)
			   BEGIN  
				insert into T003_Personen (Vorname, Nachname, plz) 
				  SELECT 
				  (select name from T002_Vorname where ID =  cast(RAND() * (select count(*) from T002_Vorname)   as int)) as Vorame
				  ,(select nachname from T001_Nachname where ID =  cast(RAND() * (select count(*) from T001_Nachname)   as int)) as name
				  ,@plz
				   SET @counter = @counter + 1  
			   END;  
		fetch next from curPLZ into @plz, @einwohner

		end
		close curPLZ
		DEALLOCATE curPLZ