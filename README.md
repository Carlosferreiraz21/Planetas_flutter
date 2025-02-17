# Gerenciador de Planetas - Flutter App

## 📌 Sobre o Projeto
Este é um aplicativo desenvolvido em **Flutter** que implementa um **sistema CRUD** (Create, Read, Update, Delete) para gerenciar informações de planetas. O sistema permite o cadastro, edição, visualização e exclusão de planetas, armazenando os dados localmente utilizando o banco de dados **SQLite**.

## 📱 Funcionalidades
✅ **Adicionar um novo planeta** com os seguintes campos:
- Nome do planeta (obrigatório)
- Distância do Sol (obrigatório, em UA - unidades astronômicas)
- Tamanho do planeta (obrigatório, em quilômetros)
- Apelido (opcional)

✅ **Visualizar a lista de planetas cadastrados** com:
- Nome
- Apelido (se disponível)

✅ **Exibir os detalhes de um planeta**, mostrando todas as informações cadastradas.

✅ **Editar um planeta existente**, permitindo a atualização dos dados.

✅ **Excluir um planeta**, com **confirmação antes da exclusão**.

✅ **Persistência de dados**, garantindo que os planetas permaneçam salvos mesmo após o fechamento do app.

## 🛠️ Tecnologias Utilizadas
- **Flutter** (Framework para desenvolvimento mobile)
- **Dart** (Linguagem de programação)
- **SQLite** (Banco de dados local)
- **Provider** (Gerenciamento de estado)

## 📥 Instalação e Execução
### **1️⃣ Clone este repositório**
```sh
 git clone https://github.com/seu-usuario/gerenciador-planetas.git
 cd gerenciador-planetas
```

### **2️⃣ Instale as dependências**
```sh
 flutter pub get
```

### **3️⃣ Execute o aplicativo**
```sh
 flutter run
```

📌 **Observação:** Certifique-se de ter um **emulador Android** ou um **dispositivo físico** conectado.

## 📦 Estrutura do Projeto
```
lib/
 ├── main.dart                 # Arquivo principal
 ├── models/
 │   ├── planet.dart            # Modelo de dados do planeta
 ├── db/
 │   ├── database_helper.dart   # Configuração do banco SQLite
 ├── screens/
 │   ├── home_screen.dart       # Tela inicial com lista de planetas
 │   ├── planet_form.dart       # Tela de cadastro/edição de planetas
 │   ├── planet_details.dart    # Tela de detalhes do planeta
```

## 🚀 Como Gerar o APK para Distribuição
Se quiser compartilhar o app sem publicá-lo na Play Store, gere um APK com o comando:
```sh
flutter build apk --release
```
O arquivo gerado estará em:
```
build/app/outputs/flutter-apk/app-release.apk
```

## 📜 Licença
Este projeto está sob a licença MIT. Sinta-se livre para modificá-lo e usá-lo como quiser. 😊

---
Desenvolvido por **Seu Nome** 🚀

