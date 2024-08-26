*** Settings***
Library    SeleniumLibrary

*** Variables ***
${Cat_videos}    //div[@class='yt-tab-shape-wiz__tab'][contains(.,'Vídeos')]
${Video_AI}      //a[@id="video-title-link" and .//yt-formatted-string[text()="Por que é tão importante aprender IA? - @CursoemVideo Inteligência Artificial"]]
${Descrição}     Nesse vídeo vamos ver como aprender Inteligência Artificial pode nos tornar profissionais bem diferentes. Vamos ver pesquisas do MIT e da IBM que falam sobre o aumento de produtividade e do crescimento do uso de IA nas empresas no Brasil. Não tem como deixar essa análise passar em branco, veja o vídeo até o final! 


*** Test Cases ***
Abrir navegador e acessar a pagina do Youtube
    Open Browser    url=https://www.youtube.com/       browser=chrome  executable_path=/usr/local/bin/chromedriver
    Maximize Browser Window

Entrar no canal Curso em Video
    Input Text                    name=search_query    text=Curso em Video
    Click Button                  locator=//*[@id="search-icon-legacy"]
    Wait Until Page Contains      text=Curso em Vídeo
    Click Element                 xpath=//yt-formatted-string[text()='Curso em Vídeo']
    Wait Until Page Contains      Início


Acessar a pagina Home do canal
    Wait Until Page Contains        text=Vídeos
    Click Element                   locator=//a[@href="/c/CursoemV%C3%ADdeo"]
    Wait Until Element Is Visible   locator=(//div[contains(.,'Seja membro')])[11]

Selecionar um video
    Click Element                    ${Cat_videos}
    Wait Until Page Contains         text=Playlists
    Sleep    3
    Scroll Element Into View            //yt-formatted-string[@id="video-title" and contains(text(), "Por que é tão importante aprender IA?")]     
    ${scroll}    Execute Javascript     window.scrollBy(0, 1000)
    Scroll Element Into View         ${Video_AI} 
    Click Element                    ${Video_AI} 
    Wait Until Page Contains         ${Descrição} 
     
Esperar o comercial terminar
     Sleep      3
     Wait Until Element Is Visible   xpath=//button[@title='Reproduzir (k)']




