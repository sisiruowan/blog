+++
title = "Sublime Python环境搭建"
date = "2017-11-29T22:39:15+08:00"
draft = true
author = "AlexTang"
slug = "sublime-python-env"
tags = ["工具技巧"]
image = "images/example.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = "工具技巧"           # set "main" to add this content to the main menu
+++

## 一、正版激活
1. build3083版本license：
```
—– BEGIN LICENSE —–
Andrew Weber
Single User License
EA7E-855605
813A03DD 5E4AD9E6 6C0EEB94 BC99798F
942194A6 02396E98 E62C9979 4BB979FE
91424C9D A45400BF F6747D88 2FB88078
90F5CC94 1CDC92DC 8457107A F151657B
1D22E383 A997F016 42397640 33F41CFC
E1D0AE85 A0BBD039 0E9C8D55 E1B89D5D
5CDB7036 E56DE1C0 EFCC0840 650CD3A6
B98FC99C 8FAC73EE D2B95564 DF450523
—— END LICENSE ——
```

2. build3126版本license：
```
—– BEGIN LICENSE —–
Michael Barnes
Single User License
EA7E-821385
8A353C41 872A0D5C DF9B2950 AFF6F667
C458EA6D 8EA3C286 98D1D650 131A97AB
AA919AEC EF20E143 B361B1E7 4C8B7F04
B085E65E 2F5F5360 8489D422 FB8FC1AA
93F6323C FD7F7544 3F39C318 D95E6480
FCCC7561 8A4A1741 68FA4223 ADCEDE07
200C25BE DBBC4855 C4CFB774 C5EC138C
0FEC1CEF D9DCECEC D3A5DAD1 01316C36
—— END LICENSE ——
```

3. build3143版本license：
```
—– BEGIN LICENSE —–
TwitterInc
200 User License
EA7E-890007
1D77F72E 390CDD93 4DCBA022 FAF60790
61AA12C0 A37081C5 D0316412 4584D136
94D7F7D4 95BC8C1C 527DA828 560BB037
D1EDDD8C AE7B379F 50C9D69D B35179EF
2FE898C4 8E4277A8 555CE714 E1FB0E43
D5D52613 C3D12E98 BC49967F 7652EED2
9D2D2E61 67610860 6D338B72 5CF95C69
E36B85CC 84991F19 7575D828 470A92AB
—— END LICENSE ——
```

## 二、配置package control：

1. `ctrl + ~`打开console，输入以下代码：
```python
# sublime text3
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
# sublime text2
import urllib2,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')
```
2. 进入packages control即可安装插件：`ctrl+shift+p -> packages control: install package`

## 三、安装插件
### 1. 我的插件列表
- Alignment：自动对齐插件
- AutoFileName：自动补全文件路径
- AutoPep8：自动语法检查
- BracketHighlighted：高亮符号（括号等）
- PackageControl：用于安装的插件，相当于应用商店
- Side Bar：自带侧边栏
- ConvertToUTF8：自动转换文件编码
- SFTP：云端同步工具
- SublimeREPL：实时运行环境
- SublimeCodeIntel:智能提示插件
- SublimeTmpl:模板生成插件
- IMESupport：支持输入法（windows）
- FileHeader：生成文件头
- Terminal：右键在指定路径打开终端

### 2.配置插件：
- 配置SublimeREPL：
    - 配置python可以直接执行当前文件 
        ```
        perferences -> brower packages -> SublimeREPL\config\Python\Main.sublime-menu
        ```
        查找到
        ```
        {"command": "repl_open",
         "caption": "Python",
         "id": "repl_python",
         "mnemonic": "P",
         "args": {
            "type": "subprocess",
            "encoding": "utf8",
            "cmd": ["python", "-i", "-u"],
            "cwd": "$file_path",
            "syntax": "Packages/Python/Python.tmLanguage",
            "external_id": "python",
            "extend_env": {"PYTHONIOENCODING": "utf-8"}
            }
        },
        ```
        把它复制并列粘贴在原位置下面，稍稍修改刚刚粘贴的部分
        ```
        {"command": "repl_open",
         "caption": "Python-tzy",# 显示在菜单栏的名称
         "id": "repl_python_tzy",
         "mnemonic": "P",
         "args": {
            "type": "subprocess",
            "encoding": "utf8",
            "cmd": ["python", "-i", "-u","$file_basename"],# 添加了一个字段
            "cwd": "$file_path",
            "syntax": "Packages/Python/Python.tmLanguage",
            "external_id": "python",
            "extend_env": {"PYTHONIOENCODING": "utf-8"}
            }
        },
        ```
        保存，至此在菜单栏 `Tools —> SublimeREPL —> python`中就出现了`python-tzy`选项

    - 配置快捷键： `preferences -> key bindings - user` 粘贴以下代码：
        ```
        {
          "keys": ["f5"],
          "caption": "SublimeREPL: Python",
          "command": "run_existing_window_command","args":
            {
             "id": "repl_python_tzy",
             "file":"config/python/Main.sublime-menu"
            }
        },
        ```
        至此配置完毕，按F5可实现IDLE调试效果

- 配置SublimeTmpl: `Preferences -> Package Settings -> SublimeTmpl -> Settings - User`，粘贴以下代码
    ```
    {
        "attr": { 
            "author": "AlexTang",
            "email": "1174779123@qq.com",
            "link": "http://t1174779123.iteye.com"
        }
    }
    ```
