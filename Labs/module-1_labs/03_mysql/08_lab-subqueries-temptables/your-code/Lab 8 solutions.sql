select authors.au_id, authors.au_fname, authors.au_lname, count(titleauthor.title_id) as count_title, sum(roysched.royalty) as total_royalty
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join roysched
on titleauthor.title_id = roysched.title_id
group by authors.au_id;

select au_id, (total_royalty / count_title) as AVG_royalty
from(
select authors.au_id, authors.au_fname, authors.au_lname, count(titleauthor.title_id) as count_title, sum(roysched.royalty) as total_royalty
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join roysched
on titleauthor.title_id = roysched.title_id
group by titleauthor.title_id
)royalty_summary;


