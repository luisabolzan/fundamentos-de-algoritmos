;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname recursao-generativa) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; quicksort
(define (quicksort l)
;; se a l é vazia, devolver empty
  (cond
;; se l não é vazia.
    [(empty? l) empty]
  ;; combinar soluções
    [else
     (append
      ;; a lista ordenada dos elementos da lista l menores que o primeir
      (quicksort (menores l (first l)))
      ;; a lista que contem somente o primeiro elemento da lista l
      (list (first l))
      ;; a lista ordenada dos elementos da lista l maiores que o primeiro
      (quicksort (maiores l (first l))))]))

;;;;;;;;;;;;;;;;;;;;;

(define (maiores lista n)
  (cond
    [(empty? l) empty]
    [(> (first lista) n) (cons (first lista) (maiores (rest lista) n))]
    [else (maiores (rest lista) n)]))

;;;;;;;;;;;;;;;;;;;;;

(define (menores lista n)
  (cond
    [(empty? l) empty]
    [(< (first lista) n) (cons (first lista) (maiores (rest lista) n))]
    [else (maiores (rest lista) n)]))