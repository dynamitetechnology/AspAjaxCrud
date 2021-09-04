create database ajaxcrud;
use ajaxcrud;

create table users(
id int identity primary key,
name varchar(200),
username varchar(200),
email varchar(200),
active char(1) default 'Y'
)

select id,name, username, email from users where active ='Y'

insert into users(name, username, email )
values ('Suraj Vishwakarma','Admin','surajvishwakarmaadsa@gmail.com' )


select * from users;
