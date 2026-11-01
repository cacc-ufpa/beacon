UFPA Computer Science Beacon
============================

Repositório Git como um diário de estudo do **Curso de Ciência da Computação da UFPA**.

A partir das contribuições de esutdantes, o repositório do CACC reúne informações de utilidade geral:

 - Orientações sobre o curso.
 - Seleção de projetos desenvolvidos por estudantes.
 - Anotações de turma:
	 - Anotações de aula.
	 - Material didático.
	 - Orientações sobre tarefas.

Já o material mais pessoal desenvolvido por cada estudante fica em seu respectivo fork:

 - Anotações de conteúdo.
 - Soluções de exercícios.
 - Implementações de tarefas.
 - Comentários.

[Tarefas](tasks.md)

Turma
-----

Turma é a aplicação de uma matéria.

Na forma estendida, nome de matéria e nome de docente aparecem completos. Esses campos, mais o ano, são separados por hífen, nessa ordem. O semestre, se houver, é acresentado após o ano, separado por barra.

```
Matéria - Docente - Ano/Semestre
```

Na forma abreviada, nome da matéria e nome de professor também são encurtados, conforme a [tabela de abreviação](abbreviations.md). Esses dois campos aparecem no final, nessa ordem, depois do ano seguido opcionalmente do semestre. Todos os campos aparecem com capitalização minúscula, separados por hífen e sem espaçamento.

```
ano-semestre-materia-professor
```

Configuração Inicial
-------------

Para começar, um fork do repositório do CACC precisa ser criado.

Após criado, o fork precisa ser clonado para o ambiente local. Nesse momento, também é importante deixar dois repositórios remotos configurados:

 - O repositório remoto `origin`, que é o fork, e já vem por padrão após a clonagem para o ambiente local.
 - O repositório remoto `upstream`, que é o do CACC, de onde o fork veio.

```sh
git clone "https://github.com/nick/ufpa" ufpa; cd ufpa;
git remote add upstream "https://github.com/ufpa-cacc/beacon"
```

Por padrão o fork, vem com uma cópia da branch principal do repositório do CACC: a branch `main`. Apesar do nome da branch ser igual, ela vai ser usada de formas diferentes:

 - A branch `main` do CACC serve para registrar informações de utilidade geral.
 - A branch `main` do fork tem o que a branch `main` do CACC tem, mais o material pessoal desenvolvido pela pessoa que criou o fork.

Na maioria dos casos, nem a branch `main` do CACC nem a branch `main` do fork devem receber commits diretamente. Ambas devem receber mesclas de outras branches auxiliares.

Arquivos de Turma de Interesse Geral
------------------------------------

Para adicionar ou alterar arquivos relacionados a uma turma (anotações, material de apoio, tarefas), o aluno cria uma uma branch de turma a partir da `main`, e a nomeia com a identificação abreviada da turma à qual as alterações estão relacionadas.

Arqiuivos relacionados à uma turma específica ficam dentro de um subdiretório com a identificação abreviada da turma (mesmo nome da branch).

```sh
# Sincronização inicial.
git fetch upstream

# Criação da branch de turma.
git switch upstream/main
git switch -c 2026-class-teacher
mkdir 2026-class-teacher

touch 2026-class-teacher/readme.md
git add 2026-class-teacher/readme.md
git commit -m "2026-class-teacher: first commit"

touch 2026-class-teacher/exam-1.md
git add 2026-class-teacher/exam-1.md
git commit -m "2026-class-teacher: add first exam"

mkdir 2026-class-teacher/task-foo
touch 2026-class-teacher/task-foo/task.md
git add 2026-class-teacher/task-foo/task.md
git commit -m "2026-class-teacher: add task foo"
```

As informações gerais da turma adicionadas localmente podem ser empurradas ao fork para submeter uma pull request ao repositório do CACC antes mesmo que as implementações sejam adicionadas. Afinal, elas vão ficar só no fork mesmo.

```sh
git push -u origin 2026-class-teacher
```

Arquivos Pessoais
-----------------

Para registrar histórico pessoal (soluções, implementações, comentários), é preciso criar uma branch separada a partir da branch da turma, com seu nick como sufixo.

```sh
# Criar branch pessoal de turma. Nick em sufixo.
git switch 2026-class-teacher
git switch -c 2026-class-teacher-nick

# Registro de conteúdo pessoal.

touch 2026-class-teacher/task-foo/report.typ
git add 2026-class-teacher/report.typ
git commit -m "2026-class-teacher: add report for task foo"

touch 2026-class-teacher/exam-1.typ
git add 2026-class-teacher/exam-1.typ
git commit -m "2026-class-teacher: add solutions for first exam"

git push -u origin 2026-class-teacher-nick
```

Quando uma branch pessoal de turma estiver madura, ela pode ser mesclada na branch `main` local.

```sh
git switch main
git merge 2026-class-teacher-nick
```

Lista de Tarefas
----------------

O arquivo `tasks.md` serve para listar as tarefas que ficam segregadas nos diretórios de turma.

```md
<!-- tasks.md -->

Tarefas
=======

Tarefa
------

[*Em: Matéria - Docente - Ano - Semestre.*](./2026-2-class-teacher/readme.md)

Breve descrição.
```

Tarefas com similaridade temática aparecem na mesma seção.

```md
<!-- tasks.md -->

Tarefas
=======

Tarefa
------

*Em: [Matéria1 - Docente1 - Ano1 - Semestre1](./2026-2-class1-teacher1/task-foo/task.md).*

*Em: [Matéria2 - Docente2 - Ano2 - Semestre2](./2026-1-class2-teacher2/task-foo/task.md).*

Ambas as tarefas pedem A, mas a tarefa na Matéria1 pede B, enquanto a tarefa na Matéria2 pede C.
```

Nem todo tipo de tarefa precisa ficar listado em `tasks.md`. Provas e listas de exercícios, por exemplo.

Comentário
----------

Tanto no registro de turma quanto no de tarefa, o aluno que está documentando pode deixar um comentário. Mas deve deixar claro que é um comentário e incluir o seu nome.

```md
> Meu comentário aqui :D
>
> *-- Seruna*
```

Se uma subtarefa for muito grande ou profunda para ficar misturada com as demais, ela pode aparecer cada em seu próprio arquivo, no formato `task-*.md`.

Formatos de anotação
--------------------

Markdown, AsciiDoc e Typst são os formatos preferidos para anotação textual, cada um com seu caso de uso:

 - Markdown (extensão de arquivo `.md`) é simples, suficiente para anotações rápidas, suporta linguagem matemática com sintaxe TeX via extensão.
 - AsciiDoc (extensão de arquivo `.adoc`) tem mais recursos que o Markdown, suporta linguagem matemática em TeX ou Asciimath e pode ser extendido via Ruby.
 - Typst (extensão de arquivo `.typ`) é melhor para tipografia e geração de texto acadêmico digital paginado ou impresso, suporta linguagem matemática na própria sintaxe e também é uma linguagem de scripting.

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


