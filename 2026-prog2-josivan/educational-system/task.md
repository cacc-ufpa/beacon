# Sistema educacional

## Josivan Reis - Programação II - 2026

Sistema educacional web.

**Requisitos:**

 - Plataforma com perfis (aluno, professor e admin), cadastro de usuários com dados (nome completo, e-mail, senha, endereço e data de nascimento).
 - Login e logout de usuários, recuperação de senha, gestão de perfil (CRUD), controle de permissão (aluno só vê o que for do curso dele).
 - Matrícula em curso = matrícula em todas as disciplinas do curso.
 - Cadastro de curso é feito por admin.
 - Cadastro de conteúdo na disciplina é feito pelo professor.
 - Professor só acessa as suas disciplinas nos cursos que ele ministra
 - Adicionar, editar e remover cursos (matérias vão junto, exclusão virtual por flag ativou ou não ativo, ou seja, ainda existe no banco de dados).
 - Correção automática (múltipla escolha e V ou F).
 - Admin pode listar todos os cursos.
 - Matrículas no curso: feita pelo administrador, o aluno pede permissão pro administrador, aluno consegue ver todos os cursos para escolher em qual se matricular.
 - Aluno pode participar de vários cursos.
 - Matérias iguais mas cursos diferentes são disciplinas diferentes.
 - Disciplina só pode ter um professor.
 - Conteúdo da disciplina e módulos feitos por professor, disciplina cadastrada por administração.

**Módulos:**

 - Disciplina tem módulos (1, 2, 3).

 - Só consegue passar para um módulo 2 se finalizar o anterior.

 - Dentro dos módulos.

 - Módulos (1 a 3) = Conteúdo (descrever, textos, anexar arquivo, colocar vídeos (tentar fazer por link não listado)), para concluir o módulo tem que ver todos os vídeos, professor cadastra as atividades com tipo (V ou F, selecionar (uma certa) ou múltipla escolha (uma ou mais certas)), cadastrar no banco as respostas, comparar as opções marcadas pelo usuário com as certas e salvar as provas do usuário para relatório futuro, módulos podem ter mais de 1 atividade, mais de 1 texto, mais de 1 vídeo e etc, usuário pode fazer o teste (3 vezes), salvando todas suas tentativas, se falhar 3 vezes avança mesmo assim, se acertar mais de 70% passa com menos de 3, pode fazer de novo se quiser, obrigar no mínimo 10 questões por atividade.

 - Gestão de aulas dentro dos módulos

 - Progresso do aluno: só o administrador vê (qual módulo ele está (pelo perfil do aluno), desempenho nos testes (podendo expandir por teste)), acesso por curso, não por aluno

 - Adm: Gerencia usuários, professor (listar todos os professores), acessar perfil de professores, sabendo cursos e disciplinas, cursos, professores naquele curso, alunos naquele curso, tudo
 - Acessibilidade, se se possível (exemplo: leitor de tela).

 - Aluno: realiza login, pede matricula em curso, assiste as aulas, faz atividade, acompanha progresso.

 - Fazer com que as aulas sejam abertas para ver seu conteúdo.

Páginas básicas:

- Login

- Recuperar senha

- Perfil do usuário

- Página dashboard de gerenciamento de conteúdos

- Pagina dashboard de permissões em grupo

- Páginas dashboard de cadastro de cursos, disciplinas, módulos, aulas e atividades

- Páginas de acesso do aluno/professor para visualizar dados de curso, disciplina, módulos, aulas e atividades

- Página de matrícula de aluno

Regras:

 - Para recuperar senha deve ter permissão do administrador ou token em email

 - o mesmo para cadastrar aluno em disciplina

 - Cada módulo deve ter atividades

 - Professor pode visualizar cursos, disciplinas, módulos, aulas e atividades

 - Professor pode editar e cadastrar módulos, aulas e atividades

 - Professor não pode apagar nem criar disciplinas e cursos

 - Professor pode ler, escrever e anexar arquivos em módulos, aulas e atividades (doc, imagem ou vídeo)

 - Alunos podem ver disciplinas, módulos, aulas e atividades

 - Aluno pode se matricular em disciplinas, acessar módulos e aulas, e responder atividades

 - Aprovação de aluno em módulo e disciplina depende de >70% de avaliação em atividades

 - Aluno terá 3 tentativas de concluir módulo

 - Aluno poderá avançar de módulo se somente se concluir atividades

 - Atividades devem ser do tipo múltipla seleção, objetiva de resposta única, ou verdadeiro e falso, todas as atividades envolvendo (checkbox ou rádio Button)

 - Administrador possui todas as permissoes de acesso ao sistema e páginas

 - Administrador pode definir status de ativo/inativo para professor, aluno, disciplina e etc

Relação de entidades:

 - n alunos para n disciplinas

 - 1 curso para n alunos

 - n módulos para n disciplinas

 - n aulas para n módulos

 - n cursos para n professor

 - 1 professor para n disciplinas
