;Sumar 1 con 2
(+ 1 2)


;Suma 1 a 9
(+ 1 2 3 4 5 6 7 8 9)


;Raiz de 49
(sqrt 49)


;Elevar 2 a la 10
(expt 2 10)


;Crear funcion para elevar un numero a otro
 (define (elevar x y)
  (cond
    ((= y 0) 0)
    ((= y 1) x)
     ((* x (elevar x (- y 1))))))


;Funcion para elevar con ^
(define (^ num1 num2)
  (expt num1 num2))

;elevar 2 a la 50
(^ 2 50)

;elevar 2 a la 100
(^ 2 100)

;Crear funcion para convertir de celsius a farenheit
(define (convertir c)
 (+ (* c 1.8) 32))



; Crear funcion para poder representar lo siguiente
(define (f1 x)
 (if (< x 0)
 (- (cos (+ x 2)) (sin (/ x 2)))
 (+ (sin (* 2 x)) (cos 2))))


; funcion parte 2
(define (f2 x)
 (cond ((< x -1) (exp (- x)))
 ((> x 1) (exp (sqrt x)))
 (else (exp 1))))


(f1 -100)
(f1 100)
(f2 -100)
(f2 100)

; las funciones map utilizando f1 y f2
(map f1 '(-2 -1 0 1 2))
(map f2 '(-2 -1 0 1 2))

;Creo la listas a utilizar
(define miLista '(1 2 3 4 5))

(define miLista1 '(6 7 8 9 10))


;crear una funcion largo que retorne recursivamente la longitud de una lista
(define (largo lista)
(if (null? lista)
       0
     (+ 1 (largo (cdr lista)))))


;Aqui implemento mi propia version de append
(define (appendVersion x1 x2)
        (if (null? x1) x2
            (list (car x1) (appendVersion (cdr x1) x2))))




;Funcion para calcular el factorial de forma recursiva
(define (factorial n)
  (if (<= n 1) 1
      (* n (factorial (- n 1)))))



; numero 16
(define x '(1 2 3 4 5))

(define (cubo x) (expt x 3))

(define (raiz x) (sqrt x))


(define (raiz-cubo-detection x)
  (cond ((< 0 x) (cubo x))
      (else(raiz x))))
(map raiz-cubo-detection x)


;1 realice una funcion

(define xf 0)
(define xi 100)
(define vi 0)
(define g -9.81)


;2 para calcular la velocidad final
(define (velocidadFinal v a t)
  (+ (* a t) v))

;3 calcular tan -1(y/x)
;(define()
 ; )


(define lista '(1 2 3 4 5))
  (car lista)