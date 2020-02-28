create table tempcat_member(
id VARCHAR2(15) primary key,
pw VARCHAR2(15) not null,
name VARCHAR2(15) not null,
nickname VARCHAR2(15) not null,
email VARCHAR2(25) not null,
inputdate date default sysdate,
logindate date default sysdate
);

create table tempcat_board(

);

create table reply(

);