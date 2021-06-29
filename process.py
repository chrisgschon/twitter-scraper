

import pandas as pd
import json
import argparse
import numpy as np


def process_tweets(date):

    l =[]

    with open(f'data/{date}.json', 'r') as f:
        for line in f:
            l.append(json.loads(line))

    df_o = pd.DataFrame.from_dict(l[0]['data'])
    users_o = pd.DataFrame.from_dict(l[0]['includes']['users'])
    df = pd.DataFrame(columns=df_o.columns)
    users = pd.DataFrame(columns=users_o.columns)

    for i in np.arange(1, 10000):
        try:
            df = df.append(pd.DataFrame.from_dict(l[i]['data']))
            users = users.append(pd.DataFrame.from_dict(l[i]['includes']['users']))
        except:
            break

    for metric in ['retweet_count', 'like_count', 'reply_count', 'quote_count']:
        df[metric] = df['public_metrics'].apply(lambda x: dict(x).get(metric))

    for metric in ['followers_count', 'following_count', 'tweet_count', 'listed_count']:
        users[metric] = users['public_metrics'].apply(lambda x: dict(x).get(metric))

    tweet_cols = ['id', 'author_id','created_at', 'text', 'retweet_count', 'like_count', 'reply_count', 'quote_count']
    user_cols = ['id', 'username', 'name', 'profile_image_url', 'description', 'location', 'followers_count', 'following_count',
                'tweet_count', 'listed_count']

    tweets = df.sort_values('retweet_count', ascending=False)[tweet_cols].drop_duplicates()
    users = users[user_cols].drop_duplicates(subset=['id'], keep='last')
    
    return tweets, users

if __name__=="__main__":

    parser = argparse.ArgumentParser()

    parser.add_argument("--date", type=str,
                        help="Date of tweets to process")

    args = parser.parse_args()

    date = args.date

    tweets, users = process_tweets(date)

    print('tweets shape:', tweets.shape)
    print('unique tweet authors:', len(tweets['author_id'].unique()))
    print('users shape:', users.shape)

    tweets.to_csv(f'csvs/{date}/tweets.csv',index=False)

    users.to_csv(f'csvs/{date}/users.csv',index=False)