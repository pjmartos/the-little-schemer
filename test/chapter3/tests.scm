#lang scheme/base

(require schemeunit "../../src/chapter3/rember.scm" "../../src/chapter3/firsts.scm" "../../src/chapter3/seconds.scm"
         "../../src/chapter3/insertR.scm" "../../src/chapter3/subst.scm" "../../src/chapter3/subst2.scm"
         "../../src/chapter3/multirember.scm" "../../src/chapter3/multiinsertR.scm")

; rember
(check-equal? (rember 'mint '(lamb chops and mint jelly)) '(lamb chops and jelly))
(check-equal? (rember 'mint '(lamb chops and mint flavored mint jelly)) '(lamb chops and flavored mint jelly))
(check-equal? (rember 'toast '(bacon lettuce and tomato)) '(bacon lettuce and tomato))
(check-equal? (rember 'cup '(coffee cup tea cup and hick cup)) '(coffee tea cup and hick cup))
(check-equal? (rember 'bacon '(bacon lettuce and tomato)) '(lettuce and tomato))
(check-equal? (rember 'and '(bacon lettuce and tomato)) '(bacon lettuce tomato))
(check-equal? (rember 'sauce '(soy sauce and tomato sauce)) '(soy and tomato sauce))
; rember -> Acepta un Atom y una lista de Atoms
;        -> Devuelve una lista con los mismos elementos que la lista original salvo la primera ocurrencia de Atom dentro
;           de la lista que sea idéntico al Atom proporcionado, si lo hubiere

; firsts
(check-equal? (firsts '((apple peach pumpkin) (plum pear cherry) (grape raisin pea) (bean carrot eggplant)))
              '(apple plum grape bean))
(check-equal? (firsts '((a b) (c d) (e f))) '(a c e))
(check-equal? (firsts '()) '())
(check-equal? (firsts '((five plums) (four) (eleven green oranges))) '(five four eleven))
(check-equal? (firsts '(((five plums) four) (eleven green oranges) ((no) more))) '((five plums) eleven (no)))
; firsts -> Acepta una lista vacía o compuesta únicamente de listas
;        -> Devuelve una lista compuesta de la primera S-expression de cada una de las listas internal que componen la
;           lista proporcionada, si las hubiere

; seconds
(check-equal? (seconds '((a b) (c d) (e f))) '(b d f))

; insertR
(check-equal? (insertR 'topping 'fudge '(ice cream with fudge for dessert)) '(ice cream with fudge topping for dessert))
(check-equal? (insertR 'jalapeño 'and '(tacos tamales and salsa)) '(tacos tamales and jalapeño salsa))
(check-equal? (insertR 'e 'd '(a b c d f g d h)) '(a b c d e f g d h))

; subst
(check-equal? (subst 'topping 'fudge '(ice cream with fudge for dessert)) '(ice cream with topping for dessert))

; subst2
(check-equal? (subst2 'vanilla 'chocolate 'banana '(banana ice cream with chocolate topping)) '(vanilla ice cream with chocolate topping))

; multirember
(check-equal? (multirember 'cup '(coffee cup tea cup and hick cup)) '(coffee tea and hick))

(check-equal? (multiinsertL 'fried 'fish '(chips and fish or fish and fried)) '(chips and fried fish or fried fish and fried))