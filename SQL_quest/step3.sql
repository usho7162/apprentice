1,よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください。

SELECT 
    E.episode_title, 
    V.viewership_count
FROM
    Episode E
INNER JOIN 
    Viewership V 
ON 
    E.episode_id = V.episode_id    
ORDER BY 
    V.viewership_count DESC
LIMIT 3;

2,よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
  エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください

SELECT 
    P.program_title, 
    E.season_number,
    E.episode_number,
    E.episode_title,
    V.viewership_count
FROM 
    Episode E
INNER JOIN 
    Viewership V 
    ON 
    E.episode_id = V.episode_id
INNER JOIN 
    Program P 
    ON 
    E.program_id = P.program_id
ORDER BY 
    V.viewership_count DESC
LIMIT 3;

3,本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
  本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
  なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします。

SELECT 
    C.channel_name, 
    CONCAT(CURRENT_DATE(), ' ', TS.start_time) AS start_datetime, 
    CONCAT(CURRENT_DATE(), ' ', TS.end_time) AS end_datetime, 
    P.season_number, 
    P.episode_number, 
    E.episode_title, 
    E.episode_description
FROM 
    TimeSlot TS
INNER JOIN 
    Channel C 
    ON 
    TS.channel_id = C.channel_id
INNER JOIN 
    Program P 
    ON 
    TS.timeslot_id = P.program_id
LEFT JOIN 
    Episode E 
    ON 
    P.program_id = E.program_id
WHERE 
    P.release_date = CURRENT_DATE()
ORDER BY 
    TS.start_time;

4,ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
  ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください。
SELECT 
    P.release_date, 
    TS.start_time,
    TS.end_time,
    P.season_number,
    P.episode_number,
    E.episode_title,
    E.episode_description
FROM 
    TimeSlot TS
JOIN 
    Channel C 
    ON
    TS.channel_id = C.channel_id
JOIN 
    Program P 
    ON 
    TS.timeslot_id = P.program_id
JOIN 
    Episode E ON P.program_id = E.program_id
WHERE 
    C.channel_name = 'ドラマ'
    AND 
    P.is_series = TRUE
    AND 
    P.release_date 
BETWEEN
    CURDATE() 
    AND 
    DATE_ADD(CURDATE(), INTERVAL 7 DAY)
ORDER BY 
    P.release_date, TS.start_time;


