# Projeto de um Compilador

## Trabalho 2 (T2): Análise Sintática

Nesta parte do projeto, você irá implementar um analisador sintático _bottom-up_ 
para a linguagem B-, usando a ferramenta _Bison_,
e integrá-lo com uma nova versão do analisador léxico desenvolvido com Flex no T1.

O analisador sintático deve receber uma sequência de _tokens_ 
enviados pelo analisador léxico desenvolvido no trabalho 1 (T1)
e determinar se um programa B- segue ou não 
a especificação definida por sua gramática.
Se um erro sintático for detectado, 
apenas a mensagem de erro padrão do Bison será reportada e 
a análise sintática interrompida. 

Antes de iniciar a sua implementação, recomendamos como leitura complementar o capítulo 5
do livro "Introduction to Compilers and Language Design" de Douglas Thain.
Outra consulta interessante é uma [especificação yacc para ANSI C](https://www.lysator.liu.se/c/ANSI-C-grammar-y.html) feita no século passado (década de 80).

## Bison e Flex

O Bison deverá ser utilizado para geração do analisador sintático,
trabalhando em conjunto com o analisador léxico 
gerado com Flex (T1).


### bminus.y

```$ bison -d bminus.y```

A opção -d faz com que o Bison gere o arquivo _bminus.tab.h_, 
que faz a interface com o analisador léxico gerado pelo Flex.

- A definição dos tokens com a diretiva ```%token``` deve ser modificada para usar códigos mais específicos, por exemplo:
   - IF, WHILE, etc., para palavras reservadas, ao invés da categoria geral "KEY" usada em T1;
   - ADD, SUB, etc., para símbolos, ao invés da da categoria geral "SYM" usada em T1;
   - EQ, NEQ, AND, etc., para símbolos compostos, ao invés da da categoria geral "SYMC" usada em T1;

```
%token IF 
...
%token ADD
...
``` 

- As regras de produção da gramática para B- devem ser especificadas no programa bminus.y.

__Atenção: Colocar os nomes dos membros da equipe como comentário no arquivo bminus.l.__

### bminus.l

O arquivo _bminus.l, criado no T1, deverá ser copiado e modificado.

- Incluir o arquivo "bminus.tab.h"  gerado pelo Bison (não usar "token.h").

- Retornar novos códigos de token nas ações associadas às expressões regulares, por exemplo:

```
if      { return IF; }
"+"     { return ADD; }
```

__Atenção: Colocar os nomes dos membros da equipe como comentário no arquivo bminus.l.__

### main.c

A função _main()_ no arquivo main.c deverá ser modificada para fazer uma chamada a yyparse().

__Atenção: Colocar os nomes dos membros da equipe como comentário na primeira linha de main.c.__

## Compilação de ```bminus```

```$ bison -d bminus.y```
```$ flex bminus.l```
```$ cc -o bminus bminus.tab.c lex.yy.c main.c```

## Execução do analisador sintático ```bminus```

```$./bminus inputfile outputfile``` 


O arquivo ```inputfile``` contém um programa-fonte em B-.
Em caso de erro sintático, o arquivo ```outputfile``` gerado conterá apenas a mensagem "syntax error".
Se não for detectado erro sintático, ```outputfile``` será criado porém vazio (0KB).
- Obs.: Em T2, o arquivo ```outputfile``` é criado apenas para uso na correção automática de T2.


**Observação**:  Atenção para os nomes usados no T2.
- O nome do arquivo Flex modificado deve ser bminus.l
- O nome do arquivo Bison deve ser bminus.y
- O nome do arquivo que contém a função _main_ deve ser main.c.

## Exemplos

### Exemplo 1 (sem erro sintático)

```
// exemplo sem erro sintatico

main: function integer () =
{
    a: integer;
    read(a);
    if (a <= 0) 
       a = 1;
    print(a);
}
```

- Saída após análise sintática do programa: um arquivo vazio (0KB)

### Exemplo 2 (com erro sintático)

```
// exemplo com erro sintatico

main: function integer () =
{
    x: integer;
    read(x);
    if (x != 0 
       x = 1;
    print(x);
}
```

- Saída após análise sintática do programa: um arquivo com apenas uma linha.

```syntax error```


## Correção Automática

A correção automática do trabalho T2 será feita com o apoio de _scripts_.
Desse modo, a correção irá considerar apenas os arquivos colocados 
no repositório GitHub da equipe,
com os nomes de arquivos indicados na especificação do trabalho.

--------
Parte deste material foi cedido pelo Prof. Vinicius Petrucci, 
e traduzido e adaptado pela Profa. Christina von Flach.
<!-- https://ruslanspivak.com/lsbasi-part1/ -->
