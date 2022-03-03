# frozen_string_literal: true
class LoginPage

  def initialize
    get_screen_mappings 'login', 'login'
  end
  def login(cpf, senha)
    preencheCPF(cpf)
    continuar()
    preencheSenha(senha)
    continuar()
  end

  def preencheCPF cpf
    wait_for_element_exist(@mappings['preencherCpf'])
    send_keys_digital_keyboard(@mappings['preencherCpf'], cpf)
    screenshot ('Page - Preenche CPF')
  end

  def preencheSenha senha
    wait_for_element_exist(@mappings['preencherSenha'])
    send_keys_digital_keyboard(@mappings['preencherSenha'], senha)
    screenshot ('Page - Preenche Senha')
  end

  def continuar
    screenshot('PAGE - Continuar')
    find(@mappings['btnContinuar']).click
  end

  def clickCPF
    if android?
      wait_for_element_exist(@mappings['campoCPF'])
      find(@mappings['campoCPF']).click
    elsif ios?
      wait_for_element_exist(@mappings['campoCPF'])
    end
  end

  def pulaBiometria
    if android?
      screenshot("Pular Biometria")
      if wait_for_element_exist(@mappings['btnAtivarAcessoBio'])
        puts("Biometria?#{wait_for_element_exist(@mappings['btnAtivarAcessoBio'])}")
        wait_for_element_exist(@mappings['btnDeixarParaDepois'])
        find(@mappings['btnDeixarParaDepois']).click
        find(@mappings['btnOkEntendiBio']).click
      end
    end
  end

end