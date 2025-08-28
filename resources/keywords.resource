*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com
${USERNAME}    admin
${PASSWORD}    password123

*** Keywords ***
Iniciar Sessao
    Create Session    restful    ${BASE_URL}    verify=${False}

Gerar Token
    ${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    restful    /auth    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200
    ${token}=    Set Variable    ${response.json()}[token]
    Set Suite Variable    ${TOKEN}    ${token}

Listar Reservas
    ${response}=    GET On Session    restful    /booking
    Should Be Equal As Strings    ${response.status_code}    200

Criar Nova Reserva
    ${bookingdates}=    Create Dictionary    checkin=2025-09-01    checkout=2025-09-10
    ${body}=    Create Dictionary
    ...    firstname=Joao
    ...    lastname=Silva
    ...    totalprice=150
    ...    depositpaid=True
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=Café da manhã
    ${response}=    POST On Session    restful    /booking    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200
    ${id}=    Set Variable    ${response.json()}[bookingid]
    Set Suite Variable    ${NEW_BOOKING_ID}    ${id}

Atualizar Reserva
    ${headers}=    Create Dictionary    Content-Type=application/json    Cookie=token=${TOKEN}
    ${bookingdates}=    Create Dictionary    checkin=2025-09-05    checkout=2025-09-15
    ${body}=    Create Dictionary
    ...    firstname=Maria
    ...    lastname=Souza
    ...    totalprice=200
    ...    depositpaid=False
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=Jantar
    ${response}=    PUT On Session    restful    /booking/${NEW_BOOKING_ID}    headers=${headers}    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200

Deletar Reserva
    ${headers}=    Create Dictionary    Cookie=token=${TOKEN}
    ${response}=    DELETE On Session    restful    /booking/${NEW_BOOKING_ID}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201