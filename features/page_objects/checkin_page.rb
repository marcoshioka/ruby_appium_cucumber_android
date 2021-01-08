# frozen_string_literal: true

class Checkin_page
  def initialize
    @botao_menu = 'br.lgfelicio:id/action_mais'
    @opcao_checkin = 'br.lgfelicio:id/llCheckin'
    @titulo_checkin = 'br.lgfelicio:id/tvRoadToolbarTitle'
    @campo_origem = 'br.lgfelicio:id/actvCheckinOrigin'
    @botao_ver_fretes = 'br.lgfelicio:id/rbCheckinViewFreights'
    @tela_confirmacao_checkin = 'br.lgfelicio:id/lavCheckin'
    @campo_editavel = 'br.lgfelicio:id/textinput_placeholder'
    @cidade_Sao_Paulo = 'br.lgfelicio:id/llCheckinContent'
    @campo_destino = 'br.lgfelicio:id/retCheckinDestination'
  end

  def acessa_checkin
    $wait.until { find_element(id: @botao_menu).displayed? }
    find_element(id: @botao_menu).click
    $wait.until { find_element(id: @opcao_checkin).displayed? }
    find_element(id: @opcao_checkin).click
    $wait.until { find_element(id: @titulo_checkin).displayed? }
  end

  def seleciona_origem_sao_paulo
    find_element(id: @titulo_checkin).click
    $wait.until { find_element(id: @campo_origem).displayed? }
    find_element(id: @titulo_checkin).click
    $wait.until { find_element(id: @campo_origem).displayed? }
    find_element(id: @campo_origem).click
    $wait.until { find_element(id: @campo_editavel).displayed? }
    find_element(id: @campo_origem).send_keys('São Paulo')
    $wait.until { find_element(id: @cidade_Sao_Paulo).displayed? }
    find_element(id: @cidade_Sao_Paulo).click
  end

  def confirma_checkin
    $wait.until { find_element(id: @botao_ver_fretes).displayed? }
    find_element(id: @botao_ver_fretes).click
    $wait.until {	find_element(id: @tela_confirmacao_checkin).displayed? }
  end
end
