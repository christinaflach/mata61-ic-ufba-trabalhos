# B-Minus

A linguagem B- é uma linguagem “pequena” usada para o ensino de compiladores em cursos de graduação. 
B- inclui expressões, fluxo de controle básico, funções recursivas e 
verificação de tipos. O código-objeto é compatível com C e, portanto, 
algumas bibliotecas C padrão podem ser usadas para os tipos definidos na linguagem.

Descreveremos a linguagem através de exemplos, deixando para você ler com atenção, fazer perguntas no Fórum e então extrair as especificações formais necessárias para desenvolver os trabalhos do curso.

## Aspectos Léxicos

### 1. Caracteres de espacejamento (_whitespace_)

Os caracteres de espacejamento são _blank_ (' '), _newline_ ('\n'),  _tab_ ('\t') e _carriage return_ ('\r').

Os caracteres de espacejamento não têm papel significativo em programas B- e devem ser desconsiderados pelo analisador léxico.

### 2. Comentários de uma linha

Comentários de uma linha (_single-line comments_) sempre são iniciados por ```//``` e se estendem até o final da linha.
Comentários devem ser desconsiderados.

- Exemplo: ```a=5; // comentário no estilo C++```

### 3. Identificadores

Identificadores são usados como nomes de variáveis e funções. 
São compostos por letras maiúsculas e minúsculas, dígitos decimais e _underscores_.
Identificadores devem começar com uma letra e podem ter até 256 caracteres.
Caracteres maiúsculos e minúsculos em identificadores são diferenciados.

- Exemplo: ```i x9 x9_ my_str name4you  NomeCompleto```
- Exemplo: ```x9``` e ```X9``` são dois identificadores distintos.

### 4. Palavras-chave (_keywords_)

```
array  boolean  else  false  function  if
integer  print  return  string  true  void   while
``` 

As palavras-chave, sempre escritas em letras minúsculas, são reservadas 
e não podem ser usadas como identificadores. 

- Exemplo: _integer_ é palavra reservada, porém  _IntegeR_ não é.

Três palavras reservadas representam tipos atômicos da linguagem:

```
integer   boolean   string
```

A palavra reservada ```array``` é usada na declaração de arrays, único tipoestruturado da linguagem.

### 5. Símbolos especiais

#### Símbolos simples

```
  +  -  *  /  %  !  <  >  =  ;  ,  (  )  [  ]  {  } 
```

#### Símbolos compostos

```
  <=  >=  ==  !=  &&  ||
```

### 6. Constantes 

#### Tipo ```integer```

Uma constante inteira é uma sequência não-vazia de dígitos decimais.

#### Tipo ```boolean```

Há duas constantes válidas para o tipo ```boolean```: ```false``` e ```true```.

#### Tipo ```string```

Uma string é sequência de caracteres entre aspas duplas, terminadas por _null_.

Uma string pode ter até 256 caracteres e pode conter apenas os seguintes
códigos de barra invertida:

- \n indica nova linha (valor ASCII 10),
- \0 indica _null_ (valor ASCII zero),
- \c indica o próprio caractere ```c```.

- Exemplo: Na string ```"letra \d\n."```, o ```\d``` 
representa o caractere ```d``` e o ```\n``` representa o valor ASCII 10.


### 7. Erros Léxicos

- caracter inválido 
- string mal-formada

### Exemplos

```
x: integer;
y: integer = 123;
b: boolean = false;
s: string  = "hello world\n";
```

```
x: integer = 65;
y: boolean = true;
if(x>y) ... etc.
```

```
f: integer = 0;
if(f<100) ...  etc.
```

```
writenum: function void ( b: integer );
a: boolean = true;
writenum(a);  // semantic error: a is not integer!
```

```
b: array [2] boolean = {true,false};
x: integer = 0;
x = b[0];      // semantic error: x is not a boolean!
```

## Aspectos Sintáticos

TBD.

## Aspectos Semânticos 

TBD.

<!--

#### Tipos

- O tipo ```integer``` define constantes representadas como ``signed 64 bit```.
- O tipo ```boolean``` possui dois valores literais: _true_ e _false_.
- O tipo ```string``` define cadeias de caracteres entre aspas duplas, terminadas por _null_ e  que não podem ser modificadas.

- Arrays são estáticos, isto é, são criados com tamanho fixo e memória reservada; o tamanho não pode ser modificado depois.

- Se um array for declarado, sem valores atribuídos, assume-se que o mesmo foi inicializado com zeros.

``` a: array [5] integer; ```

- Na declaração de um array de tamanho N, pode-se inicializar o array com um conjunto de valores.

``` a: array [5] integer = {1,2,3,4,5}; ```

- Se um array for declarado, sem valores atribuídos, assume-se que o mesmo foi inicializado com zeros.

#### Função main


Um programa completo deve ter uma função chamada de ```main``` que retorna um valor inteiro. 
A lista de parâmetros de _main_ pode ser vazia ou usar _argc_ e _argv_ 
como em programas C. 
-->

-----

### Créditos

Adaptado do material didático cedido pelo Prof. Vinicius Petrucci e 
do livro de D. Thain.

