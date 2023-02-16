-- Bigquery Marketplace: https://console.cloud.google.com/marketplace/browsefilter=solution-type:dataset&q=listenbrainz

CREATE OR REPLACE TABLE `github.listens`

AS

SELECT
  artist_name AS artist
  , track_name
  , listened_at
  , user_name
  , CASE WHEN artist_name IN ('AC/DC', 'Lynyrd Skynyrd','Van Halen','Eagles','Led Zeppelin') THEN 'Classic Rock'
         WHEN artist_name IN ('Alan Jackson','Billy Currington','Eric Church','Zac Brown Band','Josh Turner') THEN 'Country'
         WHEN artist_name IN ('Sam Cooke','Otis Redding','The Foundations','The Jackson 5','Marvin Gaye') THEN 'Soul'
         WHEN artist_name IN ('2Pac','Kid Cudi','Kanye West','Snoop Dogg','Lil Wayne') THEN 'Rap'
    END AS genre
FROM
  `listenbrainz.listenbrainz.listen`
WHERE
  artist_name IN ('AC/DC', 'Lynyrd Skynyrd','Van Halen','Eagles','Led Zeppelin', -- Classic Rock
                  'Alan Jackson','Billy Currington','Eric Church','Zac Brown Band','Josh Turner', -- Country
                  'Sam Cooke','Otis Redding','The Foundations','The Jackson 5','Marvin Gaye', -- Soul
                  '2Pac','Kid Cudi','Kanye West','Snoop Dogg','Lil Wayne') -- Rap
;

-- Replace Table with your own here
SELECT * FROM `elite-totality-301818.github.listens`

;








