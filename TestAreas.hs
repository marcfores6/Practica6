-- Ejercicio 2: imports cualificados para evitar colision de 'area'.
import qualified Circle as C
import qualified Triangle as T

main :: IO ()
main = do
    putStrLn ("Circulo de radio 2: " ++ show (C.area 2))
    putStrLn ("Triangulo de base 4 y altura 5: " ++ show (T.area 4 5))
