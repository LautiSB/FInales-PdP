
data Destino = Lugar {
    nombre :: [Char],
    precio :: Float,
    atractivos :: [String]
}

tieneBoliches :: Destino -> Bool
tieneBoliches destino = ((elem "boliches") . atractivos) destino

barato :: Destino -> Bool
barato destino = precio destino < 50

alguien = [tieneBoliches, barato]


--1a
tieneAtractivo :: String -> Destino -> Bool
tieneAtractivo atractivo destino = atractivo `elem` atractivos destino

--tiene que recibir un Destino y una String porque atractivos en el data es un vector
--de String entonces es lógico por estructura de datos que tambien necesite una string 
--para saber si esta incluida esa atraccion en el destino

--1b 
alguien2 :: [Destino -> Bool]
alguien2 = [tieneAtractivo "boliches", barato]

--se usa el concepto de aplicacion parcial porque tieneAtractivo tiene que recibir dos
--parametro y es por ello que en este caso se le aplica el parametro 'boliches' de 
--antemano para que tenga compatibilidad en el vector de "condiciones"

--2
destinosElegidos requisitos destinos = filter (f requisitos) destinos
f requisitos destino = any destino requisitos

--a FALSO
--la solucion funciona mal porque la funcion "f" esta mal desarrollada, el any espera
--(a -> bool) y aca esta recibiendo un data Destino, lo cual no tiene sentido

type Requisito = Destino -> Bool

destinosElegidos2 :: [Requisito] -> [Destino] -> [Destino]
destinosElegidos2 requisitos = filter (cumple requisitos)

cumple :: [Requisito] -> Destino -> Bool
cumple requisitos destino = any (\requisito -> requisito destino) requisitos

--b VERDADERO
--la solucion usa funciones de orden superior como any y filter, eso lo hace declarativa
--en parte. Pero al estar mal implementada ya no lo podria considerar declarativa

--c VERDADERO
-- si bien delega parte de la logica a la funcion "f" esta no tiene un buen nombre como 
--para saber con certeza lo que esta haciendo, es muy abarcativo el nombre y eso no lo 
--hace expresivo.

--d FALSO
-- si funcionara bien la implementacion si te devolveria una respuesta y esto es porque 
-- con el any mientras que una condicion de la lista infinita se cumpla esto ya dispara 
--el any y te puede dar ese resultado como respuesto. Esto es por el concepto lazy evaluation

