-- 1.) show movie title and movie year
with movie1 as
(
	select mov_title,
    mov_year from movie
)select * from movie1;

-- 2.) show movie year where the title 'American Beauty'
with movie2 as
(
	select mov_year from movie where mov_title ='American Beauty'
)select * from movie2;

-- 3.) show movie title that was released in 1999
with movie3 as
(
	select mov_title from movie where mov_year = 1999
)select * from movie3;

-- 4.) show movie title which were released before 1998
with movie4 as
(
	select mov_title from movie where mov_year < 1998
)select * from movie4;

-- 5.) show name of reviewers 
with reviewer_mov as
(
	select rev_name from reviewer
	union 
	select mov_title from movie
)select * from reviewer_mov;

-- ANOTHER WAY
with reviewer_name as
(
	select rev_name as name from reviewer
),movie_title as
(
	select mov_title as name from movie
)
select name from reviewer_name
union 
select name from movie_title;

-- 6.) show reviewer name who have rated seven or more stars to their rating
with review_rate as
(
	select re.rev_name from reviewer re
    join rating r
    on r.rev_id = re.rev_id
    where r.rev_star >= 7 
) select * from review_rate where rev_name is not null;

-- 7.) show movie title without any rating
with movie7 as
(
	select mov_title from movie
    where mov_id not in (select mov_id from rating)
)select * from movie7;

-- 8.) show movie title with ID 905,907,OR 917
with movie8 as
(
	select mov_title from movie
    where mov_id in (905,907,917)
) select * from movie8;

-- 9.) show movieID, movie title and movie year where title 'Boogie Night'.Sort asc order by movie year
with movie9 as
(
	select mov_id, mov_title, mov_year from movie
)select * from movie9 where mov_title regexp 'Boogie Night' order by mov_year;

-- 10.) show actor id with the first name 'Woody' and last name 'Allen'
with actor10 as
(
	select act_id from actor where
    act_fname regexp '^Woody' and act_lname regexp 'Allen$'
)select * from actor10;

-- 11.) show all actor table to find actor who played role in 'Anne Hall'
with actor11 as
(
	select * from actor
    where act_id in (select act_id from movie_cast 
	where mov_id in (select mov_id from movie where mov_title = 'Annie Hall'))
)select * from actor11;

-- 12.) show first name	and last name to find director of casr a role in 'Eyes Wide Shut'
with director12 as
(
	select dir_fname, dir_lname from director
    where dir_id in (select dir_id from movie_director
    where mov_id in (select mov_id from movie_cast 
    where mov_id in (select mov_id from movie where mov_title = 'Eyes Wide Shut')))
)select * from director12;

/* 13.) show movie title, movie year, movie time, and date of release, releasing country.
that released in countries other than the United Kingdom */
with movie13 as
(
	select mov_title as Title, mov_year as Year, mov_time as Duration,
    mov_dt_rel as 'Data of Release', mov_rel_country as 'Releasing Country'
    from movie 
)select * from movie13 where `Releasing Country` != 'UK';

/* 14.) movie title, year, release date, director first name, last name, 
actor first name, last name whose reviewer is unknown */
with unknown_rev as
(
	select m.mov_title as tile, m.mov_year as year, m.mov_dt_rel as 'release date',
    d.dir_fname , d.dir_lname, a.act_fname, a.act_lname 
    from movie m
    join movie_director md
    on m.mov_id = md.mov_id
    join director d
    on md.dir_id = d.dir_id
    join movie_cast mc
    on m.mov_id = mc.mov_id
    join actor a
    on mc.act_id = a.act_id
    join rating ra
    on m.mov_id = ra.mov_id
    join reviewer r
    on ra.rev_id = r.rev_id
    where r.rev_name is null
)select * from unknown_rev;

-- 15 show movie title directed by the director whose first name is Woddy
with mov_dir as
(
	select m.mov_title from movie m
    join movie_director md
    on m.mov_id = md.mov_id
    join director d
    on md.dir_id = d.dir_id
    where d.dir_fname like "Woody%"
)select * from mov_dir;

-- 16.) show movie year that that received a rating of at least three stars
with mov_rate as
(
	select distinct mov_year from movie where mov_id in
    (select mov_id from rating where rev_star >= 3) 
)select * from mov_rate order by mov_year;

-- 17.) show movie title for movies that do not have any ratings
with mov_no_rate as
(
	select distinct mov_title from movie
    where mov_id not in (select mov_id from rating)
)select * from mov_no_rate;

-- 18.) show name reviewer who have not given a rating to certain films
with rev_name as
(
	select rev_name from reviewer
    where rev_id in (select rev_id from rating where rev_star is null)
)select * from rev_name;

/* 19.) show name reviewer, movie title, review star
to find movies that have been reviewed by a reviewer and received a rating,
Sort order by reviewer name, movie title, review Stars ascending */
with rev_mov_name as 
(
	select r.rev_name, m.mov_title, ra.rev_star
	from reviewer r
	join rating ra
	on r.rev_id = ra.rev_id
	join movie m
	on ra.mov_id = m.mov_id
)select * from rev_mov_name
where rev_star is not null and rev_name is not null order by 1,2,3 asc;

/* 20.) show reviewer name, movie title. to find movies that have been 
reviewed by a reviewer and received a rating. Group on reviewer’s name, movie title.*/
with rev_mov_name as
(
	select r.rev_name, m.mov_title
    from reviewer r
    join rating ra 
    on r.rev_id = ra.rev_id
    join movie m
    on ra.mov_id = m.mov_id
    join rating ra2
    on ra.rev_id = ra2.rev_id
    where ra.rev_star is not null 
)select * from rev_mov_name 
where rev_name is not null 
group by rev_name, mov_title having count(*) > 1;

/* 21.) show movie title and max number of rev star which have received highest number of star
group by movie title and sort ascending order by movie title */
with mov_rev as 
(
	select m.mov_title, r.rev_star
	from movie m
	join rating r
	on m.mov_id = r.mov_id
)select mov_title, max(rev_star) from mov_rev
group by mov_title 
having max(rev_star) is not null order by 1;

-- 22.) show reviewer name who rated the movie 'American Beauty'
with reviewer_name as
(
	select r.rev_name, m.mov_title
    from reviewer r
    join rating ra
    on r.rev_id = ra.rev_id
    join movie m
    on ra.mov_id = m.mov_id
)select rev_name from reviewer_name where mov_title = 'American Beauty';

-- 23.) show movie title that have not been reviewed by any reviewer body other than 'Paul Monks'.
with reviewer_movie_name as
(
	select mov_title
	from movie
    where mov_id in (select mov_id from rating where rev_id not in 
    (select rev_id from reviewer where rev_name = 'Paul Monks'))
)select mov_title from reviewer_movie_name;

-- 24.) show reviewer name, movie title, number of stars for those movies with the lowest ratings. 
with low_rate as
(
	select r.rev_name,
    m.mov_title,
    ra.rev_star,
    dense_rank() over (order by ra.rev_star asc) ranking
    from movie m
    join rating ra
    on m.mov_id = ra.mov_id
    join reviewer r 
    on ra.rev_id = r.rev_id where ra.rev_star is not null
)select rev_name,mov_title,rev_star from low_rate where ranking = 1;

-- 25.) show movie title  directed by 'James Cameron'
with directed_movie as
(
	select m.mov_title, concat(d.dir_fname,' ',d.dir_lname) director_name
    from movie m
    join movie_director md
    on m.mov_id = md.mov_id
    join director d
    on md.dir_id = d.dir_id
)select mov_title from directed_movie where director_name = 'James Cameron';

-- 26.) show movie title which one or more actors appeared in more than one film.
with actor_film as
(
	select a.act_id, count(m.mov_id) jumlah
    from movie m
    join movie_cast mc
    on m.mov_id = mc.mov_id
    join actor a
    on mc.act_id = a.act_id
    group by 1
)select mov_title 
from movie 
where mov_id in 
(select mov_id from movie_cast where act_id in
(select act_id from actor_film where jumlah > 1));

-- 27.) show reviewer name whose ratings contain a NULL value
with rev_star_name as
(
	select rev_name, rev_star
	from reviewer 
	join rating
	using (rev_id)
)select rev_name from rev_star_name where rev_star is null;

-- 28.) show actor first name, last name and role who was cast in the movie 'Annie Hall'
with cast_name as
(
	select a.act_fname, a.act_lname, mc.role, m.mov_title
    from actor a
    join movie_cast mc
    using(act_id)
    join movie m
    using (mov_id)
)select act_fname,act_lname,role from cast_name where mov_title = 'Annie Hall';

-- 29.) show director first name, last name and movie title who directed a movie 'Eyes Wide Shut'
with dir_name as
(
	select d.dir_fname, d.dir_lname, m.mov_title
    from director d
    join movie_director md
    using (dir_id)
    join movie m
    using (mov_id)
)select * from dir_name where mov_title = 'Eyes Wide Shut';

-- 30) show director first name, last name and movie title that cast a role as Sean Maguire
with cast_movie as
(
	select d.dir_fname, d.dir_lname, m.mov_title, mc.role
    from director d
    join movie_director md
    using (dir_id)
    join movie m
    using (mov_id)
    join movie_cast mc
    using (mov_id)
)select dir_fname, dir_lname,mov_title from cast_movie where role = 'Sean Maguire';

/* 31.) show  actor first name, last name, movie title and release year.
which actors have not appeared in any movies between 1990 and 2000 */
with actor_movie as
(
	select a.act_fname, a.act_lname, m.mov_title, m.mov_year
    from movie m
    join movie_cast mc
    using (mov_id)
    join actor a
    using (act_id)
)select * from actor_movie where mov_year not  between 1990 and 2000;

/* 32.) show director first name, last name and number of genres movies
who have directed films in a variety of genres,  Group by  first name, last name and genre title
Sort ascending order by director first name and last name */
with dir_name as
(
	select d.dir_fname, d.dir_lname, g.gen_id, g.gen_title
	from director d
	join movie_director md
	using (dir_id)
	join movie m
	using (mov_id)
	join movie_genres mg
	using (mov_id)
	join genres g
	using (gen_id)
)select dir_fname, dir_lname,gen_title,count(gen_title) jumlah from dir_name group by dir_fname, dir_lname,gen_title 
having count(gen_title) > 1 order by 1,2 ;

-- 33.) show movie title, movie year and genre title with year and genres
with mov_year_gen as
(
	select m.mov_title, m.mov_year, g.gen_title
    from movie m
    join movie_genres mg
	using(mov_id)
    join genres g
	using (gen_id)
)select * from mov_year_gen where mov_year is not null and gen_title is not null;

-- 34.) show movie title year, genres, and name of the director
with mov_title as
(
	select m.mov_title, m.mov_year, g.gen_title,d.dir_fname, d.dir_lname
    from director d
    join movie_director md
    using (dir_id)
    join movie m
    using (mov_id)
    join movie_genres mg
    using (mov_id)
    join genres g
    using (gen_id)
)select * from mov_title;

/* 35.) show movie title, release year, date of release, duration, and first and last name of the director.
 released before 1st January 1989. Sort descending order by date of release */
 with movie_release as
 (
	select m.mov_title, m.mov_year,m.mov_dt_rel,m.mov_time,d.dir_fname,d.dir_lname
    from director d
    join movie_director md
    using (dir_id)
    join movie m
    using (mov_id)
 )select * from movie_release where mov_dt_rel < "1989-01-01" order by 3 desc;
 
 /* 36 genre title, average time and number of movies for each genre
 calculate the average movie length and count the number of movies in each genre.*/
 with time_movie as
 (
	select g.gen_title,m.mov_time,m.mov_title
    from genres g
    join movie_genres mg
    using(gen_id)
    join movie m
    using (mov_id)
 )select gen_title, avg(mov_time) avg_time,count(mov_title) total_mov from time_movie group by gen_title;
 
 /* 37.) show movie title, movie year, director first name, last name, actor first name, last name and role
 with the shortest duration*/
 with shortest_duration as
 (
	select m.mov_title, m.mov_year,d.dir_fname,d.dir_lname,a.act_fname,a.act_lname,mc.role,m.mov_time
    from actor a
    join movie_cast mc
    using (act_id)
    join movie m
    using (mov_id)
    join movie_director md
    using (mov_id)
    join director d
    using (dir_id)
 )select mov_title, mov_year,dir_fname,dir_lname,act_fname,act_lname,role 
 from shortest_duration where mov_time = (select min(mov_time) from shortest_duration);
 
 -- 38.) show movie year which a movie received a rating of 3 or 4.
 with movie_rating as
 (
	select m.mov_year,r.rev_star
    from movie m
    join rating r
    using (mov_id)
 )select distinct mov_year from movie_rating where rev_star in (3,4);
 
/* 39.) show reviewer name, movie title, review star 
order that reviewer name will come first, then by movie title, and lastly by number of stars */
with reviewer_name as
(
	select r.rev_name,m.mov_title,ra.rev_star
    from reviewer r
    join rating ra
    using (rev_id)
    join movie m
    using (mov_id)
)select * from reviewer_name
where rev_name is not null order by 1,2,3;

-- 40.) show mov title and maximum review star, that have at least one rating and received the most stars. Sort by movie title
with review_title as
(
	select m.mov_title, ra.rev_star
    from movie m
    join rating ra
    using (mov_id)
)select mov_title, max(rev_star) from review_title where rev_star is not null group by mov_title order by mov_title;

-- 41.) show movie title, director first name, director last name and review stars which movies have received ratings.
with have_rating as
(
	select m.mov_title, d.dir_fname, d.dir_lname, ra.rev_star
    from director d
    join movie_director md
    using (dir_id)
    join movie m
    using (mov_id)
    join rating ra
    using (mov_id)
)select * from have_rating where rev_star is not null;

-- 42.) show movie title, actor first and last name, and the role. which one or more actors have acted in more than one film
with actors as
(
	select m.mov_title, a.act_fname, a.act_lname, mc.role
    from actor a 
    join movie_cast mc
    using (act_id)
    join movie m
    using (mov_id)
)select * from actors
where (act_fname,act_lname) in (select act_fname, act_lname from actors group by 1,2 having count(*) > 1);

/* 43.) show director first name, last name, movie title, actor first name and last name, role.
who actor first name is 'Claire' and last name is 'Danes' */ 
with actor_movie43 as
(
	select d.dir_fname, d.dir_lname, m.mov_title, a.act_fname, a.act_lname, mc.role
    from director d
    join movie_director md
    using (dir_id)
    join movie m
    using (mov_id)
    join movie_cast mc
    using (mov_id)
    join actor a
    using (act_id)
)select * from actor_movie43 where act_fname = 'Claire' and act_lname = 'Danes';

-- 44.) show actor first name, last name, movie title and role for actors whose films have been directed by them
with actor_movie44 as
(
	select a.act_fname, a.act_lname, m.mov_title, mc.role, d.dir_fname, d.dir_lname
    from actor a
    join movie_cast mc
    using (act_id)
    join movie m
    using (mov_id)
    join movie_director md
    using (mov_id)
    join director d 
    using (dir_id)
)select act_fname, act_lname, mov_title, role
from actor_movie44
WHERE act_fname = dir_fname 
  AND act_lname = dir_lname;

-- 45.) show first name, last name to find the cast list of the movie ‘Chinatown’
with find_cast as
(
	select a.act_fname, a.act_lname,m.mov_title
    from actor a
    join movie_cast mc
    using (act_id)
    join movie m
    using (mov_id)
)select act_fname,act_lname from find_cast where mov_title = 'Chinatown';

-- 46.) show movie title where actor’s first name is 'Harrison' and last name is 'Ford'
with actor_name as
(
	select m.mov_title, a.act_fname,a.act_lname
    from actor a
    join movie_cast mc
    using (act_id)
    join movie m
    using (mov_id)
)select mov_title from actor_name where act_fname = "Harrison" and act_lname = "Ford";

-- 47.) show movie title, movie year, review stars and releasing country o find the highest-rated movies
with show_highest_rate as
(
	select m.mov_title, m.mov_year, ra.rev_star,m.mov_rel_country
    from rating ra
    join movie m
    using (mov_id)
)select * from show_highest_rate where rev_star = (select max(rev_star) from show_highest_rate);

-- 48.) show title, year, and rating to find the highest-rated ‘Mystery Movies’
with highest_rate_mystery as
(
	select m.mov_title,m.mov_year,ra.rev_star,g.gen_title
    from rating ra
    join movie m 
    using (mov_id)
    join movie_genres mg
    using (mov_id)
    join genres g
    using (gen_id)
)select mov_title,mov_year,rev_star from highest_rate_mystery 
where gen_title = "Mystery" and rev_star = (select max(rev_star) from highest_rate_mystery where gen_title = "Mystery") ;

/* 49.) show movie year, genre title, number of genre title and average rating 
to find the years when most of the ‘Mystery Movies’ produced. Group by movie release year, generic title */
with genre_movie_avg as
(
	select m.mov_year, g.gen_title, count(g.gen_title)total_gen_title, avg(ra.rev_star) avg_rev_star
    from genres g
    join movie_genres mg
    using (gen_id)
    join movie m
    using (mov_id)
    join rating ra
    using (mov_id)
    group by 1,2
)select * from genre_movie_avg where gen_title = "Mystery";

/* 50.) show movie title, name of the female actor, year of the movie, role, 
movie genres, the director, date of release, and rating of that movie */
with show_report as
(
	select m.mov_title, a.act_fname, a.act_lname, m.mov_year, mc.role,
    g.gen_title,d.dir_fname,d.dir_lname,m.mov_dt_rel,ra.rev_star,a.act_gender
    from actor a
    join movie_cast mc
    using (act_id)
    join movie m
    using (mov_id)
    join movie_director md
    using (mov_id)
    join director d
    using (dir_id)
    join rating ra
    using (mov_id)
    join movie_genres mg
    using (mov_id)
    join genres g
    using (gen_id)
)select mov_title, act_fname, act_lname, mov_year, role,
gen_title,dir_fname,dir_lname,mov_dt_rel,rev_star
from show_report where act_gender = "F";