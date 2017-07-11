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
    close all browsers
    [Teardown]    close all browsers

添加测试

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
