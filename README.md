# Practica 6 LTP (2025-2026) - resuelta

Los **9 ejercicios** del PDF `CAS_practica6_2025-26.pdf` estan resueltos. Abre la carpeta que contiene estos archivos en VS Code y ejecuta desde la terminal PowerShell:

```powershell
pwd
dir
runghc .\Main.hs
```

Si prefieres comprobar la compilacion sin ejecutar:

```powershell
ghc -fno-code Main.hs
```

> **Muy importante:** los ficheros de cada modulo tienen que llamarse **exactamente** como sus declaraciones: `Queue.hs` contiene `module Queue`, `QueueTwoLists.hs` contiene `module QueueTwoLists`, etc. Todos deben estar dentro de la **misma carpeta**.

## Ejercicios y archivos

| Ejercicio | Archivo(s) | Solucion |
|---|---|---|
| 1 | `Geometry2D.hs`, `Test.hs`, `Test2.hs` | Exportaciones publicas y ejecucion de `main` |
| 2 | `Circle.hs`, `Triangle.hs`, `TestAreas.hs` | Imports cualificados `C.area` y `T.area` |
| 3 | `QueueTwoLists.hs`, `TestQueue3.hs` | Cola con dos listas e instancia `Show` manual |
| 4 | `Queue.hs`, `TestQueue.hs` | Cola recursiva e instancia `Eq` manual |
| 5 | `QueueConversions.hs`, `TestQueue4.hs` | Conversiones `toList`/`fromList` con API publica |
| 6 | `ShapeADT.hs` | `area` para `Pentagon` y `Circle` |
| 7 | `ShapeClasses.hs` | Clase `Shape` con `area` y sus instancias |
| 8 | `ShapeClasses.hs` | `volumePrism` (metodo) y `surfacePrism` (funcion) |
| 9 | `ShapeClasses.hs` | Restricciones `Eq`, `Show`, con instancias que derivan ambas |

## Ejecucion individual

```powershell
runghc .\Test.hs
runghc .\Test2.hs
runghc .\TestAreas.hs
runghc .\TestQueue.hs
runghc .\TestQueue2.hs
runghc .\TestQueue3.hs
runghc .\TestQueue4.hs
runghc .\TestShapes.hs
```

`TestQueueError.hs` es la **prueba intencionadamente incorrecta** del PDF: muestra que el constructor `EmptyQueue` no se exporta. Si ejecutas `ghc -fno-code TestQueueError.hs`, GHC debe dar un error de constructor no visible. **No se incluye en las pruebas correctas.**

## Probar en GHCi

```powershell
ghci Main.hs
```

Entonces, puedes llamar a las funciones usando los alias que declara `Main.hs`:

```haskell
G.areaSquare 2
C.area 2
T.area 4 5
Conv.toList (Conv.fromList [1,2,3])
S.area (S.Pentagon 4 3)
S.volumePrism (S.Pentagon 4 3) 2
S.surfacePrism (S.Circle 2) 2
```

## Detalles importantes

* `Queue` y `QueueTwoLists` son dos implementaciones diferentes; se usan modulos independientes para que no haya conflicto.
* `Queue` exporta su nombre como **tipo abstracto**, sin exportar `Item` ni `EmptyQueue`.
* `QueueTwoLists` tampoco expone su constructor; su `show` imprime la cola en orden de salida FIFO.
* Se ha preferido que `first` y `dequeue` den un error explicito para colas vacias. El enunciado no define otra conducta.
* Para pentagonos regulares, `area = perimetro * apotema / 2`.
* Para un prisma recto, `superficie total = 2*area(base) + perimetro(base)*altura`.
* Los archivos son independientes: no pongas todos los modulos en un solo `Practica6.hs`.

## Nota sobre la comprobacion

Los programas se han revisado estaticamente. Este entorno no dispone de `ghc`/`runghc` instalados; ejecuta `runghc Main.hs` en tu ordenador para verificar la compilacion y las pruebas.
