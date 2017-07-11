*** Settings ***
Library           Selenium2Library

*** Variables ***
${服务器地址}          http://172.21.116.201

*** Test Cases ***
题库（包括新建题库，增加/删除/修改试题）
    [Timeout]
    教师用户登录
    sleep    1
    #新增题库（若没有则新增，有的话直接新建试题）
    click element    xpath=.//*[@id="btn_question_bank"]/span    #进入题库界面
    sleep    1
    ${a}    page should contain    题库空空，请先新增题库
    sleep    1
    run keyword if    ${a}==1    input text    xpath=.//*[@id="folderdataempty"]/div/div[2]/div/div[1]/input    你妹
    click element    xpath=.//*[@id="ok"]
    sleep    1
    click element    xpath=.//*[@id="question_itemlist_header"]/div[1]/div/div[3]/div[3]/div
    sleep    1
    input text    xpath=.//*[@id="question_itemlist_header"]/div[1]/div/div[3]/div[2]/div/input    你妹是谁
    sleep    1
    click element    //*[@id="question_itemlist_header"]/div[1]/div/div[3]/div[3]/div
    sleep    1
    #新建试题
    click element    xpath=.//*[@id="question_itemlist_header"]/div[2]/div[1]/p
    sleep    5
    Comment    ${ID}    execute javascript    return document.getElementsByClassName('item_subject')[0].getElementsByClassName('container edui-default')[0].id    获取富文本框真实id
    select frame    xpath=.//*[@id="ueditor_0"]
    input text    xpath=./html/body    测试什么试题
    Comment    choose file    xpath=.//*[@id="edui_input_j4xjpjru"]    C:\\Users\\Public\\Pictures\\Sample Pictures\\菊花.jpg    上传图片
    unselect frame
    click element    xpath=.//*[@id="app_questionlib_addquestion"]/div[1]/div[3]
    #修改试题
    sleep    2
    execute javascript    window.document.getElementsByClassName('ico_edit_small')[0].click()    #编辑试题
    select frame    xpath=.//*[@id="ueditor_1"]
    input text    xpath=./html/body    !@#$%^&&*()zheshi这是什么{}|[];'/.,<>?:"|{}{
    unselect frame
    sleep    2
    execute javascript    window.document.getElementsByClassName('layui-layer-btn0')[0].click()    #编辑成功
    #删除试题
    sleep    2
    execute javascript    window.document.getElementsByClassName('ico_edit_small')[1].click()
    sleep    2
    execute javascript    window.document.getElementsByClassName('layer-ext-smallWnd')
    sleep    1
    execute javascript    window.document.getElementsByClassName('layui-layer-btn0')[0].click()    #点击删除确认
    #删除题库
    mouse over    xpath=./html/body/div/div[2]/div/div/div[1]/div[2]/div/div[1]/ol/span/li/div/div
    wait until element is visible    xpath=./html/body/div/div[2]/div/div/div[1]/div[2]/div/div[1]/ol/span/li/div/div    1
    click element    xpath=./html/body/div/div[2]/div/div/div[1]/div[2]/div/div[1]/ol/span/li/div/div/div[1]
    execute javascript    window.document.getElementsByClassName('layer-ext-smallWnd')
    sleep    1
    execute javascript    window.document.getElementsByClassName('layui-layer-btn0')[0].click()    #点击删除确认
    close all browsers
    [Teardown]    #stop remote server    # 每次都关闭java进程，无论成功与否

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

上传图片
