#include <stdio.h>

int main(void){

    float t1, t2, t3, t_max, t_min, tempo_medio, incertezza;

    printf("Inserire i 3 tempi di oscillazione in secondi ottenuti negli esperimenti: \n");
    scanf("%f%f%f", &t1, &t2, &t3);

    if (t1 > t2){
        if(t1 > t3){
            t_max = t1;
        } else {
            t_max = t3;
        }
    } else {
        if(t2 > t3){
            t_max = t2;
        } else {
            t_max = t3;
        }
    }

    if(t1 < t2) {
        if(t1 < t3) {
            t_min = t1;
      } else {
            t_min = t3;
      }
    } else {
        if(t2 < t3){
            t_min = t2;
        } else {
            t_min = t3;
        }
    }

    tempo_medio = (t1 + t2 + t3) / 3;
    incertezza = ( t_max - t_min) / 2;

    printf("%g, incertezza %g\n", tempo_medio, incertezza);

    return 0;

}