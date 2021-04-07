*** Settings ***
Resource    ../../Resource/Fronttest/fronttest.robot

*** Variables ***
${URL} =        localhost:8080
${EMAIL} =      aarthi.badam55@gmail.com
${PASSWORD} =   bla@aarthi


*** Keywords ***

data to be accessed from frontend
    fronttest.Loging into the webpage
    @{frontCount} =    fronttest.Collecting the data
    [Return]    @{frontCount}
    #@{frontgraph} =    fronttest.collecting the data from graph
