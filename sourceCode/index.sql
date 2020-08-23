--索引优化之单表分析
CREATE TABLE IF NOT EXISTS `article`(
    `id` INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `author_id` INT(10) UNSIGNED NOT NULL,
    `category_id` INT(10) UNSIGNED NOT NULL,
    `views` INT(10) UNSIGNED NOT NULL,
    `comments` INT(10) UNSIGNED NOT NULL,
    `title` VARBINARY(255) NOT NULL,
    `content` TEXT NOT NULL
);

INSERT INTO `article`(`author_id`,`category_id`,`views`,`comments`,`title`,`content`) VALUES
(1,1,1,1,'1','1'),
(2,2,2,2,'2','2'),
(1,1,3,3,'3','3');

--开始优化
--1.1新建索引+删除索引
CREATE INDEX idx_article_ccv on article(category_id,comments,views);

EXPLAIN SELECT id,author_id FROM `article` WHERE category_id = 1 AND comments > 1 ORDER BY views DESC LIMIT 1;
EXPLAIN SELECT id,author_id FROM `article` WHERE category_id = 1 AND comments = 3 ORDER BY views DESC LIMIT 1;

-- 结论：
--type变成了range，这是可以忍受的，但是extra里使用using filesort仍是无法接受的
--但是我们已经建立了索引，为啥没用呢，这是因为BTree索引的工作原理，先排序category_id，再排序comments，如果遇到
--相同的comments,则再排序views
-- 当comments字段在联合索引里处于中间位置时，因comments > 1条件是一个范围值(所谓range)
--MySQL无法利用索引再对后面的views部分进行检索，即range类型查询字段后面的索引无效

--1.2删除第一次建立的索引
DROP INDEX idx_article_ccv ON article;
-- 1.3重建索引
CREATE INDEX idx_article_cv ON article(category_id,views);
-- 1.4删除索引
DROP INDEX idx_article_cv ON article;


