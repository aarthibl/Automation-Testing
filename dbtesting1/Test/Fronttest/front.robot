*** Settings ***
Resource    ../../Resource/Fronttest/fronttest.robot
*** Variables ***
${URL} =        https://ikarya.metricbees.com/
${EMAIL} =      aarthi.badam55@gmail.com
${PASSWORD} =   bla@aarthi
*** Keywords ***
data to be accessed from frontend
    fronttest.Loging into the webpage
    @{frontCount} =    fronttest.Collecting the data
    [Return]    @{frontCount}
    #@{frontgraph} =    fronttest.collecting the data from graph
    fronttest.creating the new setup
    fronttest.filling the form
    #fronttest.click back month
    #fronttest.click next month
    fronttest.Select Date