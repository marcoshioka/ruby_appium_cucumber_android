# frozen_string_literal: true

class Frete_page
  def initialize
    @menu_mais = 'br.lgfelicio:id/action_mais'
    @opcao_frete = 'br.lgfelicio:id/llFretes'
    @titulo_fretes = 'br.lgfelicio:id/tvTitle'
    @primeiro_frete = "(//android.view.ViewGroup[@resource-id='br.lgfelicio:id/clFreights'])[1]"
    @cabecalho_frete = 'br.lgfelicio:id/toolbar'
    @frame_dicas = 'android:id/content'
    @mensagem_dicas = "//android.widget.TextView[@resource-id='br.lgfelicio:id/tvChecklistTitle']"
    @botao_ok = 'br.lgfelicio:id/roadButtonText'
    @origem = 'br.lgfelicio:id/tvOrigem'
    @destino = 'br.lgfelicio:id/tvDestino'
  end

  def acessa_frete
    $wait.until { find_element(id: @menu_mais).displayed? }
    find_element(id: @menu_mais).click
    $wait.until { find_element(id: @opcao_frete).displayed? }
    find_element(id: @opcao_frete).click
    $wait.until { find_element(id: @titulo_fretes).displayed? }
  end

  def seleciona_primeiro_frete
    $wait.until { find_element(xpath: @primeiro_frete).displayed? }
    find_element(xpath: @primeiro_frete).click
  end

  def verifica_detalhes_frete
    # if find_element(xpath: @mensagem_dicas).displayed? === Selenium::WebDriver::Error::NoSuchElementError
    #   find_element(id: @botao_ok).click
    #   $wait.until { find_element(id: @cabecalho_frete).displayed? }
    #   $local_origem = find_element(id: @origem).text
    #   $local_destino = find_element(id: @destino).text
    # else
    #   $wait.until { find_element(id: @cabecalho_frete).negative? }
    #   $local_origem = find_element(id: @origem).text
    #   $local_destino = find_element(id: @destino).text
    # end
    find_element(xpath: @mensagem_dicas).displayed? === true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    $wait.until { find_element(id: @cabecalho_frete).displayed? }
    $local_origem = find_element(id: @origem).text
    $local_destino = find_element(id: @destino).text
    puts('Origem: ' + $local_origem)
    puts('Destino: ' + $local_destino)
  rescue
    find_element(id: @botao_ok).click
    $wait.until { find_element(id: @cabecalho_frete).displayed? }
    $local_origem = find_element(id: @origem).text
    $local_destino = find_element(id: @destino).text
    puts('Origem: ' + $local_origem)
    puts('Destino: ' + $local_destino)
    true
  end
end
