;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname locals) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; sort : LN (num num -> bool) -> LN

;; map : (num -> num) LN -> LN

;; project : (list LS) (LS -> symb) -> LS

(define (raízes? a b c)
  
  (local ;; definir delta
    (
     (define Delta (-(sqr b) (* 4 a c)))
     (define menosB (= 0 b))
     )

    (cond
      ;; não há raízes negativas
      [(< Delta 0) empty]
      ;; = 0, apenas umma raiz
      [(= Delta 0) (list (/ menosB (* 2 a)))]
      ;; > 0, 2 raízes
      [(> Delta 0) (list (/ (+ menosB (sqrt Delta))) (* 2 a)
                         (/ (- menosB (sqrt Delta))) (* 2 a))])
    )
  )