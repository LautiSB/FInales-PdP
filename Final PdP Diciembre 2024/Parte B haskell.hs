import Distribution.Simple.Setup (trueArg)
data Atleta = Atleta{
   nacionalidad :: String,
   edad :: Int,
   equipamiento :: [String]
}deriving(Show, Eq)


type Requisito = Atleta -> Bool

data Competencia = Compe {
   nombre :: String,
   requisitos :: [Requisito]
}

reqNacionalidad :: String -> Atleta -> Bool
reqNacionalidad pais atleta | pais = nacionalidad atleta
                            | otherwise = false

reqEdad :: Int -> Atleta -> Bool
reqEdad anios atleta | anios < edad atleta = true 
                     | otherwise = false

reqEquipamiento :: String -> Atleta -> Bool
reqEquipamiento equipo atleta | any(\equipo2 -> equipo2 == equipo) equipamiento atleta = true
                              | otherwise = false
--2
--Compe "competencia" [reqNacionalidad "Argentina", reqEdad 40, reqEquipamiento "Soga"]

--3
controlDeInscripcion :: [Atleta] -> Competencia -> [Atleta]
controlDeInscripcion atletas compe = filter ( )