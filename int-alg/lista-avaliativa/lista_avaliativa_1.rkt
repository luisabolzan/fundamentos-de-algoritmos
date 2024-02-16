;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lista_avaliativa_1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;#####################################################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 #####
;#####################################################################################################
;=====================================================================================================
;Defina um tipo de dados chamado Pet, que deve registrar o nome do animal de estimação (pet), a sua cor,
;a sua idade, o nome do seu dono e de que tipo de animal ele é (ex.: "Gato", "Cachorro", "Cavalo", etc).
;Defina 4 constantes cujos valores sejam do tipo Pet. Adicionalmente, defina um tipo de dados chamado
;Vet, que deve registrar o nome do veterinário, o seu turno de plantão, a sua especialidade (se realiza
;atendimento em "Gato", "Cachorro", "Cavalo", etc) e os três Pets que ele pode realizar o atendimento.
;Defina 4 constantes cujos valores sejam do tipo Vet.
;=====================================================================================================
;; Pet: String String Número String String -> String String Número String String
;; Objetivo: 

(define-struct Pet (nome cor idade dono tipo))
;;(make-Pet um-nome uma-cor uma-idade um-dono um-tipo)
;; onde:
;; um-nome: String, indica o nome do Pet
;; uma-cor: String, indica a cor do Pet
;; uma-idade: Número, indica a idade do Pet
;; um-dono: String, indica o nome do dono do Pet
;; um-tipo: String, especifica qual o tipo/raça do Pet

(define CACHORRO-CARAMELO
  (make-Pet "Zeus" "Caramelo" 5 "José" "Cachorro"))
(define GATO-LISTRADO
  (make-Pet "Gatão" "Cinza Listrado" 3 "Lucas" "Gato"))
(define SHIH-TZU
  (make-Pet "Nino" "Preto/Branco" 9 "Luísa" "Cachorro"))
(define PIUPIU
  (make-Pet "Zeca" "Amarelo" 5 "Maria" "Pássaro"))

;--------------------------------
; TIPO PetOuString:
; 1) pet
; 2) string
;--------------------------------

(define-struct Vet (nome-vet turno-plantão especialidade pet1 pet2 pet3))
;;(make-Vet um-nome-vet um-turno-plantão uma-especialidade)
;; onde:
;; um-nome-vet: String, indica o nome do Vet
;; um-turno-plantão: SímboloOuString, indica em qual turno é o plantão do veterinário
;; uma-especialidade: SímboloOuString, especifica em qual tipo/raça o veterinário é especialista
;; um-pet1: PetOuString, indica o primeiro Pet
;; um-pet2: PetOuString, indica o segundo Pet
;; um-pet3: PetOuString, indica o terceiro Pet
  (define ANA
    (make-Vet "Ana" "Manhã" "Cachorro" CACHORRO-CARAMELO SHIH-TZU (make-Pet "Doguinho" "Preto" 7 "Mário" "Cachorro")))
  (define BEATRIZ
    (make-Vet "Jorge" "Tarde" "Pássaro" PIUPIU (make-Pet "Paz" "Branca" 2 "Malala" "Pássaro") (make-Pet "Louro José" "Verde" 15 "Ana Maria" "Pássaro")))
  (define CARLOS
    (make-Vet "Jorge" "Noite" "Gato" GATO-LISTRADO (make-Pet "Garfield" "Laranja" 9 "Jon" "Gato") (make-Pet "Miau" "Preto" 8 "Fernando" "Gato")))
  (define DANIEL
    (make-Vet "Jorge" "Manhã" "Cavalo" (make-Pet "Ártemis" "Prata" 6 "Réia" "Cavalo") (make-Pet "Apolo" "Azul" 7 "Zeus" "Cavalo") (make-Pet "Afrodite" "Dourado" 7 "Cibele" "Cavalo")))

;; Testes:

   
;#####################################################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 #####
;#####################################################################################################


;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################
;=====================================================================================================
;Desenvolva um função que recebe como parâmetro de entrada um Pet ou uma string, tendo como objetivo
;realizar a verificação se um dada posição da agenda (Pets a serem atendidos) do veterinário está
;ocupada (retornando falso) ou está disponível (retornando verdadeiro) para que possa ser preenchida.
;=====================================================================================================

; ---------------
; FUNÇÃO  é-pet?:
; é-pet?: PetOuString -> Boolean
; Objetivo: verificar se é um Pet
; ---------------

(define (é-pet? animal)
  (cond
    [(string? animal) #t]
    [else #f]
    )
)

(define (agenda-livre? animal posição)
    (cond
      [(and
       (é-pet? animal)
       (or
        (and (>= posição 1) (< posição 4)) 
        (and (>= posição 8) (<= posição 10)))) #t]
      [else #f]))


;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################


;#####################################################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 #####
;#####################################################################################################
;=====================================================================================================
;Desenvolva uma função que dado um veterinário realiza a verificação de disponibilidade de em sua
;agenda, gerando um resultado verdadeiro se alguma das posições de Pets está livre. Caso contrário,
;gera um resultado falso.
;=====================================================================================================

; ---------------------------------
; FUNÇÃO  verifica-disponibilidade: vet -> boolean
; OBJETIVO: recebe um vet 
; ---------------------------------

 (define (verifica-disponibilidade vet)
  (cond
    ; Caso tenha vaga livre, devolverá #true
    [(or(é-pet? (Vet-pet1 vet))(é-pet? (Vet-pet2 vet))(é-pet? (Vet-pet3 vet))) #true]
    ; Caso não, devolverá #false
    [else #false])) 


;#####################################################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 #####
;#####################################################################################################


;#####################################################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 #####
;#####################################################################################################
;=====================================================================================================
;Desenvolva uma função que dado um veterinário e um Pet, realiza o encaminhamento do Pet para ser
;anexado na agenda do veterinário. O Pet é inserido na primeira posição livre na agenda de um
;veterinário, gerando assim um novo registro de veterinário. Caso não seja possível o encaixe,
;devolver a frase "Sem horário disponível".
;=====================================================================================================

;--------------------------------
; TIPO VetOuString:
; i) vet
; ii) string
;--------------------------------

; ---------------------
; FUNÇÃO  adiciona-pet:
; ---------------------

(define (adiciona-pet Vet Pet)
  (cond
    []
    [else "Sem horário disponível"]
  ;)

;#####################################################################################################
;### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 ### 4 #####
;#####################################################################################################


;#####################################################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 #####
;#####################################################################################################
;=====================================================================================================
;Defina um tipo de dados chamado PetShop, que deve registrar o nome do local, o endereço do local,
;o telefone de contato, e os dois veterinários que estão de plantão no momento. Defina 3 constantes
;cujos valores sejam do tipo PetShop.
;=====================================================================================================

;(define-struct PetShop (...))
;...

;#####################################################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 #####
;#####################################################################################################


;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################
;=====================================================================================================
;Uma dada PetShop quer verificar se os veterinários que estão de plantão no momento já cumpriram a
;sua carga de trabalho. Com isso, deve desenvolver uma função que recebe como parâmetro a PetShop em
;questão e o turno atual (sendo strings: "Manhã", "Tarde" e "Noite"). Caso um ou mais veterinários já
;tiverem terminado o seu turno, deve-se gerar um novo registro de PetShop com a string "Vago".
;Caso contrário, devolver o mesmo registro de PetShop sem alteração.
;=====================================================================================================

; --------------------
; FUNÇÃO  plantao-vet:
; --------------------


;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################


;#####################################################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 #####
;#####################################################################################################
;=====================================================================================================
;Um determinado Pet será enviado a uma Petshop em busca de atendimento. Contudo, não é sabido até o
;momento se os veterinários que estão de plantão fazem o atendimento do determinado Pet. Assim,
;deve-se desenvolver uma função que recebe como parâmetro o Pet em questão e a PetShop escolhida,
;com o objetivo de avaliar se os veterinários que estão de plantão atendem o determinado Pet e se
;possuem vaga para o seu atendimento. Caso não há nenhum veterinário disponível ou capacitado para
;atender o tipo de Pet, deve-se retornar a mensagem "Sem horário disponível".
;=====================================================================================================

; --------------------------
; FUNÇÃO  especialidade-vet:
; --------------------------


;#####################################################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 #####
;#####################################################################################################


;#####################################################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 #####
;#####################################################################################################
;=====================================================================================================
;Desenvolva uma função que recebe uma PetShop e gera um prontuario dos atendimentos que serão
;realizados nestaa PetShop pelos veterinários. A saída desta função é uma imagem contendo as
;informações do Pet, do local onde foi realizado o atendimento (nome e endereço) e o nome do
;veterinário.
;=====================================================================================================

; ------------------------
; FUNÇÃO  gera-prontuario:
; ------------------------

;#####################################################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 #####
;#####################################################################################################