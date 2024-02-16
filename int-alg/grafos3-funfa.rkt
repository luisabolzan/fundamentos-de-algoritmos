;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname grafos3-funfa) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (make-nodo name neighbors);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (list name neighbors))


(define (neighbors a-node a-graph)
  (cond
    [(empty? a-graph) (error 'neighbors "can't happen")]
    [else (cond
	    [(eq? (first (first a-graph)) a-node)
	     (second (first a-graph))]
	    [else (neighbors a-node (rest a-graph))])]))


(define (find-route origination destination G visited)
  (cond
    [(symbol=? origination destination) (list destination)]
    [else (if (member origination visited)
              false
              (let ((new-neighbors (remove (lambda (x) (member x visited)) (neighbors origination G))))
                (if (null? new-neighbors)
                    false
                    (let ((possible-route (find-route/list new-neighbors destination G (cons origination visited))))
                      (if (boolean? possible-route)
                          false
                          (cons origination possible-route))))))]))

(define (find-route/list lo-Os D G visited)
  (cond
    [(empty? lo-Os) false]
    [else (let ((possible-route (find-route (first lo-Os) D G visited)))
            (if (boolean? possible-route)
                (find-route/list (rest lo-Os) D G visited)
                possible-route))]))


(define Q6 '(
            (D (T W S C O H))
            (W (S D H))
            (T (S D C P))
            (P (T I N C))
            (A (N))
            (N (P I A L))
            (M (L K E N))
            (L (M I N))
            (E (M N K O H))
            (H (W D O E))
            (O (C D K E H))
            (S (T D W))
            (I (C N P L K))
            (N (M E))
            (C (T D P I O))))



