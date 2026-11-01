# Opaque types in C

*Em: Estrutura de Dados I - Denis do Rosário - 2026.*

Implemente um tipo abastrado de dado ContaBancaria, com os campos número e saldo onde os clientes podem fazer as seguintes operações:

 - Iniciar uma conta com um número e saldo inicial.
 - Depositar um valor.
 - Sacar um valor.
 - Imprimir o saldo.

```c
typedef struct {
	int numero;
	double saldo;
} ContaBancaria;

ContaBancaria inicializa(int, double);
void deposito(ContaBancaria *, double);
void saque(ContaBancaria *, double);
void imprime(ContaBancaria);
```

Implemente um tipo abstrato de dado NumeroComplexo, com o campo real e o campo imaginário, bem como as seguintes operações:

 - Exibição na forma "R + Ci", onde "R" é a parte real e "C" é a parte complexa.
 - Cópia de valor.
 - Soma.
 - Teste de pertencimento aos reais (se o número complexo também é um número real).

```c
typedef struct {
	int real;
	int img;
} NumeroComplexo;

NumeroComplexo inicializa(int, int);
void imprime(NumeroComplexo);
void copia(NumeroComplexo*, NumeroComplexo);
NumeroComplexo soma(NumeroComplexo, NumeroComplexo);
int ehReal(NumeroComplexo);
```

Implemente um tipo abstrato de dado Agenda, com os campos nome, endereço e número do contato, bem como as seguintes operações:

 - Exibição.
 - Busca por nome.
 - Edição de nome e número.

> O slide tem um print com a implementação em C++ (arquivo .cpp) que não foi transcrito para cá.
> 
> É basicamente a função main() testando esses métodos com alguns valores.
>
> *-- Seruna*
