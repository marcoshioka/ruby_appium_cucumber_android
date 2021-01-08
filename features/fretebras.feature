# language: pt

@fretebras
Funcionalidade: Fretebras App Android
  Eu como usuário da Fretebras
  desejo acessar o app Android
  para realizar pesquisas de Frete

  Cenário: Pedágio de frete para caminhão 2 eixos
    Dado que eu realize um login no app da Fretebras
    E faça checkin na plataforma 
    Quando eu selecionar um frete
    Então eu devo ver a tabela de pedágios
    E devo verificar o valor do pedágio para um caminhão de dois eixos
    