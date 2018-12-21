-- lua链表的实现

node = {}
list = node

--初始化，构建一个空表
function init()
    list.data = 0 --我将头结点的数据域存放链表的长度，以免浪费空间
    list.next = nil
end

--向链表的尾部添加数据
function addRear(d)
    node.next = {}
     --建立一个节点，相当于malloc一个节点
    node = node.next
    node.next = nil
    node.data = d
    list.data = list.data + 1 -- 长度加1
end

--向链表的头部添加数据
function addHead(d)
    newNode = {}
     --建立一个节点，相当于malloc一个节点
    newNode.data = d
    newNode.next = list.next
    list.next = newNode
    list.data = list.data + 1
end

--第i个位置 插入数据d   i>=1
function insert(i, d)
    if i < 1 then
        print("插入位置不合法")
        return
    end

    local j, k, l = i - 1, 0, list
    -- 解决问题的核心是找到第j个位置
    while k < j do
        k = k + 1
        l = l.next
        if not l.next then
            break
        end
    end
    if k ~= j then
        print("插入位置不合法")
        return
    end

    --开始插入
    newNode = {}
    newNode.next = l.next
    newNode.data = d
    l.next = newNode
    list.data = list.data + 1
end

--删除第i个位置的数据  i>=1，返回删除的数据的内容
function del(i)
    if i < 1 then
        print("删除位置不合法")
        return
    end
    local j, k, l = i - 1, 0, list
    while k < j do
        k = k + 1
        l = l.next
        if not l.next then
            print("删除位置不合法")
            return
        end
    end

    d = l.next.data
    t = l.next.next -- 保存删除节点之后的链表内容
    l.next = nil --lua中让它等于nil就删除了
    l.next = t
    list.data = list.data - 1 -- 链表长度减1
    return d
end

--清除链表，操作完成后，链表还在，只不过为空
function clear()
    if not list then -- 先判断链表是否还存在
        print("链表不存在")
    end

    while true do
        firstNode = list.next
        if not firstNode then -- 表示链表成为空表了
            break
        end
        t = firstNode.next -- 保存第一个节点之后的链表
        list.next = nil -- 删除
        list.next = t
    end
    list.data = 0 -- 将长度置0
    print("-- clear ok --")
end

-- 销毁链表
function destroy()
    clear() -- 先清除链表
    list = nil
end

--获取list中的第i个元素 i>=1
function getData(i)
    if not list then
        print("链表不存在")
        return
    end
    if i < 1 then
        print("位置不合法")
        return
    end

    local l = list.next -- l 指向第一个元素
    local k = 1
    while l do
        l = l.next
        k = k + 1
        if k == i then
            return l.data
        end
    end

    print("位置不合法")
end

--获取链表的长度
function getLen()
    if not list then
        print("链表不存在")
        return
    end
    return list.data
end

--打印链表的每一个元素
function display()
    local l = list.next
    while l do
        print(l.data)
        l = l.next
    end
    print("-- display ok --")
end

--主方法
function main()
    init() -- 初始化链表
    addRear(5)
    addRear(7)
    addRear(10)
    addHead(1) --向头部添加
    addRear(20) --向尾部添加
    insert(1, 3) --在第1个位置插入3
    insert(3, 100) -- 在第三个位置插入100
    display() -- 打印链表的每一个元素
    --print('请输入要删除的位置：')
    --pos = io.read('*number')
    ret = del(2)
    if not ret then
        print("删除失败")
    else
        print("你删除的是：", ret, "\n删除后的链表内容为：")
    end
    -- 打印改变后内容
    display()
    --clear()
    --display()

    i = 3
    print("第" .. i .. "个元素内容是：", getData(i))
    print("链表的的长度为：", getLen())

    destroy() -- 销毁链表
    print("---- main ok ----")
end

-- 程序的入口
main()
