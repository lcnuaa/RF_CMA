*** Settings ***
Library           Selenium2Library
Library           ../../Lib/site-packages/mylibrary/myself.py

*** Variables ***
${服务器地址}          http://172.21.116.201

*** Test Cases ***
上传微课
    open browser    ${服务器地址}    gc
    maximize browser window
    input text    xpath=.//*[@id="user"]    lc
    sleep    1
    input text    xpath=.//*[@id="password"]    123
    sleep    1
    click button    xpath=.//*[@id="submit"]
    #以上为登录账号
    sleep    1
    click element    xpath=.//*[@id="btn_weike_zone"]/span
    sleep    1
    click element    xpath=.//*[@id="user_tabs"]/li[2]/span
    sleep    1
    ${b}    list windows
    click element    xpath=.//*[@id="weike_upload_btn"]/span
    sleep    1
    ${a}    list windows
    log    ${a}
    execute javascript    document.getElementsByClassName('layer-ext-hugeWnd')
    sleep    1
    choose file    xpath=.//*[@id="uploadifive-file_upload"]/input[2]    C:\\Users\\Public\\Videos\\Sample Videos\\1.wmv
    sleep    5
    input text    xpath=.//*[@id="weike_set_content"]/div/textarea    sdfsdfs
    sleep    1
    input text    xpath=.//*[@id="weike_set_name"]/div/input    这是一个测试视频
    sleep    1
    execute javascript    document.getElementsByClassName('layui-layer-btn0')[0].click()    #点击确认

题库（包括新建题库，增加试题）
    [Timeout]
    set selenium timeout    20s
    open browser    ${服务器地址}    gc
    maximize browser window
    input text    xpath=.//*[@id="user"]    lc
    sleep    1
    input text    xpath=.//*[@id="password"]    123
    sleep    1
    click button    xpath=.//*[@id="submit"]
    #以上为登录账号
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
    ${ID}    execute javascript    return document.getElementsByClassName('item_subject')[0].getElementsByClassName('container edui-default')[0].id    #$(".item_subject:eq(0)").find('.container.edui-default:eq(0)').attr('id')
    comment    execute javascript    document.getElementById('${第一道题第一个编辑框ID}')
    input text    xpath=.//*[@id="${ID}"]    测试什么试题
