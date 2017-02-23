*** Settings ***
Suite Setup       Open Browser    http://10.240.194.83/    ${browser}
Suite Teardown    Close Browser
Resource          ../resources/seleniumLibrary.robot
Library           RequestsLibrary

*** Variables ***
${undefined}      http://10.240.194.83/
${browser}        gc

*** Test Cases ***
Test Case
    open    /dashboard/auth/login/
    type    id=id_username    admin@example.org
    type    id=id_password    admin
    assertValue    id=id_password    admin
    click    css=#newsplash > div > div > form > div.windMain.clearfix > fieldset > div > div.login-modal-footer > div
    waitForTitle    Lenovo OpenStack
