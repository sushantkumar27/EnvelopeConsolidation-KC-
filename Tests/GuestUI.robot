*** Settings ***
Resource    ../Tests/ContractProposalBaseTest.robot

*** Test Cases ***

Create Contract Proposal
    [Documentation]    This test case creates a contract proposal in Salesforce.
    [Tags]    CreateProposal
    [Setup]    Open Browser with Salesforce URL
    [Teardown]    Close Browser

    Login To Salesforce
    Click on Add Proposal Button

Select Proposal on Opportunity
    [Documentation]    This test case selects a proposal on an opportunity in Salesforce.
    [Tags]    SelectProposal
    [Setup]    Open Browser with Salesforce URL
    [Teardown]    Close Browser
    Login To Salesforce
    Select Proposal From Opportunity and Generate Code


Select Code and Generate Proposal Details On GuestUi
   [Documentation]    This test case selects a code and Generate details for Proposal On GuestUi.
    [Tags]    SelectCode
    [Setup]    Open Browser with Salesforce URL
    [Teardown]    Close Browser
    Login To Salesforce
    Update Contract Proposal From Code

Open Proposal and Generate Documents
    [Documentation]    This test case opens a proposal on opportunity and generate documents in Salesforce.
    [Tags]    OpenProposal
    [Setup]    Open Browser with Salesforce URL
    [Teardown]    Close Browser
    Login To Salesforce
    Open Proposal From Opportunity and Generate Documents
#Delete Proposal on Opportunity
    #[Documentation]    This test case selects a proposal on an opportunity in Salesforce.
    #[Tags]    SelectProposal
   # [Setup]    Open Browser with Salesforce URL
    #[Teardown]    Close Browser
    #Login To Salesforce
    #Select Proposal From Opportunity and Delete Proposal
