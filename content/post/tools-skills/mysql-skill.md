+++
title = "Mysql 使用技巧"
date = "2017-11-30T08:34:55+08:00"
draft = true
author = "AlexTang"
slug = "mysql-skill"
tags = ["工具技巧"]
image = "images/example.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = "工具技巧"           # set "main" to add this content to the main menu
+++

## 一、命令行操作
1. 启动mysql-server:
```mysql
mysql.server start
```

2. 登录：
```mysql
mysql -u root -p{password} {db_name}
/home/works/db/mysql/bin/mysql -h {host} -P {port} -u root -p{password} -U {db_name}
```

3. 导出数据库到文件
```mysql
mysqldump -u root -p{password} {db_name} > filename
```

4. 从文件导入数据库
```mysql
mysql -u root -p{password} {db_name} < filename
```

## 二、常用sql语句
1. 查看当前数据库
```mysql
show databases；
```

2. 查看表
```mysql
show tables
```

3. 查看表中内容
```mysql
select * from table_name
```

4. 添加字段
```mysql
alter table {tbl_name} add {col_name} VARCHAR(16);  
```

5. 修改字段
```mysql
alter table {tbl_name} modify {col_name} VARCHAR(16) NOT NULL;  
```

6. 更改列名
```mysql
alter table {tbl_name} change physics physisc char(10) not null;  
```

7. 更改字段默认值
```mysql
alter table app_ident alter checked set default 0;
alter table app_iden add checked int NOT NULL;  
alter table app_ident alter checked set default 0;
```

8. 开启/关闭安全删除
```mysql
SET SQL_SAFE_UPDATES = 1/0;
```



