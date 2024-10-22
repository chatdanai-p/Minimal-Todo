*** Settings ***
Variables   ../../resources/translation/minimalToDoTranslation.yaml

*** Variables ***
# Notification
${notification.lblTitle}                                id=com.android.permissioncontroller:id/permission_message
${notification.btnAllow}                                id=com.android.permissioncontroller:id/permission_allow_button

# Home Page
${homePage.lblTitle}                                    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.LinearLayout[2]/android.view.ViewGroup/android.widget.TextView
${homePage.btnMoreOptions}                              xpath=//android.widget.ImageView[@content-desc="More options"]
${homePage.icoToDo}                                     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.ImageView
${homePage.lblNoToDo}                                   xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/android.widget.TextView
${homePage.btnAddToDo}                                  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
# Add To Do Page
${addToDoPage.btnClose}                                 xpath=//android.widget.ImageButton[@content-desc="Navigate up"]
${addToDoPage.lblTitleText}                             id=com.avjindersinghsekhon.minimaltodo:id/toDoCustomTextInput
${addToDoPage.lblTitleValue}                            id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText
${addToDoPage.btnAction}                                id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
${addToDoPage.icoReminder}                              id=com.avjindersinghsekhon.minimaltodo:id/userToDoReminderIconImageButton
${addToDoPage.lblReminder}                              id=com.avjindersinghsekhon.minimaltodo:id/userToDoRemindMeTextView
${addToDoPage.btnReminder}                              id=com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat
${addToDoPage.reminder.lblDate}                         id=com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText
${addToDoPage.reminder.calendar.lblDatePickerHeader}    id=com.avjindersinghsekhon.minimaltodo:id/date_picker_header
${addToDoPage.reminder.calendar.lblDatePickerMonth}     id=com.avjindersinghsekhon.minimaltodo:id/date_picker_month
${addToDoPage.reminder.calendar.lblDatePickerDay}       id=com.avjindersinghsekhon.minimaltodo:id/date_picker_day
${addToDoPage.reminder.calendar.lblDatePickerYear}      id=com.avjindersinghsekhon.minimaltodo:id/date_picker_year
${addToDoPage.reminder.calendar.xxx}                    xpath=//android.view.View[@content-desc="20 October 2024"]
${addToDoPage.reminder.calendar.btnCancel}              id=com.avjindersinghsekhon.minimaltodo:id/cancel
${addToDoPage.reminder.calendar.btnOk}                  id=com.avjindersinghsekhon.minimaltodo:id/ok
${addToDoPage.reminder.icoAt}                           xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup[2]/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.LinearLayout[2]/android.widget.LinearLayout/android.widget.TextView
${addToDoPage.reminder.lblTime}                         id=com.avjindersinghsekhon.minimaltodo:id/newTodoTimeEditText
${addToDoPage.reminder.clock.lblHours}                  id=com.avjindersinghsekhon.minimaltodo:id/hours
${addToDoPage.reminder.clock.lblMinutes}                id=com.avjindersinghsekhon.minimaltodo:id/minutes
${addToDoPage.reminder.clock.icoTimePicker}             id=com.avjindersinghsekhon.minimaltodo:id/time_picker
${addToDoPage.reminder.clock.btnCancel}                 id=com.avjindersinghsekhon.minimaltodo:id/cancel
${addToDoPage.reminder.clock.btnOk}                     id=com.avjindersinghsekhon.minimaltodo:id/ok
${addToDoPage.reminder.lblSummaryDateTime}              id=com.avjindersinghsekhon.minimaltodo:id/newToDoDateTimeReminderTextView


*** Keywords ***
Open Minimal To-Do Application
    Open Application    ${remoteUrl}    platformName=${platformName}    deviceName=${deviceName}    app=${app}   automationName=${automation}  autoGrantPermissions=${permissions}
    ${status}  Run Keyword And Return Status  Element Attribute Should Match  ${notification.lblTitle}
    log  ${status}
    Run Keyword If  '${status}' == 'True'  Click Element  ${notification.btnAllow}

Verify Home Page Without To-Do List
    Wait Until Page Contains                            ${homepage['lblNoToDo']}
    Element Should Contain Text                         ${homePage.lblTitle}  ${homepage['lblTitle']}
    Element Should Be Visible                           ${homePage.btnMoreOptions}
    Element Should Be Visible                           ${homePage.icoToDo}
    Element Should Be Visible                           ${homePage.btnAddToDo}

Click More Options Button
    Click Element                                       ${homePage.btnMoreOptions}

Click Add To-Do List Button
    Click Element                                       ${homePage.btnAddToDo}

Input Title For Add To-Do List
    [Arguments]  ${value}
    Input Text                                          ${addToDoPage.lblTitleValue}  ${value}

Verify Default Add To-Do List Page
    Wait Until Page Contains                            ${addToDoPage['lblTitleText']}
    Hide Keyboard
    Element Should Be Visible                           ${addToDoPage.btnClose}
    Element Should Be Visible                           ${addToDoPage.lblTitleValue}
    Element Should Be Visible                           ${addToDoPage.btnAction}
    Element Should Be Visible                           ${addToDoPage.icoReminder}
    Element Should Contain Text                         ${addToDoPage.lblReminder}  ${addToDoPage['lblReminder']}
    Element Should Be Visible                           ${addToDoPage.btnReminder}

Click Action Button On Add To-Do List Page
    Click Element                                       ${addToDoPage.btnAction}

Verify Home Page With To-Do List
    [Arguments]  ${text}
    Page Should Contain Text                            ${text}
    
Click Reminder Button On Add To-Do List Page
    Click Element                                       ${addToDoPage.btnReminder}

Verify Date And Time For Reminder On Add To-Do List Page
    Wait Until Element Is Visible                       ${addToDoPage.reminder.lblSummaryDateTime}
    ${date}          Get Element Attribute              ${addToDoPage.reminder.lblDate}  text
    IF  '${date}' == '${addToDoPage.reminder['lblDate']}'
        Element Should Contain Text  ${addToDoPage.reminder.lblDate}  ${addToDoPage.reminder['lblDate']}
    ELSE  
        Should Match Regexp    ${date}     ^\\d{1,2} [A-Za-z]{3}, \\d{4}$
    END
    ${time}          Get Element Attribute              ${addToDoPage.reminder.lblTime}  text
    Should Match Regexp    ${time}  ^(2[0-3]|[01]?[0-9]):([0-5][0-9])$
    ${lblSummaryDateTime}  Get Element Attribute        ${addToDoPage.reminder.lblSummaryDateTime}  text
    Should Match Regexp    ${lblSummaryDateTime}  Reminder set for (\\d{1,2}) ([A-Za-z]{3}), (\\d{4}), (\\d{1,2}):(\\d{2})

Click Edit Date On Add To-Do List Page
    Click Element                                       ${addToDoPage.reminder.lblDate}

Verify Calendar Popup
    Wait Until Element Is Visible                       ${addToDoPage.reminder.calendar.lblDatePickerHeader}
    Element Should Be Visible                           ${addToDoPage.reminder.calendar.lblDatePickerMonth}
    Element Should Be Visible                           ${addToDoPage.reminder.calendar.lblDatePickerDay}
    Element Should Be Visible                           ${addToDoPage.reminder.calendar.lblDatePickerYear}
    Element Should Contain Text                         ${addToDoPage.reminder.calendar.btnCancel}  ${addToDoPage.reminder.calendar['btnCancel']}
    Element Should Contain Text                         ${addToDoPage.reminder.calendar.btnOk}  ${addToDoPage.reminder.calendar['btnOk']}

Click Cancel Button On Calendar Popup
    Click Element                                       ${addToDoPage.reminder.calendar.btnCancel}

Click OK Button On Calendar Popup
    Click Element                                       ${addToDoPage.reminder.calendar.btnOk}

Click Edit Time On Add To-Do List Page
    Click Element                                       ${addToDoPage.reminder.lblTime}

Verify Clock Popup
    Wait Until Element Is Visible                       ${addToDoPage.reminder.clock.lblHours}
    Element Should Be Visible                           ${addToDoPage.reminder.clock.lblMinutes}
    Element Should Be Visible                           ${addToDoPage.reminder.clock.icoTimePicker}
    Element Should Contain Text                         ${addToDoPage.reminder.clock.btnCancel}  ${addToDoPage.reminder.clock['btnCancel']}
    Element Should Contain Text                         ${addToDoPage.reminder.clock.btnOk}  ${addToDoPage.reminder.clock['btnOk']}

Click Cancel Button On Clock Popup
    Click Element                                       ${addToDoPage.reminder.clock.btnCancel}

Click OK Button On Clock Popup
    Click Element                                       ${addToDoPage.reminder.clock.btnOk}

Input Time On Add To-Do List Page
    ${current_time}=    Get Current Date    result_format=%H:%M
    ${new_time}=    Add Time To Time    ${current_time}     01:00
    ${new_datetime}=    Convert Date    ${new_time}     result_format=%H:%M