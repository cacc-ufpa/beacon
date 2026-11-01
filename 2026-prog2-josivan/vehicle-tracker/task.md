## Sistema de rastreamento de veículos

**Professor:** Josivan Reis.

**Disciplina:** Programação II.

**Ano:** 2026.

Requisitos:

 - Rastreador específico ou usando um smartphone.

 - Latitude, longitude, velocidade, nível de bateria, tempo (data e hora).

 - Plataforma (web) para cadastrar e gerenciar veículos.

 - Seleção de veículo para monitorar.

 - Medição de rota total e estimativa de energia e de custo.

 - Histórico de estatísticas e plotagem.

 - Visualização no mapa.

 - Cadastro de perímetro e rotas esperadas. Não precisa ser tão preciso, com rotas exatas, pode ser com raio circular ou retangular.

 - Alertas (registrados e contados) de velocidade e desvio de rota baseado em discrepância em relação ao estimado.

 - Operações CRUD para perímetros (rotas) disponível funcionários.

 - Perfis: proprietário (acessa apenas seu veículo), funcionário (acessa qualquer veículo) e admin (acessa tudo e gerencia funcionários e proprietários). Usuários podem sofrer operações CRUD assim como os veículos. Dados: nome, endereço, data de nascimento, informações do rastreador e do veículo (placa, modelo, marca, ano, cor, nº do chassi, renavam, tipo de veículo), etc.

 - Alteração de proprietário por um funcionário.

 - Veículo tem que estar associado a um proprietário e a um rastreador para estar regularmente cadastrado.

 - Status de movimentação e de sinal.

 - Registro de falha de sinal no histórico.

 - Não precisa recarregar a página pra atualizar posição (algum mecanismo on-promises em javascript).

 - Admin ou funcionário pode monitorar múltiplos veículos.

 - Nome e data de última leitura e status aparecendo em cima do pin do veículo e uma aba lateral de informação mais detalhada.

 - Economia de energia e dados: sistema para de salvar updates se o veículo passar um tempo parada.

 - Kilômetros rodados por dia no balanço mensal.

 - Opções de exportação (pdf, csv, json, png).

 - Sistema de log pra maior abrangência de operações possível (nome do usuário, ação realizada e horário).

 - Exemplo: sisgemoe.ceamazon.com.br