create database if not exists movies;

use movies;

create table actor
(
	act_id int not null primary key,
    act_fname char(20),
    act_lname char(20),
    act_gender char(1)
);

create table genres
(
	gen_id int not null primary key,
    gen_title char(20)
);

create table movie_genres
(
	mov_id int not  null primary key,
    gen_id int not null,
    foreign key (gen_id) references genres (gen_id)
);

create table reviewer
(
	rev_id int not null primary key,
    rev_name char(30)
);

create table movie
(
	mov_id int not null primary key, 
    mov_title char(50),
    mov_year int,
    mov_time int, 
    mov_lang char(50),
    mov_dt_rel date,
    mov_rel_country char(5)
);

create table movie_cast
(
	act_id int not null,
    mov_id int not null,
    role char(30),
    foreign key (act_id)  references actor (act_id),
    foreign key (mov_id) references  movie (mov_id)
);

create table rating
(
	mov_id int not null,
    rev_id int not null,
    rev_star int,
    num_o_ratings int,
    foreign key(mov_id) references movie(mov_id),
    foreign key(rev_id) references reviewer(rev_id)
);

create table director
(
	dir_id int not null primary key,
    dir_fname char(20),
    dir_lname char(20)
);

create table movie_director
(
	dir_id int not null,
    mov_id int not null,
    foreign key (dir_id) references director (dir_id),
    foreign key (mov_id) references movie (mov_id)
);

-- change data type on table rating column rev_star
alter table rating modify column rev_star decimal(10,2);

insert into actor (act_id,act_fname,act_lname,act_gender) values (101,"James","Stewart","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (102,"Deborah","Keer","F");
insert into actor (act_id,act_fname,act_lname,act_gender) values (103,"Peter","OToole","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (104,"Robert","De Niro","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (105,"F.Murray","Abraham","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (106,"Harrison","Ford","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (107,"Nicole","Kidman","F");
insert into actor (act_id,act_fname,act_lname,act_gender) values (108,"Stephen","Baldwin","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (109,"Jack","Nicholson","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (110,"Mark","Wahlberg","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (111,"Woody","Allen","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (112,"Claire","Danes","F");
insert into actor (act_id,act_fname,act_lname,act_gender) values (113,"Tim","Robbins","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (114,"Kevin","Spacey","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (115,"Kate","Winslet","F");
insert into actor (act_id,act_fname,act_lname,act_gender) values (116,"Robin","Williams","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (117,"Jon","Voight","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (118,"Ewan","McGregor","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (119,"Christian","Bale","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (120,"Maggie","Gyllenhaal","F");
insert into actor (act_id,act_fname,act_lname,act_gender) values (121,"Dev","Patel","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (122,"Sigourney","Weaver","F");
insert into actor (act_id,act_fname,act_lname,act_gender) values (123,"David","Aston","M");
insert into actor (act_id,act_fname,act_lname,act_gender) values (124,"Ali","Astin","F");

insert into genres(gen_id,gen_title) values (1001,"Action");
insert into genres(gen_id,gen_title) values (1002,"Adventure");
insert into genres(gen_id,gen_title) values (1003,"Animation");
insert into genres(gen_id,gen_title) values (1004,"Biography");
insert into genres(gen_id,gen_title) values (1005,"Comedy");
insert into genres(gen_id,gen_title) values (1001,"Action");
insert into genres(gen_id,gen_title) values (1002,"Adventure");
insert into genres(gen_id,gen_title) values (1003,"Animation");
insert into genres(gen_id,gen_title) values (1004,"Biography");
insert into genres(gen_id,gen_title) values (1005,"Comedy");
insert into genres(gen_id,gen_title) values (1006,"Crime");
insert into genres(gen_id,gen_title) values (1007,"Drama");
insert into genres(gen_id,gen_title) values (1008,"Horor");
insert into genres(gen_id,gen_title) values (1009,"Music");
insert into genres(gen_id,gen_title) values (1010,"Mystery");
insert into genres(gen_id,gen_title) values (1011,"Romance");
insert into genres(gen_id,gen_title) values (1012,"Thriller");
insert into genres(gen_id,gen_title) values (1013,"War");

insert into director(dir_id,dir_fname,dir_lname) values (201,"Alfred","Hitchcock");
insert into director(dir_id,dir_fname,dir_lname) values (202,"Jack","Clayton");
insert into director(dir_id,dir_fname,dir_lname) values (203,"David","Lean");
insert into director(dir_id,dir_fname,dir_lname) values (204,"Michael","cimino");
insert into director(dir_id,dir_fname,dir_lname) values (205,"Milos","Forman");
insert into director(dir_id,dir_fname,dir_lname) values (206,"Ridley","Scott");
insert into director(dir_id,dir_fname,dir_lname) values (207,"Stanley","Kubrik");
insert into director(dir_id,dir_fname,dir_lname) values (208,"Bryan","Singer");
insert into director(dir_id,dir_fname,dir_lname) values (209,"Roman","Polanski");
insert into director(dir_id,dir_fname,dir_lname) values (210,"Paul","Thomas Anderson");
insert into director(dir_id,dir_fname,dir_lname) values (211,"Woody","Allen");
insert into director(dir_id,dir_fname,dir_lname) values (212,"Hayao","Miyazaki");
insert into director(dir_id,dir_fname,dir_lname) values (213,"Frank","Darabont");
insert into director(dir_id,dir_fname,dir_lname) values (214,"Sam","Mendes");
insert into director(dir_id,dir_fname,dir_lname) values (215,"James","Cameron");
insert into director(dir_id,dir_fname,dir_lname) values (216,"Gus","Van Sant");
insert into director(dir_id,dir_fname,dir_lname) values (217,"John","Boorman");
insert into director(dir_id,dir_fname,dir_lname) values (218,"Danny","Boyle");
insert into director(dir_id,dir_fname,dir_lname) values (219,"Christopher","Nolan");
insert into director(dir_id,dir_fname,dir_lname) values (220,"Richard","Kelly");
insert into director(dir_id,dir_fname,dir_lname) values (221,"Kevin","Spacey");
insert into director(dir_id,dir_fname,dir_lname) values (222,"Andrei","Tarkovsky");
insert into director(dir_id,dir_fname,dir_lname) values (223,"Peter","Jackson");

insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(901,"Vertigo",1958,128,"English","1958-08-24","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(902,"The Innocents",1961,100,"English","1962-02-19","SW");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(903,"Lawrence of Arabia",1962,216,"English","1962-12-11","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(904,"The Deer Hunter",1978,183,"English","1979-03-08","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(905,"Amadeus",1984,160,"English","1985-01-07","UK");

insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(906,"Blade Runner",1982,117,"English","1982-09-09","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country) 
values(907,"Eyes Wide Shut",1999,159,"English","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(908,"The Usual Suspects",1995,106,"English","1995-08-25","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(909,"Chinatown",1974,130,"English","1974-08-09","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(910,"Boogie Night",1997,155,"English","1998-02-16","UK");

insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(911,"Annie Hall",1977,93,"English","1977-04-20","USA");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(912,"Princess Mononoke",1997,134,"Japanese","2001-10-19","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(913,"The Shawshank Redemption",1994,142,"English","1995-02-17","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country) 
values(914,"American Beauty",1999,122,"English","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(915,"Titanic",1997,194,"English","1998-01-23","UK");

insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(916,"Good Will Hunting",1997,126,"English","1998-06-03","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(917,"Deliverance",1972,109,"English","1982-10-05","SW");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(918,"Trainspotting",1996,94,"English","1996-02-23","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(919,"The Prestige",2006,130,"English","2006-11-10","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_rel_country) 
values(920,"Donnie Darko",2001,113,"English","UK");

insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(921,"Slumdog Millionaire",2008,126,"English","2009-01-09","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(922,"Aliens",1986,109,"English","1986-08-29","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(923,"Beyond the Sea",2004,94,"English","2004-11-26","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(924,"Avatar",2009,130,"English","2009-12-17","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(925,"Seven Samurai",1995,178,"English","1995-09-08","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(926,"Seven Samurai",1954,113,"Japanese","1954-04-06","JP");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(927,"Beyond the Sea",2001,125,"Japanese","2003-09-12","UK");
insert into movie(mov_id,mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country) 
values(928,"Avatar",1985,116,"English","1985-12-04","UK");

insert into movie_genres (mov_id,gen_id) values (922,1001);
insert into movie_genres (mov_id,gen_id) values (917,1002);
insert into movie_genres (mov_id,gen_id) values (903,1002);
insert into movie_genres (mov_id,gen_id) values (912,1003);
insert into movie_genres (mov_id,gen_id) values (911,1005);
insert into movie_genres (mov_id,gen_id) values (908,1006);
insert into movie_genres (mov_id,gen_id) values (913,1006);
insert into movie_genres (mov_id,gen_id) values (926,1007);
insert into movie_genres (mov_id,gen_id) values (928,1007);
insert into movie_genres (mov_id,gen_id) values (918,1007);
insert into movie_genres (mov_id,gen_id) values (921,1007);
insert into movie_genres (mov_id,gen_id) values (902,1008);
insert into movie_genres (mov_id,gen_id) values (923,1009);
insert into movie_genres (mov_id,gen_id) values (907,1010);
insert into movie_genres (mov_id,gen_id) values (927,1010);
insert into movie_genres (mov_id,gen_id) values (901,1010);
insert into movie_genres (mov_id,gen_id) values (914,1011);
insert into movie_genres (mov_id,gen_id) values (906,1012);
insert into movie_genres (mov_id,gen_id) values (904,1013);

insert into movie_director(dir_id,mov_id) values(201,901);
insert into movie_director(dir_id,mov_id) values(202,902);
insert into movie_director(dir_id,mov_id) values(203,903);
insert into movie_director(dir_id,mov_id) values(204,904);
insert into movie_director(dir_id,mov_id) values(205,905);
insert into movie_director(dir_id,mov_id) values(206,906);
insert into movie_director(dir_id,mov_id) values(207,907);
insert into movie_director(dir_id,mov_id) values(208,908);
insert into movie_director(dir_id,mov_id) values(209,909);
insert into movie_director(dir_id,mov_id) values(210,910);
insert into movie_director(dir_id,mov_id) values(211,911);
insert into movie_director(dir_id,mov_id) values(212,912);
insert into movie_director(dir_id,mov_id) values(213,913);
insert into movie_director(dir_id,mov_id) values(214,914);
insert into movie_director(dir_id,mov_id) values(215,915);
insert into movie_director(dir_id,mov_id) values(216,916);
insert into movie_director(dir_id,mov_id) values(217,917);
insert into movie_director(dir_id,mov_id) values(218,918);
insert into movie_director(dir_id,mov_id) values(219,919);
insert into movie_director(dir_id,mov_id) values(220,920);
insert into movie_director(dir_id,mov_id) values(218,921);
insert into movie_director(dir_id,mov_id) values(215,922);
insert into movie_director(dir_id,mov_id) values(221,923);

insert into reviewer(rev_id,rev_name) values(9001,"Righty Sock");
insert into reviewer(rev_id,rev_name) values(9002,"Jack Malvern");
insert into reviewer(rev_id,rev_name) values(9003,"Flagrant Baronessa");
insert into reviewer(rev_id,rev_name) values(9004,"Alec Shaw");
insert into reviewer(rev_id) values(9005);
insert into reviewer(rev_id,rev_name) values(9006,"Victor Woeltjen");
insert into reviewer(rev_id,rev_name) values(9007,"Simon Wright");
insert into reviewer(rev_id,rev_name) values(9008,"Neal Wruck");
insert into reviewer(rev_id,rev_name) values(9009,"Paul Monks");
insert into reviewer(rev_id,rev_name) values(9010,"Mike Salvati");
insert into reviewer(rev_id) values(9011);
insert into reviewer(rev_id,rev_name) values(9012,"Wesley S. Walker");
insert into reviewer(rev_id,rev_name) values(9013,"Sasha Goldshtein");
insert into reviewer(rev_id,rev_name) values(9014,"Josh Cates");
insert into reviewer(rev_id,rev_name) values(9015,"Krug Stillo");
insert into reviewer(rev_id,rev_name) values(9016,"Scott LeBrun");
insert into reviewer(rev_id,rev_name) values(9017,"Hannah Steele");
insert into reviewer(rev_id,rev_name) values(9018,"Vincent Cadena");
insert into reviewer(rev_id,rev_name) values(9019,"Brandt Sponseller");
insert into reviewer(rev_id,rev_name) values(9020,"Richard Adams");

insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(901,9001,8.40,263575);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(902,9002,7.90,20207);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(903,9003,8.30,202778);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(906,9005,8.20,484764);
insert into rating (mov_id,rev_id,rev_star) values(924,9006,7.30);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(908,9007,8.60,779489);
insert into rating (mov_id,rev_id,num_o_ratings) values(909,9008,227235);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(910,9009,3.00,195961);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(911,9010,8.10,203875);
insert into rating (mov_id,rev_id,rev_star) values(912,9011,8.40);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(914,9013,7.00,862618);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(915,9001,7.70,830095);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(916,9014,4.00,642132);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(925,9015,7.70,81328);
insert into rating (mov_id,rev_id,num_o_ratings) values(918,9016,580301);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(920,9017,8.10,609451);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(921,9018,8.00,667758);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(922,9019,8.40,511613);
insert into rating (mov_id,rev_id,rev_star,num_o_ratings) values(923,9020,6.70,13091);

insert into movie_cast(act_id,mov_id,role) values(101,901,"John Scottie Ferguson");
insert into movie_cast(act_id,mov_id,role) values(102,902,"Miss Giddens");
insert into movie_cast(act_id,mov_id,role) values(103,903,"T.E. Lawrence");
insert into movie_cast(act_id,mov_id,role) values(104,904,"Michael");
insert into movie_cast(act_id,mov_id,role) values(105,905,"Antonio Salieri");
insert into movie_cast(act_id,mov_id,role) values(106,906,"Rick Deckard");
insert into movie_cast(act_id,mov_id,role) values(107,907,"Alice Harford");
insert into movie_cast(act_id,mov_id,role) values(108,908,"McManus");
insert into movie_cast(act_id,mov_id,role) values(110,910,"Eddie Adams");
insert into movie_cast(act_id,mov_id,role) values(111,911,"Alvy Singer");
insert into movie_cast(act_id,mov_id,role) values(112,912,"San");
insert into movie_cast(act_id,mov_id,role) values(113,913,"Andy Dufresne");
insert into movie_cast(act_id,mov_id,role) values(114,914,"Lester Burnham");
insert into movie_cast(act_id,mov_id,role) values(115,915,"Rose DeWitt Bukater");
insert into movie_cast(act_id,mov_id,role) values(116,916,"Sean Maguire");
insert into movie_cast(act_id,mov_id,role) values(117,917,"Ed");
insert into movie_cast(act_id,mov_id,role) values(118,918,"Reton");
insert into movie_cast(act_id,mov_id,role) values(120,920,"Elizabeth Darko");
insert into movie_cast(act_id,mov_id,role) values(121,921,"Older Jamal");
insert into movie_cast(act_id,mov_id,role) values(122,922,"Ripley");
insert into movie_cast(act_id,mov_id,role) values(114,923,"Bobby Darin");
insert into movie_cast(act_id,mov_id,role) values(109,909,"J.J. Gittes");
insert into movie_cast(act_id,mov_id,role) values(119,919,"Alfred Borden");