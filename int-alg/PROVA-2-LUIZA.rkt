;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname PROVA-2-LUIZA) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct cafeteria (produto string-nome valor))
(define-struct produto (nome valor))
(define-struct cliente (nome pedidos))
(define-struct pedido (nome quantidade))


(define AGUA  (make-pedido "Agua" 5))
(define CAFE (make-pedido "Cafe" 7))
(define PAO (make-pedido "Pao" 1))
 
(define JULIA (make-cliente "Julia" (list CAFE)))
(define ALICE (make-cliente "Alice" (list AGUA AGUA JULIA PAO)))


; A)ler BEM e declarar TIPO MISTO

; B)

; Define a função 'imprime-pedidos' que imprime os pedidos de um cliente
(define (imprime-pedidos cliente)
  (cond
    [(empty? (cliente-pedidos cliente)) empty] ; Se a lista de pedidos do cliente estiver vazia, retorna vazio
    [(pedido? (first (cliente-pedidos cliente))) ; Se o primeiro item da lista de pedidos for um pedido
     (cons (first(cliente-pedidos cliente)) (imprime-pedidos (novo-cliente cliente)))] ; Adiciona o pedido à lista de pedidos impressos e chama a função novamente para o restante da lista
    [(cliente? (first (cliente-pedidos cliente))) ; Se o primeiro item da lista de pedidos for um cliente
     (append (imprime-pedidos (first(cliente-pedidos cliente))) (imprime-pedidos (novo-cliente cliente)))])) ; Adiciona os pedidos do cliente à lista de pedidos impressos e chama a função novamente para o restante da lista

; Define a função 'novo-cliente' que cria um novo cliente com o mesmo nome, mas com a lista de pedidos reduzida
(define (novo-cliente cliente)
  (make-cliente (cliente-nome cliente) (rest(cliente-pedidos cliente))))

(define (lista-pedidos cliente)
  (cond
    [(empty? (cliente-pedidos cliente)) empty]
    [(pedido? (first(cliente-pedidos cliente)))
     (cons (first(cliente-pedidos cliente)) (lista-pedidos (novo-cliente cliente)))] ;; chama a função pro RESTO da lista
    [(cliente? (first(cliente-pedidos cliente)))
     (append ;; junta
      (lista-pedidos (first(cliente-pedidos cliente))) ;; chamando a função para esse cliente
      (lista-pedidos (novo-cliente cliente)))])) ;; com o antigo

; C)
;filtrar os pedidos pela quantidade, ele queria q tu devolvesse só os menores que dois
(define (filtra-quantidade cliente)
  ;; ja q o pedido nao ta sendo passado, precisa usar lambda
  (filter (lambda (pedido) (< (pedido-quantidade pedido) 2)) (imprime-pedidos cliente)))

(define (menor-q-2? pedido)
  (< (pedido-quantidade pedido) 2))
  
(define (filtra-qnt cliente)
  (filter menor-q-2? (imprime-pedidos cliente)))


; A função lambda é usada para criar uma função anônima, ou seja, uma função sem nome.
; No contexto de filter, a função lambda é usada para definir a função que filter aplicará a cada elemento da lista.

; Vamos ver um exemplo:

(filter (lambda (x) (< x 2)) '(1 2 3 4 5))

; Neste exemplo, filter aplica a função lambda a cada elemento da lista (1 2 3 4 5).
; A função lambda verifica se um número x é menor que 2.
; Portanto, filter retorna uma nova lista que contém apenas os números que são menores que 2.
; Neste caso, a lista resultante seria (1).


; D) criar uma função auxiliar pra função principal (ALTA ORDEM!!!) nessa questão tinha uma “fidelidade” na cafeteria
; (função principal é fidelidade-café, por exemplo) e ela deveria receber uma lista de clientes e a função da fidelidade
; (função auxiliar, tu que escolhia sobre o que era a questão auxiliar, no meu caso, ganhava fidelidade a pessoa que comprou mais cappuccinos)
; e devolver o cliente “vencedor” da fidelidade. Não esqueçam da documentação de
; Alta-Ordem: FUNÇÃO: nomedafuncao: listaDeClientes (cliente -> número) -> cliente.
; Talvez essa questão devolveria ClienteOUString, caso houvesse empate por exemplo
; (pensei nisso escrevendo isso, estou em completo desespero, e não lembro se pedia pra considerar empate ou não) aí precisava
; desenvolver um Tipo Misto. Nessa precisava fazer terminação.


(define (fidelidade-café clientes fun)
  (cond 
    [(empty? clientes)0]
    [(>(fun (first clientes))(fidelidade-café(rest clientes) fun))(first clientes)]
    [else (fidelidade-café(rest clientes) fun)]))

(define (conta-cappucino cliente)
  (cond
    [(empty? (cliente-pedidos cliente)) 0] 
    [(cliente? (first(cliente-pedidos cliente))) 
     (+ (conta-cappucino(first(cliente-pedidos cliente)))(conta-cappucino (novo-cliente cliente)))]
    [(string=? "Cappuccino" (pedido-nome (first(cliente-pedidos cliente))))
     (+ 1 (conta-cappucino(novo-cliente cliente)))]
    [(pedido? (first(cliente-pedidos cliente)))
     (conta-cappucino (novo-cliente cliente))]))










