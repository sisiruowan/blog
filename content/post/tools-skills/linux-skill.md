+++
title = "Linux 使用技巧"
date = "2017-11-29T22:47:55+08:00"
draft = true
author = "AlexTang"
slug = "Linux Skill"
tags = ["工具技巧"]
image = "images/example.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = "工具技巧"           # set "main" to add this content to the main menu
+++

1. `ctrl + c/v`仍旧是复制粘贴，但是终端中变为`ctrl + shift + c/v`;鼠标中键为快捷粘贴
2. 清除/boot空间：
    - 查看当前内核版本：
    ```bash
    uname -a
    ```

    - 删除其他版本内核：
    ```bash
    sudo apt-get remove linux-image-xxx-generic
    ```
    
3. 查看当前boot大小：
```bash
sudo du -m /boot
```
4. 修改文件夹权限
```bash
sudo chmod -R 777 XXXX
```
5. 新机器添加新用户并加入sudoer list
```bash
# 添加新的用户
useradd -d /home/works -m works
passwd works
# 添加sudo文件写权限
chmod u+w /etc/sudoers
vi /etc/sudoers
# 允许用户执行sudo命令
works ALL=(ALL)   ALL
```

6. 安装zsh
```bash
# 安装zsh
sudo apt-get install zsh
# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

7. 出现`sudo: unable to resolve host XXXX`
```bash
sudo vim /etc/hosts
127.0.0.1   XXXX
```
