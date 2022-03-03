#language: en
#encoding: utf-8

@login
Feature: Login

Background:
  Given eu tenha as paginas necessárias iniciadas
  And o arquivo de massa de dados 

  @login_valido
  Scenario: Login efetuado com sucesso
	 Given que estou na tela inicial
	 When insiro as minhas credenciais de acesso
   Then sou direcionado a home de Conta

