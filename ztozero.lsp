; Установка Z координаты всех точек сцены в 0
; This script help to set Z-coordinate of object "POINT" to 0 (zero)
; Finding all Points in scene
; Michael M 2021

(defun c:ZToZero (/)
  (setq ss (ssget "_X" (list (cons 0 "POINT")))) ; search all objects "POINT" in scene
  (setq i 0) ; set 0 to increment
  (while (< i (sslength ss))
    (progn
      (setq le (ssname ss i)) ; get object name in set
      (setq ob (entget le)) ; get object by name in set
      (setq x (nth 0 (cdr (assoc 10 ob)))  ; get current x
	    y (nth 1 (cdr (assoc 10 ob)))) ; get current y
      (setq ob (subst (list 10 x y 0) (assoc 10 ob) ob)) ; change z in object
      (entmod ob) ; set changes in object
      (entupd le) ; update object
      (setq i (+ i 1)) ; set increment +1
      )
    )
  )