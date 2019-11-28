create database movies;
use movies;
create table actor(
act_id 			integer 	not null,
act_fname 		char (20) 	not null,
act_lname 		char(20) 	not null,
act_gender 		char(1) 	not null,
constraint 		actor_pk 	primary key (act_id)
);
  create table director(
dir_id 		integer 		not null,
dir_fname 	char (20) 		not null,
dir_lname 	char(20) 		not null,
constraint 		director_pk 	primary key (dir_id)
  );
create table movie_direction(
dir_id 		integer 		not null,
mov_id 		integer 		not null,
constraint movie_direction_pk primary key (rev_id,mov_id),
constraint 		movie_direction2_fk 	foreign key (dir_id)
								references director(dir_id),
constraint 		movie_direction1_fk 	foreign key (mov_id)
								references movie(mov_id)
  );
  create table movie_cast(
act_id integer not null,
mov_id integer not null,
movie_role char(30) not null,
constraint movie_cast_pk primary key (act_id,mov_id),
constraint 		movie_cast1_fk 	foreign key (act_id)
									references actor(act_id),
constraint 		movie_cast2_fk 	foreign key (mov_id)
									references movie(mov_id)

  );
  create table movie(
mov_id integer not null,
mov_title char (50) not null,
mov_year integer not null,
mov_time integer not null,
mov_lang char (50) not null,
mov_dt_rel date not null,
mov_rel_country char(5) not null,
constraint movie_pk primary key(mov_id)
  );
  create table reviewer(
rev_id integer not null,
rev_name char (30) not null,
constraint 		reviewer_pk 	primary key (rev_id)
									
  );
  create table genres(
gen_id integer not null,
gen_title char (20) not null,
constraint 		genres_pk		primary key (gen_id)
  );
  create table movie_genres(
mov_id integer not null,
gen_id integer not null,
constraint movie_genres_pk primary key (gen_id,mov_id),
constraint 		movie_genresa_fk 	foreign key (gen_id)
									references genres(gen_id),
constraint 		movie_genresb_fk 	foreign key (mov_id)
									references movie(mov_id)
  );
  create table rating(
mov_id integer not null,
rev_id integer not null,
rev_stars integer not null,
num_o_ratings integer not null,
constraint rating_pk primary key (rev_id,mov_id),
constraint 		ratings1_fk 	foreign key (rev_id)
									references reviewer(rev_id),
constraint 		ratings2_fk 	foreign key (mov_id)
									references movie(mov_id)
  );