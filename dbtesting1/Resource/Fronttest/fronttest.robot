*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${LOGIN_EMAIL_FIELD} =  xpath=//*[@id="input-82"]
${LOGIN_PASS_FIELD} =   xpath=//*[@id="input-85"]
${LOGIN_BUTTON} =       css=#app > div > div > div > main > div > div > div > div > form > div > div.v-card__actions > div > button.v-btn.v-btn--is-elevated.v-btn--has-bg.theme--light.v-size--default.primary
${PROJECTS_BUTTON} =    xpath=/html/body/div[1]/div/div/div/div[2]/div/nav/div[1]/div/div/div[1]/div[1]/div[1]/div[2]/div
${NEW_SETUP} =          xpath=/html/body/div[1]/div/div/div/div[2]/div/nav/div[1]/div/div/div[1]/div[2]/a[1]/div[2]/div
${DATA_PATH} =          xpath=//*[@id="input-161"]
${PROJECT_NAME} =       xpath=//*[@id="input-166"]
${CLIENT} =             xpath=//*[@id="input-169"]
${DESCRIPTION} =        xpath=//*[@id="input-175"]
${ORGANISER} =          xpath=//*[@id="input-180"]
${ASSIGNEE} =           xpath=//*[@id="input-186"]
${DUE_BY} =             xpath=//*[@id="input-194"]

*** Keywords ***
Loging into the webpage
    open browser
    go to    ${URL}
    input text      ${LOGIN_EMAIL_FIELD}    ${EMAIL}
    input text      ${LOGIN_PASS_FIELD}     ${PASSWORD}
    click button    ${LOGIN_BUTTON}
    wait until page contains    Open
    log    Login Sucessfull
    sleep  10s
Collecting the data
    ${OPEN} =             get text    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[1]/div/div[1]/div[2]/div/div
    ${In-Progress} =      GET TEXT    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div
    ${DELAYED} =          GET TEXT    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[3]/div/div[1]/div[2]/div/div
    ${ON-HOLD} =          GET TEXT    xpath=//*[@id="app"]/div/div/div/main/div/div/div/div/div[1]/div[4]/div/div[1]/div[2]/div/div
    @{counts} =           create list    ${ON-HOLD}  ${In-Progress}  ${Open}  ${Delayed}
    [Return]              @{counts}

creating the new setup
    click element    ${PROJECTS_BUTTON}
    wait until page contains    New Setup
    click element    ${NEW_SETUP}
    sleep    10s
    #wait until page contains    Group
    log  success

filling the form
    Click Element   ${DATA_PATH}
    Mouse Down    css=#list-item-256-0 > div:nth-child(1) > div:nth-child(1)
    Click Element  css=#list-item-256-0 > div:nth-child(1) > div:nth-child(1)
    input text   ${PROJECT_NAME}        ABC
    click element    ${CLIENT}
    Mouse Down    css=#list-item-261-1 > div:nth-child(1) > div:nth-child(1)
    Click Element  css=#list-item-261-1 > div:nth-child(1) > div:nth-child(1)
    input text   ${DESCRIPTION}  This project has an update about new version of BMW.
    click element    ${ORGANISER}
    Mouse Down    css=#list-item-270-2 > div:nth-child(1) > div:nth-child(1)
    Click Element  css=#list-item-270-2 > div:nth-child(1) > div:nth-child(1)
    click element    ${ASSIGNEE}
    mouse down    css=#list-item-277-2 > div:nth-child(1) > div:nth-child(1)
    Click Element  css=#list-item-277-2 > div:nth-child(1) > div:nth-child(1)

Select Date
    click back month
    click next month
    sleep  10s
    click element    xpath=/html/body/div[1]/div[6]/div/div/div/div[2]/table/tbody/tr[5]/td[1]/button/div
    ${value} =     get element attribute  id=input-194  value
    should be equal as strings    ${value}  2021-04-25

click back month
    click element    ${DUE_BY}
    mouse over    css=.v-date-picker-header > button:nth-child(1)
    click element    css=.v-date-picker-header > button:nth-child(1)
click next month
    #click element    ${DUE_BY}
    mouse over    css=button.v-btn:nth-child(3)
    click element    css=button.v-btn:nth-child(3)