*** Settings ***
Resource    ../resources/keywords.resource

*** Test Cases ***
Criar Token de Autenticação
    Iniciar Sessao
    Gerar Token

Listar Reservas (GET)
    Listar Reservas

Criar Nova Reserva (POST)
    Criar Nova Reserva

Atualizar Reserva (PUT com token)
    Atualizar Reserva

Deletar Reserva (DELETE com token)
    Deletar Reserva