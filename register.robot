*** Settings ***

Library     SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              https://vaccine-haven.herokuapp.com/registration/
${CITIZEN_ID}       9621054670631
${FIRSTNAME}        Firstname
${LASTNAME}         Lastname
${BIRTHDATE}        03\03\2001
${OCCUPATION}       Student
${PHONENUMBER}      0945824567
${ADDRESS}          KU

*** Test Cases ***
Open website
	open browser    ${URL}  ${BROWSER}

Fill from
	input text      id:citizen_id       ${CITIZEN_ID}
	input text      id:name             ${FIRSTNAME}
	input text      id:surname          ${LASTNAME}
	input text      id:birth_date       ${BIRTHDATE}
	input text      id:occupation       ${OCCUPATION}
	input text      id:phone_number     ${PHONENUMBER}
	input text      id:address          ${ADDRESS}
	click element   id:register__btn
	sleep           5
	close browser