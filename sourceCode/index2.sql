--索引优化之两表分析
CREATE TABLE IF NOT EXISTS `class`(
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `card` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `book`(
    `bookid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `card` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`bookid`)
);

INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));
INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));
INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));
INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));
INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));
INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));
INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));
INSERT INTO class(card) VALUES(FLOOR(1 + (RAND()*20)));


INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO book(card) VALUES(FLOOR(1+(RAND()*20)));

--左联结查询
SELECT * FROM class INNER JOIN book on class.card = book.card;

--分析
EXPLAIN SELECT * FROM class INNER JOIN book on class.card = book.card;
--结论 type有ALL
-- 尝试右表添加索引优化
CREATE INDEX Y ON book(`card`);
-- 删除索引
DROP INDEX Y ON book;
-- 左表添加索引
CREATE INDEX Y ON class(`card`);
--删除索引
DROP INDEX Y ON class;

-- 结论：左联结或者右联结往相反的表加索引






