/* Daniel Stulberg Huf 1920468 3WB */
/* João Pedro Khair Cunha 1910626 3WB */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "grava_structs.h"

/* A função abaixo lê um char referente a um tipo 
e retorna a equivalência numérica descrita no enunciado */
char dicionario (char c) {
    switch(c) {
        case 'c':
            return 0;
        case 's':
            return 1;
        case 'i':
            return 2;
        case 'l':
            return 3;
        default:
            return -1;
    }
}

/* A função abaixo realiza o inverso da função de cima,
porém retorna o tipo na forma de uma string de tamanho 1 */
char* dicionario_inverso (unsigned char i) {
    switch(i) {
        case 0:
            return "c";
        case 1:
            return "s";
        case 2:
            return "i";
        case 3:
            return "l";
        default:
            return "-1";
    }
}

/* A função abaixo calcula uma potência de base 2. Tal função foi criada
para que evitássemos usar o pow declarado na biblioteca math.h, que gera
o erro de 'undefined reference to pow' no terminal */ 
int potbase2 (char expoente) {
    int result = 1, base = 2;
    while (expoente != 0) {
        result *= base;
        expoente--;
    }
    return result;
}

/* A função abaixo retorna o maior tamanho
associado a um tipo de um campo da struct */
int maior_tamanho (char *campos) {
  if (strchr(campos, 'l') != NULL)
    return 8;
  else if (strchr(campos, 'i') != NULL)
    return 4;
  else if (strchr(campos, 's') != NULL)
    return 2;
  else
    return 1;
}


int grava_structs (int nstructs, void *valores, char *campos, char ord, char *arquivo) {
  int i, j, k, maximo, pos, tam;
  unsigned char c, bytes_completos, byte_restante, aux;
  
  /* Abertura do arquivo para escrita */
  FILE *arq = fopen(arquivo, "wb");
  if (arq == NULL) {
    printf("Erro na abertura do arquivo. \n");
    return -1;
    }
  
  /* Byte reservado para indicar número de structs armazenadas no arquivo */
  fwrite(&nstructs,1,1,arq);         
  
  /* Byte reservado para indicar a ordenação seguida do número de campos;
  Caso a ordenanção seja little endian, adiciona-se 1 à esquerda do byte*/
  c = strlen(campos);              
  if (ord == 'L')
    c += 128;                         
  fwrite(&c,1,1,arq);
  
  /* Iniciando o processo para gravar os bytes que descrevem os campos das structs */
  bytes_completos = (int)(strlen(campos)/4);
  byte_restante = (strlen(campos))%4;
  
  aux = 0;
  for (i = 0; i < bytes_completos; i++) {                  // itera de 0 ao número de bytes completos 
    for (j = 0; j < 4; j++)                                // 4 = 8 bits / 2, 2 = bits que a descrição do tipo ocupa
      aux += dicionario(campos[4*i + j]) << (2*(3 - j));   // byte a ser gravado é preenchido com os bits que descrevem os tipos
    fwrite(&aux,1,1,arq);
    aux = 0;
  }
  
  for (j = 0; j < byte_restante; j++)                      
    aux += dicionario(campos[4*i+j]) << (2*(3 - j));       // ultimo byte a ser gravado vai sendo preenchdo com os bits que descrevem os campos
  if (byte_restante != 0)                                  // tal byte só é gravado se contiver pelo menos 1 descrição de tipo
    fwrite(&aux,1,1,arq);

  /* Iniciando o processo para gravar os bytes com os dados das structs */
  maximo = maior_tamanho(campos);
  pos = 0;
  for (i = 0; i < nstructs; i++) {                         // itera de 0 ao número de structs do array
    for (j = 0; j < strlen(campos); j++) {                 // itera de 0 ao número de campos da struct
      tam = potbase2(dicionario(campos[j]));                    // tam = tamanho do tipo corrente
      if (pos%tam != 0)                                    // posições onde há paddings são "puladas"
        pos += tam - pos%tam;
      if (ord == 'L')                                      // little endian-> valores dos campos vão sendo gravados pela ordem "natural" dos processadores Intel (do byte menos para o mais significativo)
        for (k = 0; k < tam; k++)
          fwrite(valores + pos + k, 1, 1, arq);
      else                                                 // big endian-> deve-se inverter a ordem "natural" do processador Intel (do byte mais para o menos significativo)
        for (k = tam - 1; k >= 0; k--)
          fwrite(valores + pos + k, 1, 1, arq);
      pos += tam;
    }
    if (pos%maximo != 0)                                   // "completa" a posição que deve ser múltipla do tamanho do maior tipo da struct, preparando a posição correta da próxima sruct do array
        pos += maximo - pos%maximo;  
  }
  
  fclose(arq);
  return 0;
}

void dump_structs (char *arquivo) {
  int i, j, k, bytes_completos, byte_restante, tam;
  unsigned char nstructs, tipo, ncampos, byte_campo, byte_valor, aux;
  char* campos;
  
  /* Abertura do arquivo para leitura */
  FILE *arq = fopen(arquivo, "rb");
  if (arq == NULL) {
    printf("Erro na abertura do arquivo. \n");
    return;
  }
  
  /* Leitura dos 2 primeiros bytes de cabeçalho */
  fread(&nstructs, 1, 1, arq);
  fread(&tipo, 1, 1, arq);
  
  if (tipo > 127)                                           // Se segundo byte do arquivo possui 1 à esquerda, ord = L. Caso contrário, ord = B.
    printf("L\n");
  else
    printf("B\n");
  printf("%d\n*\n", nstructs);
  
  ncampos = (tipo<<1);                                     // ncampos = segundo byte do arquivo com o bit 0 à esquerda
  ncampos >>= 1;
  
  /* Processo para criar uma string com os tipos das structs, equivalente ao terceiro parâmetro (campos) da função grava_structs */
  campos = (char*)malloc(ncampos+1);
  strcpy(campos,"");                                      
  
  bytes_completos = (int)(ncampos/4);
  byte_restante = ncampos%4;
  
  for (i = 0; i < bytes_completos; i++) {                  // itera de 0 ao número de bytes completos do cabeçalho (a partir da terceira linha do cabeçalho)
    fread(&byte_campo, 1, 1, arq);
    for (j = 0; j < 4; j++) {                              // itera sobre o byte lido 4 vezes. A cada vez, à string dos tipos é concatenado um tipo (c, s, i ou l), obtido via manipulação bit a bit do byte lido e "convertido" para string via dicionário inverso
      aux = byte_campo;
      aux <<= (2*j);
      aux >>= 6;
      strcat(campos, dicionario_inverso(aux));
    }
  }
  
  if (byte_restante > 0) {                                 // só é lido mais um byte caso haja de fato um byte com informações sobre os tipos dos campos, completado com 0´s à direita
    fread(&byte_campo, 1, 1, arq);
    for (j = 0; j < byte_restante; j++) {                  // itera de 0 ao número de tipos que ainda existem no byte restante
      aux = byte_campo << (2*j);
      aux >>= 6;
      strcat(campos, dicionario_inverso(aux));
    }
  }
  
  /* Iniciando o processo para ler os bytes associados aos dados das structs e printar no devido formato solicitado*/
  for (i = 0; i < nstructs; i++) {                         // itera de 0 ao número de structs do array
    for (j = 0; j < strlen(campos); j++) {                 // itera de 0 ao número de campos de cada struct
      tam = potbase2(dicionario(campos[j]));               // tam = tamanho do tipo corrente
      for (k = 0; k < tam; k++) {                          // itera de 0 ao tamanho do tipo corrente
        fread(&byte_valor, 1, 1, arq);                     // faz a leitura byte a byte
        printf("%02x ",byte_valor);                        // printa no formato hexadecimal
      }
      printf("\n");
    }
    printf("*\n");
  }
  fclose(arq);
  return;
}