;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname flags) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
"hello world"

(define BarraVermelha (rectangle 30 60 "solid" "red"))
(define BarraVerde (rectangle 30 60 "solid" "darkgreen"))
(define LinhaVerde (rectangle 90 20 "solid" "forestgreen"))
(define BarraAzul (rectangle 30 60 "solid" "blue"))
(define LinhaAzul (rectangle 90 20 "solid" "blue"))
(define BarraBranca (rectangle 30 60 "solid" "white"))
(define LinhaBranca (rectangle 90 20 "solid" "white"))
(define BarraAmarela (rectangle 30 60 "solid" "yellow"))
(define BarraPreta (rectangle 30 60 "solid" "black"))
(define LinhaPreta (rectangle 90 20 "solid" "black"))

(overlay
 (rectangle 15 40 "solid" "white")
 (rectangle 40 15 "solid" "white")
 (beside BarraVermelha BarraVermelha BarraVermelha))

(define (bandeira cor1 cor2 cor3) ;;função bandeira
  (beside
  (rectangle 30 60 "solid" cor1)
  (rectangle 30 60 "solid" cor2)
  (rectangle 30 60 "solid" cor3)))

(beside BarraVermelha
        (above LinhaVerde LinhaBranca LinhaPreta))

(beside
(above
 (overlay
  (star 15 "solid" "blue")
  (rectangle 60 30 "outline" "grey"))
 (rectangle 60 30 "solid" "blue"))
 (above
  (rectangle 60 30 "solid" "red")
   (overlay
    (star 15 "solid" "red")
    (rectangle 60 30 "outline" "grey"))))