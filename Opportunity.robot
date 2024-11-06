*** Settings ***

Documentation              Private Opportunity Creation using XPath
Library                    QForce
Library                    QWeb
Library                    QVision
Library                    DateTime
Suite Setup                Open Browser                about:blank                 chrome
Suite Teardown             Close All Browsers

*** Variables ***
${Account_Name}            CloudFulcrum
${Opportunity_Name}        Edward Jones
${Close_Date}              30/11/2024
${Stage_Name}              Closed Won

*** Keywords ***
 Set up Browser
    Open Browser           ${login_url}                ${Browser}
    TypeText               username                    ${username}
    TypeText               password                    ${password}
    ClickText              Log In

*** Test Cases ***
Create Private Opportunity Test
    [Documentation]        Private Opportunity Creation using XPath
    Set up Browser
    Launch App             Sales
    ClickText              Opportunities
    Click Element          xpath=//div[@title='New']
    Use Modal              On
    Verify Element         xpath=//h2[text()='New Opportunity']
    Verify Element         xpath=//span[normalize-space(text())='Opportunity Information']
    VerifyElement          xpath=//span[text()='Opportunity Owner']
    VerifyElement          xpath=//span[contains(@class,'circle icon')]
    Click Element          xpath=//input[@part='checkbox']
    QWeb.TypeText               *Opportunity Name           ${Opportunity_Name}
    ClickElement           xpath=(//input[@role='combobox'])[1]
    ClickElement           xpath=//span[text()='New Account']
    Verify Element         xpath=//h2[text()='New Account']
    Verify Element         xpath=//span[text()='Account Information']
    TypeText               *Account Name               ${Account_Name}
    ClickElement           xpath=//label[normalize-space(text())='Parent Account']
    ClickElement           xpath=(//*[starts-with(@id,"dropdown-element-")])[9]/ul/li[3]
    ClickElement           xpath=//input[@name="AccountNumber"]
    TypeText               Account Number              56789054
    TypeText               Account Site                Outbound
    TypeText               Phone                       7075191353
    TypeText               Fax                         89453895923
    TypeText               Website                     https://www.cloudfulcrum.com/
    TypeText               Ticker Symbol               Jens
    ClickElement           xpath=xpath=//button[@role="combobox" and @aria-label="Type"]
    ClickText              Stage                       Prospecting
    ClickElement           xpath=//button[@data-value="--None--" and @aria-label="Rating"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Cold"]
    ClickElement           xpath=xpath=//button[@role="combobox" and @aria-label="Ownership"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Private"]
    ClickElement           xpath=xpath=//button[@role="combobox" and @aria-label="Industry"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Technology"]
    TypeText               Annual Revenue              1500000
    TypeText               Employees                   760
    TypeText               SIC Code                    500087
    Verify Element         xpath=//span[text()='Address Information']
    Verify Element         xpath=//legend[text()="Billing Address"]
    TypeText               Billing Street              Prashant Hills
    TypeText               Billing City                Hyderabad
    TypeText               Billing Zip                 500087
    TypeText               Billing State               Telengana
    TypeText               Billing Country             India
    Verify Element         xpath=//legend[text()="Shipping Address"]
    TypeText               Shipping Street             Khajaguda
    TypeText               Shipping City               Hyderabad
    TypeText               Shipping Zip                500080
    TypeText               Shipping State              Telengana
    TypeText               Shipping Country            India
    Verify Element         xpath=//span[text()='Additional Information']
    ClickElement           xpath=//button[@role="combobox" and @aria-label="Customer Priority"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Medium"]
    ClickElement           xpath=//button[@role="combobox" and @aria-label="SLA"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Platinum"]
    ClickElement           xpath=//button[@role="combobox" and @aria-label="Upsell Opportunity"]
    ClickElement           xpath=(//lightning-base-combobox-item[@data-value="Yes"])[1]
    ClickElement           xpath=//button[@role="combobox" and @aria-label="Active"]
    ClickElement           xpath=(//lightning-base-combobox-item[@data-value="Yes"])[2]
    TypeText               Number of Locations         3
    VerifyElement          xpath=//span[contains(text(), 'Description Information')]
    ClickElement           xpath=(//textarea[@class="slds-textarea"])[3]
    TypeText               Description                 Save it
    ClickElement           xpath=//button[@name="SaveEdit"]
    TypeText               Amount                      6000000
    ClickElement           xpath=//button[@aria-label="Type"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="New Customer"]
    ClickElement           xpath=//button[@aria-label="Lead Source"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Partner Referral"]
    TypeText               Next Step                   Procced for Closure
    ClickElement           xpath=//button[@aria-label="Stage"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Needs Analysis"]
    ClickElement           xpath=//input[@name='CloseDate']
    TypeText               Close Date                  11/30/2024
    TypeText               Probability                 85%
    ClickElement           xpath=//input[@placeholder='Search Campaigns...']
    ClickElement           xpath=//span[@title="New Campaign"]
    VerifyElement          xpath=//h2[text()="New Campaign"]
    VerifyElement          xpath=//span[text()="Campaign Information"]
    VerifyElement          xpath=//span[text()="Campaign Owner"]
    VerifyElement          xpath=//span[text()='Campaign Name']/../following-sibling::input
    TypeText               Campaign Name               Cloudfulcrum
    ClickElement           xpath=//span[text()='Active']/../following-sibling::input
    ClickElement           xpath=(//a[@class='select'])[2]
    ClickElement           xpath=//a[@title="Completed"]
    TypeText               Start Date                  01/11/2024
    TypeText               Close Date                  30/11/2024
    TypeText               Expected Revenue in Campaign                            7000000
    TypeText               Budgeted Cost in Campaign                               6000000
    TypeText               Actual Cost in Campaign     6200000
    TypeText               Expected Response           56
    ClickText              Parent Campaign             Cloudfulcrum
    # ClickElement         xpath=//span[@title='Cloudfulcrum']
    TypeText               Description                 Save the Campaign
    ClickText              Save                        partial_match=false
    VerifyElement          xpath=//span[text()="Additional Information"]
    TypeText               Order Number                789056688
    TypeText               Main Competitor             Social Media
    TypeText               Current Generator           3
    ClickElement           xpath=//button[@aria-label="Delivery/Installation Status"]
    ClickElement           xpath=//lightning-base-combobox-item[@data-value="Completed"]
    TypeText               Tracking Number             987605553673
    Verify Element         xpath=//span[text()="Description Information"]
    ClickElement           xpath=//textarea[@class="slds-textarea"]
    TypeText               Description                 Close the Opportunity
    ClickElement           xpath=//button[@name="SaveEdit"]                        wait=10s
    ClickElement           xpath=//button[@title="Close this window"]
    ClickElement              xpath=(//span[text()\='Show Actions'])[1]
    ClickElement              xpath=//a[@title\='Edit']/div/ancestor::li
    TypeText               *Opportunity Name            Thomson Reuters
    wait                   3s
    ClickElement           xpath=//button[@name="SaveEdit"]
    ${success_message}=    GetText                     //span[@class\="toastMessage slds-text-heading--small forceActionsText"]
    Log                    Success Message: ${success_message}                     level=Info
    Should Contain         ${success_message}          was saved
   

