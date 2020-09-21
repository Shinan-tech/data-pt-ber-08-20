/-- Challenge 0
select authors.au_id, authors.au_fname, authors.au_lname, count(titleauthor.title_id) as counttitles
from authors
left join titleauthor
using (au_id)
group by authors.au_id;

SELECT jobs.job_desc, MIN(employee.hire_date)
FROM jobs
LEFT JOIN employee
USING (job_id)
GROUP BY jobs.job_desc
ORDER BY MIN(employee.hire_date);

/-- Challenge 1
select authors.au_id, authors.au_fname, authors.au_lname, titles.title, publishers.pub_name
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id;

/-- Challenge 2
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(titles.title_id)
FROM authors
INNER JOIN titleauthor
USING (au_id)
INNER JOIN titles
USING (title_id)
INNER JOIN publishers
USING (pub_id)
GROUP BY authors.au_id, publishers.pub_name
ORDER BY COUNT(titles.title_id) DESC;

select * from sales;

/-- Challenge 3
select authors.au_id, authors.au_fname, authors.au_lname, sum(sales.qty)
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by sum(sales.qty) desc
limit 3;

/-- Challenge 4
select authors.au_id, authors.au_fname, authors.au_lname, ifnull(sum(sales.qty),0) as sales_qty
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id
order by sum(sales.qty) desc;

/-- Bonus Challenge
select * from titleauthor;

select authors.au_id, authors.au_lname, authors.au_fname, titleauthor.royaltyper, titles.advance, titles.royalty, sales.qty
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id;

select revenue_info.au_id, revenue_info.au_lname, revenue_info.au_fname, revenue_info.royaltyper * (revenue_info.advance + revenue_info.royalty) as title_rev
from (select authors.au_id, authors.au_lname, authors.au_fname, titleauthor.royaltyper, titles.advance, titles.royalty, sales.qty
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id) revenue_info
order by title_rev desc
limit 3;


