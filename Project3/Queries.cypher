//q1
match(u:User)-[p:POSTED]->(t:Tweet)
where t.month = "1" and t.year = "2016"
return t.retweet_count as tw,t.text,u.screen_name,u.category,u.sub_category
order by toInteger(tw) DESC limit 5;

//q2
match (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
where t.year = "2016" and h.name <> "" and s. name <> "na"
with distinct toLower(h.name) as hashtagName, count(DISTINCT toLower(s.name)) as statenum, collect(DISTINCT toLower(s.name)) as states
return hashtagName,statenum,states
order by statenum  desc limit 5;

//q3 
match (u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
where h.name = "HappyNewYear" or h.name = "NewYear" or h.name ="NewYears" or h.name ="NewYearsDay"
with DISTINCT u.screen_name as name, u.location as Location, toInteger(u.followers) as f
return  name, Location
order by f  desc limit 12;

//q4
match (u:User)
where u.sub_category = "GOP"
return u.screen_name,u.sub_category,u.followers
order by toInteger(u.followers) desc limit 5;

match (u:User)
where u.sub_category = "democrat"
return u.screen_name,u.sub_category,u.followers
order by toInteger(u.followers) desc limit 5;

//q5 
match (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
where (s.name = "Ohio" or s.name = "Alaska" or s.name  = "Alabama") and t.year = "2016" and t.month = "1" and h.name <> ""
return distinct h.name,s.name
order by toLower(h.name);

//q6 slightly off 
match (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
 where h.name = "Ohio" and s.name = "Ohio" and  (u.sub_category = "GOP" or u.sub_category = "democrat") and t.month = "1" and t.year =  "2016"
 return t.text, h.name, u.screen_name, u.sub_category
 order by u.sub_category desc limit 5 ;


//q7 
match (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)-[ur:URL_USED]->(ul:Url)
 where u.sub_category = "GOP"  and t.month = "1" and t.year = "2016" and ul.url <> ""
return  u.screen_name,s.name, collect(ul.url) as urrl
order by toLower(u.screen_name);

//q8
match (s:State)-[f:FROM]-(u:User)-[p:POSTED]->(t:Tweet)-[m:MENTIONED]->(u2:User)
where u.sub_category = "GOP" and t.month = "1" and t.year = "2016" and u2.screen_name <> "" 
with  u2.screen_name as mScreenName,collect(distinct u.screen_name) as c,count(u2.screen_name) as num, s.state as statee
return mScreenName,statee, c
order by num  desc limit 5;

//q9
match (u:User)-[p:POSTED]->(t:Tweet)<-[ta:TAGGED]-(h:Hashtag)
where (u.sub_category = "GOP") and (t.month = "1" or t.month = "2" or t.month = "3") and t.year =  "2016" and h.name <> ""
with  toLower(h.name) as hashtagName
return hashtagName,count(toLower(hashtagName)) as tweetcount
order by tweetcount  desc limit 5;