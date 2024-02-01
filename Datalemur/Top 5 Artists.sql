-- Common Table Expression (CTE) named 'cte' to calculate dense ranking of artists based on the count of songs with global rank within the top 10
WITH cte AS (
  -- Selecting artist_name and calculating dense rank based on the count of songs' song_id in descending order
  SELECT 
    artist_name,
    DENSE_RANK() OVER(ORDER BY COUNT(songs.song_id) DESC) AS artist_rank  
  FROM 
    artists
  INNER JOIN 
    songs ON artists.artist_id = songs.artist_id
  INNER JOIN 
    global_song_rank ON songs.song_id = global_song_rank.song_id
  WHERE 
    rank <= 10  -- Including only songs with global rank within the top 10
  GROUP BY 
    1
  ORDER BY 
    2 ASC
)

-- Selecting artist_name and artist_rank from the CTE where artist_rank is within the top 5
SELECT 
  artist_name,
  artist_rank 
FROM 
  cte
WHERE 
  artist_rank <= 5;
