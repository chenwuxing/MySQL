
--创建数据表user id tinyint 字段
CREATE TABLE user1(
    id TINYINT
);
--添加一个username字段 varchar(5) not null
ALTER TABLE user1
ADD username VARCHAR(5) NOT NULL;

--一次添加两个字段 password char(32) not null email varchar(10) not null

ALTER TABLE user1
ADD password CHAR(32) NOT NULL;
ALTER TABLE user1
ADD email VARCHAR(10) NOT NULL;
--给email字段添加默认值 'i@qq.com'
ALTER TABLE user1
ALTER email SET DEFAULT 'i@qq.com';

--将username字段改为username 类型varchar(20) not null
ALTER TABLE user1
CHANGE username username VARCHAR(20) NOT NULL;

--将password字段改为password char(40) not null
ALTER TABLE user1
CHANGE password password CHAR(40) NOT NULL;

--给id字段主键索引
ALTER TABLE user1
ADD PRIMARY KEY(id);
--给id增加AUTO_INCREMENT属性   
ALTER TABLE user1
MODIFY id TINYINT AUTO_INCREMENT;

--给username字段添加唯一索引
ALTER TABLE user1
ADD UNIQUE INDEX(username);
--给email字段添加唯一索引名称是uni_email
ALTER TABLE user1
ADD UNIQUE INDEX uni_email(email);

--在一次添加2个字段 age TINYINT UNSIGNED DEFAULT 18加到password之后
--addr varchar(20) not null default '北京'
ALTER TABLE user1
ADD age TINYINT UNSIGNED DEFAULT 18 AFTER password,
ADD addr VARCHAR(20) NOT NULL DEFAULT 'BEIJING';

--删除addr的默认值
ALTER TABLE user1
ALTER addr DROP DEFAULT;

--删除password唯一索引

--删除email唯一索引
ALTER TABLE user1
DROP INDEX uni_email;
-- 删除主键索引
ALTER TABLE user1
DROP PRIMARY KEY;

-- 重命名user表叫new_user
ALTER TABLE user1
RENAME AS new_user;

ALTER TABLE new_user
RENAME AS user1;

























