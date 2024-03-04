// Find sum of each row 
/*
Table creation command
create table `input` (
	`val` int (11)
); 
insert into `input` (`val`) values('1234');
insert into `input` (`val`) values('56');
insert into `input` (`val`) values('989');
insert into `input` (`val`) values('7');
insert into `input` (`val`) values('100');
*/

// Solution 1 - by someone else
with rec_cte (val,ln,val1,flag) as(
select val,length(val) as ln,substr(val,1,1) as val1,1 as flag from input
union all
select val,length(val) as ln,substr(val,flag+1,1) as val1,flag+1 from rec_cte
where flag<=ln
)
select val,sum(val1) as sum from rec_cte group by val;



// Solution 2 - by Tanveer Sir
with cte1(val,val1,id) as
(select val,val,mod(val,10) from input
union all
select val,floor(val1/10),mod(floor(val1/10),10) from cte1 where floor(val1/10)>0)
select val,sum(id) from cte1 group by val
