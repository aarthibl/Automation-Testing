*** Settings ***
Resource    ../../Resource/Backend/backendtest.robot


*** Variables ***


*** Keywords ***
Data should be accessed from database
        @{backCount} =      backendtest.access data from backend
        [Return]    @{backCount}
        #@{backgrpah} =      backendtest.access data from bargraph

