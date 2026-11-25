-- Ejercicio 1: varias acciones IO en un bloque do.
import Geometry2D

main :: IO ()
main = do
    putStrLn ("The area is " ++ show (areaSquare 2))
    let other = areaSquare 5
    putStrLn ("Another area is " ++ show other)
    putStrLn ("The perimeter is " ++ show (perimeterSquare 2))
