;Porcentaje de grasa corporal

;Peso en kg
;Altura cm

(define (IMC peso altura)
  (/ peso (expt (/ altura 100) 2)))

;Peso en kg
;Altura en metros
(define (IMC1 peso altura)
  (/ peso (expt altura 2)))

;Grasa corporal
;Peso kg
;Altura en cm

(define (CGCHombre edad peso altura)
  (-(- (+ (* 1.2 (IMC peso altura))(* 0.23 edad))10.8)5.4))

(define (CGCMujer edad peso altura)
(- (+ (* 1.2 (IMC peso altura))(* 0.23 edad)) 5.4))

;Platos que podría consumir al día para mantener el peso actual.
;Tsa metabolica basal * Dias ejercicios (0-7)
;peso kg, altura cm 

(define (TMBHombre edad peso altura)
  (+(-(+ (* 10 peso)(* 6.25 altura))(* 5 edad))5))

(define (TMBMujer edad peso altura)
  (-(-(+ (* 10 peso)(* 6.25 altura))(* 5 edad))161))

;cantidad de calorias recomendadas
(define (DietaMantenerHombre edad peso altura diasEje)
  (cond ((= diasEje 0) (* (TMBHombre edad peso altura) 1.2))
        ((<= diasEje 3) (* (TMBHombre edad peso altura) 1.375))
        ((<= diasEje 5) (* (TMBHombre edad peso altura) 1.55))
        ((= diasEje 6) (* (TMBHombre edad peso altura) 1.725))
        (else (> diasEje 6) (* (TMBHombre edad peso altura) 1.9))))


(define (DietaMantenerMujer edad peso altura diasEje)
  (cond ((= diasEje 0) (*(TMBMujer edad peso altura) 1.2))
        ((<= diasEje 3) (*(TMBMujer edad peso altura) 1.375))
        ((<= diasEje 5) (*(TMBMujer edad peso altura) 1.55))
        ((= diasEje 6) (*(TMBMujer edad peso altura) 1.725))
        (else (> diasEje 6) (* (TMBMujer edad peso altura) 1.9))))



;Platos que podría consumir al día para disminuir cierto peso a la semana.
;TMB un 15% -20%.

(define (DietaPerderMujer edad peso altura)
  (-(* (TMBMujer edad peso altura) 0.15)(TMBHombre edad peso altura)))

(define (DietaPerderHombre edad peso altura)
  (-(* (TMBHombre edad peso altura) 0.15)(TMBHombre edad peso altura)))