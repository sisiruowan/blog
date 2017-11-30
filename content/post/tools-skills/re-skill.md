+++
title = "正则表达式技巧"
date = "2017-11-29T22:51:59+08:00"
draft = true
author = "AlexTang"
slug = "Re-Skill"
tags = ["工具技巧"]
image = "images/example.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = "工具技巧"           # set "main" to add this content to the main menu
+++

1. `\d` 匹配一个数字：`'00\d'` 可以匹配 `'007'`、`'008'`等字符串
2. `\w` 匹配一个数字或者字母：`'\w\w\d'` 可以匹配 `'py3'`
3. `\s` 匹配一个空格
4. `. ` 匹配任何字符：`'py.'` 可以匹配 `'py2'` 或者`'py3'`
5. 变长符号：
    - `*` 表示任意个（包括0）
    - `+` 表示至少一个
    - `?` 表示0个或1个字符
    - `{n}` 表示n个字符
    - `{n, m}` 表示n - m个字符
    - 示例：
    ```python
    '\d{3}\s+\d{3, 8}'
    # 三个数字+至少一个空格+3-8个数字，可以匹配任意空格分开的带区号的电话号码
    ```  
6. 使用方括号进行精确匹配：
```python
[0-9a-zA-Z\_] # 匹配一个字母数字或者下划线
[0-9a-zA-Z\_]+ # 可以匹配至少由一个字母数字下划线组成的字符串
[a-zA-Z\_][0-9a-zA-Z\_]* # 字母或下划线开头，加上任意个字母数字下划线字符，即python中的合法变量
[a-zA-Z\_][0-9a-zA-Z\_]{0,19} # 限制长度为20个字符的变量名
```

    
7. `\[A|B\]`代表 A或B，`\[P|p\]ython`代表`'Python'`或`'python'`
8. `^`行开头匹配：`^\d`表示必须以数字开头
9. `$`行结尾匹配：`$\d`表示必须以数字结尾

10. 注意：python本身用`\`做转义，所以直接使用python字符串必须用`\\`表示斜杠，为此使用`r'str'`取消转义

11. `re.match(r'...','...')`用于检测字符串是否匹配，不匹配返回`None`，匹配返回`Match`对象
12. `re.split()`切分字符串：
```python
s = '1 2 3   4'
s.split(' ')
>>>['1', '2', '3', '', '', '', '4']
re.split(r'\s+', s)
>>>['1', '2', '3', '4']
```
13. 分组：`()`定义要提取的子串组，直接从匹配中提取子串
```python
m = re.match(r'^(\d{3})-(\d{3,8})$', '010-12345')
m.group(0)
>>>010-12345
m.group(1)
>>>010
m.group(2)
>>>12345
```
- 识别日期：
```python
time_format = r'^([0-2][0-9] | [0-9]):([0-5][0-9]|[0-9]):([0-5][0-9]|[0-9])$'
m = re.match(time_fromat, '23:00:50')
m.group(1)      
>>>'23'
m.group(2)      
>>>'00'
m.group(3)      
>>>'50'
```
14. 贪婪匹配问题：
    - 由于贪婪匹配`\d+`总会匹配尽可能多的字符，所以导致`0*` 匹配不到应有的内容:

        ```python
        >>> re.match('^(\d+)(0*)$', '12300').groups()
        >>> ('12300','') 
        ```
    - 要消除贪婪匹配的影响，使用`?`：
        ```python
        re.match('^(\d+?)(0*)$','12300').groups()
        >>('123','00')
        ```
15. `re`模块匹配字符串时，会先编译正则表达式，再用之去匹配字符串，当某一表达式重复多次使用时，重复编译效率低下，因此我们可以使用提前编译好的正则表达式，提高效率。

16. 匹配字符串中的pattern替换为新字符串：
```python
re.sub(r'\d+', 'int_t', u'python有2个版本')
```
- 如果可以，尽量使用`str.replace()`，因为后者效率高得多，[前者耗时数us，后者耗时数ns](https://stackoverflow.com/questions/5668947/use-pythons-string-replace-vs-re-sub)。

17. [正则表达式有缺陷：](https://blogs.msdn.microsoft.com/jaredpar/2008/10/15/regular-expression-limitations/)
    - 无法递归提取：
    ```python
    # 无法只提取字符串注释的文字部分
    /* /* this is a comment */ */
    ```
    - 任何有递归可能的表达式都不能完全用正则匹配
        - 能匹配：
            - python字符串
            - python字符串常量
            - XML属性
            - 文件路径
            - 邮箱地址
        - 不能匹配：
            - XML元素
            - C语言数学表达式
            - 有效正则表达式

