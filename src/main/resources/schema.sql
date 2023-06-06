DROP TABLE IF EXISTS users,films,film_likes,friendship,genres_films,rating,genres CASCADE;

CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    login VARCHAR(50) UNIQUE,
	name VARCHAR(50),
	email VARCHAR(50) UNIQUE,
	birthday DATE
);
CREATE TABLE IF NOT EXISTS films (
    film_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(200),
    releaseDate DATE,
    duration INTEGER,
    mpa_id INTEGER
);
CREATE TABLE IF NOT EXISTS film_likes (
    film_id INTEGER REFERENCES films(film_id),
    user_id INTEGER REFERENCES users(user_id)
);
CREATE TABLE IF NOT EXISTS friendship (
    user_id INTEGER REFERENCES users(user_id),
    friend_id INTEGER REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS rating (
    mpa_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS genres (
    genre_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS genres_films (
    film_id INTEGER REFERENCES films(film_id),
    genre_id INTEGER
);