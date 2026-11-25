-- Ejercicio 3: ejemplo de Show explicito para cola de dos listas.
import qualified QueueTwoLists as Q

main :: IO ()
main = print (Q.enqueue (7 :: Int) (Q.enqueue 5 Q.empty))
