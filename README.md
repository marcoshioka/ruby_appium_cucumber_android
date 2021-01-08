# Ruby_Appium_Cucumber_Android 

## README 
Repositório com estrutura de automação de testes mobile Android, com Ruby, Appium e Cucumber

#### Frameworks básicos: 
- Ruby, Appium e Cucumber.

#### Configuração: 
- Realizar clone do repositório
- Instalar o Ruby 
- Instalar o Node.Js
- Instalar o Java (JDK) e configurar as variáveis de ambiente ($JAVA_HOME)
- Instalar o Android Studio e configurar SDK e AVD (emulador) que irá utilizar
- Instalar o Appium versão console ou através do pacote NPM:
```sh
 npm install -g appium
```
- Após isso, para verificar o funcionamento e start do servidor Appium, insira o comando:
```sh
 appium
```
Realizadas essas configurações, na raíz do projeto inserir o comando bundle para instalar as demais dependências do projeto:
```sh
 bundle install
```

#### Estrutura do projeto:
- As features em Gherkin (Cucumber) ficam no diretório “features”
- Os steps definitions e page objects estão em suas respectivas pastas no diretório “features”
- É gerado o report do Cucumber na raíz do projeto, como "report.html"
- O apk para o teste fica dentro do diretório build
- Foi criado um .gitignore para não subir os prints e eventuais vídeos para o repositório
- Foram adicionados alguns logs aos métodos da automação, para exibir mensagens no console durante a execução
- O teste é executável em devices físicos (Android 10) e emuladores Android

#### Como executar os testes:
**Para executar todas as features do projeto usando emulador, o comando é:**
```sh
cucumber
```
**Para executar a feature criada para o apk, o comando é passado com a tag:**
```sh
cucumber --tags='@fretebras'
```

**Para executar os testes por um device real, é necessário passar a variável  'device_real' na linha de comando:**
```sh
cucumber --tags='@fretebras' device_real=true
```

### Travis CI: 
Foi incluída uma configuração para execução dessa automação no Travis CI (CI/CD/Continuous Testing). A configuração está no arquivo “.travis.yml” na raíz do projeto. Com essa configuração o projeto é executado no Travis CI com Cucumber e um emulador Android.

### Observação:
- Foi criada a ENV device_real, incluindo steps diferentes em alguns métodos para essa chamada, pois foi observada diferença no comportamento entre a execução com emulador e a execução com um device físico. 
- Também foi notada que a execução por emulador no apk da Fretebras não apresenta o link para a tabela de pedágio (o comportamento foi notado em emuladores diferentes, com versões de Android também diferentes). Os steps foram tratados para lidar com  essa diferença.

### Informação de versões:
- 1.0.0: versão inicial

### Autor:
- Marcos Ribeiro Hioka
- contato: marcosribeirohioka@gmail.com