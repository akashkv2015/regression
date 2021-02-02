*** Settings ***
Library  CSVLib
Library     Collections

*** Variables ***


*** Keywords ***
Read Data from CSV
    ${dict} =   read csv as dictionary   ../../Test Data/testData.csv     Columns   Value1
    ${url} =  get from dictionary  ${dict}     url
    ${Browser} =    get from dictionary  ${dict}   browser
    ${Timeout} =    get from dictionary  ${dict}   Timeout
    ${Retry} =  get from dictionary  ${dict}   Retry
    ${STOProduct} =     get from dictionary  ${dict}   STOProduct
    ${CTOProduct} =     get from dictionary  ${dict}   CTOProduct
    ${PODescval} =  get from dictionary  ${dict}   PODescval
    ${cardType} =   get from dictionary  ${dict}   cardType
    ${cardNumber} =     get from dictionary  ${dict}   cardNumber
    ${cardExpiry} =     get from dictionary  ${dict}   cardExpiry
    ${cardCVV} =    get from dictionary  ${dict}   cardCVV
    ${fName} =      get from dictionary     ${dict}     fName
    ${lName} =      get from dictionary     ${dict}     lName
    ${phone} =      get from dictionary     ${dict}     phone
    ${email} =      get from dictionary     ${dict}     email

    Set Global Variable        ${Browser}
    Set Global Variable        ${Timeout}
    Set Global Variable        ${Retry}
    Set Global Variable        ${url}
    Set Global Variable        ${STOProduct}
    Set Global Variable        ${CTOProduct}
    Set Global Variable        ${PODescval}
    Set Global Variable        ${cardType}
    Set Global Variable        ${cardNumber}
    Set Global Variable        ${cardExpiry}
    Set Global Variable        ${cardCVV}
    Set Global Variable        ${fName}
    Set Global Variable        ${lName}
    Set Global Variable        ${phone}
    Set Global Variable        ${email}
