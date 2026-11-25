module Queue (Queue, empty, enqueue, dequeue, first, isEmpty, size) where

-- Ejercicios 4 y 5: cola polimorfica de definicion recursiva.
-- Los constructores EmptyQueue e Item se OCULTAN al importar Queue.
data Queue a = EmptyQueue | Item a (Queue a)
    deriving Show

empty :: Queue a
empty = EmptyQueue

enqueue :: a -> Queue a -> Queue a
enqueue x EmptyQueue = Item x EmptyQueue
enqueue x (Item a q) = Item a (enqueue x q)

dequeue :: Queue a -> Queue a
dequeue EmptyQueue = error "dequeue: cola vacia"
dequeue (Item _ q) = q

first :: Queue a -> a
first EmptyQueue = error "first: cola vacia"
first (Item a _) = a

isEmpty :: Queue a -> Bool
isEmpty EmptyQueue = True
isEmpty _ = False

size :: Queue a -> Int
size EmptyQueue = 0
size (Item _ q) = 1 + size q

-- Ejercicio 4: instancia Eq manual, SIN deriving Eq.
instance Eq a => Eq (Queue a) where
    EmptyQueue == EmptyQueue = True
    Item x xs == Item y ys = x == y && xs == ys
    _ == _ = False
