-- create the village 

create schema if not exists village;
-- or replace

use village;

--!
drop table quests;
drop table heroes;
drop table villagers;



create or replace table heroes 
(
id int not null auto_increment,
name varchar(25) not null,
fame int not null default (0),

primary key (id)
);

create or replace table villagers 
(
id int not null auto_increment,
name varchar(25) not null,
constraint 
    primary key (id)
);


create or replace table quests 
(
id int not null auto_increment,
villager_id int not null,
hero_id int not null,
name varchar(25) not null,
fame int not null default (0),
constraint
    primary key (id),
constraint
        foreign key (villager_id) references villagers(id),
constraint
    foreign key (hero_id) references heroes(id)
);



insert into heroes (`name`) values
( 'atos' ),
( 'portos' ),
( 'aramis' ),
( 'dartanyan' );


insert into villagers (`name`) values
( 'vil1' ),
( 'vil2' ),
( 'vil3' ),
( 'vil4' ),
( 'vil5' ),
( 'vil6' );



insert into quests (villager_id, hero_id, name, fame) values
( 1, 1, 'que1', 20),
( 3, 4, 'que2', 10 );

