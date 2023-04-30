# Projeto de um Compilador

## Trabalho 1 (T1): Análise Léxica

Nesta parte do projeto, você irá implementar um analisador léxico
para a [linguagem B-](../Linguagem/Manual.md)).

O analisador léxico do trabalho T1 deve ler um programa fonte e produzir uma lista de _tokens_,
sequencialmente, um _token_ de cada vez, anotado com as seguintes informações:
- localização (número da linha) no código fonte
- classe (identificador, constante inteira, símbolo, etc)
- lexema (cadeia de caracteres correspondente).

Se uma entrada incorreta for encontrada, o analisador léxico deve reportá-lo e prosseguir com a análise.

A versão da linguagem B- usada aqui é levemente diferente da usada no livro do Douglas Thain, mas os exemplos de código e o material podem ser extremamente úteis.

## Classes de _tokens_

Em sua implementação do analisador léxico, considere as seguintes classes de _tokens_ da linguagem:

__ID__      Identificador

__NUM__     Literal decimal (inteiro)

__KEY__     Keyword (palavra-chave)

__SYM__     Símbolo especial

__ERROR__   Erro léxico

Comentários e caracteres de espacejamento (_white space_) devem ser descartados durante a fase de análise léxica do compilador.

O formato da saída do analisador léxico, um _token_ por linha, é:

``` (line_num,token_class,"lexeme") ``` (_lexeme_ entre aspas)

Você deve imprimir o número da linha na qual o _token_ foi encontrado, inclusive no caso de erro.
No caso de erro léxico, retornar o _token_ __ERROR__.
O analisador léxico deve reportar todos os erros léxicos existentes no programa fonte analisado, prosseguindo até o final do arquivo de entrada.

## Exemplo de arquivo de entrada em B-

```
main: function integer () = 
{
    a: integer;
    a = 4 + 5;  
}
```

## Modelo da saída gerada pelo analisador léxico

O analisador léxico deverá ler um arquivo de entrada contendo um programa fonte em B- (com extensão _.bm_)
e gerar um arquivo de saída (com extensão _.out_).

Por exemplo, para o programa fonte em _main.cm_ (acima), a saída gerada no arquivo _main.out_ deverá ser:
```
(1,ID,"main")
(1,SYM,":")
(1,KEY,"function")
(1,KEY,"integer")
(1,SYM,"(")
(1,SYM,")")
(1,SYM,"=")
(2,SYM,"{")
(3,ID,"a")
(3,SYM,":")
(3,KEY,"integer")
(3,SYM,";")
(4,ID,"a")
(4,SYM,"=")
(4,NUM,"4")
(4,SYM,"+")
(4,NUM,"5")
(4,SYM,";")
(5,SYM,"}")
```

## Como executar (dois argumentos: entrada e saída)

O nome do analisador léxico (executável) deve ser _b1_lexer_.
O programa _b1_lexer_ deve ler a entrada a partir de um arquivo 
com extensão _.bm_ e escrever a saída em um arquivo com extensão _.out_.
O nome do arquivo de saída _.out_ deve ser igual ao nome do arquivo de entrada _.bm_.

## Entrega

Usar o repositório individual criado pelo GitHub Classroom para entrega do trabalho T1.

- Entrega parcial (7 dias): 
Subir uma versão incompleta do programa flex para B- com especificação de padrões e ações para descartar caracteres de espacejamento e para o reconhecimento de identificadores, palavras reservadas e constantes numéricas;

- Entrega final: Subir a versão completa do programa flex para B- e todos os arquivos associados.


