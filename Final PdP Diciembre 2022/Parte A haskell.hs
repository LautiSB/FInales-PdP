data Producto = Prod {
    nombre :: String,
    precio :: Int
}

queEmpieceConA :: Producto -> Bool
queEmpieceConA = (=='a') . head . nombre

barato :: Producto -> Bool
barato = (<50) . precio

restriccionesDeCompra = [queEmpieceConA, barato]

{-1
queEmpieceConA :: Producto -> Bool
barato :: Producto -> Bool
-}

--2
--queEmpieceConA :: Char -> Producto -> Bool
--queEmpieceConA c = (== c) . head . nombre

--una vez cambiada la funcion "queEmpieceConA" la funcion "restriccionesDeCompra"
--no puede ser utilizada así como aparece, ya que necesita un nuevo parametro char,
--una posible solucion a esto seria hacer uso de aplicacion parcial [queEmpieceConA 'a', barato]
--y con eso nos aseguramos que siga funcionando con el mismo parametro de entrada que barato.
-- Esto se relaciona con el concepto de currificacion

--3    
type Reestricciones = Producto -> Bool

productos = [
    Prod "arroz" 40,
    Prod "manzana" 60,
    Prod "almendra" 30]

verificanRestricciones :: [Producto] -> [Reestricciones] -> [Producto]
verificanRestricciones productos reestricciones =
    filter (`verifica` reestricciones) productos

verifica :: Producto -> [Reestricciones] -> Bool
verifica producto = all (\reestriccion -> reestriccion producto)

--use delegacion con la funcion verificanRestricciones haciendo que parte de la logica lo haga una 
--funcion auxiliar verifica. Esta funcion auxiliar tiene expresiones lambda en el all
--Tambien use esta funcion verifica de forma infija para que me sea util en verificanRestricciones
