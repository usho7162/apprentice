1.データベースを構築
MySQLサーバーに接続します。接続にはMySQLクライアントやコマンドラインツールを使用します。
以下のコマンドを使用し、データベースを構築します。

CREATE DATABASE InternetTV;

構築したベータベースを使用します。

USE InternetTV;

2.テーブルを構築します。以下のコマンドを実行します。

-- テーブル1: Channel（チャンネル）
CREATE TABLE Channel (
  channel_id INT AUTO_INCREMENT PRIMARY KEY,
  channel_name VARCHAR(255)
);

-- テーブル2: TimeSlot（番組枠）
CREATE TABLE TimeSlot (
  timeslot_id INT AUTO_INCREMENT PRIMARY KEY,
  channel_id INT,
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);

-- テーブル3: Program（番組）
CREATE TABLE Program (
  program_id INT AUTO_INCREMENT PRIMARY KEY,
  program_title VARCHAR(255),
  program_description TEXT,
  genres VARCHAR(255),
  is_series BOOLEAN,
  season_number INT,
  episode_number INT,
  release_date DATE
);

-- テーブル4: Episode（エピソード）
CREATE TABLE Episode (
  episode_id INT AUTO_INCREMENT PRIMARY KEY,
  program_id INT,
  season_number INT,
  episode_number INT,
  episode_title VARCHAR(255),
  episode_description TEXT,
  duration TIME,
  release_date DATE,
  FOREIGN KEY (program_id) REFERENCES Program(program_id)
);

-- テーブル5: Viewership（視聴数）
CREATE TABLE Viewership (
  viewership_id INT AUTO_INCREMENT PRIMARY KEY,
  episode_id INT,
  timeslot_id INT,
  viewership_count INT DEFAULT 0,
  FOREIGN KEY (episode_id) REFERENCES Episode(episode_id),
  FOREIGN KEY (timeslot_id) REFERENCES TimeSlot(timeslot_id)
);


3.サンプルデータを入れます。以下のコマンドを実行します。

-- テーブル1: Channel（チャンネル）
INSERT INTO Channel (channel_name)
VALUES ('チャンネルA'), ('チャンネルB'), ('チャンネルC');

-- テーブル2: TimeSlot（番組枠）
INSERT INTO TimeSlot (channel_id, start_time, end_time)
VALUES (1, '08:00:00', '09:30:00'),
       (2, '12:00:00', '13:30:00'),
       (3, '19:00:00', '20:30:00');

-- テーブル3: Program（番組）
INSERT INTO Program (program_title, program_description, genres, is_series, season_number, episode_number, release_date)
VALUES ('番組A', '番組Aの説明', 'ドラマ', TRUE, 1, 1, '2023-01-01'),
       ('番組B', '番組Bの説明', 'バラエティ,音楽', FALSE, NULL, NULL, '2023-02-15'),
       ('番組C', '番組Cの説明', 'アニメ', TRUE, 2, 10, '2023-03-10');

-- テーブル4: Episode（エピソード）
INSERT INTO Episode (program_id, season_number, episode_number, episode_title, episode_description, duration, release_date)
VALUES (1, 1, 1, 'エピソード1', 'エピソード1の説明', '00:30:00', '2023-01-05'),
       (3, 2, 10, 'エピソード10', 'エピソード10の説明', '00:25:00', '2023-03-15');


-- テーブル5: Viewership（視聴数）
INSERT INTO Viewership (episode_id, timeslot_id, viewership_count)
VALUES (1, 1, 1000),
       (1, 3, 500),
       (2, 2, 800),
       (3, 3, 1200);

