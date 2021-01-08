# frozen_string_literal: true

class Pedagio_page
  def initialize
    @link_tabela = 'br.lgfelicio:id/tvTollsTable'
    @titulo_tabela_pedagios = 'br.lgfelicio:id/tvRoadToolbarTitle'
    @pedagio_caminhao_dois_eixos = "(//android.widget.TextView[@resource-id='br.lgfelicio:id/tvAxis'])[2]"
    @eixos = "(//android.widget.TextView[@resource-id='br.lgfelicio:id/tvAxis'])[2]"
    @caminhao = "(//android.widget.TextView[@resource-id='br.lgfelicio:id/tvDescription'])[2]"
    @preco = "(//android.widget.TextView[@resource-id='br.lgfelicio:id/tvPrice'])[2]"
  end

  def acessa_tabela
    if ENV['device_real']
      $wait.until { find_element(id: @link_tabela).displayed? }
      find_element(id: @link_tabela).click
      $wait.until { find_element(id: @titulo_tabela_pedagios).displayed? }
    else
      puts('Observação: emulador não exibe tabela')
    end
  end

  def valor_pedagio_caminhao_dois_eixos
    if ENV['device_real']
      $wait.until { find_element(xpath: @pedagio_caminhao_dois_eixos).displayed? }
      numero_eixos = find_element(xpath: @eixos).text
      numero_eixos.should == '2 EIXOS'
      descricao_caminhao = find_element(xpath: @caminhao).text
      descricao_caminhao.should == 'Caminhão leve ônibus / Trator Furgão'
      preco_pedagio = find_element(xpath: @preco).text
      puts('RESULTADO: O pedágio para caminhão com origem ' + $local_origem + ', destino ' + $local_destino + ', com ' + numero_eixos + ', categoria ' + descricao_caminhao + ' tem o valor de ' + preco_pedagio)
    else
      puts('Observação: método não disponível para emulador')
    end
  end
end
