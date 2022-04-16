SELECT people.name FROM people
JOIN directors ON directors.person_id=people.id
JOIN movies ON movies.id=directors.movie_id
Join ratings ON ratings.movie_id=movies.id
WHERE ratings.rating=9.0 OR ratings.rating>9.0;