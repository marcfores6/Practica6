-- Ejemplo DIDACTICO del PDF: compilacion intencionadamente fallida.
-- Queue exporta el TIPO Queue, pero NO sus constructores.
-- Ejecuta 'ghc -fno-code TestQueueError.hs' para observar el error.
import Queue

main :: IO ()
main = print (isEmpty EmptyQueue)
