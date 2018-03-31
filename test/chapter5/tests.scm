#lang scheme/base

(require schemeunit "../../src/chapter1/functions.scm" "../../src/chapter2/functions.scm" "../../src/chapter5/functions.scm")

; rember*

(check-equal? (rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup)) '((coffee) ((tea)) (and (hick))))
(check-equal? (rember* 'sauce '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))) '(((tomato)) ((bean)) (and ((flying)))))

; lat?
(check-false (lat? '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))))
(check-false (atom? (car '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce)))))

; insertR*
(check-equal? (insertR* 'roast 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood))
              '((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast))) (if (a) ((wood chuck roast))) could chuck roast wood))

; occur*
(check-equal? (occur* 'banana '((banana) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy))) 5)

; subst*
(check-equal? (subst* 'orange 'banana '((banana) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy))) '((orange) (split ((((orange ice))) (cream (orange)) sherbet)) (orange) (bread) (orange brandy)))

; insertL*
(check-equal? (insertL* 'pecker 'chuck '((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)) '((how much (wood)) could ((a (wood) pecker chuck)) (((pecker chuck))) (if (a) ((wood pecker chuck))) could pecker chuck wood))

; member*
(check-true (member* 'chips '((potato) (chips ((with) fish) (chips)))))

; leftmost
(check-equal? (leftmost '((potato) (chips ((with) fish) (chips)))) 'potato)
(check-equal? (leftmost '(((hot) (tuna (and))) cheese)) 'hot)
; leftmost no está definido para listas vacías
; (check-equal? (leftmost '(((() four)) 17 (seventeen))) null)
; (check-equal? (leftmost (quote ())) null)

; and
(check-false (and (atom? (car '(mozzarella pizza))) (eq? (car '(mozzarella pizza)) 'pizza)))
(check-false (and (atom? (car '((mozzarella mushroom) pizza))) (eq? (car '((mozzarella mushroom) pizza)) 'pizza)))
(check-true (and (atom? (car '(pizza (tastes good)))) (eq? (car '(pizza (tastes good))) 'pizza)))

; eqlist
(check-true (eqlist? '(strawberry ice cream) '(strawberry ice cream)))
(check-false (eqlist? '(strawberry ice cream) '(strawberry cream ice)))
(check-false (eqlist? '(banana ((split))) '((banana) (split))))
(check-false (eqlist? '(beef ((sausage)) (and (soda))) '(beef ((salami)) (and (soda)))))
(check-true (eqlist? '(beef ((sausage)) (and (soda))) '(beef ((sausage)) (and (soda)))))