create database spotifydb;
use spotifydb;
ALTER table top2018 
rename spotify18;

SELECT 
    *
FROM
    spotify18;

-- Which artists had the most Top 100 songs?
SELECT 
    artists, COUNT(name) AS songs
FROM
    spotify18
GROUP BY artists
ORDER BY COUNT(name) DESC;

-- Are there more artists in the Top 100 with 'Lil' in their name, or with 'DJ' in their name?
SELECT 
    artists, COUNT(name)
FROM
    spotify18
WHERE
    artists LIKE '%Lil%'
        OR artists LIKE '%DJ%'
GROUP BY artists;

-- Which song attributes are most strongly correlated? What attributes seem to have very little correlation?


-- Which attributes have the most variability? Which tend to be the most similar among the Top 100 songs?

