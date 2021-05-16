use yt1421;

--create projects table
drop table if exists projects;
create external table projects 
(id BIGINT, url STRING, owner_id BIGINT, name String, description STRING, language STRING, 
created_at STRING, forked_from BIGINT, deleted TINYINT, updated_at STRING, forked_commit_id BIGINT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE 
LOCATION "hdfs://horton.hpc.nyu.edu:8020/user/yt1421/project/data/project/";

--check how many lines 
select count(1) from projects;


--create cleanedProjects table by selecting the columns we need.
drop table if exists cleanedProjects;
create table cleanedProjects
as select id, language, created_at from projects 
where language is not null;

