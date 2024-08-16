
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.youtube.com
${PESQUISAR}      //input[contains(@autocapitalize,'none')]


*** Test Cases ***
Teste 01: Acessar canal Curso em Video
    Acessar canal Curso em Video
    
    

*** Keywords ***

Acessar canal Curso em Video
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Input Text      ${PESQUISAR}       Cursoemvideo   
    # Wait Until Page Contains        Cursoemvideo     5
    Click Button        //button[@class='style-scope ytd-searchbox'][contains(.,'Pesquisar')]
    
    Wait Until Element Is Visible    //img[contains(@height,'136')]    timeout=5
    Click Element   //*[@id="avatar-section"]/a
    Wait Until Element Is Visible    //*[@id="edit-banner-link"]   timeout=10
