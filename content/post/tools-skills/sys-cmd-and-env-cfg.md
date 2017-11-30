+++
author = "AlexTang"
date = "2017-11-29T21:05:11+08:00"
draft = true
title = "常用命令&环境配置"
slug = "sys-cmd-and-env-cfg"
tags = ["工具技巧"]
image = "images/2014/Jul/titledotscale.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = "工具技巧"           # set "main" to add this content to the main menu
+++


# Linux&Mac

- mysql操作
```bash
# 启动mysql
mysql.server start
# 登录命令
mysql -u root -pxxx
/home/works/db/mysql/bin/mysql -h xxx.xxx.xxx.xxx -P 3306 -u root -pxxx -U im_saas_db
/home/works/db/mysql/bin/mysql -h xxx.xxx.xxx.xxx -P 3306 -u root -pxxx -U  xxx_db
# 导出数据库
mysqldump -u root -pxxx xxx_db > xxx_db_dump.txt
mysql -u root -p huishi_db < huishi_db_dump.txt
# 安全删除
SET SQL_SAFE_UPDATES = 0;
```

- conda启用虚拟环境:
```bash
conda create -n tang requirements
source activate tang
source deactivate tang
```

- virtualenv启用虚拟环境：
```bash
cd到clone的repo目录 执行 
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
```
- python3创建虚拟环境
```bash
python -m venv ./venv
source venv/bin/activate
```
- SFTP停止进程:

    <kbd>ctrl+cmd+u+x</kbd>


- 查找文本中的字符：
```bash
sed -n '1, 1000p' data/dialog.data | grep '%%'
fgrep 'rsp match sug' 'log/main.log'| head -3
```

- 查找文件名
```bash
find . -name 'my*'
```

- 查找正在运行的进程：
```bash
ps -ef |grep python
```

- 后台运行程序：
```bash
nohup python xxx.py 1111 >out 2>err &
jobs
fg x
kill xxxxx
```
- less命令：
```bash
# 搜索
/
# 只显示包含搜索内容行
&
```
- crontab定时任务
```bash
crontab -e
```

- 其他：
```bash
# 查看文件行数
wc -l filename  
# 查看端口占用
lsof -i:8130  
# 查看文件空间占用 
du -ah dir 
# 查看ip地址信息     
curl ip.gs    
# 合并文件  
cat file1 file2 dir/* > file3 
```


# ES
- 查看分析器效果：
```bash
curl -XGET 'localhost:9200/wulai_ques_ans_v0/_analyze?field=tag&pretty' -d '今天的天气如何？' -H 'Content-Type: text/plain'
```

- 查看mapping效果
```bash
curl -XGET 'http://127.0.0.1:9203/wulai_ques_ans_v0/_settings,_mappings?pretty'
```

- 查看索引列表
```bash
curl -XGET 127.0.0.1:9200/_cat/indices
```

# Mysql
- 导出数据到文件：
```mysql
# 导出数据到文件
select * from   where zk_frozen=0 into outfile '/home/works/tangziyi/zhiku.txt' fields terminated by '`' lines terminated by '\n';
```

# Supervisor
- 一般运行流程：
```bash
# 启动进程
supervisord -c conf/sup.qsearch.conf
# 进入控制台
supervisorctl -c conf/sup.qsearch.conf
```

# Mac OS
- 禁用、开启`.DS_Store`文件生成:
```bash
# 启用、删除 .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
defaults delete com.apple.desktopservices DSDontWriteNetworkStores
```
- homebrew切换源:
```bash
cd /usr/local/HomeBrew
git remote set-url origin https://git.coding.net/homebrew/homebrew.git
cd Library/Taps/homebrew/homebrew-core
git remote set-url origin https://git.coding.net/homebrew/homebrew-core.git
git remote set-url origin https://github.com/Homebrew/homebrew-core.git
```
- 终端移动光标
```bash
ctrl+a : 光标移动到行首
ctrl+e : 光标移动到行尾
ctrl+u : 删除光标前所有字符
ctrl+k : 删除光标后所有字符
ctrl+l : 清屏，= clear
```