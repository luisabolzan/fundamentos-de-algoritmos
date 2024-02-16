;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname resposta) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; ==============================================================
;; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; ==============================================================
;; Desenvolva uma função chamada calcula-prop que dado um valor e
;; um total, nesta ordem, devolve a percentagem do valor sobre o total.
;; Assuma que o valor é sempre menor ou igual ao total.
;; ==============================================================

;; calcula-prop: Número Número -> Número
;; Dados um valor e um total, calcula a percentagem do valor sobre o total.
;; Exemplos:
;;      (calcula-prop 15 30) = 50
;;      (calcula-prop 3 30) = 10

(define (calcula-prop valor total)
        (* (/ valor total) 100))

;; Testes:
(check-expect (calcula-prop 15 30) 50)
(check-expect (calcula-prop 3 30) 10)

;; ==============================================================
;; 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
;; ==============================================================
;; Construa um programa, chamado calcula-aprovados, que, dados os números de alunos que
;; foram aprovados e que foram reprovados e uma turma, devolve
;; a proporção de aprovados.

;; calcula-aprovados: Número Número String -> Número
;; Dados os números de alunos aprovados e reprovados e uma turma,
;; calcula a percentagem de aprovados.
;; Exemplos:
;;      (calcula-aprovados 15 15 "A") = 50
;;      (calcula-aprovados 27 3 "B") = 90

(define (calcula-aprovados aprovados reprovados turma)
        ;; calcula a proporção entre
        (calcula-prop aprovados ;;  o número de aprovados e
                      (+ aprovados reprovados)));; o número total de alunos

;; Testes:
(check-expect (calcula-aprovados 15 15 "A") 50)
(check-expect (calcula-aprovados 27 3 "A") 90)

;; ==============================================================
;; 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
;; ==============================================================
;; Construa o programa mostra-proporcao que, dados uma turma,
;; uma proporcao e a sitacao de alunos nesta proporcao ("aprovados"
;; ou "reprovados"), escreve o seguinte texto:
;; "Na turma T foram S N% dos alunos",
;; onde T é o nome da turma, S é a situação e N a proporçao de alunos.

;; mostra-proporcao: String String Número -> String
;; Dados o nome da turma, a situação e o número de alunos nesta situação
;; desta turma, mostra uma mensagem com a percentagem.
;; Exemplos:
;;      (mostra-proporcao "X" "reprovados" 50) = "Na turma X foram reprovados 50% dos alunos"
;;      (mostra-proporcao "Y" "aprovados" 90) = "Na turma Y foram aprovados 90% dos alunos"

(define (mostra-proporcao  turma situacao numero)
        ;; une várias strings:
        (string-append
                       "Na turma "
                       turma                    ;; a turma
                       " foram "
                       situacao " "             ;; a situação dos alunos
                       (number->string numero)  ;; a porcentagem
                       "% dos alunos"))

;; Testes:
(check-expect (mostra-proporcao "X" "reprovados" 50)  "Na turma X foram reprovados 50% dos alunos")
(check-expect (mostra-proporcao "Y" "aprovados" 90)  "Na turma Y foram aprovados 90% dos alunos")


;; ==============================================================
;; 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
;; ==============================================================
;; Construa um programa chamado desenha-barra que, dada uma largura
;; e uma cor, nesta ordem, desenha um retângulo com a largura dada e 
;; pintado na cor dada. A altura do retângulo deve ser 30.
;; Assuma que o número dado é entre 0 e 100.

;; desenha-barra: Número String -> Imagem
;; Dada uma largura e uma cor, desenha um retângulo com a largura dada e 
;; pintado na cor dada.
;; Exemplos:
;;      (desenha-barra 30 "green") = (rectangle 30 30 "solid" "green")
;;      (desenha-barra 50 "orange") = (rectangle 50 30 "solid" "orange")

(define (desenha-barra larg cor)
          (rectangle larg 30 "solid" cor))

;; Testes:
(check-expect (desenha-barra 30 "green")  (rectangle 30 30 "solid" "green"))
(check-expect (desenha-barra 50 "orange") (rectangle 50 30 "solid" "orange"))

;; ==============================================================
;; 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5  
;; ==============================================================
;; Desenvolva um programa que, dados o nome de uma turma e os
;; números de alunos aprovados e reprovados, gera uma imagem com
;; as porcentagens de aprovados e reprovados, como nos exemplos abaixo.
;; Os aprovados devem ser escritos na cor "darkgreen" e o reprovados
;; em "red". O fonte deve ser tamanho 15.

;; mostra-estatisticas: String Numero Numero -> Imagem
;; Dados o nome de uma turma e os numeros de alunos aprovados e reprovados,
;; gera uma imagem com as estatisticas da turma.
;; Exemplos:
;;   (mostra-estatisticas "X" 50 50) deve desenhar um diagrama com 50% da
;;        barra verde e 50% vermelha, e escrever que 50% dos alunos foram
;;        aprovados e 50% reprovados.
;;   (mostra-estatisticas "Y" 27 3) deve desenhar um diagrama com 90% da
;;        barra verde e 10% vermelha, e escrever que 90% dos alunos foram
;;        aprovados e 10% reprovados.

(define (mostra-estatisticas turma aprov reprov)
   (beside ;; colocar lado a lado
         (beside  ;; a barra com uma parte verde e uma parte vermelha:
                 (desenha-barra (calcula-prop aprov (+ aprov reprov)) "darkgreen")
                 (desenha-barra (calcula-prop reprov (+ aprov reprov)) "red"))
         (above  ;; as mensagens indicando a proporção de alunos aprovados/reprovados:
                 (text (mostra-proporcao turma "aprovados" (calcula-prop aprov (+ aprov reprov))) 15 "darkgreen")
                 (text (mostra-proporcao turma "reprovados"(calcula-prop reprov (+ aprov reprov))) 15 "red"))))

;; Aplicações da função:
(mostra-estatisticas "X" 50 50) 
(mostra-estatisticas "Y" 27 3)