# Currency Converter — documentação técnica

## 1. Visão geral

Aplicativo iOS em Swift/UIKit desenvolvido como estudo de arquitetura VIPER e do padrão Adapter. O projeto contém um módulo de conversão e um módulo de histórico, mas algumas partes ainda estão em estágio de protótipo.

## 2. Estado atual e limites conhecidos

### Conversão

O código atual **não consulta uma API de câmbio real**. Em `VIPER/Conversor/Interactor/ConversorInteractor.swift`, `API.criarMoeda(type:)` cria moedas com valores demonstrativos fixos (BRL = 1, USD = 5, EUR = 6), e `callAPI` apenas aguarda um pequeno intervalo antes de retornar esses objetos.

Esses números são exemplos para exercitar o fluxo entre as camadas, não cotações atuais nem dados apropriados para decisões financeiras. Uma futura integração real deve definir fonte, data/hora da cotação, direção da taxa, precisão e tratamento de falhas de rede.

### Histórico

O módulo `VIPER/Historico/` contém componentes de arquitetura, mas o fluxo ainda não representa um histórico persistido completo: `obterHistorico(dado:)` não tem implementação, `adaptarRegistro()` produz uma data vazia e não há evidência no código inspecionado de armazenamento durável das conversões.

### Testes

Os diretórios de testes unitários e de interface existem, mas `Currency_Converter_C10Tests.swift` ainda contém apenas o teste de exemplo. A existência desses diretórios não significa que a conversão e o histórico já tenham cobertura automatizada.

## 3. Tecnologias e arquitetura

- **Linguagem:** Swift.
- **Plataforma/UI:** iOS, UIKit e Storyboards.
- **Arquitetura:** VIPER — View, Interactor, Presenter, Entity e Router.
- **Padrões em estudo:** Adapter e Factory.

Estrutura do módulo principal:

- `Entity/`: modelos de dados, como `Moeda`.
- `Interactor/`: regras de conversão e preparação dos dados.
- `Presenter/`: mediação entre View e Interactor.
- `View/`: interface e controlador.
- `Router/`: navegação.
- `Protocols/`: contratos entre as camadas.

O módulo `Historico` possui estrutura semelhante, com implementação ainda incompleta conforme descrito acima.

## 4. Executar localmente

1. Use um Mac com uma versão compatível do Xcode.
2. Abra `Currency-Converter-C10.xcodeproj` (ou o workspace caso ele esteja presente e seja necessário).
3. Selecione um simulador iOS compatível.
4. Compile e execute o esquema do aplicativo.

Os testes precisam ser executados pelo Xcode ou por um ambiente macOS com os SDKs Apple adequados; eles não foram executados durante esta revisão.

## 5. Próximos passos

- Definir se o objetivo permanece demonstrar padrões arquiteturais com dados simulados ou se haverá integração com uma API real de câmbio.
- Criar testes para as conversões BRL/USD/EUR, entradas inválidas e precisão numérica.
- Definir e implementar o armazenamento do histórico e a data de cada registro.
- Atualizar o README novamente quando essas funcionalidades forem implementadas e validadas.
