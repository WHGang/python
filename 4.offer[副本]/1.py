# -*- coding: UTF-8 -*-


# 剑指 Offer 03. 数组中重复的数字
# 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。
# 数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。
# 请找出数组中任意一个重复的数字。

def findRepeatNumber(nums):
    """
    :type nums: List[int]
    :rtype: int
    """
    n = len(nums)
    nums.sort()
    for i in range(n-1):
        if nums[i] == nums[i+1]:
            return nums[i]

def findRepeatNumber2(nums):
    """
    原地哈希
    """
    n = len(nums)
    for i in range(n):
        
        while nums[i] != i:
            k = nums[i]
            nums[i], nums[k] = nums[k], nums[i]
            
    return nums

nums = [1, 0, 2,5,4,6,3]
print(findRepeatNumber2(nums))
print(9//2)


# 剑指 Offer 04. 二维数组中的查找


# 注意二维数组的长度表示

matirx = [[1,4,7,10,15], [2,5,8,12,19], [3,6,9,16,22], [10,13,14,17,24]]
matirx =  [[-5]]
target = -10
def fun(matrix, target):
    n = len(matrix)     # chang
    if n  == 0:
        return False
    else:
        m = len(matrix[0])  #            
        if m == 0:
            return False
        else:
            i = 0
            j = m-1
            while i < n and j >= 0:
                if target == matrix[i][j]:
                    return True
                elif target < matrix[i][j]:
                    j = j - 1 
                elif target > matrix[i][j]:
                    i = i + 1 
            
            return False
        
aaa = fun(matirx, target)
print(aaa)


# 剑指 Offer 05. 替换空格
s = "We are happy."
#s = ""
def replaceSpace(s):
    """
    :type s: str
    :rtype: str
    """
    s_list = list(s)
    n = len(s_list)
    for i in range(n):
        if s_list[i] == ' ':
            s_list[i] = '%20'
    
    if n == 0:
        return s
    else:
        ss = s_list[0]
        for i in range(1, n):
            ss = ss+str(s_list[i])

    return ss
    
aaa = replaceSpace(s)
print(aaa)


def replaceSpace2(s):
    """
    :type s: str
    :rtype: str
    """
    s_list = list(s)
    n = len(s_list)
    for i in range(n):
        if s_list[i] == ' ':
            s_list[i] = '%20'
    
    ss = ''.join(s_list)

    return ss


def replaceSpace3(s):
    
    return s.replace(' ','%20')

aaa = replaceSpace2(s)
print(aaa)


# 剑指 Offer 06. 从尾到头打印链表
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    
    def reversePrint(self, head):
        """
        :type head: ListNode
        :rtype: List[int]
        """
        if head == None:
            return []
        else:
            a_list = []
            cur = head
            while cur != None:
                a_list.insert(0, cur.val)
                cur = cur.next

        return a_list
    
    

# 剑指 Offer 07. 重建二叉树


# 剑指 Offer 09. 用两个栈实现队列
# 允许插入的一端称为队尾，允许删除的一端称为队头。


#2020-09-15
# 1. 两数之和


# 左旋转字符串


# 剑指 Offer 59 - I. 滑动窗口的最大值


# 剑指 Offer 60. n个骰子的点数


# 剑指 Offer 29. 顺时针打印矩阵

def spiralOrder(matrix):
    """
    :type matrix: List[List[int]]
    :rtype: List[int]
    """
    res = []
    while matrix:
        res += matrix.pop(0)
        matrix = list(zip(*matrix))[::-1]
    return res

def spiralOrder2(matrix):
    if not matrix:
        return []
    
    l, r, t, b, res = 0, len(matrix[0])-1, 0, len(matrix)-1, []
    
    while True:
        # 从左向右
        for i in range(l, r+1):
            res.append(matrix[t][i])
            
        # top增加
        t = t + 1 
        if t>b:
            break
        
        # 从上到下
        for i in range(t, b+1):
            res.append(matrix[i][r])
            
        # right 减少
        r = r - 1
        if r<l:
            break
        
        # 从右向左
        for i in range(r, l-1, -1):
            res.append(matrix[b][i])
        
        # bottom 减少
        b = b - 1
        if b <t:
            break
        
        # 从下到上
        for i in range(b, t-1, -1):
            res.append(matrix[i][l])
        
        l = l + 1
        if l>r:
            break
        
    return res
        
    return res

matrix = [[1,2,3],[4,5,6],[7,8,9]]

bb = spiralOrder2(matrix)
print(bb)


# 剑指 Offer 30. 包含min函数的栈


# 剑指 Offer 11. 旋转数组的最小数字


# 剑指 Offer 15. 二进制中1的个数


# 剑指 Offer 17. 打印从1到最大的n位数


# 剑指 Offer 18. 删除链表的节点


# 剑指 Offer 57 - II. 和为s的连续正数序列


# 剑指 Offer 58 - I. 翻转单词顺序


# 剑指 Offer 65. 不用加减乘除做加法




# 剑指 Offer 40. 最小的k个数


##### 剑指 Offer 42. 连续子数组的最大和


#### 剑指 Offer 50. 第一个只出现一次的字符  hash


# 剑指 Offer 52. 两个链表的第一个公共节点

# 剑指 Offer 53 - I. 在排序数组中查找数字 I


##### 剑指 Offer 57. 和为s的两个数字    


# 剑指 Offer 22. 链表中倒数第k个节点


#### 剑指 Offer 24. 反转链表


#### 剑指 Offer 25. 合并两个排序的链表