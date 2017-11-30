+++
title = "Git 使用技巧"
date = "2017-11-29T23:12:35+08:00"
draft = true
author = "AlexTang"
slug = "Git Skill"
tags = ["工具技巧"]
image = "images/example.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = "工具技巧"           # set "main" to add this content to the main menu
+++

### 整理自[廖雪峰的git教程](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

1. 指定路径建立仓库：
```bash
cd PATH
git init
```

2. 添加文件
```bash
git add filename
git add . # 添加当前目录所有可追踪文件
```

3. 添加修改&修改说明：
```bash
git commit -m "the commit content"
```

4. 查看代码库的状态：
```bash
git status
```

5. 连接远程库：
```bash
git remote add origin https://github.com/sisiruowan/HighStockLearn.git
git pull origin master
git push origin master
```

5. 查看具体文件的改动:
```bash
git diff filename
```

6. 版本还原：
```bash
# 查看修改日志
git log
# 精简输出：
git log --pretty=oneline # 等号前后不要习惯性加空格
# 图像化查看log：
git log --pretty=format:"%h %s" --graph
# 启动还原指令
git reset --hard HEAD ^/^^/~100 # ^上一个版本 ^^上上个版本 ~100之前100个版本
git reset --hard commond ID # 强行通过commit的ID直接还原
```

7. 暂存区是很重要的概念！！！
所有修改通过add 加到暂存区， 再通过commit加到仓库中

8. 撤销操作：
```bash
git checkout -- filename  # 直接把文件返回最近一次git commit或git add的状态
git reset HEAD filename # 撤销add的效果，清空暂存区的修改。
# 如果想要撤销commit后的结果，使用之前的版本和还原命令，依然是reset
```
9. 文件删除：
```bash
git rm filename # 直接把文件从硬盘删除
git rm --cached filename # 取消对文件的追踪
```

10. 分支的使用：
```bash
git branch dev #创建分支
git checkout dev #切换到某个分支
git checkout -b dev  # 一步指令，创建并切换到指定分支
```

11. 分支的合并：
```bash
git merge branchname # 把指定分支的改变合并到当前的分支
```
12. 分支的删除：
```bash
git branch -d branchname
```

13. 冲突解决：合并分支时，先要保证两个分支中文件不存在重叠情况

14. 分支管理：
    - 如果不存在并列分支，那么合并时可以执行fast forward，快进模式
    - 但快进模式会造成分支丢失，因为是直接指针操作，没有建立新的文件版本。
    - 这时候，我们可以强行禁用快进模式
        ```bash
        git merge --no-ff -m "....." branchname
        ```
        这里，`--no-ff` 就是强行禁用快进模式的指令，但是这个操作要加入`commit`

    - 通常的开发策略是，所有人在dev分支上搞开发，等到dev 稳定后再合并到master，一次性发布稳定版本

15. bug分支管理策略：
    - 前工作暂存起来，冻结dev分支，在之前的可靠版本上修复BUG，然后合并，再回复之前的工作:
    
        ```bash
        git stash # 把当前工作雪藏起来，无需add与commit操作
        git stash list # 查看当前暂存的所有工作
        git stash apply stashname # 恢复feature某个工作
        git stash drop stashname # 删除某个stash
        git stash pop # 直接恢复并删除某暂存工作
        ```
16. feature分支：
    - 为每个功能建立一个feature分支，完成功能后合并到主分支
    - 但是，分支未merge的时候，为保留修改，不能删除，只能强制删除

        ```bash
        git branch -D branchname # 强行删除
        ```


