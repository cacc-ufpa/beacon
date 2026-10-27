#import "@local/brazilian-computer-society:0.1.0" as sbc

#show: sbc.brazilian-computing-society-article.with(
	title: "Máquinas de Turing",
	authors: (
        (
            name: "Mateus C. Barreto",
            affiliation: "Instituto de Ciências Exatas e Naturais - Universidade Federal do Pará",
            email: "mateus.cezario.barreto@gmail.com",
        ),
	),
	resumo: "Relatório técnico de experimentos de construção de Máquinas de Turing simples usando o JFLAP."
)

= Introdução

Esse relatório técnico contém 5 Máquinas de Turing construidas no JFLAP para realizar algumas tarefas básicas, diante de cadeias de entradas construídas sobre conjuntos pequenos de símbolos. As tarefas basicamente consistem em: deslocar a cadeia uma posição à esquerda, contar aparições de um símbolo, decodificar símbolos, classificar um número binário e cancelar símbolos de par em par nos extremos de uma sequência.

= Experimentos

== Deslocamento à esquerda

O experimento de deslocamento à esquerda consiste em mover cada caractere de uma cadeia sobre os símbolos 0 e 1 para a posição à esquerda de sua posição original, com o caractere na primeira posição sendo excluído.

#figure(
	caption: [Resultados da Máquina de Turing que realiza deslocamento dos símbolos à esquerda (@left-shift).],
	table(
		columns: (auto, auto),
		table.header("Entrada", "Saída"),
		"0", $epsilon$,
		"1", $epsilon$,
		"01", "1",
		"10", "0",
		"0101", "101",
		"1010", "010",
	),
) <left-shift-results>

A solução (@left-shift) começa movendo o cursor para o final da cadeia, para então voltar ao começo empurrando os caracteres ao longo do percurso. A ideia de empurrar um caractere segue o fluxo de: descarregar o caractere que estava na posição mais à direita na posição atual do cursor, mas armazenando o caractere que já estava naquela posição e está sendo sobrescrito por meio de um estado dedicado, para então seguir à esquerda e repetir o processo.

#figure(
	caption: [Máquina de Turing que realiza deslocamento dos símbolos à esquerda.],
	image("1-left-shift.png"),
) <left-shift>

Existe um primeiro estado de carga e descarga que carrega o primeiro caractere branco à direita e o descarrega no que era a última posição da cadeia. Como o primeiro caractere é excluído, a cadeia naturalmente diminui, e por isso um caractere branco é escrito no final. Mas o caractere que já estava naquela posição é mantido por meio de um outro estado, e segue o fluxo de carga e descarga.

Como o conjunto de caracteres tem dois deles, existem mais dois estados de carga e descarga, um para armazenar cada caractere sendo carregado à esquerda.

== Contagem

Dada uma cadeia de entrada sobre os caracteres "a" e "b", esta Máquina de Turing devolve uma cadeia sobre o caractere 1, com um caractere 1 para cada caractere "a" que estava presente na cadeia de entrada. Ou seja, a máquina conta as aparições de "a" na cadeia de entrada.

#figure(
	caption: [Resultados da Máquina de Turing que conta aparições de "a" com repetições de "1" e remove símbolos "b". (@count-a).],
	table(
		columns: (auto, auto),
		table.header("Entrada", "Saída"),
		$epsilon$, $epsilon$,
		"bbb", $epsilon$,
		"abb", "1",
		"bba", "1",
		"aba", "11",
	),
) <count-a-results>

A implementação (@count-a) trata o caractere "b" quase como se fosse um caractere branco, isso porque esse caractere não é significativo para a contagem em si. O cabeçote de leitura se move à direita ignorando qualquer caractere "b", até encontrar um caractere "a". Assim que o encontra, substitui esse "a" por "b", para que seja ignorado, e então retorna à esquerda ignorando novamente a sequência de caracteres "b", se houver. Só ao voltar à esquerda ignorando os caracteres "b", o caractere 1 da contagem é registrado, sobrescrevendo o "b" mais à esquerda.

Esse ciclo se repete até que não restem mais caracteres "a", e o cabeçote de leitura alcançe o caractere branco à direita. A partir daí, o cabeçote retorna à esquerda, limpando qualquer "b" que tenha restado.

#figure(
	image("2-count-a.png"),
	caption: [Máquina de Turing que conta aparições de "a" com repetições de "1" e remove símbolos "b".],
) <count-a>

É interessante notar que a limpeza dos caracteres "b" não deixa buracos. Isso porque, quando um caractere "a" é limpo à direita, o caractere 1 é sempre escrito ou na primeira posição ou empilhado após a sequência de caracteres 1 que já está compactada. Dessa maneira, os caracteres 1 nunca estarão fragmentados.

== Decodificação

Decodificar uma sequência é uma tarefa de substituição. No melhor dos casos, existe um mapeamento direto de 1 para 1, de forma que a substituição pode ser feita com reescritas diretas, do começo ao fim.

Mas o mapemento de codificação de caracteres nesse experimento (@decoder-map) não é de 1 para 1. O caractere "a" mapeia para um caractere binário, mas os caracteres "b" e "c" mapeiam para dois caracteres binários, o que significa que a decodificação não pode ser escrita diretamente sobre o caractere codificado.

#figure(
	caption: [Mapa de decodificação de {a, b, c} para binário.],
	table(
		columns: (auto, auto),
		table.header("Entrada", "Saída"),
		"a", "0",
		"b", "10",
		"c", "11",
	),
) <decoder-map>

O papel da Máquina de Turing desse experimento é aplicar o mapeamento para decodificar uma sequência construída sobre o alfabeto de entrada para obter uma sequência de saída, possivelmente maior (@decoder-results).

#figure(
	caption: [Resultados da decodificação de {a, b, c} para binário.],
	table(
		columns: (auto, auto),
		table.header("Entrada", "Saída"),
		$epsilon$, $epsilon$,
		"abc", "01011",
		"cba", "11100",
		"aacbbac", "00111010011",
	),
) <decoder-results>

Nesse caso, existe mais de uma forma de escrever a cadeia decodificada. Uma delas, e que é a utilizada aqui (@decoder), é ler e limpar os caracteres codificados da esquerda para a direita, e despejar a respectiva decodificação no lugar mais próximo que esteja preenchido por um caractere branco.

#figure(
	caption: [Máquina de Turing que decodifica cadeias sobre {a, b, c} para binário.],
	image("3-decode.png"),
) <decoder>

== Classificação

Este experimento se passa num contexto de classificação de notas por meio da atribuição de conceitos de acordo com o intervalo no qual aquela nota se encaixa (@classification-table).

#figure(
	caption: [Classificação.],
	table(
		columns: (auto, auto, auto, auto),
		table.header("Intervalo decimal", "Binários", "Abreviação", "Classe"),
		"9 à 10", "1001 e 1010", "EXC", "Excelente",
		"7 à 8", "0111 e 1000", "BOM", "Bom",
		"5 à 7", "0101 e 0110", "REG", "Regular",
		"0 à 4", "0000 à 0100", "INS", "Insuficiente",
	),
) <classification-table>

A função da máquina é substituir a sequência binária representando a nota pela abreviação da classe onde essa nota se enquadra. Nesse caso, apenas notas inteiras são consideradas. Frações são disconsideradas.

Como o conjunto de entrada é discreto e não tão extenso (11 possibilidades apenas), a solução (@classification-machine) é uma árvore de decisão, que afunila a escolha de classe conforme os caracteres binários são lidos, na direção do mais significativo ao menos significativo.

#figure(
	caption: [Máquina de Turing que calcula o conceito a partir de uma pontuação de 0 à 10.],
	image("4-score.png"),
) <classification-machine>

A árvore de decisão (@classification-machine) tem altura 4, devido aos 4 bits considerados na representação das notas de 0 à 10. O restante das transições e estados serve para substituir a sequência de entrada pela abreviação da respectiva classe.

== Cancelamento

Neste último experimento, a sequência de entrada consiste em duas sequências de caracteres 1 separadas por um caractere 0. A função da máquina é cancelar um caractere 1 da sequência à esquerda para cada caractere 1 presente na sequência à direita.

No caso de haverem mais caracteres 1 à esquerda que à direita, apenas aqueles não cancelados devem restar ao final. O próprio 0 deve ser limpo ao fim.

Caso a sequência à direita do 0 seja maior, o resultado deve ser uma cadeia vazia.

#figure(
	caption: [Resultados do cancelamento de repetições de "1" separadaras por "0".],
	table(
		columns: (auto, auto),
		table.header("Entrada", "Saída"),
		$epsilon$, $epsilon$,
		"0", $epsilon$,
		"101", $epsilon$,
		"11101", "11",
		"10111", $epsilon$,
	),
) <cancellation-results>

A solução (@cancellation-machine) é uma espécie de ping-pong de remoção de símbolos: o cabeçote de leitura remove um caractere "1" à direita, depois segue à direita para fazer o mesmo, e o ciclo reinicia, voltando à direita.

#figure(
	caption: [Máquina de Turing que cancela repetições de "1" separadaras por "0".],
	image("5-cancel.png"),
) <cancellation-machine>

A máquina (@cancellation-machine) para em dois casos:

 - Após remover um caractere 1 na direita, não há caractere 1 na esquerda para ser removido junto, então a máquina limpa tudo e para;
 - Após remover um par com sucesso (na direita depois na esquerda) não há mais caractere 1 na direita para reiniciar o ciclo, então a máquina remove o 0 que fica de resíduo na direita e para.

= Considerações finais

O JFLAP foi uma ferramenta extremamente útil durante todo o trabalho de experimentação, desde a etapa de prototipagem até a execução de testes. A visualização em grafos que o programa oferece para os autômatos ajuda muito na organização mental da lógica por trás, e isso é potencializado pela variedade de recursos gráficos nesse sentido: etiquetas para colocar descrições breves em estados, execução de teste passo a passo com coloração do estado atual, acompanhamento da fita em tempo real com posição do cabeçote realçada, entre outros.

Uma limitação é que a exportação para imagem suporta apenas formatos pixelados por padrão. A opção para exportar a máquina em formato vetorizável escalonável depende da instalação externa do Java, e nem sempre está disponível, o que prejudica a visualização para máquinas grandes, com muitos estados e transições, onde é necessário usar zoom. Dito isso, nenhum dos experimentos aqui registrados ficou extenso a esse ponto.
