--索引优化之三表优化
CREATE TABLE IF NOT EXISTS `phone`(
    `phoneid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `card` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`phoneid`)
)ENGINE = INNODB;

INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));
INSERT INTO phone(card) VALUES(FLOOR(1+(RAND()*20)));

--查询操作
SELECT * FROM class LEFT JOIN book ON class.card = book.card LEFT JOIN phone ON book.card = phone.card;
--explain
EXPLAIN SELECT * FROM class LEFT JOIN book ON class.card = book.card LEFT JOIN phone ON book.card = phone.card;

--结论
--尽可能减少JOIN语句中的NestedLoop的循环总次数：“永远用小结果集驱动大的结果集”
--优先优化NestedLoop的内存循环
--保证JOIN语句被驱动表上JOIN条件字段已经被索引
--当无法保证被驱动表的JOIN条件字段被索引且内存资源充足的前提下，不要太吝啬JOINbuffer的设置