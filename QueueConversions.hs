module QueueConversions (toList, fromList) where

-- Ejercicio 5: solo usa las operaciones PUBLICAS de Queue.
-- NO utiliza los constructores ocultos EmptyQueue ni Item.
import qualified Queue as Q

toList :: Q.Queue a -> [a]
toList q
    | Q.isEmpty q = []
    | otherwise = Q.first q : toList (Q.dequeue q)

fromList :: [a] -> Q.Queue a
fromList = foldl (flip Q.enqueue) Q.empty
