# frozen_string_literal: true
require 'rspec/expectations'
require 'pry'

Given('eu tenha as paginas necessárias iniciadas') do
  @login = LoginPages.new
end

And('o arquivo de massa de dados') do
  @datalogin = init_data("login")
end

Given(/^que estou na tela inicial$/) do
  print "Entrou no step"
  expect(@login.home.is_home?).to be true
  @login.home.pulaWalkThrough
  @login.login.clickCPF
end

When(/^insiro as minhas credenciais de acesso$/) do
  @login.login.login(@datalogin["login"]["ativada"]["cpf"], @datalogin["login"]["ativada"]["senha"])
end

Then(/^sou direcionado a home de Conta$/) do
  @login.login.pulaBiometria
  if @login.token.pularToken
    @login.organizadorHome.is_page?
  end
  @login.organizadorHome.is_page?
end
