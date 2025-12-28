--class5
--crime database

--HINT #1
-- On a cold winter night, a brutal murder shocked the quiet
--streets of Chattanooga.
--The crime scene was puzzling, but a few nervous witnesses
--spoke of shady figures seen around a nearby gym and at a
--Facebook event the night before.
--As the lead data detective, you must sift through mountains
--of data to uncover the truth - using nothing but SQL."

--CRIME is murder / city is  sequel city / on 2018-02-18

select * 
from crime_scene
where type ='Murder' and city = 'sequel city' and date='2018-02-18'

--lets read the description 

/*security camera in the 
 neighborhood captured two
 figures who may be witnesses.
 The first one lives at 513
 Hamilton Dr. The second one
 was tentatively identified by
 one of the police officers as a
 man named George, who lives
 on Independence St.*/

--to get there IDs
SELECT *
FROM individual
WHERE (name like '%George%' and address like '%independence%')
   OR address = '%Hamilton%'; 

 --where have two witnesses with id  201/328 

--NOW we go to see there interrogation

select *
from interrogation
where individual_id = '201' or individual_id ='328' 

--201 SAYES
--I heard a scream and then saw someone run away. I thought it was just a robbery, 
--but then I saw the pool of blood and freaked out. The guy that escaped accidentally 
--left a card from the Muscle Hassle Gym. 
--The ID member number was damaged but it starts with a 33. A minute later,
--I heard tyre screeches and saw a car pass by real fast, and the plate had ZDI or something like that.

--328 SAYES
--And, for the rest of the way home, I recited to them the various exploits and triumphs of Hercule Poirot.

--INFORMATION WE GOT 
--1.left a card from the Muscle Hassle Gym
--2.starts with a 33
--3.car plate had ZDI or something like that

-------------------------------------------------------------
--NOW lets serch for the GYM meamber that have this car 

select i.id , i.name,d.plate ,g.id as gym_id
from individual i
inner join drivers d on d.id=i.driver_id
inner join gym_affiliated g on g.individual_id=i.id
where g.status='Muscle Hassle' 
and g.id like'33%'

-- The suspect Tris MacVagh with id = 981
--lets see what tris sayes 
select *
from interrogation i
where i.individual_id='981'


--I did not know the deceased. I was just following orders. I met a woman on a blind date who I really liked.
--She promised me that if I killed the guy she would be with me forever. I believed her, but then she disappeared and is not answering my calls. 
--I remember her hair was blonde and her eyes were green. She said goodbye to me and I watched her drive away in a Pontiac. 
--On our date she mentioned her love of private rock concerts and said she had not been to one since 2016.

--lets serch according to the car type , hair color and eye  she is a girl how like rock event and didint do to one sense 2016
select i.id,i.name,d.gender,d.hair_color,d.eye_color,d.car_make,f.date,f.event_description
from drivers d
inner join individual i on d.id=i.driver_id
inner join facebook_event f on f.individual_id=i.id
where d.hair_color='blonde' and d.eye_color='green' and d.car_make='Pontiac' and d.gender='Female' 
and f.date like '%2016%'
--output:Berry Esmead
--------------------------------------------
--lets see what Berry Esmead with id 402 says
select *
from interrogation
where individual_id='402'

--We three sat for some time in silence. It was a glorious night, 
--hot and still. Mrs. Cavendish fanned herself gently with a palm leaf.

