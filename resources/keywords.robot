# -*- coding: utf-8 -*-
# +
*** Settings ***
Library           RPA.Browser
Library           RPA.FileSystem
Variables         variables.py

*** Keywords ***
Show apartments for sale in Oikotie
    Open Oikotie apartments for sale page
    Search for apartments for sale
    Show apartments for sale
    [Teardown]    Close Browser


Open Oikotie apartments for sale page
    Open Available Browser    ${OIKOTIE_APARTMENTS_FOR_SALE_URL}
    Sleep    2 seconds
    Accept cookie notice


Search for apartments for sale
    Input search criteria
    Click Button    Näytä kohteet
    Select From List By Label    xpath://select[@name="sorting"]    Halvin ensin
    Sleep    2 seconds
    

Show apartments for sale
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    @{apartments}=   Get WebElements    xpath://a[@class="ot-card"]
    FOR    ${apartment}    IN    @{apartments}
        Scroll Element Into View    ${apartment}
        Capture Element Screenshot    ${apartment}
    END


Accept cookie notice
    ${cookie_acceptance_button} =    Get cookie acceptance button locator
    Select Frame    sp_message_iframe_210572
    Click Element When Visible    xpath://button[@title="OK"]
    Unselect Frame


Input search criteria
    Input Location
    Input min price
    Input max price
    Input min size
    

Get cookie acceptance button locator
    [Return]    xpath://button[@title="OK"]
    

Input Location
    Input Text    xpath://input[@id="autocomplete2-input"]    Hyvinkää
    Press Keys    None    RETURN
    

Input min price
    Input Text    xpath://input[@name="priceMin"]    70000
    

Input max price
    Input Text    xpath://input[@name="priceMax"]    200000
    

Input min size
    Input Text    xpath://input[@name="sizeBuildingMin"]    70
      
# -


