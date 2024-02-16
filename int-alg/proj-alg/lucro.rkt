;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lucro) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (lucro preço-do-ingresso)
 (- (receita preço-do-ingresso)
 (custo preço-do-ingresso)))

(define (receita preço)
 (* (nro-espectadores preço)
 preço))

(define (custo preço)
 (+ 180
 (* 0.04 (nro-espectadores preço))))

(define (nro-espectadores preço)
 (+ 120
 (* 150 (- 5 preço))))