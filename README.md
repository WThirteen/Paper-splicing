# Paper splicing
纸片拼接  
来源：  
*2013年大学生数学建模竞赛B题 纸片拼接*

## 思路
先找最左端的那一张小纸片，然后比较纸片1的最右侧像素值与纸片2最左侧像素值，依次比较，记录相同的个数  

在全部纸片中寻找最大相同个数的纸片作为该纸片的右边，再依次将其存入数组。  

最后按照数组的顺序将纸片拼接完成。
