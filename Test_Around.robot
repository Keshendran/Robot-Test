*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
@{ITEMS}          Lazy Stretch \    \ Circle \ \ \    Spill \ \    Frame it

*** Test Cases ***
Test Around - FOR Loop
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
    END
