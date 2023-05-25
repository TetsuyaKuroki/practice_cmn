import pandas as pd
import codecs

# CSVファイルを読み込む
with codecs.open('\\Attachment.csv', 'r', 'shift_jis', 'ignore') as f:
    df = pd.read_csv(f)

# 必要な列だけを残す
df = df[['Id', 'Name', 'ParentId', 'CreatedDate']]

# 'CreatedDate'列をDatetime型に変換する
df['CreatedDate'] = pd.to_datetime(df['CreatedDate'])

# 2020年3月31日以降の行だけを選択する
df = df[df['CreatedDate'] > '2020-03-31']

# 結果を新しいCSVファイルに保存する
df.to_csv('Attachment_edited.csv', index=False)