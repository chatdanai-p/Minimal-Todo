*** Settings ***
Variables   ../../resources/translation/minimalToDoTranslation.yaml

*** Keywords ***
Add To-Do List With Turn Off Remind Me
    [Arguments]  ${value}
    minimalToDoPage.Click Add To-Do List Button
    minimalToDoPage.Verify Default Add To-Do List Page
    minimalToDoPage.Input Title For Add To-Do List  ${value}
    minimalToDoPage.Click Action Button On Add To-Do List Page
    minimalToDoPage.Verify Home Page With To-Do List  ${value}

Add To-Do List With Turn On Remind Me
    [Arguments]  ${value}
    minimalToDoPage.Click Add To-Do List Button
    minimalToDoPage.Verify Default Add To-Do List Page
    minimalToDoPage.Input Title For Add To-Do List  ${value}
    minimalToDoPage.Click Reminder Button On Add To-Do List Page
    minimalToDoPage.Verify Date And Time For Reminder On Add To-Do List Page
    minimalToDoPage.Click Action Button On Add To-Do List Page
    minimalToDoPage.Verify Home Page With To-Do List  ${value}

Verify Edit Date Time For Remind Me
    minimalToDoPage.Click Add To-Do List Button
    minimalToDoPage.Verify Default Add To-Do List Page
    minimalToDoPage.Input Title For Add To-Do List  ${Title['thai']}
    minimalToDoPage.Click Reminder Button On Add To-Do List Page
    minimalToDoPage.Verify Date And Time For Reminder On Add To-Do List Page
    minimalToDoPage.Click Edit Date On Add To-Do List Page
    minimalToDoPage.Verify Calendar Popup
    minimalToDoPage.Click Cancel Button On Calendar Popup
    minimalToDoPage.Click Edit Date On Add To-Do List Page
    minimalToDoPage.click OK Button On Calendar Popup
    minimalToDoPage.Click Edit Time On Add To-Do List Page
    minimalToDoPage.Verify Clock Popup
    minimalToDoPage.Click Cancel Button On Clock Popup
    minimalToDoPage.Verify Date And Time For Reminder On Add To-Do List Page
    minimalToDoPage.Click Action Button On Add To-Do List Page