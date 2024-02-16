;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname prova2-tentativa) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #t ((lib "image.rkt" "teachpack" "2htdp")) #f)))
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

(define A1 (make-artigo 'A1 (list 'Aut1 'Aut2) (list 'esse 'é 'um 'texto)))
(define TC1 (list 'cientifico))
(define TC2 (list 'mais 'um 'texto))
(define A2 (make-artigo 'A2 (list 'Aut2 'Aut3)  TC2))

; Desenvolva uma função que recebe um artigo e um símbolo. A função deve
; retornar o número total de ocorrências do símbolo no próprio artigo e em todos os artigos
; referenciados a partir do artigo inicial (passado como parâmetro). Note que se A referencia
; B, e B referencia C, então C é referenciado a partir do artigo inicial A.

;; num-oc: artigo simbolo -> numero
;; dados um artigo e um simbolo, a funcao devolve o numero de ocorrencias do simbolo no artigo e em todos os artigos referenciados a partir dele.
;; Exemplos: (num-oc A2 'um) = 1
;;           (num-oc A1 'dois) = 0

(define (num-oc art simb)
  (num-oc-txt (artigo-texto art) simb))

;; num-oc-txt: artigo simbolo -> numero
;; dados um artigo e um simbolo, a funcao devolve o numero de ocorrencias do simbolo no artigo.
;; Exemplos: (num-oc-txt (list 'esse 'é 'um 'texto) 'esse) = 1
;;           (num-oc-txt (list 'esse 'é 'um 'texto) 'jogo) = 0

(define (num-oc-txt txt simb)
  (cond
    [(empty? txt) 0] ;; se o texto estiver vazio, o número de ocorrências é 0.
    [else
     (+
      (cond
        [(and (symbol? (first txt)) (symbol=? (first txt) simb)) 1] ;; se o primeiro elemento for igual ao simb, soma 1
        [(artigo? (first txt)) (num-oc (first txt) simb)] ;; se for um artigo, coloca na funçao principal o artigo e começa a contar tudo dentro dele
        [else 0]) ;; senão, soma 0
      (num-oc-txt (rest txt) simb))] ;; continua ate terminar a lista  
    )
  )

; (artigo? (first txt)): Isso verifica se o primeiro elemento do texto (txt) é um artigo.
; A função artigo? é uma função que verifica se o argumento passado é uma estrutura de dados representando um artigo.

; (num-oc (first txt) simb): Se o primeiro elemento do texto for de fato um artigo, a expressão chama recursivamente a função num-oc com dois argumentos:
; (first txt) (o artigo) e simb (o símbolo que estamos contando). Isso é feito para explorar as ocorrências do símbolo não apenas no texto atual, mas também nos textos dos artigos referenciados a partir deste artigo.

; Dessa forma, se o primeiro elemento do texto for um artigo, a função num-oc será chamada recursivamente para processar esse artigo,
; aumentando assim a contagem total de ocorrências do símbolo não apenas no artigo atual, mas em todos os artigos referenciados a partir dele.
; Esse processo de recursão permite analisar profundamente a estrutura hierárquica dos artigos e contar as ocorrências do símbolo em todos os níveis.


; Para fazer estatísticas sobre as palavras contidas em artigos, pode-se utilizar
; funções que, dados um artigo, uma palavra e um número, compara este número com o
; número de ocorrências da palavra no artigo (ou em artigos referenciados por ele). Para não
; termos que fazer uma função para cada tipo de comparação possível, seria interessante termos uma função genérica,
; que recebe, além dos argumentos acima, o critério de comparação que deve ser usado.
; Faça uma função de alta-ordem para implementar esta análise de um
; artigo. Construa uma critério de comparação (diferente dos operadores relacionais <, >, =,
; etc), e use seu critério como um dos exemplos na definição da função de alta-ordem.

;; estatisticas : artigo simbolo numero (numero numero -> booleano) -> booleano
;; dados um artigo, um simbolo, um numero e um criterio de comparacao, compara o numero dado com o numero de ocorrencias da palavra no artigo
;; ex: (estatisticas A1 'um 2 metade) = true
;;     (estatisticas A1 'um 4 metade) = false

(define (estatisticas art simb num crit)
  (crit (num-oc art simb) num))
  
;; metade : numero numero -> booleano
;; dados dois numeros, verifica se o primeiro equivale a metade do segundo numero.
;; ex: (metade 1 2) = true
;;     (metade 3 2) = false

(define (metade num1 num2)
  (= num1 (/ num2 2)))

; Desenvolva um algoritmo que, dada uma palavra e um artigo, retorna os nomes
; dos autores que citaram esta palavra no texto de seus artigos. A pesquisa deve englobar
; todos artigos referenciados a partir do artigo recebido (incluindo este). Se a palavra não
; ocorrer em nenhum artigo, a função deve retornar false.

;; listadesimbOUbooleano é um tipo misto que é um
;; 1. lista de simbolos ou
;; 2. booleano

;; retorna-aut : artigo simbolo -> listadesimbOUbooleano
;; dados uma palavra e um artigo, devolve os nomes dos autores que citaram esta palavra no texto de seus artigos
;; ex: (retorna-aut A2 'um) = (list 'Aut2 'Aut3)

(define (lista-aut art simb)
  (cond
    [(empty? (retorna-aut art simb)) #false] ;; se a palavra n foi citada, devolve false
    [else (retorna-aut art simb)])) ;; senão, retorna os nomes dos autores


(define (retorna-aut art simb)
  (cond
    [(= 0 (num-oc art simb)) empty] ;; se nao tiver ocorrencias da palavra, devolve empty -> virara false
    [else (append ;; senao, junta
           (artigo-autores art) ;; os autores do artigo
           (retorna-aut-txt (artigo-texto art) simb))])) ;; os autores dos subartigos


(define (retorna-aut-txt txt simb)
  (cond
    [(empty? txt) empty] ;; se a lista tiver vazia, devolve empty
    [(symbol? (first txt)) (retorna-aut-txt (rest txt) simb)] ;; se for um simbolo, devolve os autores que citaram o simbolo no resto do texto
    [(artigo? (first txt)) (append ;; se for um artigo, junta
                            (retorna-aut (first txt) simb) ;; lista de autores que citaram essa palavra neste artigo
                            (retorna-aut-txt (rest txt) simb))])) ;; lista de autores que citaram essa palavra no resto do texto

     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;







 