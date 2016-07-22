\c has_many_blogs;


SELECT * FROM users;
SELECT * FROM posts WHERE user_id=100;

SELECT posts.*,users.first_name,users.last_name FROM
users JOIN posts ON users.id=posts.user_id
WHERE users.id=200;

SELECT posts.*,users.username FROM
users JOIN posts ON users.id=posts.user_id
WHERE users.first_name ='Norene' AND users.last_name ='Schmitt';


--Create a query to get usernames from the users table where the user has created a post after January 1, 2015
SELECT posts.*,users.username FROM
users JOIN posts ON users.id=posts.user_id
WHERE posts.created_at > '2015-01-01';


--Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015
SELECT posts.title,posts.content,users.username FROM
users JOIN posts ON users.id=posts.user_id
WHERE users.created_at < '2015-01-01';

--Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields

SELECT comments.*, posts.title "Post Title" FROM
posts JOIN comments ON posts.id=comments.post_id;

--Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

SELECT comments.*, posts.title post_title, posts.url post_url, comments.body comment_body FROM
posts JOIN comments ON posts.id=comments.post_id
WHERE posts.created_at < '2015-01-01';

--Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015

SELECT comments.*, posts.title post_title, posts.url post_url, comments.body comment_body FROM
posts JOIN comments ON posts.id=comments.post_id
WHERE posts.created_at < '2015-01-01';

--Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'

SELECT comments.*, posts.title post_title, posts.url post_url, comments.body comment_body FROM
posts JOIN comments ON posts.id=comments.post_id
WHERE comments.body LIKE '%USB%';

--Create a query to get the post title (aliased as post_title), first name of the author of the post, 
--last name of the author of the post, and comment body (aliased to comment_body), 
--where the comment body contains the word 'matrix' ( should have 855 results )

SELECT COUNT(*) -- posts.title post_title, users.first_name, users.last_name, comments.body comment_body
FROM  users JOIN posts ON users.id=posts.user_id
JOIN comments ON posts.id=comments.post_id
WHERE comments.body LIKE '%matrix%';

--Create a query to get the first name of the author of the comment, last name of the author of the comment, 
--and comment body (aliased to comment_body), where the comment body contains the word 'SSL' 
--and the post content contains the word 'dolorum' ( should have 102 results )

SELECT COUNT(*) --u.first_name,u.last_name,c.body comment_body
--,p.content,c.body 
FROM users as u JOIN comments as c ON u.id=c.user_id
JOIN posts as p ON c.post_id=p.id
WHERE c.body LIKE '%SSL%' AND p.content LIKE '%dolorum%';

--Create a query to get the first name of the author of the post (aliased to post_author_first_name), 
--last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), 
--username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), 
--where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 197 results )

SELECT COUNT(*) --pA.first_name post_author_first_name,pA.last_name post_author_last_name, p.title post_title
--,cA.username comment_author_username, c.body comment_body
FROM users AS cA JOIN  comments AS c ON cA.id=c.user_id
JOIN posts AS p  ON c.post_id=p.id
JOIN users AS pA  ON p.user_id=pA.id
WHERE (c.body LIKE '%SSL%' OR  c.body LIKE '%firewall%') AND p.content LIKE '%nemo%';






/*






 */