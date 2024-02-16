;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname solucao-parcial-p2-exemplo) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))
;; Atenção: esta é uma solução parcial do exemplo de prova 2, não está completa.

(define-struct artigo (titulo autores texto))
;; Um artigo do conjunto Artigo é uma estrutura
;; (make-artigo t aut txt)
;; onde t : Simbolo, é o título do artigo;
;; aut : Lista-de-simbolos , é a lista de autores do artigo; e
;; txt : Texto-cientifico, é o texto do artigo.

;; Uma Lista-de-simbolos é
;; 1) empty ou
;; 2) (cons s ls), onde s é Simbolo e ls é Lista-de-símbolos

;; Um Texto-cientifico é
;; 1) empty, ou
;; 2) (cons s tc), onde s é um Símbolo e tc é do tipo Texto-científico;
;; 3) (cons a tc), onde a é um Artigo, e tc é do tipo Texto-cientifico.

;; (a)

;; definir constantes do tipo Artigo e Text-cientifico

(define A1 (make-artigo 'Titulo1 (list 'Aut1 'Aut2) (list 'um 'um)))
(define T1 (list 'este 'é 'um 'texto))
(define T2 (list 'este 'é 'um 'texto 'com 'subtexto A1 A1))
(define A2 (make-artigo 'Titulo2 (list 'Aut2 'Aut3) T2))

;; (b)

;; numero-ocorrencias: Artigo Simbolo -> Numero
;; Dados um artigo e uma palavra, devolve o numero de ocorrecnias desta palavra
;; neste artigo ou em seus sub-artigos
;; Exemplos/testes:
   (check-expect (numero-ocorrencias A1 'X) 0)
   (check-expect (numero-ocorrencias A2 'um) 5)

(define (numero-ocorrencias art pal)
  ;; devolver o numero de ocorrencias de pal no texto do artigo art
  (numero-ocorrencias-texto (artigo-texto art) pal))

;; numero-ocorrencias-texto: Texto-cientifico Simbolo -> Numero
;; Dados um texto e uma palavra, devolve o numero de ocorrencias desta palavra
;; neste texto incluindo os artigos contidos neste texto
;; Exemplos/testes:
   (check-expect (numero-ocorrencias-texto (list 'um 'um) 'X) 0)
   (check-expect (numero-ocorrencias-texto T2 'um) 5)

(define (numero-ocorrencias-texto txt pal)
  (cond
  ;; se o txt for vazio, devolver 0
  [(empty? txt) 0]
  ;; se o primeiro elemento de txt for simbolo e for a palavra pal, somar um
  ;;    ao numero de ocorrncias de pal no resto do texto
  [(and (symbol? (first txt)) (symbol=? (first txt) pal))
   (+ 1 (numero-ocorrencias-texto (rest txt) pal))]
  ;; se o primeiro elemento de txt for simbolo e nao for a palavra pal, 
  ;;    devolver o numero de ocorrencias de pal no resto do texto
   [(symbol? (first txt)) 
    (numero-ocorrencias-texto (rest txt) pal)]   
  ;; se o primeiro elemento de txt for artigo, somar
  ;;    o numero de ocorrencias de pal no artigo (primeiro elemento do texto) ao
  ;;    o numero de ocorrencias de pal no resto do texto
  [(artigo? (first txt))
   (+ (numero-ocorrencias (first txt) pal)
      (numero-ocorrencias-texto (rest txt) pal))])) 

;; outra opção:
(define (numero-ocorrencias-texto-1 txt pal)
  (cond
  ;; se o txt for vazio, devolver 0
  [(empty? txt) 0]
  ;; senão, somar o número de ocorrências de pal no primeiro elemento de txt
  ;;        com o número de ocorrências de pal no resto de txt
  [else (+ ;; somar
          (cond
             ;; se o primeiro elemento de txt for simbolo e for a palavra pal, somar um
             [(and (symbol? (first txt)) (symbol=? (first txt) pal)) 1]
             ;; se o primeiro elemento de txt for artigo, somar
             ;;    o numero de ocorrencias de pal no artigo --> chamo o NUMERO-OCORRENCIAS pra contar as ocorrencias dentro daquele artigo e juntar com o resto
             [(artigo? (first txt)) (numero-ocorrencias (first txt) pal)]
             ;; senão, somar 0
             [else 0])
          ;; ao numero de ocorrencias de pal no resto do texto
          (numero-ocorrencias-texto-1 (rest txt) pal))])) 


  ;; (d)

;; Uma Lista-de-simbolosOUBooleano é
;; 1. Uma Lista-de-simbolos, ou
;; 2. Um Booleano

;; lista-autores: Artigo Simbolo -> Lista-de-simbolosOUBooleno
;; Dados um artigo e uma palavra, devolve os nomes dos autores que citaram esta paralvra no
;; neste artigo ou em sub-artigos. Se a palavra não foi citada, devolver false.
;; Exemplos/testes:
   (check-expect (lista-autores A1 'casa) false)
   (check-expect (lista-autores A2 'um) (list 'Aut2 'Aut3 'Aut1 'Aut2 'Aut1 'Aut2))

(define (lista-autores art pal)
  (cond
  ;; se a palavra pal nao foi citada no texto do artigo ou seus sub-artigos,
  ;; deveolver false
  [(empty? (busca-autores art pal)) false]
  ;; senao, devolver os nomes dos autores que citam esta palavra
  [else (busca-autores art pal)]))

;; busca-autores: Artigo Simbolo -> Lista-de-simbolos
;; Dados um artigo e uma palavra, devolve os nomes dos autores que citaram esta paralvra no
;; neste artigo ou em sub-artigos
;; Exemplos/testes:
   (check-expect (busca-autores A1 'casa) empty)
   (check-expect (busca-autores A2 'um) (list 'Aut2 'Aut3 'Aut1 'Aut2 'Aut1 'Aut2))
 
(define (busca-autores art pal)
  (cond
  ;; se a palavra pal nao foi citada no texto do artigo ou seus sub-artigos,
  ;; deveolver empty
  [(= 0 (numero-ocorrencias art pal)) empty]
  ;; senao, juntar os nomes dos autores do artigo art aos
  ;;         nomes de autores citados por art que citam esta palavra
  [else (append (artigo-autores art)
                (busca-autores-texto (artigo-texto art) pal))]))

;; busca-autores-texto : Texto-cientifico Simbolo -> Lista-de-simbolos
;; Dados um texto e uma palavra, devolve os autores de aub-artigos que citaram esta  palavra
;; Exemplos/testes:
   (check-expect (busca-autores-texto (list 'um 'um) 'X) empty)
   (check-expect (busca-autores-texto T2 'um) (list 'Aut1 'Aut2 'Aut1 'Aut2))

(define (busca-autores-texto txt pal)
  (cond
  ;; se o txt for vazio, devolver a lista vazia
  [(empty? txt) empty]
  ;; se o primeiro elemento de txt for simbolo ,
  ;;    devolver os autores de artigos que citaram pal no resto do texto
  [(symbol? (first txt))
   (busca-autores-texto (rest txt) pal)] 
  ;; se o primeiro elemento de txt for artigo, juntar
  ;;    a lista de autores que citaram pal neste artigo (primeiro elemento do texto) a
  ;;    lista de autores que citaram pal no resto do texto
  [(artigo? (first txt))
   (append (busca-autores (first txt) pal)
           (busca-autores-texto (rest txt) pal))]))

;; (c)
;; analisa-artigo: Artigo Simbolo Numero (Numero Numero -> Booleno) -> Booleano
;; Dados um artigo, uma palavra, um numero de ocorrencias e um critério de análise,
;; verifica se a palavra ocorre no texto do artigo de acordo com o critério dado.
;; Exemplos/testes:
   (check-expect (analisa-artigo A1 'um 1 =) false)
   (check-expect (analisa-artigo A2 'um 5 =) true)
   (check-expect (analisa-artigo A2 'um 10 >) false)
   (check-expect (analisa-artigo A2 'um 10 dobro?) true)

(define (analisa-artigo art pal num fun-comp)
  (fun-comp (numero-ocorrencias art pal) num))

;; critério de comparação:
;; dobro?: Numero Numero -> Booleano
;; Dados dois números, verifica se o segundo é o dobro do primeiro.
;; Exemplos/testes:
   (check-expect (dobro? 2 4) true)
   (check-expect (dobro? 2 3) false)
(define (dobro? num1 num2)
  (= (* 2 num1) num2)) 




