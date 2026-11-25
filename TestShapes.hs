-- Ejercicios 6-9: tipos algebraicos, instancias y prismas.
import qualified ShapeADT as A
import qualified ShapeClasses as C

main :: IO ()
main = do
    let a = A.Pentagon 4 3
        p = C.Pentagon 4 3
        c = C.Circle 2
    putStrLn ("Area pentagono (ADT): " ++ show (A.area a))
    putStrLn ("Area pentagono (clase): " ++ show (C.area p))
    putStrLn ("Area circulo: " ++ show (C.area c))
    putStrLn ("Volumen prisma pentagonal altura 2: " ++ show (C.volumePrism p 2))
    putStrLn ("Superficie prisma pentagonal altura 2: " ++ show (C.surfacePrism p 2))
    print (p == C.Pentagon 4 3)
    print p
