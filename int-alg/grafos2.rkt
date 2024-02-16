;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname grafos2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (make-nodo name neighbors);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (list name neighbors))

(define (neighbors a-node a-graph)
  (cond
    ((empty? a-graph) (error 'neighbors "can't happen"))
    (else (cond
	    ((eq? (first (first a-graph)) a-node)
	     (second (first a-graph)))
	    (else (neighbors a-node (rest a-graph)))))))

;; find-route : node node graph  ->  (listof node) or false
;; to create a path from origination to destination in G
;; if there is no path, the function produces false
(define (find-route origination destination G)
  (cond
    [(symbol=? origination destination) (list destination)] ;;;;;;;;;;;;
    [else (local ((define possible-route 
		    (find-route/list (neighbors origination G) destination G)))
	    (cond
	      [(boolean? possible-route) false]
	      [else (cons origination possible-route)]))]))

;; find-route/list : (listof node) node graph  ->  (listof node) or false
;; to create a path from some node on lo-Os to D
;; if there is no path, the function produces false
(define (find-route/list lo-Os D G)
  (cond
    [(empty? lo-Os) false]
    [else (local ((define possible-route (find-route (first lo-Os) D G)))
	    (cond
	      [(boolean? possible-route) (find-route/list (rest lo-Os) D G)]
	      [else possible-route]))]))

(define Q6 (list
            (make-nodo 'D (list 'T 'W 'S 'C 'O 'H))
            (make-nodo 'W (list 'S 'D 'H))
            (make-nodo 'T (list 'S 'D 'C' 'P))
            (make-nodo 'P (list 'T 'I 'N 'C))
            (make-nodo 'A (list 'N))
            (make-nodo 'N (list 'P 'I 'A 'L))
            (make-nodo 'M (list 'L 'K 'E 'N))
            (make-nodo 'L (list 'M 'I 'N))
            (make-nodo 'E (list 'M 'N 'K 'O 'H))
            (make-nodo 'H (list 'W 'D 'O 'E))
            (make-nodo 'O (list 'C 'D 'K 'E 'H))
            (make-nodo 'S (list 'T 'D 'W))
            (make-nodo 'I (list 'C 'N 'P 'L 'K))
            (make-nodo 'N (list 'M 'E))
            (make-nodo 'C (list 'T 'D 'P' 'I 'O))))





