# frozen_string_literal: true
class TokenPage
require 'pry'
require 'rest-client'
require 'json'

  def initialize
    get_screen_mappings 'token', 'login'
  end

  def pularToken
    if find(@mappings['btnDeixarParaDepois']).displayed?
      @mappings['btnDeixarParaDepois'].click
      screenshot('Page - Pular Token')
      @mappings['vwIrTelaInicial'].click
    end
  end
end

