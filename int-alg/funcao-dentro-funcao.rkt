;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname funcao-dentro-funcao) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "gui.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp") (lib "gui.rkt" "teachpack" "htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define LISTA (list 4 16 "oi" "fogo"))

;;(text  (map number->string LISTA) 20 "red")

;;(text (foldl string-append ""  LISTA) 20 "red")


;;(text  (map number->string (foldl string-append ""  LISTA)) 20 "red")


;(text (foldl string-append "" (map number->string LISTA)) 20 "red")

;(foldl string-append ""  LISTA)

;Imagine que LISTA é uma lista cujos elementos podem ser  números, imagens ou strings.
;Para somar as raízes quadradas de todos os números que fazem parte da LISTA pode-se usar a expressão
;(use apenas um espaço em branco para separar cada palavra não use espaços entre palavras e parênteses, entre as funções de alta-ordem, use apenas filter, map e/ou foldl):

(define (soma-raizes LISTA)
  (foldl + 0 
    (map sqrt 
      (filter number? LISTA))))


(foldl + 0(map sqrt(filter number? LISTA)))


(define (h n)
   (cond
            [(<= n 0) "Zero"]
            [(= n 1) "Um"]
            [(= n 2) (string-append (h (h1 n)) (h (h2 n)))]
            [else (string-append (h (h3 n)) "*")]))
(define (h1 n) (- n 1))
(define (h2 n) (- n 2))
(define (h3 n) (round (/ n 2)))