-- Ejercicio 4: prueba de la cola recursiva y su igualdad.
import qualified Queue as Q

main :: IO ()
main = do
    let q1 = Q.enqueue 7 (Q.enqueue 5 Q.empty)
        q2 = Q.enqueue 7 (Q.enqueue 5 Q.empty)
        q3 = Q.enqueue 8 (Q.enqueue 5 Q.empty)
    print (q1 == q2)  -- True
    print (q1 == q3)  -- False
    print (Q.size q1) -- 2
