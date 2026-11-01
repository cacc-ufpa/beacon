# Mini shell.

## Flávia Monteiro - Laboratório de Sistemas Operacionais - 2026

Nesta atividade, cada aluno deverá finalizar e ampliar o projeto do Mini-Shell UNIX, iniciado em sala de aula. O trabalho é individual e deverá demonstrar tanto a implementação das funcionalidades solicitadas quanto a compreensão dos conceitos de Sistemas Operacionais envolvidos no funcionamento do shell.

O mini-shell deverá ser desenvolvido em linguagem C e executado em ambiente Linux/UNIX. Além da implementação, o aluno deverá realizar testes, registrar evidências por meio de prints e produzir um relatório explicando o funcionamento das funcionalidades desenvolvidas, os erros encontrados e os comportamentos observados durante a execução do programa.

A entrega deverá ser feita em formato PDF. Cada aluno deverá organizar o documento da forma que considerar mais adequada para apresentar o resultado do seu trabalho, desde que o relatório mostre com clareza:

 - As funcionalidades implementadas.

 - Os testes realizados.

 - Os prints das execuções.

 - Os erros ou comportamentos inesperados observados.

 - As explicações técnicas relacionadas aos conceitos de Sistemas Operacionais.

 - As correções ou decisões adotadas durante o desenvolvimento.

O relatório não precisa seguir um modelo único obrigatório. O aluno deverá preparar uma estrutura que melhor apresente o que foi desenvolvido, explicando de forma organizada o código, os testes e os resultados obtidos.

Além do relatório em PDF, o aluno deverá entregar o código-fonte do mini-shell, devidamente identificado e organizado. Os dois arquivos deverão estar comprimidos em formato zip.

## Histórico de comandos com history

**O que implementar:** o armazenamento dos últimos comandos digitados no mini-shell e criar o comando interno history para exibir esse histórico.

**O que testar com prints:**

 - Execução de vários comandos comuns.

 - Exibição do histórico.

 - Verificação da ordem dos comandos.

 - Verificação do limite máximo de comandos armazenados.

 - Verificação se comandos internos, como history, entram ou não no histórico, conforme decisão da equipe.

**Perguntas para responder no relatório:**

 - Como o histórico foi armazenado no programa?

 - Por que foi necessário usar vetor ou matriz de caracteres?

 - O que acontece quando o número de comandos ultrapassa o limite definido?

 - O histórico implementado funciona como um buffer circular? Explique.

 - O comando history é um comando interno ou externo? Justifique.

## Reexecução do último comando com !!

**O que implementar:** o comando !!, permitindo que o mini-shell recupere e execute novamente o último comando armazenado no histórico.

**O que testar com prints:**

 - Execução de um comando comum.

 - Execução de !!.

 - Verificação se o comando anterior foi repetido corretamente.

 - Execução de !! quando ainda não existe comando no histórico.

 - Verificação se o comando repetido entra novamente no histórico.

**Perguntas para responder no relatório:**
 
 - Como o programa identifica qual foi o último comando digitado?

 - O que deve acontecer se o usuário digitar !! sem haver comandos anteriores?

 - O comando !! deve ser armazenado no histórico ou o comando recuperado deve ser armazenado? Justifique a decisão.

 - Qual é a relação dessa funcionalidade com a memória de comandos de um shell real?

### Reexecução de comando específico com !N

**O que implementar:** o comando !N, em que N representa o número de um comando armazenado no histórico.

**O que testar com prints:**

 - Execução de vários comandos.

 - Exibição do histórico.

 - Execução de um comando existente usando !N.

 - Tentativa de executar um número inexistente.

 - Tentativa de executar um número que já saiu do limite do histórico.

 - Teste com entrada inválida, como !abc.

**Perguntas para responder no relatório:**

 - Como o programa localiza um comando pelo número informado?

 - Como o programa verifica se o número está dentro da faixa válida do histórico?

 - O que acontece quando o usuário informa um número inexistente?

 - Qual problema pode ocorrer ao usar atoi() sem validação?

 - Como a equipe tratou entradas inválidas após o símbolo !?

## Tratamento de comandos inválidos

**O que implementar:** melhor tratamento de erro quando o usuário digitar um comando inexistente ou inválido.

**O que testar com prints:**

 - Digitação de comando inexistente.

 - Digitação de comando com argumento inválido.

 - Verificação da mensagem de erro exibida.

 - Verificação se o shell continua funcionando após o erro.

 - Verificação se o erro ocorre no processo-pai ou no processo-filho.

**Perguntas para responder no relatório:**

 - O que acontece quando execvp() não consegue executar um comando?

 - Por que é importante exibir uma mensagem de erro clara?

 - Em qual processo ocorre a falha do execvp(): pai ou filho?

 - Por que o processo-filho deve ser encerrado após a falha?

 - O que pode acontecer se o filho não for encerrado corretamente?

## Encerramento correto do processo-filho após falha

**O que implementar:** garantia de que, quando execvp() falhar, o processo-filho seja encerrado corretamente usando exit().

**O que testar com prints:**

 - Execução de um comando inexistente com o tratamento correto.

 - Teste temporário removendo o exit() após a falha do execvp().

 - Observação de saídas duplicadas, múltiplos prompts ou travamento aparente.

 - Correção do código e novo teste.

 - Comparação entre o comportamento incorreto e o comportamento corrigido.

**Perguntas para responder no relatório:**

 - Por que o fork() faz com que pai e filho continuem a execução a partir do mesmo ponto do código?

 - O que deveria acontecer com o filho após chamar execvp()?

 - O que acontece quando execvp() falha e o filho não é encerrado?

 - Por que podem aparecer prompts repetidos ou comportamento estranho no terminal?

 - Como o uso de exit() corrige esse problema?

 - Qual é a relação dessa falha com criação indevida de processos

## Exibição do PID do processo-filho

**O que implementar:** exibição do PID do processo-filho sempre que um comando for executado pelo mini-shell.

**O que testar com prints:**

 - Execução de comando simples.

 - Execução de comando em background.

 - Verificação do PID exibido pelo mini-shell.

 - Uso de comandos do sistema para observar processos ativos.

 - Comparação entre processo-pai e processo-filho.

**Perguntas para responder no relatório:**

 - O que é um PID?

 - Qual é a diferença entre o PID do shell e o PID do processo-filho?

 - Por que cada processo precisa ter um identificador?

 - Como o PID ajuda a acompanhar processos em execução?

 - O que acontece com o PID de um processo após ele terminar?

## Comandos internos do mini-shell

**O que implementar:** comandos internos do mini-shell, como exit, history, ajuda e, opcionalmente, cd.

**O que testar com prints:**

 - Execução do comando exit.

 - Execução do comando history.

 - Execução do comando ajuda.

 - Teste de comandos internos sem criação de processo-filho.

 - Teste opcional do comando cd.

 - Comparação entre comandos internos e comandos externos.

**Perguntas para responder no relatório:**

 - O que diferencia um comando interno de um comando externo?

 - Por que exit não deve ser executado com execvp()?

 - Por que history precisa ser tratado pelo próprio mini-shell?

 - Por que o comando cd, se implementado, precisa alterar o estado do processo-pai?

 - O que aconteceria se cd fosse executado apenas em um processo-filho?

 - Como o mini-shell decide se deve tratar um comando internamente ou criar um processo-filho?

