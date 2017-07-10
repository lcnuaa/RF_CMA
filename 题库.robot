*** Settings ***
Library           Selenium2Library

*** Test Cases ***
题库（包括新建题库，增加试题）
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
    click element    xpath=.//*[@id="question_itemlist_header"]/div[2]/div[1]/p    #新建试题
    sleep    5
    Comment    ${ID}    execute javascript    return document.getElementsByClassName('item_subject')[0].getElementsByClassName('container edui-default')[0].id
    comment    execute javascript    document.getElementById('${第一道题第一个编辑框ID}')
    select frame    xpath=.//*[@id="ueditor_0"]
    input text    xpath=./html/body    测试什么试题
    choose file    xpath=.//*[@id="edui_input_j4xjpjru"]    C:\\Users\\Public\\Pictures\\Sample Pictures\\菊花.jpg

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
