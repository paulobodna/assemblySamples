
.data # inicia segmento de dados
.align 0 # alinhamento a byte (2^0)
str_dig: .asciiz "digite um numero: " # definindo a string str_dig
str_pos: .asciiz "\nfatorial eh: ! " # definindo a string str_pos

# estes dois dados abaixo não são necessarios no programa
# .align 2 # exemplifica alinhamento para inteiros com 32 bits
#vlr_int: .word 5 # exemplifica armazenamento de um inteiro na memoria de maneira estática
#string: .asciiz "abcdefghi" # armazena estaticamente a cadeia rotulada como string na memoria

.text # inicia segmento de texto (instrucoes)
    .align 2 # alinhamento a word 4 bytes (2^2)
    .globl main # rotulo main e global

main: # inicio do programa

# vai imprimir uma string
# load immediate
li $v0, 4 # atribui 4 para $v0. codigo para print_str
# load address
la $a0, str_dig # carrega endereco de str_dig em $a0
# eh o end da string a ser impressa
syscall # chamada de sistema para e/s

# vai ler um inteiro vindo do teclado
li $v0, 5 # atribui 5 para $vo. codigo para read_int
syscall # chamada de sistema para e/s. retorno estara em $v0
move $t2, $v0 # copia conteudo digitado para $t2 para preservar dado

li $t1, 1 # $t1=1 eh usado como aux.

# set-on-less-than
slt $t0, $t2, $zero # verifica se nr digitado eh negativo

# branch-if-equal
beq $t0, $t1, print_neg # se é negativo então goto print_neg

# vai imprimir uma string
li $v0, 4 # atribui 4 para $v0. codigo para print_str
la $a0, str_pos # carrega endereco de str_pos em $a0
# eh o end da string a ser impressa
syscall # chamada de sistema para e/s

# vai imprimir um inteiro se ele for >= 0
li $v0, 1 # atribui 1 para $v0. codigo para print_int
move $a0, $t2 # copia nr a ser impresso para $a0.
# argumento de entrada para a impressao do int
syscall # chamada de sistema para e/s

# jump
j thatsallfolks # goto thatsallfolks. salta a impressao do nr negativo

print_neg: # aqui fara impressao no nr negativo

# vai imprimir uma string
li $v0, 4 # atribui 4 para $v0. codigo para print_str
la $a0, str_neg # carrega endereco de str_neg em $a0
# eh o end da string a ser impressa
syscall # chamada de sistema para e/s

# vai imprimir um inteiro
li $v0, 1 # atribui 1 para $v0. codigo para print_int
move $a0, $t2 # copia nr a ser impresso para $a0.
# argumento de entrada para a impressao do int
syscall # chamada de sistema para e/s

thatsallfolks: # o que que ha velhinho?
li $v0, 10 # atribui 10 para $v0. codigo para exit (termina programa)
syscall # chamada de sistema para e/s
