*** Settings ***
Library           RequestsLibrary
Library           SSHLibrary
Library           HttpLibrary
Library           JMeterLib
Library           Collections

*** Variables ***
${url}            http://172.21.116.201:9001
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
