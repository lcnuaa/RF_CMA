*** Settings ***
Library           RequestsLibrary
Library           SSHLibrary
Library           HttpLibrary
Library           JMeterLib
Library           Collections
Library           Selenium2Library

*** Variables ***
${服务器地址}          http://172.21.116.201:9001
&{header}         Content-Type=application/json;charset=UTF-8

*** Test Cases ***
建立备课件
    create session    api    ${url}
    ${dict}    create dictionary    &{header}
    ${返回}    get request    api    /rj/index.php/apps/lesson_prepare/ajax/lessonprepare.php    ${dict}
    ${log}    to json    ${返回.content}    True
    ${新增备课夹}    create dictionary    method=0    name=数学
    ${结果}    post request    api    /rj/index.php/apps/lesson_prepare/ajax/lessonprepare.php    data=${新增备课夹}    params=None    headers=${header}
    should be equal as strings    ${结果.status_code}    200
    delete all sessions

dd
    登录获取cookie和token
    ${cookie}    get cookies
    ${dict}    create dictionary    Content-Type=application/json;charset=UTF-8    cookies=${cookie}
    create session    api    ${服务器地址}    ${dict}
    ${新增教室}    create dictionary    method=0    name=数学    ip=1.1.1.1    description=sdflk
    ${新增教室返回结果}    post request    api    /rj/index.php/apps/backmanage/ajax/classroom.php    data=${新增教室}
    ${log}    to json    ${新增教室返回结果.content}    True
    delete all sessions
    close all browsers
    [Teardown]    close all browsers

*** Keywords ***
登录获取cookie和token
    open browser    ${服务器地址}    gc
    maximize browser window
    input text    xpath=.//*[@id="user"]    admin
    sleep    1
    input text    xpath=.//*[@id="password"]    123
    sleep    1
    click button    xpath=.//*[@id="submit"]
