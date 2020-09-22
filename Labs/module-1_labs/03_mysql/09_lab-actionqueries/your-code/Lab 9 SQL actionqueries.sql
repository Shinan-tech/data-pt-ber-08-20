create table publications.total_royalties
select authors.au_id, authors.au_fname, authors.au_lname, count(titleauthor.title_id) as total_titles, sum(titleauthor.royaltyper) as sum_royalties
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
group by authors.au_id;

select * from total_royalties;
delete from total_royalties where sum_royalties < 100;
alter table publications.total_royalties
add AvgRoyalty CHAR(255);

update total_royalties
set AvgRoyalty = sum_royalties / total_titles;

delete from total_royalties;

insert into publications.total_royalties
select authors.au_id, authors.au_fname, authors.au_lname, count(titleauthor.title_id) as total_titles, sum(titleauthor.royaltyper) as sum_royalties, sum(titleauthor.royaltyper) / count(titleauthor.title_id) as AvgRoyalty
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
group by authors.au_id;

insert into publications.total_royalties
select * , sum_royalties / total_titles as AvgRoyalty
from (select authors.au_id, authors.au_fname, authors.au_lname, count(titleauthor.title_id) as total_titles, sum(titleauthor.royaltyper) as sum_royalties
from authors
inner join titleauthor
on authors.au_id = titleauthor.au_id
group by authors.au_id) royalty_summary;
