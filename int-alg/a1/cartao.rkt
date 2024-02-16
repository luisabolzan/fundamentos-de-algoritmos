;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cartao) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct CartãoCrédito (número bandeira validade CVV))
;; Um elemento do conjunto CartãoCrédito tem o formato
;;     (make-CartãoCrédito um-número uma-bandeira uma-validade um-CVV), onde
;; um-número: Número, é o número do cartão de crédito
;; uma-bandeira: Símbolo, é a bandeira do cartão, exemplo: visa, master...
;; uma-validade: Número (1 a 12), é o mês de vencimento do cartão
;; um-CVV: Número, é o código de segurança do cartão (3 dígitos)

(define MEU-CARTÃO (make-CartãoCrédito 123456789 'Visa 12 911))