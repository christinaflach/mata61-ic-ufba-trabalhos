# Projeto de um Compilador

## Trabalho 1 (T1): Análise Léxica

Nesta parte do projeto, você irá implementar um analisador léxico
para a [linguagem B-](../Linguagem/Manual.md)).

O analisador léxico do trabalho T1 deve receber como entrada 
um programa fonte em B- e retornar um sequência _tokens_, 
um a um, cada _token_ anotado com as seguintes informações:
- classe do _token_ (identificador, constante inteira, símbolo, etc)
- lexema do _token_ (cadeia de caracteres), 
no caso de identificadores e constantes inteiras.

Se uma entrada incorreta for encontrada, o analisador léxico 
retornar o token __ERROR__.
O analisador léxico deve reportar todos os erros léxicos presentes 
no programa fonte analisado, ou seja, após identificar e reportar o erro, 
a análise léxica deve prosseguir até o final do programa fonte.

A versão da linguagem B- usada aqui é levemente diferente da usada no livro do Douglas Thain, mas os seus exemplos de código e o material podem ser extremamente úteis.

## Classes de _tokens_

Em sua implementação do analisador léxico, considere as seguintes classes de _tokens_ da linguagem:

__ID__     Identificador

__NUM__    Literal decimal (inteiro)

__KEY__    Keyword (palavra-chave)

__SYM__    Símbolo especial simples

__SYMC__   Símbolo especial composto

__ERROR__  Erro léxico

Comentários e caracteres de espacejamento (_white space_) devem ser descartados durante a fase de análise léxica do compilador.

## Entrada

O analisador léxico deverá ler um arquivo de entrada (com extensão _.bm_),
contendo um programa fonte em B-.

```
// main.bm 
main: function integer () =
{
    a: integer;
    a = 4 + 5;
    print(a);
}
```
 
## Saída 

O analisador léxico deve gerar um arquivo de saída (com extensão _.out_).
Para cada chamada do analisador léxico, a saída deve mostrar 
um _token_ e seus atributos, um _token_ por linha, 
no formato especificado a seguir:

```(line_num,token_class,"lexeme") ``` (_lexeme_ entre aspas)

onde ```line_num``` é o número da linha no arquivo de entrada 
em que  _token_ aparece,
 ```token_class``` é a classe do _token_ válido ou __ERROR__,  
no caso de erro léxico, e
```lexeme``` é o lexema associado ao _token_, reportado em entre 
aspas duplas.

Para o programa fonte em _main.bm_ (acima), 
a saída gerada em _main.out_ deverá ser:
```
(2,ID,"main")
(2,SYM,":")
(2,KEY,"function")
(2,KEY,"integer")
(2,SYM,"(")
(2,SYM,")")
(2,SYM,"=")
(3,SYM,"{")
(4,ID,"a")
(4,SYM,":")
(4,KEY,"integer")
(4,SYM,";")
(5,ID,"a")
(5,SYM,"=")
(5,NUM,"4")
(5,SYM,"+")
(5,NUM,"5")
(5,SYM,";")
(6,KEY,"print")
(6,SYM,"(")
(6,ID, "a")
(6,SYM,")")
(6,SYM,";")
(7,SYM,"}")
```

## Como executar (dois argumentos: entrada e saída)

O nome do analisador léxico (executável) deve ser _bminus_.
O programa _bminus_ deve ler a entrada a partir de um arquivo 
com extensão _.bm_ e escrever a saída em um arquivo com extensão _.out_.
O nome do arquivo de saída _.out_ deve ser igual ao nome do arquivo de entrada _.bm_.

```$ bminus main.bm```

## Entrega

A entrega do T1 deve ser feita no repositório individual 
criado pelo GitHub Classroom. 
O repositório tem duas pastas, ```src``` e ```tests``.
Os arquivos na pasta _src_,  
```bminus.l```, ```bminus.y``` e ```main.c```
devem ser usados.
Modificar _bminus.y_ para definir os tokens que serão usados 
na especificação definida em  _bminus.l_.

A pasta _tests_ contém arquivos _.bm_ com programas para teste.
_Não_ incluir outros arquivos nesse repositório.

A entrega deverá ser feita em duas etapas:

- Entrega parcial (7 dias) 

Subir uma versão incompleta do programa flex para B- 
com especificação de padrões e ações para 
descartar caracteres de espacejamento e para o reconhecimento 
de identificadores, palavras reservadas e constantes numéricas;

- Entrega final (15 dias) 

Subir a versão completa do programa flex para B- com todos
padrões e ações implementados. 

