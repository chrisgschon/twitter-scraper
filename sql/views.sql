create view tweets_wide
            (id, author_id, created_at, text, retweet_count, like_count, reply_count, quote_count, username, name,
             followers_count) as
SELECT t.id,
       t.author_id,
       t.created_at,
       t.text,
       t.retweet_count,
       t.like_count,
       t.reply_count,
       t.quote_count,
       u.username,
       u.name,
       u.followers_count
FROM tweets t
         LEFT JOIN users u ON t.author_id = u.id;

alter table tweets_wide
    owner to postgres;