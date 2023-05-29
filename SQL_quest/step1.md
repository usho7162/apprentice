<summary><h2>STEP01：テーブル設計</h2></summary>　　


<h3>テーブル1：Channel（チャンネル）</h3>

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
| channel_id | INT |  | PRIMARY |  | YES |
| channel_name | VACHAR |  |  |  |  |

<br>

<h3>テーブル2：TimeSlot（番組枠）</h3>

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
| timeslot_id | INT |  | PRIMARY |  | YES |
| channel_id | INT |  | FOREIGN |  |  |
| start_time | TIME |  |  |  |  |
| end_time | TIME |  |  |  |  |

<br> 

<h3>テーブル3：Program（番組）</h3>

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
| program_id | INT |  | PRIMARY |  | YES |
| program_title | VARCHAR |  |  |  |  |
| program_description | TEXT |  |  |  |  |
| genres | VARCHAR |  |  |  |  |
| is_series | BOOLEAN |  |  |  |  |
| season_number | INTEGER |  |  |  |  |
| episode_number | INTEGER |  |  |  |  |
| release_date | DATE |  |  |  |  |


<br> 

<h3>テーブル4： Episode（エピソード）</h3>

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
| episode_id | INT |  | PRIMARY |  | YES |
| program_id | INT |  | FOREIGN  |  |  |
| season_number | INT |  |  |  |  |
| episode_number | INT |  |  |  |  |
| episode_title | VARCHAR |  |  |  |  |
| episode_description | TEXT |  |  |  |  |
| duration | TIME |  |  |  |  |
| release_date | DATE |  |  |  |  |

<br> 

<h3>テーブル5：Viewership（視聴数）</h3>

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
| viewership_id | INT |  | PRIMARY |  | YES |
| episode_id | INT |  |  | FOREIGN |  |  |
| timeslot_id | INT |  |  | FOREIGN |  |  |
| viewership_count | INT |  |  |  | 0 |  |

<br> 




