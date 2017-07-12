*** Settings ***
Suite Teardown    run keyword if any tests failed    close all browsers
Library           Selenium2Library

*** Variables ***
${服务器地址}          http://172.21.116.201

*** Test Cases ***
布置导学
    教师用户登录
    click element    xpath=./html/body/div[1]/div[1]/div/ul[1]/li[2]/a/span
    click element    xpath=./html/body/div[1]/div[2]/div/div[1]/div/div/div[1]/div[3]/span
    input text    xpath=./html/body/div/div[2]/div/div[2]/div/div/table/tr[2]/td[2]/div/textarea    sdfa
    capture page screenshot
    click element    xpath=./html/body/div/div[2]/div/div[2]/div/div/table/tr[3]/td[2]/div/div/input    #点击插入微课准备跳转页面
    wait until page contains    可选微课    2
    mouse over    xpath=./html/body/div/div[2]/div/div[2]/div/div[2]/div[2]/div[1]
    assign id to element    xpath=./html/body/div/div[2]/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/span    第一个微课复选框id
    wait until element is visible    第一个微课复选框id
    click element    第一个微课复选框id
    capture page screenshot
    sleep    1
    click element    xpath=./html/body/div/div[2]/div/div[2]/div/div[1]/div[2]/div[1]
    sleep    2
    click element    xpath=./html/body/div/div[2]/div/div[2]/div/div/table/tr[4]/td[2]/div/div[2]/div/input    #点击上传题目按钮，准备跳转页面
    wait until page contains    题库    2
    assign id to element    xpath=./html/body/div/div[2]/div/div[2]/div/div/div[2]/div[2]/div[2]/div    全选框
    click element    全选框
    execute javascript    window.document.getElementsByClassName('confirm_btn user_btn_confirm ok')[0].click()    #点击确认
    execute javascript    window.document.getElementById('yes_flowWnd').click()    #弹出菜单点击确认
    execute javascript    document.getElementsByClassName('user_btn right_top homeworkmaterial_file')
    choose file    xpath=./html/body/div/div[2]/div/div[2]/div/div/table/tr[5]/td[2]/div/div[1]/input[2]    C:\\Users\\Public\\Pictures\\Sample Pictures\\1.jpg
    capture page screenshot
    close all browsers
    [Teardown]    close all browsers

添加测试/删除测试
    教师用户登录
    click element    xpath=./html/body/div[1]/div[1]/div/ul[1]/li[2]/a/span
    assign id to element    xpath=./html/body/div/div[2]/div/div[1]/div/div/div[2]/div[3]/span    添加测试
    click element    添加测试
    wait until page contains    新建试题
    execute javascript    window.document.getElementsByClassName('check_item')[0].click()
    input text    xpath=./html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div[1]/input    添加测试试题
    execute javascript    window.document.getElementsByClassName('confirm_btn user_btn_confirm ok')[0].click()    #点击确认按钮
    execute javascript    window.document.getElementById('yes_flowWnd').click()    #二级弹出框确认
    #以下是删除测试
    execute javascript    document.getElementsByClassName('el-checkbox__inner')[0].click()    #全选试题列表
    sleep    1
    execute javascript    window.document.getElementsByClassName('icon_btn ico_del btn_delete')[0].click()
    execute javascript    document.getElementsByClassName('layui-layer-btn0')[0].click()
    [Teardown]    close all browsers

布置作业

*** Keywords ***
教师用户登录
    open browser    ${服务器地址}    gc
    maximize browser window
    input text    xpath=.//*[@id="user"]    lc
    sleep    1
    input text    xpath=.//*[@id="password"]    123
    sleep    1
    click button    xpath=.//*[@id="submit"]
    #以上为登录账号
