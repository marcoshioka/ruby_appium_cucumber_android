# frozen_string_literal: true

$login_page = Login_page.new
$checkin_page = Checkin_page.new
$frete_page = Frete_page.new
$pedagio_page = Pedagio_page.new

Dado('que eu realize um login no app da Fretebras') do
  $login_page.acessa_app
  $login_page.insere_placa
  $login_page.insere_senha
  $login_page.permitir_acesso
end

Dado('faça checkin na plataforma') do
  $checkin_page.acessa_checkin
  $checkin_page.seleciona_origem_sao_paulo
  $checkin_page.confirma_checkin
end

Quando('eu selecionar um frete') do
  $frete_page.acessa_frete
  $frete_page.seleciona_primeiro_frete
  $frete_page.verifica_detalhes_frete
end

Então('eu devo ver a tabela de pedágios') do
  $pedagio_page.acessa_tabela
end

Então('devo verificar o valor do pedágio para um caminhão de dois eixos') do
  if ENV['device_real']
    $pedagio_page.valor_pedagio_caminhao_dois_eixos
  else
    log('Observação: step indisponível para emulator')
  end
end
