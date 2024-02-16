;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname PROVA2-TESTE) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #t ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (testa-soma x y z)
  (local (
          (define (soma i nivel)
            (cond
              [(or (> x y) (< x 1) (< y 1)) 'ArgumentosInvalidos]
              [(= i y) i]
              [(= nivel 1) (+ (soma i 2) (soma (+ i 2) 1))]
              [else (+ i (soma (+ i 1) 2))]
              )
            )
          (define SOMA (soma x 1))
          )
    (cond
      [(symbol? SOMA) SOMA]
      [(> SOMA z) 'Maior]
      [(< SOMA z) 'Menor]
      [(= SOMA z) SOMA]
      )
    )
  )

;Claro, vamos acompanhar o passo a passo da execução de (testa-soma 2 4 7):

;A função testa-soma é chamada com x = 2, y = 4 e z = 7.
;A função soma é chamada pela primeira vez com i = x = 2 e nivel = 1.
;Como i não é igual a y e nivel é igual a 1, a função soma faz duas chamadas recursivas:
;Primeira chamada: soma(2, 2).
;Como i não é igual a y e nivel não é igual a 1, a função soma faz uma chamada recursiva: soma(3, 2).
;Como i não é igual a y e nivel não é igual a 1, a função soma faz uma chamada recursiva: soma(4, 2).
;Como i é igual a y, a função soma retorna 4.
;A função soma retorna 3 + 4 = 7.
;A função soma retorna 2 + 7 = 9.
;Segunda chamada: soma(4, 1).
;Como i é igual a y, a função soma retorna 4.
;A função soma retorna 9 + 4 = 13. Portanto, SOMA = 13.
;Como SOMA é maior que z, a função testa-soma retorna ‘Maior’.
;Espero que isso ajude a entender o passo a passo da execução de (testa-soma 2 4 7). Se você tiver mais perguntas, fique à vontade para perguntar.