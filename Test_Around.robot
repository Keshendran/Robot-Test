*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           JenkinsLibrary

*** Variables ***
@{ITEMS}          Lazy Stretch \    \ Circle \ \ \    Spill \ \    Frame it

*** Test Cases ***
TestAround-FOR-Loop
    Open Browser    https://tympanus.net/Development/PageLoadingEffects/    browser=chrome
    Set Selenium speed    0.3
    Maximize browser Window
    @{ITEMS}    Create List    Lazy Stretch    Circle    Spill    Frame it    Tunnel vision    Windscreen wiper    Jammed blind    Parallelogram    Tilted    Lateral Swipe    Wave    Origami    Curtain
    FOR    ${INDEX}    ${ELEMENT}    IN ENUMERATE    @{ITEMS}
        Wait Until Page Contains Element    //div[@class="pageload-overlay"]
        Click Element    //a[text()="${ELEMENT}"]
        Log To Console    ${ELEMENT}
        Click Element    //a[@class="pageload-link"][text()="Show Page Loader"]
        Wait Until Page Contains Element    //div[@class="pageload-overlay"]
        Click Element    //a[@class="pageload-link"][text()="Go back"]
    #Set Jenkins Server    url=http://192.168.1.4:8080/    username=axiata-local    password=Mandrill@123
    #Create Jenkins Job    test_job
    #Start Jenkins Job    test_job
    END
