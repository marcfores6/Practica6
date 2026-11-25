-- Ejemplo del PDF: sin acceder a los constructores ocultos.
import Queue

main :: IO ()
main = print (first (enqueue (5 :: Int) empty))
