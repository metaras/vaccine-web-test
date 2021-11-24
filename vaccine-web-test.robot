*** Settings ***

Library     SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              https://vaccine-haven.herokuapp.com
${CITIZEN_ID}       9621054670631
${SITE_NAME}        OGYHSite
${VACCINE_NAME}     Sinopharm

*** Test Cases ***
Home page test
	open browser                    ${URL}      ${BROWSER}
	page should contain element     id:check_info__link
	page should contain element     id:reserve__link

Reservation test
	click element                   id:reserve__link
	input text                      id:citizen_id               ${CITIZEN_ID}
	select from list by value       id:site_name                ${SITE_NAME}
	select from list by value       id:vaccine_name             ${VACCINE_NAME}
	click button                    id:reserve__btn
	sleep                           5

Cancel reservation test
	click element                   id:nav__info__link
	input text                      id:citizen_id               ${CITIZEN_ID}
	click button                    id:info__btn
	wait until element contains     id:reserve_vaccine_value    ${VACCINE_NAME}
	wait until element contains     id:reserve_site_value       ${SITE_NAME}
	page should contain element     id:reserve_vaccine_value    ${VACCINE_NAME}
	page should contain element     id:reserve_site_value       ${SITE_NAME}
	click button                    id:cancel__btn
	sleep                           5
	close browser