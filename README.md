ruby-mobile-appium-template
============================

Description
-----------

Quer um template pronto para testes mobile com appium? Essa é sua salvação. Plug and Play.

Pre-requisites
--------------

MacOS (Android e IOS) ou Windows (Somente Android);
Java;
Android Studio;
Ruby 3.0.0;
Appium server;
Android Studio.

Installation
------------

MacOS

Para facilitar a instalação e gerenciamento de pacotes sugerimos a instalação do Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Mais informações: Homebrew - https://brew.sh/

1: Instalar o RVM (Ferramenta que possibilita instalar e gerenciar diversas versões do Ruby e suas gems) $ 

curl -sSL https://get.rvm.io | bash -s stable

1.1: Definindo versão do Ruby:

rvm list

Veja a versão do Ruby mais atual da lista:

rvm install ruby-<versão da lista>

2 - Instalação JAVA. Faça download e realize a instalação 
2.1: Confira a versão instalada digitando o comando java -version no terminal

3 - Faça a instalação do Android Studio

4 - Faça instalação do Appium Desktop

5 - Configuração das variaveis de ambiente JAVA_HOME e ANDROID_HOME 
5.1: Aconselho utilizar o bash_profile 
5.2: Após ter instalado o JDK abra o arquivo bash_profile através do terminal nano ~/.bash_profile 
5.3: Adicione a configuração para JAVA_HOME e ANDROID_HOME 

export JAVA_HOME=$(/usr/libexec/java_home) 

export ANDROID_HOME=/Users/<seu user>/Library/Android/sdk 

export PATH="$PATH:$ANDROID_HOME/platform-tools" 

export PATH="$PATH:$ANDROID_HOME/tools" 

export PATH="$PATH:$ANDROID_HOME/tools/bin" 

export PATH="$PATH:$ANDROID_HOME/emulator"

5.4: Salve suas alterações utilizando "ctrl+o" e "return". E para sair "ctrl+x" 
5.5: Em seguida digite source .bash_profile


6 - Instalação do Ant 

brew install ant


7 - Instalar Bundler 

gem install bundler


Passo 8 - Instalação do allure-commandLine

npm install -g allure-commandline


8 - Instalar a Gem na sua maquina:

gem install ruby-mobile-appium-template

Usage
-----

1 - Vá ao diretório que você deseja criar o projeto pelo terminal;

2 - Digite o comando abaixo no console, substituindo o nomeDoProjeto pelo nome que você deseja dar ao seu projeto.

ruby-mobile-appium-template nomeDoProjeto

      create

      create  Gemfile

      create  Rakefile

      create  cucumber.yml

      create  app

      create  config

      create  features
      
      create  app/ios
      
      create  app/android
      
      create  config/ios
      
      create  config/android
      
      create  features/login
      
      create  features/support
      
      create  features/login/features
      
      create  features/login/data
      
      create  features/login/elements
      
      create  features/login/pageobjects
      
      create  features/login/steps
      
      create  config/ios/appium.txt
      
      create  config/ios/appium_farm.txt
      
      create  config/android/appium.txt
      
      create  config/android/appium_farm.txt
      
      create  features/support/env.rb
      
      create  features/support/hooks.rb
      
      create  features/support/utils.rb
      
      create  features/support/appium_custom.rb
      
      create  features/login/features/login.feature
      
      create  features/login/data/login.yaml
      
      create  features/login/elements/screen_mappings_home.yaml
      
      create  features/login/elements/screen_mappings_login.yaml
      
      create  features/login/elements/screen_mappings_organizadorhome.yaml
      
      create  features/login/elements/screen_mappings_token.yaml
      
      create  features/login/pageobjects/home.rb
      
      create  features/login/pageobjects/login.rb
      
      create  features/login/pageobjects/loginPages.rb
      
      create  features/login/pageobjects/organizadorHome.rb
      
      create  features/login/pageobjects/token.rb
      
      create  features/login/steps/login_steps.rb


3 - Após isso digite no console

     cd nomeDoProjeto

     # instalar as dependencias com bundle
     
     bundle install

     # Rodar testes com Rake

     rake <Um dos profiles dentro do cucumber.yml>[@tagExistenteNoArquivoFeatures]
     Exemplo: rake android_local[@login_valido]

    # Rodar testes com Cucumber

     cucumber -p <Um dos profiles dentro do cucumber.yml> -t @tagExistenteNoArquivoFeatures
     Exemplo: cucumber -p android_local -t @login_valido



