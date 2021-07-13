/* Daniel Stulberg Huf 1920468 Turma 3WB */
/* João Pedro Khair Cunha 1910626 Turma 3WB */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "gera.h"

#define MAXLINHAS 30
#define MAXVAR 5
#define MAXPARAM 3

unsigned char *codigo;
int i;

typedef struct Jump {
    int posCodigo;     //onde será alterado o código de máquina
    int destino;       //linha de destino do jump
    int prox;          //linha da próxima instrução após o jump
} jump;

/* --FUNÇÃO LIBERA-- */
void libera(void *vetor) {
	free(vetor);
	return;
}

/* --FUNÇÃO ERRO-- */
static void error(const char* msg, int line) {
	fprintf(stderr, "erro %s na linha %d\n", msg, line);
	exit(EXIT_FAILURE);
}

/* --GUARDA VAR LOCAL EM REGISTRADOR-- */
void addVarLocal(int n, int line) {
    if (n > MAXVAR)
        error("numero de variaveis locais excedido", line);
    codigo[i++] = 0xff - 4 * n + 1;
}

/* --FUNÇÃO OPERA-- */
void opera(char op, char var1, char var2, int idx0, int idx1, int idx2, int line) {
    if (var1 == '$' && var2 == '$') {
        codigo[i++] = 0xb8;
        *((int*)&codigo[i]) = idx1; i += 4;
        if (op == '+') {
            codigo[i++] = 0x05;
            *((int*)&codigo[i]) = idx2; i += 4;
        }
        else if (op == '-') {
            codigo[i++] = 0x83;
            codigo[i++] = 0xe8;
            *((int*)&codigo[i]) = idx2; i += 4;
            i++;
        }
        else { // op == '*'
            codigo[i++] = 0x6b;
            codigo[i++] = 0xc0;
            *((int*)&codigo[i]) = idx2; i += 1;
        }
    }
    else if (var1 == 'v' && var2 == '$') {   
        codigo[i++] = 0x8b;
        codigo[i++] = 0x45;
        addVarLocal(idx1, line);
        if (op == '+') {
            codigo[i++] = 0x83;
            codigo[i++] = 0xc0;
        }
        else if (op == '-') {
            codigo[i++] = 0x83;
            codigo[i++] = 0xe8;
        }
        else {
            codigo[i++] = 0x6b;
            codigo[i++] = 0xc0;
        }
        *((int*)&codigo[i]) = idx2; i += 1;
    }
    else if (var1 == '$' && var2 == 'v') {
        codigo[i++] = 0xb8;
        *((int*)&codigo[i]) = idx1; i += 4;
        if (op == '+') {
            codigo[i++] = 0x03;
        }
        else if (op == '-') {
            codigo[i++] = 0x2b;
        }
        else {
            codigo[i++] = 0x0f;
            codigo[i++] = 0xaf;
        }
        codigo[i++] = 0x45;
        addVarLocal(idx2, line);
    }
    else if (var1 == 'v' && var2 == 'v') {
        codigo[i++] = 0x8b;
        codigo[i++] = 0x45;
        addVarLocal(idx1, line);
        if (op == '+') {
            codigo[i++] = 0x03;
        }
        else if (op == '-') {
            codigo[i++] = 0x2b;
        }
        else {
            codigo[i++] = 0x0f;
            codigo[i++] = 0xaf;
        }
        codigo[i++] = 0x45;
        addVarLocal(idx2, line);
    }
    else {
        error("operacao invalida", line);
    }
    codigo[i++] = 0x89;
    codigo[i++] = 0x45;
    addVarLocal(idx0, line);
    return;
}

/* --FUNÇÃO GERA-- */
funcp gera(FILE* f) {
    funcp cod;
    char c;
    int pos, line = 1, nJumps = 0;
    long int destino, prox, endereco[MAXLINHAS];
    jump jumps[MAXLINHAS];
    codigo = (unsigned char*)malloc(300 * sizeof(unsigned char));
    i = 0;

    /* CRIAÇÃO DA PILHA */
    codigo[i++] = 0x55; codigo[i++] = 0x48; codigo[i++] = 0x89; codigo[i++] = 0xe5;  
    /* ABERTURA DE ESPAÇO NA PILHA PARA ATÉ 5 VARIAVEIS LOCAIS */
    codigo[i++] = 0x48; codigo[i++] = 0x83; codigo[i++] = 0xec; codigo[i++] = 0x20;

    while ((c = fgetc(f)) != EOF) {

        endereco[line - 1] = (long)(&codigo[i]);               //salva endereço inicial de cada instrução: endereço[n-1] - endereço do comando da linha n
        switch (c) {
            case 'r': {                                        //retorno da função
                char var0;
                int idx0;
                if (fscanf(f, "et %c%d", &var0, &idx0) != 2)
                    error("comando invalido", line);
                switch (var0) {
                    case '$': {                                //retorno de constante
                        codigo[i++] = 0xb8;        
                        *((int*)&codigo[i]) = idx0; i += 4;    //salva o inteiro idx0, já em little-endian, no espaço de memória referente aos 4 bytes do array codigo
                        break;
                    }
                    case 'v': {
                        codigo[i++] = 0x8b;
                        codigo[i++] = 0x45;
                        addVarLocal(idx0, line);                
                        break;
                    }
                }
                codigo[i++] = 0xc9; //leave
                codigo[i++] = 0xc3; //ret
                printf("%d ret %c%d\n", line, var0, idx0);
                break;
            }
            case 'v': {                                        //atribuição e operação aritmética
                char var0 = c, c0, var1;
                int idx0, idx1;
                if (fscanf(f, "%d %c", &idx0, &c0) != 2)
                    error("comando invalido", line);
                switch (c0) {
                    case '<': {                                //atribuição
                        if (fscanf(f, " %c%d", &var1, &idx1) != 2)
                            error("comando invalido", line);
                        switch (var1) {
                            case '$': {                        //atribuição de constante
                                codigo[i++] = 0xc7;
                                codigo[i++] = 0x45;
                                addVarLocal(idx0, line);
                                *((int*)&codigo[i]) = idx1; i += 4;
                                break;
                            }
                            case 'v': {                        //atribuição de variável
                                codigo[i++] = 0x44;
                                codigo[i++] = 0x8b;
                                codigo[i++] = 0x55;
                                addVarLocal(idx1, line);
                                codigo[i++] = 0x44;
                                codigo[i++] = 0x89;
                                codigo[i++] = 0x55;
                                addVarLocal(idx0, line);
                                break;
                            }
                            case 'p': {                        //atribuição de parâmetro
                                if (idx1 > MAXPARAM)
                                    error("numero de parametros excedido", line);
                                codigo[i++] = 0x89;
                                switch (idx1) {
                                    case 1:                    //primeiro parâmetro
                                        codigo[i++] = 0x7d;
                                        break;
                                    case 2:                    //segundo parâmetro
                                        codigo[i++] = 0x75;
                                        break;
                                    case 3:                    //terceiro parâmetro
                                        codigo[i++] = 0x55;
                                        break;
                                }
                                addVarLocal(idx0, line);
                                break;
                            }
                        }
                        printf("%d %c%d < %c%d\n", line, var0, idx0, var1, idx1);
                        break;
                    }
                    case '=': {                                 //operação aritmética
                        char var2, op;
                        int idx2;
                        if (fscanf(f, " %c%d %c %c%d", &var1, &idx1, &op, &var2, &idx2) != 5)
                            error("comando invalido", line);
			            if (op != '+' && op != '-' && op != '*')
		                    error("simbolo invalido", line);
                        opera(op, var1, var2, idx0, idx1, idx2, line);
                        printf("%d %c%d = %c%d %c %c%d\n", line, var0, idx0, var1, idx1, op, var2, idx2);
                        break;
                    }
                    default: error("comando invalido", line);
                }
                break;
            }
            case 'i': {                                           //desvio condicional
                char var0;
                int idx0, n;
                if (fscanf(f, "flez %c%d %d", &var0, &idx0, &n) != 3)
                    error("comando invalido", line);

                codigo[i++] = 0x7e; /* código de máquina indicativo de jle */
                jumps[nJumps].posCodigo = i; /* o preenchimento será realizado nessa posição*/
                jumps[nJumps].destino = n;
                jumps[nJumps++].prox = line+1;
                for (int j = 0; j < 4; j++)
                    codigo[i++] = 0x00;
                i++;
                printf("%d iflez %c%d %d\n", line, var0, idx0, n);
                break;
            }
            default: error("comando desconhecido", line);
        }
        line++;
        fscanf(f, " ");
    }

    for (int j = 0; j < nJumps; j++) {
        pos = jumps[j].posCodigo;
        destino = endereco[jumps[j].destino-1];            //endereço de destino do j° jump, localizado na linha n, está gravado no endereço[n-1]
        prox = endereco[jumps[j].prox - 1];
        *((int*)&codigo[pos]) = (int)(destino - prox);     //preenche o local do jump
    }

    cod = (funcp)codigo;
    return cod;
}