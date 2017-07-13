*** Settings ***
Library           Selenium2Library
Library           ../../Lib/site-packages/mylibrary/myself.py

*** Variables ***
${服务器地址}          http://172.21.116.201

*** Test Cases ***
上传微课/删除微课
    教师用户登录
    sleep    1
    click element    xpath=.//*[@id="btn_weike_zone"]/span
    sleep    1
    click element    xpath=.//*[@id="user_tabs"]/li[2]/span
    sleep    1
    click element    xpath=.//*[@id="weike_upload_btn"]/span
    sleep    1
    execute javascript    document.getElementsByClassName('layer-ext-hugeWnd')
    sleep    1
    choose file    xpath=.//*[@id="uploadifive-file_upload"]/input[2]    C:\\Users\\Public\\Videos\\Sample Videos\\Wildlife.wmv
    sleep    5
    input text    xpath=.//*[@id="weike_set_content"]/div/textarea    sdfsdfs
    sleep    1
    input text    xpath=.//*[@id="weike_set_name"]/div/input    这是一个测试视频
    sleep    1
    execute javascript    document.getElementsByClassName('layui-layer-btn0')[0].click()    #点击确认
    wait until page contains    老师    30
    sleep    5
    execute javascript    window.document.getElementById('weike_del_btn_enter').click()
    wait until page contains element    xpath=.//*[@id="weike_del_check_all"]
    execute javascript    window.document.getElementById('weike_del_check_all').click()
    execute javascript    window.document.getElementById('weike_del_btn').click()
    capture page screenshot
    sleep    2
    execute javascript    window.document.getElementsByClassName('layui-layer-btn0')[0].click()
    close all browsers
    [Teardown]    close all browsers

根据学段/年级/学科选择微课
    教师用户登录
    sleep    1
    click element    xpath=.//*[@id="btn_weike_zone"]/span    #进入我的微课
    sleep    1
    click element    xpath=.//*[@id="user_tabs"]/li[2]/span    #选择我的微课
    click element    xpath=./html/body/div/div[2]/div/div/div/div[1]/div[1]/div[1]/div/div[2]/b    #点击下拉框
    select from list    xpath=./html/body/div/div[2]/div/div/div/div[1]/div[1]/div[1]/div/div[1]/select    全部    #选择小学
    click element    xpath=./html/body/div/div[2]/div/div/div/div[1]/div[1]/div[1]/div/div[3]/div/div[1]/div/ul/li[2]
    capture page screenshot
    close all browsers
    [Teardown]    close all browsers

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
