# Gen Flutter App

Este é um aplicativo Flutter que utiliza a arquitetura Clean Architecture, princípios do SOLID, e gerenciamento de estado com Provider.

## Pré-requisitos

Certifique-se de ter o Flutter instalado. Se não tiver, você pode seguir as instruções de instalação no [site oficial do Flutter](https://flutter.dev/docs/get-started/install).

## Download do APK

Baixe a versão mais recente do aplicativo [aqui](https://drive.google.com/drive/folders/1z-CHnPpgvCTg8gXhZMLZoIuAyy3TZVw6).

## Configuração do Projeto

1. Clone este repositório para o seu ambiente local.

    ```bash
    git clone https://github.com/FonteneleMichel/gen.git
    ```

2. Navegue até o diretório do projeto.

    ```bash
    cd gen
    ```

3. Execute o aplicativo.

    ```bash
    flutter run
    ```

## Arquitetura

O projeto segue a arquitetura Clean Architecture, que é dividida nas camadas:

- **Domain:** Contém a lógica de negócios do aplicativo, incluindo as entidades e casos de uso.
- **Data:** Responsável pela implementação dos repositórios e fontes de dados.
- **Presenter:** Lida com a camada de apresentação, conectando a lógica de negócios com a interface do usuário.

## Gerenciamento de Estado

O estado do aplicativo é gerenciado usando o Provider para injetar dependências e atualizar a interface do usuário conforme necessário.

## Bibliotecas Externas

- **http:** Usada para fazer requisições HTTP para a API.
- **provider:** Gerenciamento de estado simples e eficaz para Flutter.

## Estrutura de Pastas

A estrutura de pastas do projeto segue a convenção da Clean Architecture, com pastas separadas para Domain, Data e Presenter.

