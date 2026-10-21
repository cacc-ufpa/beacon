# UFPA Computer Science Beacon

Repositório Git como um diário de estudo do **Curso de Ciência da Computação da UFPA**.

| Diretório | Descrição |
|-|-|
| [`log/`](log/readme.md) | Diário de aula. |
| [`task/`](task/readme.md) | Tarefas. |
| [`doc/`](about/readme.md) | Informações gerais. |
| [`awesome/`](awesome/readme.md) | Seleção de repositórios externos. |

## Funcionamento

As aulas são registradas diariamente em [`log/`](log/readme.md). Quando uma tarefa surge, ela é referenciada no diário e registrada em [`task/`](task/readme.md), em um subdiretório dedicado, cujo nome fica ao critério da criatividade. O conteúdo completo de uma tarefa não aparece no diário, sequer o seu nome identificador. No máximo, o diário contém a indicação de que uma tarefa foi passada naquele dia. O caminho onde a tarefa foi registrada deve ser consultado na tabela principal no arquivo [`task/readme.md`](task/readme.md), que associa o nome de uma tarefa aos contextos em que apareceu (disciplinas, professor e opcionalmente semestre).

Do outro lado, o aluno começa clonando o repositório central (esse, o beacon) e criando uma branch para si, com seu nick. Essa nova branch vai conter as soluções do aluno para as tarefas que vão surgindo no repositório central, na branch `beacon`.

Após a clonagem, é importante trocar a branch principal de `beacon` para a branch do aluno nas configurações do repositório.

Depois, o processo é repetitivo:

 1. Uma tarefa surge na branch `beacon` do repositório central.
 2. O aluno atualiza a branch `beacon` do seu repositório clonado.
 3. O aluno lê a tarefa e implementa a solução na branch pessoal.
 4. O aluno mescla a branch `beacon` em cima da pessoal.

## Formatos de anotação

Markdown, AsciiDoc e Typst são os formatos preferidos para anotação textual, cada um com seu caso de uso:

 - Markdown (extensão de arquivo `.md`) é simples, suficiente para anotações rápidas, suporta linguagem matemática com sintaxe TeX via extensão.
 - AsciiDoc (extensão de arquivo `.adoc`) tem mais recursos que o Markdown, suporta linguagem matemática em TeX ou Asciimath e pode ser extendido via Ruby.
 - Typst (extensão de arquivo `.typ`) é melhor para tipografia e geração de texto acadêmico digital paginado ou impresso, suporta linguagem matemática na própria sintaxe e também é uma linguagem de scripting.

## Diário

O diário de aulas é formado pelas anotações dentro de `log/`, as quais são organizadas por data, com nome no formato `YYYY-MM-DD`, seguido pela extensão do arquivo de anotação.

```md
# YYYY-MM-DD

## Disciplina - Nome Completo do Professor

Anotações
```

## Sumário

Sumários são anotações no formato de diário, mas com nome de arquivo sufixado com `-sum` (`YYYY-MM-DD-sum`). Elas server para resumir informações de vários dias anteriores que não foram registradas até então.

```md
# Sumário (YYYY-MM-DD)

## Disciplina - Nome Completo do Professor

Anotações de dias anteriores.
```

## Tarefa

Cada diretório de tarefa fica com um arquivo `task.md` dentro contendo o enunciado da tarefa e sua contextualização: professor, disciplina e data. O motivo disso ficar no `task.md` é que o `readme.md` é específico para explicar cada implementação de cada aluno.

```md
# Tarefa

*Em: Disciplina - Professor - Ano.*

Enunciado aqui.
```

Eventualmente, mais de uma tarefa com enunciados complementares, parecidos ou literalmente iguais podem (e vão) surgir. O ideal quando isso ocorre é unir esses enunciados. Se dois enunciados esperam a mesma solução, não tem razão para o mesmo aluno criar duas soluções com poucas diferenças ou tecnicamente iguais.

No caso em que as subtarefas se complementam e podem ser satisfeitas por uma mesma solução, eles ficam juntas no arquivo `task.md`, em seções diferentes. Nesse caso, os contextos que aparecem na lista geral são distribuídos entre as seções. Isso significa que a mesma subtarefa pode ter mais de um contexto de aparição. Esse tipo de junção aumenta o tamanho ou a complexidade da solução porque mais requisitos vão sendo empilhados, por isso deve ser usada na medida do razoável.

```md
# Tarefa

## Subtarefa 1

*Em: Professor - Disciplina - Ano.*

Enunciado aqui.

## Subtarefa 2

*Em: Professor - Disciplina - Ano.*

Enunciado aqui.
```

Se uma composição de subtarefas se tornar muito grande ou profunda para ficar em um arquivo só, elas podem aparecer cada uma em seu próprio arquivo, no formato `task-*.md`.

## Comentário

Tanto no diário quanto em enunciados de tarefa, o aluno que está documentando pode deixar um comentário, mas deve deixar claro que é um comentário e incluir o seu nome.

```md
> Meu comentário aqui.
>
> *-- Seruna*
```

## Commit

Cada alteração é registrada por um commit, com um título conciso de idealmente até 60 caracteres, contendo o local da mudança, se houver um específico, e uma breve descrição da mudança em si. O local da mudança é um dos diretórios principais, e, no caso de uma tarefa, o nome do subdiretório da tarefa em si. Exemplos:

```
awesome: add X from Someone
log: 2026-06-02
task/minishell: register
task/minishell: feat: add X and Y
```

---

> *Nos meus primeiros dois semestres eu não anotava nada e, bom, a falta de informação sempre virava uma bola de neve.*
>
> *Comecei a organizar as coisas melhor ao longo do terceiro semestre.*
>
> *As informações aqui estão longe de serem completas. Mas serve para mim. E é o que eu consigo deixar para talvez servir para alguém no futuro.*
>
> (❍ᴥ❍ʋ)
>
> *-- Seruna*


