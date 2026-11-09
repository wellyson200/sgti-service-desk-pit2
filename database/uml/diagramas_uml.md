# Modelagem UML Revisada — Sistema SGTI
**Aluno:** Wellyson Rodrigues de Sousa | **RGM:** 40356698

## Diagrama de Classes e Persistência (Padrão MVC)
```mermaid
classDiagram
    class Usuario {
        +int id_usuario
        +string nome
        +string email
    }
    class AtivoTI {
        +int id_ativo
        +string tag_patrimonio
        +string ip_rede_cabeada
    }
    class Chamado {
        +int id_chamado
        +string protocolo
        +string status
        +encerrar(solucao)
    }
    Usuario "1" --> "0..*" Chamado : abre/atende
    AtivoTI "1" --> "0..*" Chamado : vincula
