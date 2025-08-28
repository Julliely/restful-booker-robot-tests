# Testes Automatizados da API Restful-Booker com Robot Framework

Este projeto contém **testes automatizados de API** para a [API Restful-Booker](https://restful-booker.herokuapp.com/apidoc/index.html), desenvolvidos com **Robot Framework** e a biblioteca **RequestsLibrary**.

---

## 📂 Estrutura do projeto
```
restful-booker-tests/
├── resources/
│ └── keywords.resource # Keywords reutilizáveis (sessão, auth, CRUD)
├── tests/
│ └── booking_tests.robot # Casos de teste principais
├── .gitignore
└── README.md
```


## 🚀 Pré-requisitos

- Python 3.12+  
- Robot Framework  
- RequestsLibrary  

Instalar dependências:

```bash
pip install robotframework
pip install robotframework-requests
