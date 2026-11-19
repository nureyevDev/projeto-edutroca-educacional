# EduTroca

Aplicativo **Flutter** para compartilhamento e venda de materiais estudantis e fardamento a baixo custo.

> **Status:** em fase inicial. O repositório contém a estrutura base do projeto (Android, iOS e tema Material). As funcionalidades descritas abaixo ainda serão desenvolvidas.

## Sobre o projeto

O **EduTroca** é um aplicativo para **compartilhamento e venda de materiais estudantis a baixo custo**. A ideia é facilitar o acesso de estudantes e famílias a itens escolares por preços acessíveis, dando uma segunda vida a materiais que seriam descartados ou ficariam parados.

### Itens previstos

- Materiais escolares e acadêmicos (livros, cadernos, apostilas, etc.)
- Fardamento
- Outros itens de uso estudantil

### Objetivos

- Reduzir o custo da vida escolar e universitária
- Incentivar o reaproveitamento e o consumo consciente
- Aproximar estudantes e famílias que querem trocar, doar ou vender materiais

Este repositório reúne o código-fonte do aplicativo, desenvolvido com Flutter e Dart. Hoje ele roda a partir de uma tela inicial de exemplo (contador) gerada pelo template do Flutter, usada como ponto de partida.

## Tecnologias

- [Flutter](https://flutter.dev/) / [Dart](https://dart.dev/) (SDK `^3.14.0`)
- `material_ui` — componentes Material
- `cupertino_icons` — ícones no estilo iOS
- `flutter_lints` — regras de análise estática
- Plataformas configuradas: Android e iOS

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) compatível com Dart `^3.14.0`
- Android Studio (Android SDK) e/ou Xcode (apenas em macOS, para iOS)
- Um emulador, simulador ou dispositivo físico

Verifique o ambiente com:

```bash
flutter doctor
```

## Como executar

```bash
# 1. Clonar o repositório
git clone https://github.com/nureyevDev/projeto-edutroca-educacional.git
cd projeto-edutroca-educacional

# 2. Instalar as dependências
flutter pub get

# 3. Executar o app (com um dispositivo/emulador conectado)
flutter run
```

## Testes e análise de código

```bash
# Testes de widget
flutter test

# Análise estática (regras em analysis_options.yaml)
flutter analyze
```

## Estrutura do projeto

```
.
├── android/                 # Projeto nativo Android
├── ios/                     # Projeto nativo iOS
├── assets/
│   └── logo_edutroca.png    # Logo do app (declarada no pubspec.yaml)
├── lib/
│   └── main.dart            # Ponto de entrada do app
├── test/
│   └── widget_test.dart     # Teste de widget
├── analysis_options.yaml    # Regras de lint
└── pubspec.yaml             # Dependências e configuração do Flutter
```

## Próximos passos

- [ ] Detalhar as funcionalidades (cadastro de anúncios, busca por categoria, contato entre usuários, etc.)
- [ ] Substituir a tela de exemplo (contador) pelas telas do EduTroca
- [ ] Atualizar o título e o tema do app
- [ ] Adicionar capturas de tela a este README

## Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua alteração: `git checkout -b feat/minha-alteracao`
3. Faça o commit: `git commit -m "feat: descrição da alteração"`
4. Envie para o seu fork: `git push origin feat/minha-alteracao`
5. Abra um Pull Request

## Licença

Este repositório ainda não define uma licença. Adicione um arquivo `LICENSE` para especificar os termos de uso.