*** Settings ***
Library    SeleniumLibrary
Resource    ../ReusableComponents/Variable.robot

*** Keywords ***
Open URL
   #${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    #Call Method    ${chrome_options}    add_argument    --start-maximized
    #Create WebDriver    Chrome    chrome_options=${chrome_options}

    ${chrome options} =     Evaluate    selenium.webdriver.ChromeOptions()
    ...                     modules=selenium, selenium.webdriver

    #Go To
    Open Browser    ${CODEURL}    ${Browser}

Open the Browser with URL
   # Create Webdriver    Chrome  ${Chrome_path}
   # Create Webdriver    Edge     ${Edge_browser}
   # Go To    ${salesforce_hicvqa}
    Open Browser    ${CODEURL}    ${BROWSER}    options=add_argument("--disable-notifications")
    Maximize Browser Window
    Set Selenium Speed   1
    Set Selenium Implicit Wait    10

Open New Tab with URL
   # Open Browser    ${CODEURL}    ${BROWSER}
    #Maximize Browser Window
    #Set Selenium Speed   1
    Set Selenium Implicit Wait    10
    Execute Javascript    window.open('${CODEURL}', '_blank');
    Switch Window    NEW
    Log    New tab opened and switched
Login To Salesforce

   #Provide user credentials
   Input Text  //input[@id ='username']  ${sfusername}
   Input Text    //input[@id ='password']    ${sfpassword}
   #click on Next button
   Click Button    //input[@id ='Login']
   #Waiting on password text field to be populated.
   Set Selenium Implicit Wait    5

Open Browser with Salesforce URL
    Open Browser    ${SFURL}    ${BROWSER}    options=add_argument("--disable-notifications")
    Maximize Browser Window
    Set Selenium Speed    1
    Set Selenium Implicit Wait    10
Click element using Javascript executor
    [Arguments]    ${xpath}
    ${element}=      Get Webelement   ${xpath}
   Execute javaScript    arguments[0].click();     ARGUMENTS    ${element}
     
Create Contract Proposal
 #   <CODE TO BE ADDED HERE FOR CREATE PROPOSAL SCENARIO>
    Set Selenium Implicit Wait    8
    Click Element    //div/one-app-nav-bar-item-root[3]
    Log To Console    Opportunity menu clicked
    Set Selenium Implicit Wait    8
    Click Link    //a[@class='slds-truncate'][contains(string(),'Allen')]
    Set Selenium Implicit Wait    10


     ${ele}    Get Webelement    //strong[text()=' Select Point Package']/../../..//select
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${ele}
    Select From List By Index    //strong[text()=' Select Point Package']/../../..//select    1
    Sleep    5s
    Scroll Element Into View    //strong[text()='Club Fee']
    Sleep    5s
    Wait Until Element Is Visible    //strong[text()='Select Financial Terms']/../../..//select    timeout=30s
    ${ele1}    Get Webelement    //strong[text()='Select Financial Terms']/../../..//select
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${ele1}
    Select From List By Index    //strong[text()='Select Financial Terms']/../../..//select    1
    Scroll Element Into View    //button[@title='Submit']
    Wait Until Element Is Visible    //div[@data-aura-class='cNewProposalComp']/div/div/div[2]/div[2]//button[@title='Submit']/..    timeout=30s
    ${element_submit}=    Get WebElement    xpath=//div[@data-aura-class='cNewProposalComp']/div/div/div[2]/div[2]//button[@title='Submit']
    Mouse Over    ${element_submit}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element_submit}
    Sleep    10s

     #Click on Add Proposal button
     Set Selenium Implicit Wait    15
     ${element_addProposal}=    Get WebElement    xpath=(//div[@class='slds-grid slds-gutters slds-p-around_small'])[2]/div/div/div/a/div/div/div/div[12]/div/div//button[@title='Add Proposal']
     Mouse Over    ${element_submit}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element_addProposal}
    Set Selenium Implicit Wait    15

    #Select Proposal
#problem with this xpath
   ${element_Proposal}=    Get WebElement    xpath=(//a[@class='slds-box slds-box_link slds-box_large slds-media'])[3]
    Mouse Over    ${element_submit}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element_Proposal}

#problem with this xpath
    #  Scroll Element Into View    (//a[@class='slds-box slds-box_link slds-box_large slds-media'])[3]
   # sET Selenium Implicit Wait    40
  # Click Element    (//a[@class='slds-box slds-box_link slds-box_large slds-media'])[3]
    #Set Selenium Implicit Wait    20

    #Select Open Bankruptcy
    Scroll Element Into View    //ul[@class='slds-tabs_default__nav']
    Click Element    (//div[@class='slds-col slds-p-around_small'])[9]/div/div/div/div/div/div/div/select
    Select From List By Index    (//div[@class='slds-col slds-p-around_small'])[9]/div/div/div/div/div/div/div/select    2
    Click Button    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/div/button

    #Maritial Status selection to Single Man
    Set Selenium Implicit Wait    5
    Click Element    (//div[@class='slds-col slds-p-around_small'])[9]/div/div/div/div/div/div/div
    Select From List By Index    (//div[@class='slds-col slds-p-around_small'])[9]/div/div/div/div/div/div/div/Select    5
    Click Button    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/button[2]

    #Select Vesting option
    Set Selenium Implicit Wait    5
    Click Element    (//div[@class='slds-col slds-p-around_small'])[10]/div/div/div/div/div/div/div
    Select From List By Index    (//div[@class='slds-col slds-p-around_small'])[10]/div/div/div/div/div/div/div/select    1
    Click Button    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/div/button[2]

    #Global Choice program
    
    Set Selenium Implicit Wait    5
    Select From List By Index    (//div[@class='slds-col slds-p-around_small'])[9]/div/div/div/div/div/div/select    2

    #Click on on PreConfirmation button.
    Click Button    //div[@class='slds-p-around_small slds-align_absolute-center']/button[2]
    Set Selenium Implicit Wait    5

   #Click on Accept button
   Click Button     //div[@class='slds-align_absolute-center cNewProposalSelector']/div/div[2]/div/button
   Set Selenium Implicit Wait    3
   
   #Click on Create Proposal
   Click Button   //div[@class='slds-p-around_small slds-align_absolute-center']/button[3]
    
    #Get code details
    ${ProposalCode} =    Get Text    (//div[@class='slds-col slds-p-around_xxx-small'])[4]/div/div
    Log To Console    ${ProposalCode}

  #Open New Tab with URL
  #Set Selenium Implicit Wait    5
  #Update Contract Proposal From Code

Click on Add Proposal Button
    Set Selenium Implicit Wait    8
    Click Element    //div/one-app-nav-bar-item-root[3]
    Log To Console    Opportunity menu clicked
    Set Selenium Implicit Wait    8
    Click Link    //a[@class='slds-truncate'][contains(string(),'Aaron')]
    Set Selenium Implicit Wait    10


     ${ele}    Get Webelement    //strong[text()=' Select Point Package']/../../..//select
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${ele}
    Select From List By Index    //strong[text()=' Select Point Package']/../../..//select    1
    Sleep    5s
    Scroll Element Into View    //strong[text()='Club Fee']
    Sleep    5s
    Wait Until Element Is Visible    //strong[text()='Select Financial Terms']/../../..//select    timeout=30s
    ${ele1}    Get Webelement    //strong[text()='Select Financial Terms']/../../..//select
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${ele1}
    Select From List By Index    //strong[text()='Select Financial Terms']/../../..//select    1
    Scroll Element Into View    //button[@title='Submit']
    Wait Until Element Is Visible    //div[@data-aura-class='cNewProposalComp']/div/div/div[2]/div[2]//button[@title='Submit']/..    timeout=30s
    ${element_submit}=    Get WebElement    xpath=//div[@data-aura-class='cNewProposalComp']/div/div/div[2]/div[2]//button[@title='Submit']
    Mouse Over    ${element_submit}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element_submit}
    Sleep    10s

     #Click on Add Proposal button
     Set Selenium Implicit Wait    15
     ${element_addProposal}=    Get WebElement    xpath=(//div[@class='slds-grid slds-gutters slds-p-around_small'])[2]/div/div/div/a/div/div/div/div[12]/div/div//button[@title='Add Proposal']
     Mouse Over    ${element_submit}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element_addProposal}
    Set Selenium Implicit Wait    15
Select Proposal From Opportunity and Delete Proposal
    Set Selenium Implicit Wait    3
    Click Element    //div/one-app-nav-bar-item-root[3]
    Log To Console    Opportunity menu clicked
    Set Selenium Implicit Wait    3
    Click Link    //a[@class='slds-truncate'][contains(string(),'Aaron')]
    Set Selenium Implicit Wait    2
    Scroll Element Into View    xpath=(//span[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11'])[1]

    ${DP}    Get Webelement    //div[@class='slds-media__body slds-p-around_medium']/div/div/button
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${DP}

    #Delete proposal confirm
    ${DC}    Get Webelement    //button[@class="slds-button slds-button_neutral customButton uiButton"]
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${DC}
    #Click Button    //button[@class="slds-button slds-button_neutral customButton uiButton"]
    Log To Console    "Proposal deleted"
    Set Selenium Implicit Wait    5


Select Proposal From Opportunity and Generate Code
    Set Selenium Implicit Wait    3
    Click Element    //div/one-app-nav-bar-item-root[3]
    Log To Console    Opportunity menu clicked
    Set Selenium Implicit Wait    3
    Click Link    //a[@class='slds-truncate'][contains(string(),'Aaron')]
    Set Selenium Implicit Wait    2
    Scroll Element Into View    xpath=(//span[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11'])[1]
    #problem with this xpath
    Set Selenium Implicit Wait    2
   ${element_Proposal}=    Get WebElement    xpath=//div[@class='slds-col slds-size_4-of-7 cNewProposalSelector']/div/div/div/div
    Mouse Over    ${element_Proposal}
    #Click Element    ${element_Proposal}
    Double Click Element   ${element_Proposal}
   # Execute Javascript    arguments[0].click();    ARGUMENTS    ${element_Proposal}

    #Select Open Bankruptcy
    Set Selenium Implicit Wait    2
    ${OB}    Get Webelement    //div[@class='slds-p-around_small']/div/div/div/div/div/select
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${OB}
    Select From List By Index    //div[@class='slds-p-around_small']/div/div/div/div/div/select    2
    Set Selenium Implicit Wait    2

    ${NB}    Get Webelement    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/div/button
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${NB}
    #Click Button    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/div/button

    #¸
   # Mouse Over    //div[@class='slds-p-around_small']/div/div/div/div/div
   # Click Element    //div[@class='slds-p-around_small']/div/div/div/div/div
   # Select From List By Index    (//div[@class='slds-p-around_small']/div/div/div/div/div/select    2
    #Click Button    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/div/button

    #Maritial Status selection to Single Man
    Set Selenium Implicit Wait    2
    ${MS}    Get Webelement    //div[@class='slds-col slds-p-around_small']/div/div/div/div/div/div/div/Select
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${MS}

    Select From List By Index    //div[@class='slds-col slds-p-around_small']/div/div/div/div/div/div/div/Select    5
    ${NB}    Get Webelement    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/button[2]
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${NB}
    #Click Button    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/button[2]

    #Select Vesting option
    Set Selenium Implicit Wait    2
    Select From List By Index    //div[@class='slds-col slds-p-around_small']/div/div/div/div/div/div/div/Select    1
    Set Selenium Implicit Wait    1
    ${NB}    Get Webelement    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/div/button[2]
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${NB}

    #Click Button    //div[@class='slds-grid slds-grid_vertical slds-align_absolute-center']/div/div/button[2]
    #Global Choice program

    Set Selenium Implicit Wait    2
    ${GC}    Get Webelement    (//div[@class='slds-col slds-p-around_small'])[9]/div/div/div/div/div/div/select
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${GC}
    Select From List By Index    (//div[@class='slds-col slds-p-around_small'])[9]/div/div/div/div/div/div/select    2

    #Click on on PreConfirmation button.
    Set Selenium Implicit Wait    2
    ${PC}    Get Webelement    //div[@class='slds-p-around_small slds-align_absolute-center']/button[2]
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${PC}

    #Click Button    //div[@class='slds-p-around_small slds-align_absolute-center']/button[2]


   #Click on Accept button
   Set Selenium Implicit Wait    2
    ${GC}    Get Webelement    //div[@class='slds-align_absolute-center cNewProposalSelector']/div/div[2]/div/button
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${GC}

   #Click Button     //div[@class='slds-align_absolute-center cNewProposalSelector']/div/div[2]/div/button
   Set Selenium Implicit Wait    3

   #Click on Create Proposal
   Set Selenium Implicit Wait    2
   ${CP}    Get Webelement    //button[@title='CreateProposal']
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${CP}
  # Click Button   //div[@class='slds-p-around_small slds-align_absolute-center']/button[3]
  Set Selenium Implicit Wait    5


   #Get code details
    ${ProposalCode} =    Get Text    (//div[@class='slds-col slds-p-around_xxx-small'])[4]/div/div
    Log To Console    ${ProposalCode}

    Log To Console        Before Update: ${Code}
    Set Global Variable    ${Code}    ${ProposalCode}
    Log To Console    After Update: ${Code}


Close Current Tab And Switch Back
    Open Browser    https://example.com    Chrome
    Sleep    2s
    Execute JavaScript    window.open('https://www.google.com', '_blank')
    Sleep    2s
    Switch Window    title=Google
    Close Window
    Switch Window    title=Example Domain
    [Teardown]    Close Browser
    
Update Contract Proposal From Code

     Set Selenium Implicit Wait    3
    Click Element    //div/one-app-nav-bar-item-root[3]
    Log To Console    Opportunity menu clicked
    Set Selenium Implicit Wait    3
    Click Link    //a[@class='slds-truncate'][contains(string(),'Aaron')]
    Set Selenium Implicit Wait    2
    Scroll Element Into View    xpath=(//span[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11'])[1]
    #problem with this xpath
    Set Selenium Implicit Wait    2
   ${element_Proposal}=    Get WebElement    xpath=//div[@class='slds-col slds-size_4-of-7 cNewProposalSelector']/div/div/div/div
    Mouse Over    ${element_Proposal}
    #Click Element    ${element_Proposal}
    Double Click Element   ${element_Proposal}

#Get code details
    ${ProposalCode} =    Get Text    (//div[@class='slds-col slds-p-around_xxx-small'])[4]/div/div
    Log To Console    ${ProposalCode}
    
    Log To Console        Before Update: ${Code}
    Set Global Variable    ${Code}    ${ProposalCode}
    Log To Console    After Update: ${Code}
    
# Open new tab in browser and shift for further actions
    Execute JavaScript    window.open('${CODEURL}', '_blank')
    Sleep    2s
    Switch Window    title=/code
    Log To Console   New tab opened and switched
    
    Input Text    //input[@placeholder='Code']    ${Code}
    Click Button   //button[@class='button is-primary is-large']
    Set Selenium Implicit Wait    2

    #Click on Continue button
    Wait Until Element Is Visible    //button[@class='button is-primary is-large']
    Click Button    //button[@class='button is-primary is-large']


    #input name and click accept
    Click Element    //input[@class='input is-medium ']
    Set Selenium Implicit Wait    2
    Input Text    //input[@class='input is-medium ']    ${name}
    Wait Until Element Is Enabled    //button[@class='button is-medium is-fullwidth is-primary']
    Click Button    //button[@class='button is-medium is-fullwidth is-primary']
    Set Selenium Implicit Wait    10

    #Provide emailaddress and other details
    
    Select From List By Value    //Select[@name='day']    1
    Select From List By Index        //Select[@name='months']   1
    Select From List By Value    //Select[@name='year']    1981
    
    
   Input Text    (//div[@class='control'])[5]/input    ${email}
   Input Text     //div[@class='card-content']/div[3]/div[2]/div/div/input    ${SSN}
   #Input Text    //input[@class='input is-medium '][4]    ${email}
    #Click Element    //div[@class='card-content']/div[4]/div/div/div/input
    Set Selenium Implicit Wait    3


    Sleep    0.5    # Optional, give JS time to react
    Clear Element Text   //div[@class='card-content']/div[4]/div/div/div/input
     Click Element    //div[@class='card-content']/div[4]/div/div/div/input
    Press Keys    //div[@class='card-content']/div[4]/div/div/div/input     \\ue011    # HOME key
    Input Text    //div[@class='card-content']/div[4]/div/div/div/input     ${Phone}
 
 
  # ${PH}    Get Webelement    //div[@class='card-content']/div[4]/div/div/div/input
   # Execute Javascript    arguments[0].dispatchEvent(new Event('input'));   ARGUMENTS   ${PH}    ${Phone}

   #Input Text     //div[@class='card-content']/div[4]/div/div/div/input    3
   # Click Element    (//input[@class='input is-medium is-danger'])[1]
   Input Text     //div[@class='card-content']/div[6]/div[2]/div/div/input   ${City}
    #Input Text    //input[@class='input is-medium is-danger']    ${SSN}
    Set Selenium Implicit Wait    5
    Wait Until Element Is Enabled    //button[@class='button is-medium is-fullwidth is-primary']
    Click Button    //button[@class='button is-medium is-fullwidth is-primary']

    #Provide Employer Information
    Set Selenium Implicit Wait    10

    Input Text    (//div/input)[1]     1234567890
    Input Text    (//div/input)[2]     1234567890
    #Name
    Input Text    (//div/input)[3]     James Test
    Input Text    (//div/input)[4]     1234567890
    #Address
    Input Text    (//div/input)[5]     Westgate US 192
    
    Select From List By Index     //div[@class='select is-medium is-fullwidth ']/select    2
    Set Selenium Implicit Wait    2
    Click Button    //button[@class='button is-medium is-fullwidth is-primary']


#Reference contact information
    Set Selenium Implicit Wait    3
    #Name
    Input Text    (//div/input)[1]    James1
    #Relation
    Input Text    (//div/input)[2]    COusin
    #Telephone
    Click Element  (//div/input)[3]
    Input Text    (//div/input)[3]    1234567890
    #Reference 2
    Input Text    (//div/input)[4]    James2
    Select From List By Index     //div[@class='card']/div[1]/div[3]/div[2]/div/div/div/select    1
    Input Text    (//div/input)[5]    COusin2
    Input Text    (//div/input)[6]    1234567890
    Select From List By Index     //div[@class='card']/div[2]/div[3]/div[2]/div/div/div/select   1
    Set Selenium Implicit Wait    4
    Click button   //button[@class='button is-medium is-fullwidth is-primary']

  # Down Payment information
  Set Selenium Implicit Wait    4
  Select From List By Index     //div[@class='column is-half is-offset-one-quarter has-text-centered']/div/div/div/select    2

   #Enter downpayment information.

    Set Selenium Implicit Wait    4
    Select From List By Index    //div[@class='select is-medium is-fullwidth is-danger']/select    1
    #postal code
    Input Text    //div[@class='column is-one-quarter']/div/div/input    123
    #Credit card number
    Input text     //div[@class='column is-one-half']/div/div/input    4444333322221111
    #Expiry Date
    Input text     //form[@id='add-payment-form']/fieldset/div[2]/div[2]/div[2]/div/div/input    04/28
    #CVV Info:
    Input Text    //form[@id='add-payment-form']/fieldset/div[2]/div[2]/div[3]/div/div/input    123
    #Amount provided
    input text     //form[@id='add-payment-form']/fieldset/div[3]/div/div/div/input    720

    Click Button    //button[@type='submit']

    #Click next button for confirmation on cc
    Set Selenium Implicit Wait    4
    CLick Button     //button[@class='button is-medium is-fullwidth is-primary']

    #automatic monthly payments.
    Set Selenium Implicit Wait    4
    CLick Button     //button[@class='button is-medium is-fullwidth is-primary']
    Set Selenium Implicit Wait    5

    #Summary of Purchase
    #Reason 1
    Input Text    (//input[@class='input is-medium is-danger'])[1]     Good View
    #Reason 2
    Input Text    (//input[@class='input is-medium is-danger'])[1]     Property
    #Reason 3
    Input Text    (//input[@class='input is-medium is-danger'])[1]     Good Deal
    
    #Click on Accept button
    Click Button    //button[@class='button is-medium is-fullwidth is-primary']
    Set Selenium Implicit Wait    5 
    
   # Switch Window    title=Aaron-6340960 | Opportunity | Salesforce
   # Set Selenium Implicit Wait    5

Open Proposal From Opportunity and Generate Documents

   Set Selenium Implicit Wait    3
    Click Element    //div/one-app-nav-bar-item-root[3]
    Log To Console    Opportunity menu clicked
    Set Selenium Implicit Wait    3
    Click Link    //a[@class='slds-truncate'][contains(string(),'Aaron')]
    Set Selenium Implicit Wait    2
    Scroll Element Into View    xpath=(//span[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11'])[1]
    #problem with this xpath
    Set Selenium Implicit Wait    2
   ${element_Proposal}=    Get WebElement    xpath=//div[@class='slds-col slds-size_4-of-7 cNewProposalSelector']/div/div/div/div
    Mouse Over    ${element_Proposal}
    #Click Element    ${element_Proposal}
    Double Click Element   ${element_Proposal}

    
    Set Selenium Implicit Wait    2
   ${OP}    Get Webelement    //button[@title='openProposal']
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${OP}
    Set Selenium Implicit Wait    2

    #Click QAO BUTTON
    ${QAO}    Get Webelement    //button[@name='Contract_Proposal__c.Assign_QAO']
    Execute Javascript    arguments[0].click();   ARGUMENTS   ${QAO}

    
    #Select a value dynamically generated on input
    Set Selenium Implicit Wait    3
    Wait Until Element Is Visible    xpath=//input[@role='comboBox']

    ${element}    Get WebElement    xpath=//input[@role='comboBox']
    Execute JavaScript    arguments[0].dispatchEvent(new Event('input'))    ARGUMENTS    ${element}    SushantKumar Rout
    #Input Text    xpath=//input[@role='comboBox']    SushantKumar Rout
    Sleep    2s    # Wait for the dropdown to populate
    Click Element    xpath=//div[@role='listbox']/div[2]/ul/li/a/div[2]

    #Save button
    Click Element    //footer[@class='slds-modal__footer']/button[2]
    Set Selenium Implicit Wait    2


