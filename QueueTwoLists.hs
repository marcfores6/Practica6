module QueueTwoLists (Queue, empty, enqueue, dequeue, first, isEmpty, size) where

-- Ejercicio 3: cola polimorfica implementada mediante dos listas.
-- xs es el frente en orden; ys es el final en orden inverso.
data Queue a = Queue [a] [a]

empty :: Queue a
empty = Queue [] []

enqueue :: a -> Queue a -> Queue a
enqueue y (Queue xs ys) = Queue xs (y:ys)

dequeue :: Queue a -> Queue a
dequeue (Queue (x:xs) ys) = Queue xs ys
dequeue (Queue [] []) = error "dequeue: cola vacia"
dequeue (Queue [] ys) = dequeue (Queue (reverse ys) [])

first :: Queue a -> a
first (Queue (x:_) _) = x
first (Queue [] []) = error "first: cola vacia"
first (Queue [] ys) = head (reverse ys)

isEmpty :: Queue a -> Bool
isEmpty (Queue [] []) = True
isEmpty _ = False

size :: Queue a -> Int
size (Queue xs ys) = length xs + length ys

-- Ejercicio 3: instancia Show MANUAL, no deriving Show.
-- Se muestran los elementos en orden real de salida FIFO.
instance Show a => Show (Queue a) where
    show (Queue xs ys) =
        " <- " ++ concatMap (\x -> show x ++ " <- ") (xs ++ reverse ys)
