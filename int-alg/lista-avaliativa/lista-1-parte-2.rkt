;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lista-1-parte-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
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
;; Objetivo: Registrar o nome de um Pet, sua cor, idade, dono e tipo.

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
; O tipo misto pode ser:
; i) Pet
; ii) String
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
    (make-Vet "Beatriz" "Tarde" "Pássaro" PIUPIU (make-Pet "Paz" "Branca" 2 "Malala" "Pássaro") (make-Pet "Louro José" "Verde" 15 "Ana Maria" "Pássaro")))
(define CARLOS
    (make-Vet "Carlos" "Noite" "Gato" GATO-LISTRADO (make-Pet "Garfield" "Laranja" 9 "Jon" "Gato") "livre"))
(define DANIEL
    (make-Vet "Daniel" "Manhã" "Cavalo" (make-Pet "Ártemis" "Prata" 6 "Réia" "Cavalo") (make-Pet "Apolo" "Azul" 7 "Zeus" "Cavalo") (make-Pet "Afrodite" "Dourado" 7 "Cibele" "Cavalo")))
(define EDUARDA
    (make-Vet "Eduarda" "Tarde" "Cachorro" SHIH-TZU (make-Pet "Jade" "Preto" 4 "Anitta" "Cachorro") (make-Pet "Princesa" "Branco" 2 "Ludmilla" "Cachorro")))
(define FABIANA
    (make-Vet "Fabiana" "Noite" "Gato"  (make-Pet "Gatinha" "Cinza" 5 "Pietra" "Gato") "livre" "livre"))

   
;#####################################################################################################
;### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 ### 1 #####
;#####################################################################################################


;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################
;=====================================================================================================
; Desenvolva um função chamada é-pet? que, dado um Pet ou uma String, verifica se a entrada é
; do tipo Pet ou do tipo String, retornando verdadeiro se for do tipo Pet e falso caso contrário.
;=====================================================================================================

; ---------------
; FUNÇÃO  é-pet?: PetOuString -> Boolean
; OBJETIVO: verificar se é um Pet ou uma String, retornando #true para Pet e #false para Strings
; Exemplos: (é-pet? "Vector") = #true
;           (é-pet? PIUPIU) = #false
;           (é-pet? "Lulu") = #true
; ---------------


(define (é-pet? PetOuString)
  (cond
    ;; Checa se PetOuString é uma String, caso sim devolve #false
    [(string? PetOuString) #f]
    ;; Checa se PetouString é um Pet, caso sim devolve #true
    [(Pet? PetOuString) #t]))

;; Testes:
(check-expect (é-pet? "Vector") #f)
(check-expect (é-pet? PIUPIU) #t)
(check-expect (é-pet? "Lulu") #f)
         

;#####################################################################################################
;### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 ### 2 #####
;#####################################################################################################


;#####################################################################################################
;### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 ### 3 #####
;#####################################################################################################
;=====================================================================================================
; Construa uma funç˜ao verifica-disponibilidade que, dado um veterinário, verifica se ele está
; disponível para atender um novo pet, ou seja, caso algum de seus espaços de atendimento seja
; "livre", devolve verdadeiro, caso contrário, gera um resultado falso.
;=====================================================================================================

; ---------------------------------
; FUNÇÃO  verifica-disponibilidade: Vet -> Boolean
; OBJETIVO: Verificar a disponibilidade de um Vet gerando um #true se tiver alguma posição disponível
; Exemplos: (verifica-disponibilidade ANA) = #false
;           (verifica-disponibilidade FABIANA) = #true
;           (verifica-disponibilidade CARLOS) = #true
; ---------------------------------

(define (verifica-disponibilidade vet)
   ;; Verificar se há disponibilidade na agenda do Vet
  (cond
   ;; Verifica se os Pet1, Pet2 e Pet3 são strings, caso um seja, retorna #true, pois está escrito "livre" na agenda do Vet
   [(or (string? (Vet-pet1 vet)) (string? (Vet-pet2 vet)) (string? (Vet-pet3 vet))) #true]
   ;; Caso contrário, retorna #false, tendo em vista que agenda do Vet está cheia
   [else #f]))

  
;; Testes:
(check-expect (verifica-disponibilidade ANA) #false)
(check-expect (verifica-disponibilidade FABIANA) #true)
(check-expect (verifica-disponibilidade CARLOS) #true)

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
; O tipo misto pode ser:
; i) Vet
; ii) String
;--------------------------------

; ---------------------
; FUNÇÃO  adiciona-pet: Vet Pet -> VetOuString
; OBJETIVO: Dado um Vet e um Pet, encaminha um Pet para a agenda de um veterinário caso tenha horário disponível
; Exemplos: (adiciona-pet FABIANA PIUPIU) = (make-Vet "Fabiana" "Noite" "Gato"  (make-Pet "Gatinha" "Cinza" 5 "Pietra" "Gato") PIUPIU "livre")
;           (adiciona-pet ANA PIUPIU) = "Sem horário disponível"
;           (adiciona-pet CARLOS CACHORRO-CARAMELO) = (make-Vet "Carlos" "Noite" "Gato" GATO-LISTRADO (make-Pet "Garfield" "Laranja" 9 "Jon" "Gato") CACHORRO-CARAMELO)
; ---------------------

(define (adiciona-pet vet pet)
  (cond
    ;; Verificar se é um pet1 e se tem horário disponível, se sim devolve com o Pet adicionado
    [(string? (Vet-pet1 vet)) (make-Vet (Vet-nome-vet vet) (Vet-turno-plantão vet) (Vet-especialidade vet) pet (Vet-pet2 vet) (Vet-pet3 vet))]
    ;; Verificar se é um pet2 e se tem horário disponível, se sim devolve com o Pet adicionado
    [(string? (Vet-pet2 vet)) (make-Vet (Vet-nome-vet vet) (Vet-turno-plantão vet) (Vet-especialidade vet) (Vet-pet1 vet) pet (Vet-pet3 vet))]
    ;; Verificar se é um pet3 e se tem horário disponível, se sim devolve com o Pet adicionado
    [(string? (Vet-pet3 vet)) (make-Vet (Vet-nome-vet vet) (Vet-turno-plantão vet) (Vet-especialidade vet) (Vet-pet1 vet) (Vet-pet2 vet) pet)]
    ;; Caso não tenha horário disponível, devolve "Sem horário disponível"
    [else "Sem horário disponível"]))
 
(check-expect (adiciona-pet FABIANA PIUPIU) (make-Vet "Fabiana" "Noite" "Gato"  (make-Pet "Gatinha" "Cinza" 5 "Pietra" "Gato") PIUPIU "livre"))
(check-expect (adiciona-pet ANA PIUPIU) "Sem horário disponível")
(check-expect (adiciona-pet CARLOS CACHORRO-CARAMELO) (make-Vet "Carlos" "Noite" "Gato" GATO-LISTRADO (make-Pet "Garfield" "Laranja" 9 "Jon" "Gato") CACHORRO-CARAMELO))

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

(define-struct PetShop (nome-local endereço contato vet1 vet2))
; (make-PetShop um-nome-local um-endereço um-contato um-vet1 um-vet2)
; onde:
; um-nome-local: String, indica o nome da PetShop
; um-endereço: String, indica o endereço da PetShop
; um-contato: Número, indica o número de telefone de contato da PetShop
; um-vet1: PetOuString, indica o primeiro veterinário
; um-vet2: PetOuString, indica o segundo veterinário

(define AUMIGOS
  (make-PetShop "Aumigos" "Av. Assis Brasil 343" 51999875463 ANA DANIEL))

(define PATRULHA-CANINA
  (make-PetShop "Patrulha Canina" "Av. Sertório 165" 51999635874 EDUARDA FABIANA))

(define VALE
  (make-PetShop "Campus do Vale" "Av. Bento Gonçalves 9500" 51998765432 ANA CARLOS))

;#####################################################################################################
;### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 ### 5 #####
;#####################################################################################################


;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################
;=====================================================================================================
; No momento da troca de turno, o registro da petshop deve ser atualizado, removendo os veterinários que
; não atuam no novo turno de trabalho. Construa uma função chamada termina-plantão que, dados uma PetShop
; e o novo turno (que pode ser "Manhã", "Tarde" ou "Noite"), nesta ordem, remove do registro os
; veterinários que não atuam neste novo turno. No caso de um veterinário ser removido, o registro deste
; veterinário na petshop deve atualizado para ao valor "vago". 
;=====================================================================================================

; --------------------
; FUNÇÃO  termina-plantão: PetShop turno -> PetShop
; OBJETIVO: verificar se há veterinários de plantão no turno solicitado, caso sim, indica a PetShop com os veterinários, caso não, indica a PetShop com o horário vago
; EXEMPLOS: (termina-plantão AUMIGOS "Tarde") = (make-PetShop "Aumigos" "Av. Assis Brasil 343" 51999875463 "vago" (make-Vet "Daniel" "Manhã" "Cavalo" (make-Pet "Ártemis" "Prata" 6 "Réia" "Cavalo") (make-Pet "Apolo" "Azul" 7 "Zeus" "Cavalo") (make-Pet "Afrodite" "Dourado" 7 "Cibele" "Cavalo"))))
;           (termina-plantão PATRULHA-CANINA "Noite") = (make-PetShop "Patrulha Canina" "Av. Sertório 165" 51999635874 "vago" (make-Vet "Fabiana" "Noite" "Gato" (make-Pet "Gatinha" "Cinza" 5 "Pietra" "Gato") "livre" "livre")))
;           (termina-plantão VALE "Manhã") = (make-PetShop "Campus do Vale" "Av. Bento Gonçalves 9500" 51998765432 (make-Vet "Ana" "Manhã" "Cachorro" (make-Pet "Zeus" "Caramelo" 5 "José" "Cachorro") (make-Pet "Nino" "Preto/Branco" 9 "Luísa" "Cachorro") (make-Pet "Doguinho" "Preto" 7 "Mário" "Cachorro")) "vago"))
; --------------------

(define (termina-plantão petshop turno)
   (cond
     
    ;; Verifica se os Vet estão no plantão matutino
    [(string=? turno "Manhã")
     (cond
         ;; Verifica se os dois veterinários estão trabalhando de manhã 
         [(and
           (string=? (Vet-turno-plantão (PetShop-vet1 petshop)) "Manhã") (string=? (Vet-turno-plantão (PetShop-vet2 petshop)) "Manhã"))
          petshop]
         ;; Verifica se somente o vet1 está trabalhando de manhã
        [(not (string=? (Vet-turno-plantão (PetShop-vet1 petshop)) "Manhã"))
         (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) "vago" (PetShop-vet2 petshop))]  
         ;; Verifica se somente o vet2 está trabalhando de manhã
        [(not (string=? (Vet-turno-plantão (PetShop-vet2 petshop)) "Manhã"))
         (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) (PetShop-vet1 petshop) "vago")]      
         [else petshop])]
    
    ;; Verifica se os Vet estão no plantão vespertino
    [(string=? turno "Tarde")
     (cond
         ;; Verifica se os dois veterinários estão trabalhando de tarde 
         [(and
           (string=? (Vet-turno-plantão (PetShop-vet1 petshop)) "Tarde") (string=? (Vet-turno-plantão (PetShop-vet2 petshop)) "Tarde"))
          petshop]
         ;; Verifica se somente o vet1 está trabalhando de manhã
        [(not (string=? (Vet-turno-plantão (PetShop-vet1 petshop)) "Tarde"))
         (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) "vago" (PetShop-vet2 petshop))]  
         ;; Verifica se somente o vet2 está trabalhando de manhã
        [(not (string=? (Vet-turno-plantão (PetShop-vet2 petshop)) "Tarde"))
         (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) (PetShop-vet1 petshop) "vago")]      
         [else petshop])]
    
    ;; Verifica se os Vet estão no plantão noturno
    [(string=? turno "Noite")
     (cond
         ;; Verifica se os dois veterinários estão trabalhando de manhã 
         [(and
           (string=? (Vet-turno-plantão (PetShop-vet1 petshop)) "Noite") (string=? (Vet-turno-plantão (PetShop-vet2 petshop)) "Noite"))
          petshop]
         ;; Verifica se somente o vet1 está trabalhando de manhã
        [(not (string=? (Vet-turno-plantão (PetShop-vet1 petshop)) "Noite"))
         (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) "vago" (PetShop-vet2 petshop))]  
         ;; Verifica se somente o vet2 está trabalhando de manhã
        [(not (string=? (Vet-turno-plantão (PetShop-vet2 petshop)) "Noite"))
         (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) (PetShop-vet1 petshop) "vago")]      
         [else petshop])]
    
   ;; Caso contrário, devolve PetShop sem alteração
    [else petshop]))
    
;; Testes:
(check-expect (termina-plantão AUMIGOS "Tarde") (make-PetShop "Aumigos" "Av. Assis Brasil 343" 51999875463 "vago" (make-Vet "Daniel" "Manhã" "Cavalo" (make-Pet "Ártemis" "Prata" 6 "Réia" "Cavalo") (make-Pet "Apolo" "Azul" 7 "Zeus" "Cavalo") (make-Pet "Afrodite" "Dourado" 7 "Cibele" "Cavalo"))))
(check-expect (termina-plantão PATRULHA-CANINA "Noite") (make-PetShop "Patrulha Canina" "Av. Sertório 165" 51999635874 "vago" (make-Vet "Fabiana" "Noite" "Gato" (make-Pet "Gatinha" "Cinza" 5 "Pietra" "Gato") "livre" "livre")))
(check-expect (termina-plantão VALE "Manhã") (make-PetShop "Campus do Vale" "Av. Bento Gonçalves 9500" 51998765432 (make-Vet "Ana" "Manhã" "Cachorro" (make-Pet "Zeus" "Caramelo" 5 "José" "Cachorro") (make-Pet "Nino" "Preto/Branco" 9 "Luísa" "Cachorro") (make-Pet "Doguinho" "Preto" 7 "Mário" "Cachorro")) "vago"))

;#####################################################################################################
;### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 ### 6 #####
;#####################################################################################################


;#####################################################################################################
;### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 ### 7 #####
;#####################################################################################################
;=====================================================================================================
; Quando um animal chega na petshop para atendimento, é necessário verificar se algum dos veterinários
; de plantão presta atendimento para este tipo de animal e tem horário livre para atendê-lo. Desenvolva
; uma função chamada aloca-pet-vet que, dados um animal (tipo Pet) e uma petshop (tipo PetShop), nesta
; ordem, verifica se algum dos veterinários que estão de plantão atende este tipo de animal e se possui
; vaga para o seu atendimento. Em caso positivo, deve-se incluir este animal no primeiro espaço de
; atendimento livre do veterinário e atualizar o registro da petshop. Caso contrário, deve-se retornar
; a mensagem "Sem horário disponível".
;=====================================================================================================

; --------------------------
; FUNÇÃO  aloca-pet-vet: Pet PetShop -> PetShopOuString
; OBEJTIVO: Dado um Pet e uma PetShop, avaliar se os veterinários de plantão na PetShop atendem o Pet e se têm vaga para o atendimento.
; EXEMPLOS: (especialidade-vet PIUPIU AUMIGOS) = "Sem horário disponível"
;           (especialidade-vet GATO-LISTRADO VALE) = (make-PetShop "Campus do Vale" "Av. Bento Gonçalves 9500" 51998765432 (make-Vet "Ana" "Manhã" "Cachorro" (make-Pet "Zeus" "Caramelo" 5 "José" "Cachorro") (make-Pet "Nino" "Preto/Branco" 9 "Luísa" "Cachorro")  (make-Pet "Doguinho" "Preto" 7 "Mário" "Cachorro")) (make-Vet "Carlos" "Noite" "Gato" (make-Pet "Gatão" "Cinza Listrado" 3 "Lucas" "Gato") (make-Pet "Garfield" "Laranja" 9 "Jon" "Gato") (make-Pet "Gatão" "Cinza Listrado" 3 "Lucas" "Gato")))
;           (especialidade-vet CACHORRO-CARAMELO VALE) = "Sem horário disponível"
; --------------------------
; TIPO PetOuString
; O tipo misto pode ser:
; i) Pet
; ii) String

(define (aloca-pet-vet pet petshop)
  (cond
    ;; Verifica se as strings são iguais e se é um Pet, se for adiciona o Pet no vet1 se tiver horário
    [(and
      (string=? (Vet-especialidade (PetShop-vet1 petshop)) (Pet-tipo pet))
      (Vet? (adiciona-pet (PetShop-vet1 petshop) pet))
     )
     (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) (adiciona-pet (PetShop-vet1 petshop) pet) (PetShop-vet2 petshop))]
    ;; Verifica se as strings são iguais e se é um Pet, se for adiciona o Pet no vet2 se tiver horário
    [(and
      (string=? (Vet-especialidade (PetShop-vet2 petshop)) (Pet-tipo pet))
      (Vet? (adiciona-pet (PetShop-vet2 petshop) pet))
     )
     (make-PetShop (PetShop-nome-local petshop) (PetShop-endereço petshop) (PetShop-contato petshop) (PetShop-vet1 petshop) (adiciona-pet (PetShop-vet2 petshop) pet))]
    ;; Caso não tenha horário, devolve "Sem horário disponível"
    [else "Sem horário disponível"]))

;; Testes:
(check-expect (aloca-pet-vet PIUPIU AUMIGOS) "Sem horário disponível")
(check-expect (aloca-pet-vet GATO-LISTRADO VALE) (make-PetShop "Campus do Vale" "Av. Bento Gonçalves 9500" 51998765432 (make-Vet "Ana" "Manhã" "Cachorro" (make-Pet "Zeus" "Caramelo" 5 "José" "Cachorro") (make-Pet "Nino" "Preto/Branco" 9 "Luísa" "Cachorro")  (make-Pet "Doguinho" "Preto" 7 "Mário" "Cachorro")) (make-Vet "Carlos" "Noite" "Gato" (make-Pet "Gatão" "Cinza Listrado" 3 "Lucas" "Gato") (make-Pet "Garfield" "Laranja" 9 "Jon" "Gato") (make-Pet "Gatão" "Cinza Listrado" 3 "Lucas" "Gato"))))
(check-expect (aloca-pet-vet CACHORRO-CARAMELO VALE) "Sem horário disponível")

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
; FUNÇÃO  gera-prontuario: PetShop -> Imagem
; OBJETIVO: Gerar a imagem do prontuário de atendimento dada uma PetShop.
; OBS: Eu e meus amigos Rodrigo e Luiza estávamos com dificuldade em realizar essa função devido à estrutura, então pedimos auxílio para a Isabella. Por tal motivo, reconheço que as funções podem apresentar semelhanças.
; ------------------------

(define (gera-prontuario petshop)
  (above
   (above
    (text (format "~a" (PetShop-nome-local petshop)) 40 "blue violet")
        (text (format "Endereço: ~a" (PetShop-endereço petshop)) 25 "violet red"))
   ;; Checa se é um veterinário e, se positivo, mostra as informações na tabela
    (cond      
      [(not(Vet? (PetShop-vet1 petshop))) #false]
      [else (above(cond
                     ;; Se tiver pet1, mostra na imagem as informações do pet1 e do vet1
                     [(Pet?(Vet-pet1 (PetShop-vet1 petshop)))
                      (above ;; Coloca as informações do Pet acima do endereço acima do Veterinário responsável pelo caso
                        (text(format "Nome: ~a. Cor: ~a. Idade: ~a anos. Dono do Pet: ~a. Espécie: ~a"(Pet-nome(Vet-pet1 (PetShop-vet1 petshop)))(Pet-cor(Vet-pet1 (PetShop-vet1 petshop)))(Pet-idade(Vet-pet1 (PetShop-vet1 petshop)))(Pet-dono(Vet-pet1 (PetShop-vet1 petshop)))(Pet-tipo(Vet-pet1 (PetShop-vet1 petshop)))) 20 "navy")          
                        (text(format "Veterinário do caso: ~a"(Vet-nome-vet(PetShop-vet1 petshop)))15 "dark magenta"))]
                     ;; Caso contrário, devolve a imagem de um retângulo branco no lugar de todas as informações
                     [else (rectangle 40 1 "solid" "white")]) 
                  (cond
                     ;; Se tiver pet2, mostra na imagem as informações do pet2 e do vet1
                     [(Pet?(Vet-pet2 (PetShop-vet1 petshop)))
                      (above ;; Coloca as informações do Pet acima do endereço acima do Veterinário responsável pelo caso
                        (text(format "Nome: ~a. Cor: ~a. Idade: ~a anos. Dono do Pet: ~a. Espécie: ~a"(Pet-nome(Vet-pet2 (PetShop-vet1 petshop)))(Pet-cor(Vet-pet2 (PetShop-vet1 petshop)))(Pet-idade(Vet-pet2 (PetShop-vet1 petshop)))(Pet-dono(Vet-pet2 (PetShop-vet1 petshop)))(Pet-tipo(Vet-pet2 (PetShop-vet1 petshop)))) 20 "navy")
                        (text(format "Veterinário do caso: ~a"(Vet-nome-vet(PetShop-vet1 petshop)))15 "dark magenta"))]
                     ;; Caso contrário, devolve a imagem de um retângulo branco no lugar de todas as informações
                     [else (rectangle 40 1 "solid" "white")]) 
                  (cond
                     ;; Se tiver pet3, mostra na imagem as informações do pet3 e do vet1
                     [(Pet?(Vet-pet3 (PetShop-vet1 petshop)))
                      (above ;; Coloca as informações do Pet acima do endereço acima do Veterinário responsável pelo caso
                        (text(format "Nome: ~a. Cor: ~a. Idade: ~a anos. Dono do Pet: ~a. Espécie: ~a"(Pet-nome(Vet-pet3 (PetShop-vet1 petshop)))(Pet-cor(Vet-pet3 (PetShop-vet1 petshop)))(Pet-idade(Vet-pet3 (PetShop-vet1 petshop)))(Pet-dono(Vet-pet3 (PetShop-vet1 petshop)))(Pet-tipo(Vet-pet3 (PetShop-vet1 petshop)))) 20 "navy")
                        (text(format "Veterinário do caso: ~a"(Vet-nome-vet(PetShop-vet1 petshop)))15 "dark magenta"))]
                     ;; Caso contrário, devolve a imagem de um retângulo branco no lugar de todas as informações
                     [else (rectangle 40 1 "solid" "white")]))]) 
    ;; Checa se é um veterinário e, se positivo, mostra as informações na tabela
    (cond 
      [(not(Vet? (PetShop-vet2 petshop))) #false]
      [else (above(cond
                     ;; Se tiver pet1, mostra na imagem as informações do pet1 e do vet2
                     [(Pet?(Vet-pet1 (PetShop-vet2 petshop)))
                      (above ;; Coloca as informações do Pet acima do endereço acima do Veterinário responsável pelo caso
                        (text(format "Nome: ~a. Cor: ~a. Idade: ~a anos. Dono do Pet: ~a. Espécie: ~a"(Pet-nome(Vet-pet1 (PetShop-vet2 petshop)))(Pet-cor(Vet-pet1 (PetShop-vet2 petshop)))(Pet-idade(Vet-pet1 (PetShop-vet2 petshop)))(Pet-dono(Vet-pet1 (PetShop-vet2 petshop)))(Pet-tipo(Vet-pet1 (PetShop-vet2 petshop)))) 20 "navy")
                        (text(format "Veterinário do caso: ~a"(Vet-nome-vet(PetShop-vet2 petshop)))15 "dark magenta"))]
                     ;; Caso contrário, devolve a imagem de um retângulo branco no lugar de todas as informações
                     [else (rectangle 40 1 "solid" "white")]) 
                  (cond
                     ;; Se tiver pet2, mostra na imagem as informações do pet2 e do vet2
                     [(Pet?(Vet-pet2 (PetShop-vet2 petshop)))
                      (above ;; Coloca as informações do Pet acima do endereço acima do Veterinário responsável pelo caso
                       (text(format "Nome: ~a. Cor: ~a. Idade: ~a anos. Dono do Pet: ~a. Espécie: ~a"(Pet-nome(Vet-pet2 (PetShop-vet2 petshop)))(Pet-cor(Vet-pet2 (PetShop-vet2 petshop)))(Pet-idade(Vet-pet2 (PetShop-vet2 petshop)))(Pet-dono(Vet-pet2 (PetShop-vet2 petshop)))(Pet-tipo(Vet-pet2 (PetShop-vet2 petshop)))) 20 "navy")
                       (text(format "Veterinário do caso: ~a"(Vet-nome-vet(PetShop-vet2 petshop)))15 "dark magenta"))]
                     ;; Caso contrário, devolve a imagem de um retângulo branco no lugar de todas as informações
                     [else (rectangle 40 1 "solid" "white")]) 
                  (cond
                     ;; Se tiver pet3, mostra na imagem as informações do pet3 e do vet2
                     [(Pet?(Vet-pet3 (PetShop-vet2 petshop)))
                      (above ;; Coloca as informações do Pet acima do endereço acima do Veterinário responsável pelo caso
                       (text(format "Nome: ~a. Cor: ~a. Idade: ~a anos. Dono do Pet: ~a. Espécie: ~a"(Pet-nome(Vet-pet3 (PetShop-vet2 petshop)))(Pet-cor(Vet-pet3 (PetShop-vet2 petshop)))(Pet-idade(Vet-pet3 (PetShop-vet2 petshop)))(Pet-dono(Vet-pet3 (PetShop-vet2 petshop)))(Pet-tipo(Vet-pet3 (PetShop-vet2 petshop)))) 20 "navy")
                       (text(format "Veterinário do caso: ~a"(Vet-nome-vet(PetShop-vet2 petshop)))15 "dark magenta"))]
                     ;; Caso contrário, devolve a imagem de um retângulo branco no lugar de todas as informações
                     [else (rectangle 40 1 "solid" "white")]))])))
 

;#####################################################################################################
;### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 ### 8 #####
;#####################################################################################################