;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname teste-prova1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (Num1-4 num)
  (cond
    [(and (number? num) (> num 0) (< num 5)) "Válido"]
    [else "Inválido"]))

(define (NumVotos LV num)
  (cond
    [(string=? (Num1-4 num) "Inválido") "Candidato Inexistente"]
    [else
     (cond
       [(empty? LV) 0]
       [(not (number? (first LV)))  (+ 0 (NumVotos (rest LV) num))]
       [(= (first LV) num) (+ 1 (NumVotos (rest LV) num))]
       [else (+ 0 (NumVotos (rest LV) num))])]))

(define-struct Resultado (num votos))
      
(define (registro-soma-1 res)
  (cond
    [(string=? (Num1-4 (Resultado-num res)) "Válido") (make-Resultado (Resultado-num res) (+ (Resultado-votos res) 1))]
    [else (make-Resultado (Resultado-num res) (Resultado-votos res))]))

(define POSN1 (make-posn 2 3))
(define POSN2 (make-posn 2 4))
(define POSN3 (make-posn 4 3))

(define LISTA1 (cons POSN1 (cons POSN2 empty)))