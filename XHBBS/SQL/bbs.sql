create table article(
id int primary key auto_increment,
pid int,
rootid int,
title varchar(255),
cont text,
pdate datetime,
isleaf int
);

insert into article values(null,0,1,'PHP是最好的编程语言','PHP是最好的编程语言，谁敢不服，干死她',now(),1);
insert into article values(null,1,1,'不明觉历，楼下怎么看','不明觉历，楼下怎么看',now(),1);
insert into article values(null,1,1,'C/C++是世界上最好的编程语言','C/C++是世界上最好的编程语言',now(),0);
insert into article values(null,2,1,'C#是世界上最好的编程语言','C#是世界上最好的编程语言+1111111111',now(),1);
insert into article values(null,2,1,'狗屁，c才是最好','狗屁，c才是最好最好的编程语言，谁敢不是',now(),1);
insert into article values(null,8,1,'golang是世界上最好的编程语言','golang才是世界上最好的编程语言6666',now(),1);
insert into article values(null,4,1,'swift 才是世界上 最好的 编程语言','swift 才是世界上 最好的 编程语言',now(),0);
insert into article values(null,5,1,'楼主曰之最好的，感觉自己萌萌哒。耶！','楼主曰之最好的，感觉自己萌萌哒。耶！',now(),0);
insert into article values(null,5,1,'python是世界上最好的编程语言','python是世界上最好的编程语言',now(),1);
insert into article values(null,9,1,'中文是世界上最好的编程语言。','中文是世界上最好的编程语言。+1000000',now(),0);
insert into article values(null,2,1,'节能。。。。。是世界上最好的语言，没有abc。。。你啥也写不出来','节能。。。。。是世界上最好的语言，没有abc。。。你啥也写不出来',now(),1);






--id 文章的id号
--pid 文章的父亲的id号
--rootid 最根上节点的id号
--title	标题
--cont  内容
--isleaf   是否是叶子节点
