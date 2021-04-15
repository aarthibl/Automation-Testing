*** Settings ***
Library    OperatingSystem
Library    MongoDBLibrary
Library    String
Library    Collections
Library    DateTime
*** Variables ***
*** Keywords ***
access data from backend
    [Tags]    count
    ${On-Hold}        retrieve some mongodb records    workflow    v_agg_project    {"_id":"On-Hold"}
    ${In-Progress}    retrieve some mongodb records    workflow    v_agg_project    {"_id":"In-Progress"}
    ${Open}           retrieve some mongodb records    workflow    v_agg_project    {"_id":"Open"}
    ${Delayed}       retrieve some mongodb records    workflow    v_agg_project    {"_id":"Delayed"}
    @{bck}    create list    ${On-Hold}      ${In-Progress}      ${Open}        ${Delayed}
    @{backenddata}      create list
    FOR    ${ITEM}    IN    @{bck}
        ${length}   get length    ${item}
        @{split_string}    split string  ${ITEM}
        log  ${split_string}
        run keyword if     ${length} == 0
        ...     append to list    ${split_string}       0  0  0  0
        log many    @{split_string}
        log  ${backenddata}
        ${count}    get from list  ${SPLIT_STRING}  3
        append to list    ${backenddata}    ${count}
        log  ${backenddata}
    END
    [Return]    @{backenddata}
access data from bargraph
    [Tags]  graph
    #${Open_graph}  retrieve some mongodb records    workflow  v_workflow_status   {"_id":"2021-04-06"}
    #log    ${Open_graph}
     ${DATE}        GET CURRENT DATE
     @{DATES}       CREATE LIST                                 #gets both date and time for next 5 days
     FOR    ${ITEM}     IN RANGE    1  6
            ${DAY}      ADD TIME TO DATE    ${DATE}     ${ITEM}DAYS
            append to list    ${DATES}    ${Day}
     END
     @{DATES_FINAL}     create list                            #collecting only dates from the data
     FOR    ${ITEM}    IN    @{DATES}
            @{date}     split string    ${ITEM}
            ${Date_only}    get from list    ${date}    0
            append to list    ${DATES_FINAL}    ${Date_only}
     END
     log many    @{DATES_FINAL}
     FOR    ${ITEM}     IN     @{DATES_FINAL}
            ${OPEN_GRAPH} =    RETRIEVE SOME MONGODB RECORDS    workflow     v_workflow_status     {"_id":"${ITEM}"}
            LOG    ${OPEN_GRAPH}
            #RUN KEYWORD IF    ${OPEN_GRAPH}
            #...    ELSE     continue for loop
     END