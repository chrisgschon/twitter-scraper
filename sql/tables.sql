create table contestants
(
    id          serial  not null
        constraint contestants_pk
            primary key,
    name        text    not null,
    gender      text    not null,
    age         integer not null,
    race        text    not null,
    date_joined date    not null,
    date_left   date
);

alter table contestants
    owner to postgres;

create unique index contestants_id_uindex
    on contestants (id);

create table tweets
(
    id            numeric not null
        constraint tweets_pk
            primary key,
    author_id     numeric,
    created_at    text,
    text          text,
    retweet_count integer,
    like_count    integer,
    reply_count   integer,
    quote_count   integer
);

alter table tweets
    owner to postgres;


create table users
(
    id                numeric not null
        constraint users_pk
            primary key,
    username          text,
    name              text,
    profile_image_url text,
    description       text,
    location          text,
    followers_count   integer,
    following_count   integer,
    tweet_count       integer,
    listed_count      integer
);

alter table users
    owner to postgres;


    

