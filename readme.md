# UFPA Computer Science Beacon

Repositório Git como um diário de estudo do **Curso de Ciência da Computação da UFPA**.

| Diretório | Descrição |
|-|-|
| [`log/`](log/readme.md) | Registro de turmas. |
| [`task/`](task/readme.md) | Registro de tarefas. |
| [`doc/`](about/readme.md) | Informações gerais. |
| [`awesome/`](awesome/readme.md) | Seleção de repositórios de alunos. |

O aluno começa criando seu fork do repositório central e criando uma branch para si, com seu nick. Essa nova branch vai conter as soluções do aluno para as tarefas que vão surgindo no repositório central, na branch `beacon`.

A branch de soluções pode ser criada na interface web do Github antes da clonagem local, ou pode ser criada depois da clonagem, na máquina local, pela linha de comando.

```sh
# Repositório central: "https://github.com/ufpa-cacc/beacon"
# Repositório do aluno: "https://github.com/seruna-1/ufpa"
# Nick do aluno: seruna-1

# Clonagem do fork.
git clone "https://github.com/seruna-1/ufpa" ufpa/
cd ufpa/

# Criação da branch de soluções.
git switch -c seruna

# Empurrar para o repositório remoto.
git push -u origin seruna
```

Uma vez criada a branch de soluções, ela deve ser definida como branch padrão no fork, ao invés da branch `beacon`. Isso é feito no Github, na aba de configurações do repositório.

É importante que a branch `beacon` do fork fique livre de alterações do aluno, para que não ocorram conflitos quando as mudanças forem puxadas da branch `beacon` do repositório central para a branch `beacon` do repositório do aluno. As soluções do aluno devem ser adicionadas à branch de soluções, e a branch `beacon` deve periodicamente ser mesclada nela.

```sh
# Atualizar a branch `beacon` do fork.
git switch beacon
git pull

# Passar as atualizações de `beacon` para a branch de soluções.
git switch seruna
git merge beacon

# Solucionar.
git add task/some-task/solution.c task/some-task/solution.c
git commit -m "task/some-task: add solution."
```

O processo é repetitivo:

 1. Tarefas surgem na branch `beacon` do repositório central.
 1. O aluno puxa novidades da branch `beacon` do repositório central para a branch `beacon` do seu fork.
 1. O aluno mescla as novidades da branch `beacon` do seu fork na sua branch de soluções.
 1. O aluno adiciona suas soluções em sua branch de soluções.

**Via de regra, o aluno não deve contribuir suas próprias soluções ao repositório central.** As suas soluções são da tutela do próprio aluno, e devem permanecer no fork. O repositório central é feito para armazenar conteúdos de aula, enunciados de tarefas e informações auxiliares para motivar essas soluções.

Caso o aluno queira contribuir seus registros de aulas e de tarefas de volta ao repositório central, o aluno deve:

 1. Criar uma branch derivada de `beacon`, que não seja a branch de soluções.
 1. Adicionar informações de aulas ou de tarefas.
 1. Empurrar as adições ao seu fork.
 1. Criar uma pull request no repositório central.

## Identificação de turma

Cada turma é identificada por matéria, professor e ano. Adicionalmente, o semestre do ano também pode ser usado se a mesma matéria tiver sido ministrada pelo mesmo professor duas vezes no mesmo ano.

Na forma estendida, o nome da matéria e do professor aparecem completos. Esses campos, junto com o ano (nessa ordem) são separados por hífen. O semestre, se houver, é acresentado à direita do ano, separados por barra.

```
Nome da Matéria - Nome do Professor - Ano/Semestre
```

Na forma abreviada, o nome da matéria e do professor também são abreviados, conforme a [tabela de abreviação](abbreviations.md). Esses dois campos aparecem no final (nessa ordem), depois do ano seguido opcionalmente do semestre. Todos os campos aparecem com capitalização minúscula, separados por hífen e sem espaçamento.

```
ano-semestre-materia-professor
```

## Formatos de anotação

Markdown, AsciiDoc e Typst são os formatos preferidos para anotação textual, cada um com seu caso de uso:

 - Markdown (extensão de arquivo `.md`) é simples, suficiente para anotações rápidas, suporta linguagem matemática com sintaxe TeX via extensão.
 - AsciiDoc (extensão de arquivo `.adoc`) tem mais recursos que o Markdown, suporta linguagem matemática em TeX ou Asciimath e pode ser extendido via Ruby.
 - Typst (extensão de arquivo `.typ`) é melhor para tipografia e geração de texto acadêmico digital paginado ou impresso, suporta linguagem matemática na própria sintaxe e também é uma linguagem de scripting.

## Registro de turmas

O registro de turmas mantido em [`log/`](log/readme.md) é atualizado conforme as disciplinas em andamento avançam. As informações das disciplinas registradas são agrupadas em subdiretórios nomeados na forma abreviada. Dentro de cada subdiretório, fica um arquivo `readme.md` descrevendo como foi a turma e demais arquivos auxiliares, menos as tarefas. Quando uma tarefa surge, ela é apenas mencionada em [`log/`](log/readme.md). O registro da tarefa em si, do enunciado, é feito em [`task/`](task/readme.md).

## Registro de tarefas

O diretório [`task/`](task/readme.md) tem um subdiretório dedicado para cada tarefa, cujo nome fica ao critério da criatividade. Mais especificamente, os subdiretórios tem o nome abreviado da respectiva tarefa, enquanto o nome estendido é usado dentro das anotações. O arquivo [`task/readme.md`](task/readme.md) contém um mapeamento entre nomes abreviados e estendidos das tarefas e as turmas às quais cada tarefa está relacionada.

```md
<!-- task/readme.md -->

# Tarefas

## Tarefa

[`tarefa/`](tarefa/readme.md)

*Em: Matéria - Professor - Ano - Semestre.*

*Em: Matéria - Professor - Ano - Semestre.*

Breve descrição.
```

Cada subdiretório de tarefa fica com um arquivo `task.md` interno contendo o enunciado da tarefa e as respectivas turmas, na forma estendida. O motivo disso ficar no `task.md` é que o `readme.md` é específico para explicar cada implementação de cada aluno.

```md
<!-- task.md -->

# Tarefa

*Em: Matéria - Professor - Ano.*

Enunciado aqui.
```

Eventualmente, mais de uma tarefa com enunciados complementares, parecidos ou literalmente iguais podem (e vão) surgir. Uma opção quando isso ocorre é unir esses enunciados. Se dois enunciados esperam a mesma solução, não tem razão para o mesmo aluno criar duas soluções com poucas diferenças ou tecnicamente iguais.

No caso em que as subtarefas se complementam e podem ser satisfeitas por uma mesma solução, elas ficam juntas no arquivo `task.md`, em seções diferentes. Nesse caso, as turmas que aparecem na lista geral, associadas àquela tarefa, são distribuídas entre as subtarefas (subseções). Esse tipo de junção aumenta o tamanho ou a complexidade da solução, porque mais requisitos vão sendo empilhados. Por isso, deve ser usada na medida do razoável.

```md
<!-- task.md -->

# Tarefa

## Subtarefa 1

*Em: Professor - Matéria - Ano.*

Enunciado aqui.

## Subtarefa 2

*Em: Professor - Matéria - Ano.*

Enunciado aqui.
```

Se uma subtarefa for muito grande ou profunda para ficar misturada com as demais, ela pode aparecer cada em seu próprio arquivo, no formato `task-*.md`.

## Comentário

Tanto no registro de turma quanto no de tarefa, o aluno que está documentando pode deixar um comentário. Mas deve deixar claro que é um comentário e incluir o seu nome.

```md
> Meu comentário aqui :D
>
> *-- Seruna*
```

## Commit

Cada alteração é registrada por um commit, com um título conciso de idealmente até 60 caracteres, contendo o local da mudança, se houver um específico, e uma breve descrição da mudança em si. O idioma preferido é o Inglês, mas, se você realmente gostar muito do Português, pode usar também. Faz parte. Quanto ao conteúdo em si, não existe um padrão rígido, apenas a espectativa de que seja algo significativo.

```
Update git commands in readme.
```

Se for um registro de turma ou de tarefa, é bom usar as formas abreviadas de identificação.

```
log/auto-regi-2026: add first exam date.
task/minishell: register.
task/minishell: add X and Y.
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


