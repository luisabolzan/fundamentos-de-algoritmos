;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercicio) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; Desenvolva uma função chamada calcula-prop que dado um valor e
;; um total, nesta ordem, devolve a percentagem do valor sobre o total.
;; Assuma que o valor é sempre menor ou igual ao total.

(define (calcula-prop valor total)
        (* (/ valor total) 100))

;; 2. Construa um programa, chamado calcula-aprovados, que, dados os números de alunos que foram aprovados e
;; que foram reprovados e o nome de uma turma (string), nesta ordem, devolve a proporção de aprovados.

(define (calcula-aprovados aprovados reprovados turma)
        (/
         aprovados
         (+ aprovados reprovados)
         ))

;; 3. Construa o programa mostra-proporcao que, dados uma turma, uma proporção e a situação de alunos nesta
;; proporção ("aprovados" ou "reprovados"), nesta ordem, gera o seguinte texto: "Na turma T foram S N%
;; dos alunos", onde T é o nome da turma, S é a situação e N a proporção de alunos.

(define (mostra-proporção turma situaçao porcentagem) ;; situaçao (aprovado ou reprovado)
  (string-append                                      ;; porcentagem (porcentagem de aprovados ou reprovados)
   "Na turma "
   turma
   " foram "
   situaçao " "
   (number->string porcentagem)
   "% dos alunos"
   )
  )

;; 4. Construa um programa chamado desenha-barra que, dada uma largura e e uma cor, nesta ordem, desenha um
;; retângulo com a largura dada e pintado na cor dada. A altura do retângulo deve ser 30. Assuma que o número
;; dado é entre 0 e 100.

(define (desenha-barra largura cor)
  (rectangle largura 30 "solid" cor)
  )

;; 5. Desenvolva um programa chamado mostra-estatisticas que, dados o nome de uma turma e os números de
;; alunos aprovados e reprovados nesta turma, nesta ordem, gera uma imagem com as porcentagens de aprovados
;; e reprovados, como nos exemplos abaixo. Os aprovados devem ser escritos na cor "darkgreen" (tanto a barra
;; quanto o texto) e o reprovados em "red". O fonte deve ser tamanho 15.

(define (mostra-estatisticas turma aprovados reprovados)
  (beside
   (beside
    (desenha-barra (calcula-prop aprovados (+ aprovados reprovados)) 15 "darkgreen")
    (desenha-barra (calcula-prop reprovados (+ aprovados reprovados)) 15 "red"))
  (above
   (text(mostra-proporção turma "aprovados"))
   (text(mostra-proporção turma "reprovados"))
  )))
   

   