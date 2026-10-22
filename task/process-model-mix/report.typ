#import "@local/brazilian-computer-society:0.1.0" as sbc

#show: sbc.brazilian-computing-society-article.with(
	title: "Ciclo Composto de Desenvolvimento para um Ambiente de Usuário Baseado em Linux",
	authors: (
        (
            name: "Mateus C. Barreto",
            affiliation: "Instituto de Ciências Exatas e Naturais - Universidade Federal do Pará",
            email: "mateus.cezario.barreto@gmail.com",
        ),
	),
	resumo: "Esse trabalho traz um experimento de mistura de ciclos de desenvolvimento (sequencial, prototipagem, Rapid Application Development, evolucionário, incremental e espiral) para a criação e manutenção de um ambiente de usuário baseado em Linux."
)

= Introdução


Os modelos de desenvolvimento de software sequencial, prototipagem, Rapid Application Development (RAD), evolucionário, incremental e espiral expõem ciclos abstraídos feitos para se encaixar em várias situações, uns eventualmente mais ou menos adequados que outros, a depender do contexto. Tendo isso em vista, esse trabalho apresenta um modelo composto a partir destes outros, feito para o caso concreto hipotético de desenvolvimento de um ambiente de usuário baseado em Linux.

O modelo foi projetado tendo como casos motivadores o desenvolvimento do GNOME e do KDE, dois ambientes de usuário populares para Linux. O grande porte de ambos os projetos ilustram bem a complexidade desse tipo de software, muito por conta da amplitude do escopo, que precisa abranger necessidades básicas do usuário com uma suíte de aplicações integradas por meio de bibliotecas comuns de desenvolvimento. Essa abrangência naturalmente difusa não se encaixa exatamente em nenhum dos modelos de ciclo de desenvolvimento citados, em particular. Por isso, ao invés de buscar um único modelo para aplicar a todo o escopo, é mais proveitosa uma composição para esse caso, extraindo características distintas desses modelos para cada etapa do desenvolvimento.

= Projeção

Prototipagem inicial para a interface gráfica, depois modelo RAD para desenvolvimento da primeira versão das bibliotecas de sistema. O desenvolvimento de cada contexto dentro API da biblioteca de sistema (interface gráfica, persistência, preferências, comunicação interprocesso e assim por diante) segue seu próprio fluxo sequencial de implementação de acordo com a visão geral estabelecida após a fase de prototipação.

Com a primeira versão estável da biblioteca de sistema disponível, o desenvolvimento dos programas começa seguindo o modelo incremental. Os requisitos das aplicações são escolhidos para atender, primeiramente, o básico do que outras alternativas já atendem. Depois, o desenvolvimento das aplicações entra no modelo incremental para implementar funções mais complexas gradualmente.

Ao passo que cada aplicação do sistema atinge maturidade funcional, o desenvolvimento passa para o modelo espiral. Depois da primeira versão, o desenvolvimento da biblioteca gráfica de sistema passa para o modelo evolucionário, recebendo feedback dos usuários e melhorando constantemente ao longo de lançamentos intermediários, e eventualmente versões estáveis. Já as aplicações do sistema que forem atingindo maturidade suficiente saem do modelo incremental para o modelo espiral, com as espirais sincronizadas com as versões estáveis do sistema: assim que uma nova versão estável do sistema é lançada, o código da aplicação é readequado à nova API preservando as funções existentes, depois novas funções podem ser adicionadas já adequadas à nova interface, e , por fim, o desenvolvimento entra em modo de manutenção, com correção de bugs, até que a estrutura do ambiente seja novamente atualizada e o processo reinicie.

#figure(
	caption: [Modelo de desenvolvimento composto.],
	image("fluxogram.svg"),
)

