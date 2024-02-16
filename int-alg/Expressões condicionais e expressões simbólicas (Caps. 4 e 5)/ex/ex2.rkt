;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (calcula-nota nota1 nota2 nota3)
  (/
   (+ nota1
      (* nota2 2)
      (* nota3 3))
    6))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; mostra-media: numero -> imagem

(define (num n)
  (exact->inexact (/ (round (* n 100)) 100))) ;;;; nao entendi o que isso faz

(define (mostra-media n)
  (overlay
   (text (number->string (num n)) 20 "black")
   (star 60 "solid" "yellow")))
