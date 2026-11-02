# Projeto Linux: Backup Automatizado

## Sobre o projeto

Esse projeto foi desenvolvido como parte dos meus estudos de Linux com foco em Administração de Banco de Dados.

O objetivo é automatizar a criação de backups compactados, registrar as operações em logs, remover backups antigos e agendar a execução diária utilizando o cron.

## Tecnologias e ferramentas

- Linux Mint
- Bash Script
- tar e gzip
- find
- Cron
- Terminal Linux

## Estrutura do projeto

- **Script:** `backup.sh`
- **Origem dos arquivos:** `/home/banco/dados`
- **Destino dos backups:** `/backup/backup_diario`
- **Log das operações:** `/var/log/backup/backup_diario.log`
- **Log de saída do cron:** `/var/log/backup/cron.log`

## Funcionalidades

- Criação de backups compactados no formato `.tar.gz`.
- Identificação dos arquivos de backup por data e horário.
- Verificação da existência do diretório de origem.
- Registro de sucessos e falhas em arquivo de log.
- Remoção de backups com mais de sete dias, conforme a regra `find -mtime +7`.
- Restauração dos arquivos em outro diretório.
- Agendamento automático diário às 02:00 por meio do cron.

## Como executar

1. Clone ou copie o projeto para o computador Linux.
2. Confira os caminhos de origem, destino e log no script.
3. Dê permissão de execução:

   ```bash
   chmod +x backup.sh
   ```

4. Execute o script:

   ```bash
   ./backup.sh
   ```

5. Confira os backups gerados:

   ```bash
   ls -lh /backup/backup_diario/
   ```

6. Confira os registros:

   ```bash
   tail -n 15 /var/log/backup/backup_diario.log
   ```

## Agendamento com Cron

Para executar o backup diariamente às 02:00, edite o agendador:

```bash
crontab -e
```

Adicione a linha:

```cron
0 2 * * * /home/ricardo/backup.sh >> /var/log/backup/cron.log 2>&1
```

Confira o agendamento:

```bash
crontab -l
```

## Testes realizados

- Execução manual do script e verificação do código de saída.
- Verificação dos arquivos `.tar.gz` gerados.
- Inspeção do conteúdo dos arquivos de backup.
- Simulação de diretório de origem inexistente para testar o tratamento de erros.
- Teste da política de remoção de backups antigos.
- Restauração em diretório separado e comparação com os arquivos originais.
- Verificação do serviço cron e teste de execução automática a cada minuto.
- Configuração final do cron para execução diária às 02:00.

## Aprendizados

Durante o desenvolvimento, pratiquei comandos Linux, permissões de arquivos e diretórios, criação e execução de scripts Bash, \
compactação e extração de arquivos, tratamento de erros, logs, limpeza automatizada e agendamento de tarefas com cron.

## Objetivo profissional

Este projeto faz parte do meu aprendizado prático em Linux e Administração de Banco de Dados, com foco na automação de tarefas e nos fundamentos de backup e recuperação.
