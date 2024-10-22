*** Settings ***
Resource            ../resources/import/import_lib.robot
Resource            ../keywords/pages/minimalToDoPage.robot
Resource            ../keywords/features/minimalToDofeatures.robot
Variables           ../resources/test_data/minimalToDoTestData.yaml
Suite Setup         Set Appium Timeout    ${global_timeout}
Suite Teardown      Close All Applications

*** Test Cases ***
Add To-Do List With Turn Off Remind Me
    minimalToDoPage.Open Minimal To-Do Application
    minimalToDoPage.Verify Home Page Without To-Do List
    minimalToDoFeatures.Add To-Do List With Turn Off Remind Me  ${Title['thai']}
    minimalToDoFeatures.Add To-Do List With Turn Off Remind Me  ${Title['english']}
    minimalToDoFeatures.Add To-Do List With Turn Off Remind Me  ${Title['specialCharacter']}

Add To-Do List With Turn On Remind Me
    minimalToDoPage.Open Minimal To-Do Application
    minimalToDoPage.Verify Home Page Without To-Do List
    minimalToDoFeatures.Add To-Do List With Turn On Remind Me  ${Title['thai']}
    minimalToDoFeatures.Add To-Do List With Turn On Remind Me  ${Title['english']}
    minimalToDoFeatures.Add To-Do List With Turn On Remind Me  ${Title['specialCharacter']}

Verify Edit Date Time For Remind Me
    minimalToDoPage.Open Minimal To-Do Application
    minimalToDoPage.Verify Home Page Without To-Do List
    minimalToDoFeatures.Verify Edit Date Time For Remind Me