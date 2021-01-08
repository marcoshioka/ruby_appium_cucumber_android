# frozen_string_literal: true

class Login_page
  def initialize
    @logo_inicial = 'br.lgfelicio:id/ivSplashScreenLogo'
    @botao_comecar = 'br.lgfelicio:id/roadButtonText'
    @texto_placa = 'br.lgfelicio:id/tvVehiclePlateLabel'
    @campo_placa = 'br.lgfelicio:id/etVehiclePlate'
    @botao_proximo = 'br.lgfelicio:id/btVehiclePlateNext'
    @texto_senha = 'br.lgfelicio:id/tvPasswordLabel'
    @campo_senha = 'br.lgfelicio:id/etPassword'
    @botao_entrar = 'br.lgfelicio:id/btPasswordFinish'
    @permitir_fretebras = 'br.lgfelicio:id/alertTitle'
    @confirma_acesso = 'android:id/button1'
    @mensagem_localizacao_emulador = 'com.android.packageinstaller:id/permission_message'
    @mensagem_localizacao = 'com.android.permissioncontroller:id/permission_message'
    @confirma_permissao_emulador = 'com.android.packageinstaller:id/permission_allow_button'
    @confirma_permissao = 'com.android.permissioncontroller:id/permission_allow_always_button'
    @logo_home = 'br.lgfelicio:id/ivLogo'
  end

  def acessa_app
    if ENV['device_real']
      $wait.until { find_element(id: @logo_inicial).displayed? }
      $wait.until { find_element(id: @botao_comecar).displayed? }
      find_element(id: @botao_comecar).click
      $wait.until { find_element(id: @texto_placa).displayed? }
    else #emulador
      $wait.until { find_element(id: @logo_inicial).displayed? }
      $wait.until { find_element(id: @botao_comecar).displayed? }
      find_element(id: @botao_comecar).click
      $wait.until { find_element(id: @texto_placa).displayed? }
    end
  end

  def insere_placa
    if ENV['device_real']
      find_element(id: @campo_placa).send_keys('DTY1986')
      find_element(id: @botao_proximo).click
      $wait.until {	find_element(id: @texto_senha).displayed? }
    else #emulador
      find_element(id: @campo_placa).send_keys('DTY1986')
      find_element(id: @botao_proximo).click
      $wait.until {	find_element(id: @texto_senha).displayed? }
    end
  end

  def insere_senha
    if ENV['device_real']
      find_element(id: @campo_senha).send_keys('R1234567')
      find_element(id: @botao_entrar).click
      $wait.until { find_element(id: @confirma_acesso).displayed? }
    else #emulador
      find_element(id: @campo_senha).send_keys('R1234567')
      find_element(id: @botao_entrar).click
      $wait.until { find_element(id: @confirma_acesso).displayed? }
    end
  end

  def permitir_acesso
    if ENV['device_real']
      find_element(id: @confirma_acesso).click
      $wait.until { find_element(id: @logo_home).displayed? }
    else #emulador
      find_element(id: @confirma_acesso).click
      $wait.until { find_element(id: @logo_home).displayed? }
    end
  end
end
