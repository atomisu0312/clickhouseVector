#!/bin/bash
# 繰り返し実行可能なサンプル

# 初期化スクリプトを実行
curl 'http://localhost:18123/?password=changeme' --data-binary @query/00_drop_db.sql
curl 'http://localhost:18123/?password=changeme' --data-binary @query/01_init_db.sql
curl 'http://localhost:18123/?password=changeme' --data-binary @query/02_init_table.sql

# 圧縮されたCSVファイルを解凍してデータを挿入
gzip -d -c query/03_output.csv.gz | 
  curl 'http://localhost:18123/?password=changeme&query=INSERT+INTO+mame_db.vector_sample+FORMAT+CSV' --data-binary @-

# データの確認
curl 'http://localhost:18123/?password=changeme' --data-binary @query/04_select_one.sql