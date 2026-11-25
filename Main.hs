module Main where

-- Ejecutar todos los ejercicios (sin ejecutar el ejemplo de error intencional).
import qualified Geometry2D as G
import qualified Circle as C
import qualified Triangle as T
import qualified Queue as Q
import qualified QueueTwoLists as Q2
import qualified QueueConversions as Conv
import qualified ShapeADT as A
import qualified ShapeClasses as S
import Control.Monad (unless)
import System.Exit (exitFailure)

check :: (Eq a, Show a) => String -> a -> a -> IO ()
check label expected obtained =
    if expected == obtained
       then putStrLn ("OK    " ++ label)
       else do
           putStrLn ("FALLO " ++ label ++ ": esperado " ++ show expected ++ ", obtenido " ++ show obtained)
           exitFailure

checkNear :: String -> Float -> Float -> IO ()
checkNear label expected obtained =
    unless (abs (expected - obtained) < 0.0001) $ do
        putStrLn ("FALLO " ++ label ++ ": esperado " ++ show expected ++ ", obtenido " ++ show obtained)
        exitFailure

main :: IO ()
main = do
    putStrLn "Practica 6 LTP - comprobacion de ejercicios 1 a 9"
    checkNear "1 areaSquare" 4 (G.areaSquare 2)
    checkNear "1 perimeterSquare" 8 (G.perimeterSquare 2)
    checkNear "2 circle area" (4*pi) (C.area 2)
    checkNear "2 triangle area" 10 (T.area 4 5)

    let q2 = Q2.enqueue (7::Int) (Q2.enqueue 5 Q2.empty)
    check "3 size QueueTwoLists" 2 (Q2.size q2)
    check "3 first QueueTwoLists" 5 (Q2.first q2)
    check "3 show QueueTwoLists" " <- 5 <- 7 <- " (show q2)
    check "3 dequeue QueueTwoLists" 7 (Q2.first (Q2.dequeue q2))

    let q1 = Q.enqueue (7::Int) (Q.enqueue 5 Q.empty)
    check "4 Eq reflexiva" True (q1 == q1)
    check "4 Eq distintos" False (q1 == Q.enqueue 8 (Q.enqueue 5 Q.empty))
    check "4 Eq colas vacias" True ((Q.empty :: Q.Queue Int) == Q.empty)
    check "4 Eq distinto tamano" False (q1 == Q.enqueue 5 Q.empty)

    check "5 fromList/toList" [5,10,15::Int] (Conv.toList (Conv.fromList [5,10,15::Int]))
    check "5 fromList vacia" ([]::[Int]) (Conv.toList (Conv.fromList []))
    check "5 toList dequeue" [10,15::Int] (Conv.toList (Q.dequeue (Conv.fromList [5,10,15::Int])))

    checkNear "6 ADT perimeter Pentagon" 20 (A.perimeter (A.Pentagon 4 3))
    checkNear "6 ADT area Pentagon" 30 (A.area (A.Pentagon 4 3))
    checkNear "6 ADT area Circle" (4*pi) (A.area (A.Circle 2))

    let p = S.Pentagon 4 3
        c = S.Circle 2
    checkNear "7 class perimeter Pentagon" 20 (S.perimeter p)
    checkNear "7 class area Pentagon" 30 (S.area p)
    checkNear "7 class area Circle" (4*pi) (S.area c)
    checkNear "8 volume pentagonal prism" 60 (S.volumePrism p 2)
    checkNear "8 surface pentagonal prism" 100 (S.surfacePrism p 2)
    checkNear "8 volume circular cylinder" (8*pi) (S.volumePrism c 2)
    checkNear "8 surface circular cylinder" (16*pi) (S.surfacePrism c 2)
    check "9 Eq Pentagon" True (p == S.Pentagon 4 3)
    check "9 Eq distinto Pentagon" False (p == S.Pentagon 4 4)
    check "9 Show Pentagon" "Pentagon 4.0 3.0" (show p)
    putStrLn "TODAS LAS PRUEBAS HAN TERMINADO CORRECTAMENTE"
