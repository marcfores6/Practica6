module ShapeClasses
    (Side, Apothem, Radius, Height, Volume, Surface,
     Pentagon(..), Circle(..), Shape(..), surfacePrism) where

-- Ejercicios 7, 8 y 9: clase de tipos con instancias.
type Side = Float
type Apothem = Float
type Radius = Float
type Height = Float
type Volume = Float
type Surface = Float

data Pentagon = Pentagon Side Apothem
    deriving (Eq, Show)

data Circle = Circle Radius
    deriving (Eq, Show)

-- Ejercicio 9: las instancias de Shape han de ser Eq y Show.
class (Eq a, Show a) => Shape a where
    perimeter :: a -> Float
    area :: a -> Float

    -- Ejercicio 8: metodo por defecto para volumen de un prisma.
    volumePrism :: a -> Height -> Volume
    volumePrism base h = area base * h

instance Shape Pentagon where
    perimeter (Pentagon s _) = 5 * s
    area (Pentagon s ap) = 5 * s * ap / 2

instance Shape Circle where
    perimeter (Circle r) = 2 * pi * r
    area (Circle r) = pi * r * r

-- Ejercicio 8: superficie total = dos bases + superficie lateral.
surfacePrism :: Shape a => a -> Height -> Surface
surfacePrism base h = 2 * area base + perimeter base * h
