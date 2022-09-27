# creating table named personal which carries personal data of the player such as id name age country which they belong to as selecting primary key as id
CREATE TABLE `olymp`.`personal` (
  `id` BIGINT NOT NULL,
  `name` VARCHAR(100) NULL,
  `age` INT NULL,
  `country` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) );

#using insert into to fill the new table from the old table 
INSERT INTO personal (id,name,age,country)
SELECT id,name,age,country
FROM ds_15_data;

#creating other table named country which has player id and the country which they belong to here the primary key is idcountry as well as the foreign key 
CREATE TABLE `olymp`.`country` (
  `idcountry` BIGINT NOT NULL,
  `country` VARCHAR(100) NULL,
  PRIMARY KEY (`idcountry`),
  CONSTRAINT `id`
    FOREIGN KEY (`idcountry`)
    REFERENCES `olymp`.`personal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
#using insert into to fill the new table from the old table 
INSERT INTO country (idcountry,country)
SELECT id,country
FROM ds_15_data;



#creating another table named date which consists of player id, date which he has played and the year primery as well as foregin key is id here 
CREATE TABLE `olymp`.`date` (
  `id` BIGINT NOT NULL,
  `date` TEXT NULL,
  `year` TEXT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_date`
    FOREIGN KEY (`id`)
    REFERENCES `olymp`.`personal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


#using insert into to fill the new table from the old table 
INSERT INTO date (id,date,year)
SELECT id,Date_given,year
FROM ds_15_data;


#creatinhg table named sports which has player id and the sports which he played here the foreign key is id as idsports
CREATE TABLE `olymp`.`sports` (
  `idsports` BIGINT NOT NULL,
  `sports` VARCHAR(100) NULL,
  PRIMARY KEY (`idsports`),
  CONSTRAINT `player_id`
    FOREIGN KEY (`idsports`)
    REFERENCES `olymp`.`personal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
  #using insert into to fill the new table from the old table   
INSERT INTO sports (idsports,sports)
SELECT id,sports
FROM ds_15_data;

#creating tbale as medal which consists of player id gold medal sliver medal brone medal and the total medal which the player has won.
CREATE TABLE `olymp`.`medal` (
  `id` BIGINT NOT NULL,
  `gold` INT NULL,
  `silver` INT NULL,
  `brone` INT NULL,
  `total` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_medal`
    FOREIGN KEY (`id`)
    REFERENCES `olymp`.`personal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
#using insert into to fill the new table from the old table     
INSERT INTO medal (id,gold,silver,brone,total)
SELECT id,gold_medal,silver_medal,brone_medal,total_medal
FROM ds_15_data;




# The average number of medals won by each country

SELECT avg(m.total)as avg_medal,c.country   #selecting average of total medal and country 
FROM medal m
JOIN country c      #from table medal and country and joining on id and idcountry 
ON m.id=c.idcountry
GROUP BY c.country            #grouping by country
;



# The countries and the number of gold medals they have won in decreasing order

SELECT c.country,count(m.gold)as gold    #selcting country and the total gold medal count
FROM country c,medal m 
WHERE m.id=c.idcountry                   #from table country nad medal where id=idcountry
GROUP BY c.country                       #grouping by country
ORDER BY gold desc;                      #ordering by gold medals in descending order


# The list of people and the medals they have won in descending order, grouped by their country

SELECT p.name,m.gold,m.silver,m.brone,m.total,c.country    #selcting name, countries and medals
FROM personal p,medal m,country c                          #from personal and country and medal table
WHERE c.idcountry=m.id                                     #where all table id are equal
AND m.id=p.id                                                 
AND p.id=c.idcountry
GROUP BY  C.COUNTRY                                        #grouping by country
ORDER BY total,gold,silver,brone desc;                     #ordering by gold,silver,brone,total in descending order


# The list of people with the medals they have won according to their age
SELECT p.name,m.gold,m.silver,m.brone,m.total,p.age       #selcting name,age,,gold,sliver,brone,total medal
FROM personal p,medal m                #from personal and medal tables
WHERE m.id=p.id                       #where ids are equal
GROUP BY p.age
ORDER BY p.age desc; #grouping and ordering by age 


# country that has won the most number of medals (cumulative)
SELECT c.country ,m.total         #selcting countrybnad total medal 
FROM country c, medal m         #from country and medal table
WHERE m.id=c.idcountry           
GROUP BY C.COUNTRY 
ORDER BY M.TOTAL DESC           #grouping by country and ordering by total medals in descending order
LIMIT 3;                    #showing only top 3 countries 