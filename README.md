# Documentação Técnica - Currency Converter

**Projeto:** Currency-Converter-C10 [cite: 5]

## 1. Visão Geral do Projeto
O **Currency Converter** é um aplicativo mobile desenvolvido para iOS, projetado para realizar conversões de moedas [cite: 5]. O aplicativo permite que os usuários verifiquem taxas de câmbio e também conta com um módulo de histórico, onde as conversões passadas podem ser consultadas [cite: 5]. O desenvolvimento seguiu práticas modernas de engenharia de software para plataformas Apple [cite: 5].

## 2. Tecnologias Implementadas
* **Linguagem:** Swift [cite: 5].
* **Plataforma:** iOS (Desenvolvido no Xcode) [cite: 5].
* **Interface Gráfica:** Storyboards (como `Main.storyboard`, `LaunchScreen.storyboard` e `Historico.storyboard`) e UIKit [cite: 5].
* **Arquitetura:** O projeto utiliza o padrão arquitetural **VIPER** (View, Interactor, Presenter, Entity, Router), que promove uma alta separação de responsabilidades, facilitando a manutenção e escalabilidade do código [cite: 5].

## 3. Estrutura do Projeto
O código-fonte está estruturado no diretório principal `Currency-Converter-C10/`, dividido da seguinte forma [cite: 5]:

### VIPER (Arquitetura Principal)
A lógica principal do aplicativo está organizada em módulos dentro da pasta `VIPER/` [cite: 5]:

* **Módulo Conversor:** Responsável pela tela e lógica de conversão de moedas [cite: 5].
    * `Entity/`: Contém os modelos de dados (`ConversorEntity.swift`) [cite: 5].
    * `Interactor/`: Lida com as regras de negócio e requisições de dados (`ConversorInteractor.swift`) [cite: 5].
    * `Presenter/`: Atua como mediador entre a View e o Interactor (`ConversorPresenter.swift`) [cite: 5].
    * `View/`: Contém a interface do usuário e controladores (`ConversorView.swift`, `ConversorViewController.swift`) [cite: 5].
    * `Router/`: Gerencia a navegação a partir deste módulo (`ConversorRouter.swift`) [cite: 5].
    * `Protocols/`: Define os protocolos (interfaces) para a comunicação entre as camadas VIPER (`ConversorProtocols.swift`) [cite: 5].

* **Módulo Histórico:** Responsável por exibir o registro de conversões realizadas [cite: 5].
    * Segue a mesma estrutura VIPER: `Entity`, `Interactor`, `Presenter`, `View` (incluindo `Historico.storyboard`), `Router` e `Protocols` [cite: 5].

### Outros Componentes
* `Assets.xcassets/`: Contém os recursos visuais do aplicativo, como ícones (`AppIcon.appiconset`) e cores personalizadas (`AccentColor.colorset`) [cite: 5].
* `Base.lproj/`: Contém os arquivos de interface primários (`Main.storyboard`, `LaunchScreen.storyboard`) [cite: 5].
* `Currency-Converter-C10Tests/` e `Currency-Converter-C10UITests/`: Diretórios destinados a testes unitários e testes de interface (UI Tests) [cite: 5].

## 4. Funcionalidades do Sistema
* **Conversão de Moedas:** A tela principal permite ao usuário inserir valores e obter a conversão com base em taxas de câmbio (Módulo `Conversor`) [cite: 5].
* **Histórico de Conversões:** Uma tela dedicada para visualizar o registro das operações anteriores realizadas pelo usuário (Módulo `Historico`) [cite: 5].

## 5. Como Utilizar a Aplicação
Para executar o sistema em um ambiente de desenvolvimento local, siga as instruções abaixo:
    
### 5.1. Pré-requisitos
* Computador macOS.
* Xcode instalado (versão compatível com a versão do Swift utilizada no projeto).

### 5.2. Execução
1. Clone o repositório do projeto.
2. Navegue até o diretório do projeto e abra o arquivo `Currency-Converter-C10.xcworkspace` (ou `.xcodeproj` se não houver dependências do CocoaPods configuradas externamente) no Xcode [cite: 5].
3. Selecione um simulador iOS (ex: iPhone 14 Pro) ou conecte um dispositivo físico.
4. Pressione o botão **Run** (Play) no Xcode ou use o atalho `Cmd + R` para compilar e executar o aplicativo.
