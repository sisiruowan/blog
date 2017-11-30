+++
title = "Python技巧"
date = "2017-11-29T22:05:11+08:00"
draft = true
author = "AlexTang"
slug = "python-skill"
tags = ["工具技巧"]
image = "images/example.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = "工具技巧"           # set "main" to add this content to the main menu
+++

1. 同时遍历dict键和值：
```python
# 使用 dict.items()
for k,v in dict.items():
    print k,v
```
2. 巧用 or 关键字
```python
>>> '' or 'abc'
'abc'
>>> 'a ' or 'abc'
'a '
```
3. 多行字符串：三个引号
```python
>>> '''line 1
    line 2
    line 3'''
>>> 'line 1\nline 2\nline 3'
```

4. 获得当前信息
```python
import sys
def get_cur_info():
　　print sys._getframe().f_code.co_filename  #当前文件名，可以通过__file__获得
　　print sys._getframe(0).f_code.co_name  #当前函数名
　　print sys._getframe(1).f_code.co_name　#调用该函数的函数的名字，如果没有被调用，则返回<module>，貌似call stack的栈低
　　print sys._getframe().f_lineno #当前行号
```

5. Python变量作用域说明：Python除了`def/class/lambda` 外，其他如: `if/elif/else/ try/except for/while `都不能改变变量作用域，外部仍旧能够访问。
```python
# if/else case:b与a并列，else语句结束，b并未析构
a = 100
if a > 10:
    b = 10
else:
    b = -10
>>> b
10
```

6. 字符串换行有两种方式，`\`和`()`:
```python
a = '123'\
    '345'
b = ('123'
    '456')
```
7. 使用namedtuple表示那些只有属性没有方法的类
```python
from collections import namedtuple
Card = namedtuple('Card', ['rank', 'suit'])
beer_card = Card('7', 'diamonds')
```

8. [`__str__`与`__repl__`的区别](https://stackoverflow.com/questions/1436703/difference-between-str-and-repr-in-python)
    - __repl__为了不混淆（unambiguous）
    - __str__为了可读性（readable）

9. Python3中不会出现Python2的变量泄露问题:
```python
# python2
>>> x = '12345'
>>> b = [x for x in 'ABC']
>>> x
>>> 'C'
# python3
>>> x = '12345'
>>> b = [x for x in 'ABC']
>>> x
>>> '12345'
```

10. 生成器表达式:方括号变圆括号
```python
(ord(symbol) for symbol in symbols) 
a = tuple(ord(symbol) for symbol in symbols) 
```

11. python3中可以利用*解包不定量元素
```python
>>> a, b, *c = range(5)
>>> 0,1,[2,3,4]
>>> a, *b, c = range(5)
>>> 0,[1,2,3],4
```

12. [Python Tutor](http://www.pythontutor.com/)可以可视化分析python运行过程

13. Python Sidecases(不注意会采坑):
    1. 最好不要在tuple中添加可变对象：
    ```python
    s = (1,[2,3],4)
    s[1] += [4] # 结果会既改变s[1]又赋值时报错
    ```

    2. python中加 `,` 会把变量转化为数组：
    ```python
    >>> a = '123',
    >>> a
    >>> ('123')
    # 转化成一个元素为tuple时，不光要加括号，还要加逗号
    >>> a= ('123')
    >>> a
    >>> '123'
    # 小心行末的逗号！！
    >>> a= '123',
    >>> a
    >>> ('123',)
    ```
