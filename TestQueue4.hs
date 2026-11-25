-- Ejercicio 5: pruebas de toList y fromList.
import qualified Queue as Q
import QueueConversions

main :: IO ()
main = do
    let q = fromList [5,10,15 :: Int]
    print (toList q)
    print (toList (Q.dequeue q))
    print (Q.isEmpty (fromList ([] :: [Int])))
