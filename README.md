# MySQL EasySupport

![MySQL EasySupport](mysqleasysupport.png)

`MySQL-EasySupport.bat` é um script em lote para Windows desenvolvido com o objetivo de facilitar a coleta de informações e suporte técnico em servidores MySQL e MariaDB. Ele automatiza tarefas comuns de diagnóstico e coleta de dados, reduzindo o tempo necessário para suporte e análise de problemas.

## Funcionalidades

O script executa uma série de comandos para coletar dados essenciais sobre o ambiente MySQL/MariaDB, sistema operacional e performance. As principais funcionalidades incluem:

- **Detecção automática da instalação do MySQL/MariaDB**
  - Localiza o executável `mysql.exe` e `mysqld.exe` em diretórios padrão.
  - Verifica a versão instalada.

- **Coleta de dados do sistema**
  - Nome do computador, usuário atual e data/hora.
  - Informações de rede (IP, nome do host).
  - Informações do sistema operacional (via `systeminfo`).
  - Espaço em disco (via `wmic logicaldisk`).

- **Coleta de dados do MySQL**
  - Versão do servidor.
  - Informações de status (`SHOW STATUS`).
  - Variáveis do sistema (`SHOW VARIABLES`).
  - Informações de processos em execução (`SHOW PROCESSLIST`).
  - Tabelas com mais linhas (`information_schema`).
  - Verificação da engine InnoDB e tamanho do buffer pool.

- **Exportação de dados**
  - Todos os dados coletados são gravados em um arquivo de log com timestamp.
  - Possibilidade de exportar dados adicionais via `mysqldump` (caso configurado).

- **Execução assistida**
  - O script solicita que o usuário informe:
    - Caminho do executável MySQL (se não encontrado automaticamente).
    - Credenciais de acesso ao banco (usuário e senha).
    - Nome do banco de dados a ser diagnosticado.

## Requisitos

- Sistema Operacional: Windows 7 ou superior.
- MySQL ou MariaDB instalado.
- Acesso ao prompt de comando com permissões de administrador (recomendado).
- Acesso ao MySQL com um usuário que tenha permissões de leitura nas tabelas de sistema.

## Como usar

1. Clique com o botão direito sobre o arquivo `MySQL-EasySupport.bat` e selecione "Executar como administrador".
2. Siga as instruções no terminal:
   - Informe o caminho do executável `mysql.exe` se solicitado.
   - Digite o usuário e senha para conectar ao banco.
   - Informe o nome do banco de dados a ser analisado.
3. O script irá executar os comandos de coleta e gerar um arquivo de log no mesmo diretório do script, com nome no formato `MySQL_EasySupport_YYYYMMDD_HHMMSS.txt`.

## Observações

- O script não realiza modificações no banco de dados.
- As credenciais são solicitadas apenas em tempo de execução e não são armazenadas.
- Pode ser adaptado para uso com múltiplos bancos ou como ferramenta de suporte interno.

## Licença

Este script é distribuído sem garantia, podendo ser modificado conforme necessário para uso interno.
