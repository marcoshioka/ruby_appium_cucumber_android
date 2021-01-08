require 'rubygems'
require 'rake/testtask'

desc 'Iniciando servidor Appium'
task :default do
  puts 'iniciando server do appium'
  system 'nohup appium &'
  sleep(4)
end

desc 'Verificando se emulador Android está ativo'
task :status do
  sh 'android-wait-for-emulator'
end

desc 'Executando testes no Android'
task :android do
  sh "cucumber --tags='@fretebras'"
end

desc 'Fechando conexão com o servidor Appium'
task :close_appium_server do
  puts 'Fechando conexão com o servidor Appium'
  system "ps -ef | grep -v grep | grep appium | awk '{print $2}' |
  xargs kill -9"
end

task :cucumber_android_emulator => [:default,:status, :android, :close_appium_server]