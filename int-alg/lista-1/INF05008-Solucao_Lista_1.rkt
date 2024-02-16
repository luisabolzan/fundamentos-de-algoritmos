;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lista-1-resolvida) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; Exercício 1 ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Item a

(/ (+ 5 3) 4)

;; Item b

(- (sqrt 9) 1)

;; Item c

(+ (sin (/ pi 2)) 1)

;; Item d

(* (- (sqrt (expt 5 4)) (log e)) (/ 1 12))

;; Item e

(/
 (+ -4
    (sqrt (- (expt 4 2) (* 4 2 -16))))
 (* 2 2))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; Exercício 2 ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (area-circulo raio)
  (* pi (* raio raio)))

(define (volume-cilindro r a)
  (* (area-circulo r) a))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; Exercício 3 ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (bhaskara a b c)
  (/ (+ (- b) (sqrt (- (expt b 2) (* 4 a c)))) (* 2 a)) )

(bhaskara 2 4 -16)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; Exercício 4 ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (calcula-nota p1 p2 p3 p4 nt np)
  (+ (* 0.5 (/ (+ p1 p2 p3 p4) 4)) (* 0.3 nt) (* 0.2 np)))

(calcula-nota 8 9 7 9.5 8.5 9)

