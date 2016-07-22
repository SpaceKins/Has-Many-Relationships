
/*
DROP USER IF EXISTS denormal_user;
CREATE USER denormal_user CREATEDB LOGIN;  -- WITH PASSWORD 'password' 

DROP USER IF EXISTS normal_user;
CREATE USER normal_user CREATEDB LOGIN;  -- WITH PASSWORD 'password' 

DROP DATABASE IF EXISTS has_many_blogs;
CREATE DATABASE has_many_blogs;
*/

\c has_many_blogs;

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE IF NOT EXISTS users
(
  id SERIAL PRIMARY KEY NOT NULL
  ,username character varying(90) NOT NULL
  ,first_name character varying(90)  NULL
  ,last_name character varying(90)  NULL
  ,created_at timestamp NOT NULL DEFAULT statement_timestamp()
  ,updated_at timestamp NOT NULL DEFAULT statement_timestamp()
);


DROP TABLE IF EXISTS posts CASCADE;

CREATE TABLE IF NOT EXISTS posts
(
  id SERIAL PRIMARY KEY NOT NULL 
  ,title character varying(180) NULL
  ,url character varying(510)  NULL
  ,content text  NULL
  ,created_at timestamp NOT NULL DEFAULT statement_timestamp()
  ,updated_at timestamp NOT NULL DEFAULT statement_timestamp()
  ,user_id INT NOT NULL REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments
(
  id SERIAL PRIMARY KEY NOT NULL
  ,body character varying(510)  NULL
  ,created_at timestamp NOT NULL DEFAULT statement_timestamp()
  ,updated_at timestamp NOT NULL DEFAULT statement_timestamp()
  ,user_id INT NOT NULL REFERENCES users(id)
  ,post_id INT NOT NULL REFERENCES posts(id)
);
