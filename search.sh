
search_tweets.py \
  --max-tweets 50000 \
  --results-per-call 100 \
  --query "(#LoveIsland) -is:retweet" \
  --expansions "author_id" \
  --no-print-stream \
  --credential-file "creds.yaml" \
  --tweet-fields "id,author_id,text,geo,public_metrics,created_at,entities" \
  --user-fields "id,name,username,description,location,profile_image_url,public_metrics,verified" \
  --start-time "2021-06-28T00:00" \
  --end-time "2021-06-29T00:00" \
  --filename-prefix "data/2021-06-28"

# field options [attachments,author_id,context_annotations,
#   conversation_id,created_at,entities,geo,id,in_reply_to_user_id,
#   lang,non_public_metrics,organic_metrics,possibly_sensitive,
#   promoted_metrics,public_metrics,referenced_tweets,
#   reply_settings,source,text,withheld]


# user fields

# https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/user

