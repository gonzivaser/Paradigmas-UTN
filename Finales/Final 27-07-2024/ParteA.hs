-- PARA CADA MEDICAMENTO
amoxicilina = cura "infeccion"
bicarbonato = cura "picazon"
ibuprofeno = cura "dolor" . cura "hinchazon"
todosLosMedicamentos = [amoxicilina, bicarbonato, ibuprofeno]


cura sintoma = filter (\= sintoma)

-- PARA CADA ENFERMEDAD / CONJUNTO DE SINTOMAS 
malMovimiento = ["dolor"]
varicela = repeat "picazon"


-- ASUMIMOS QUE EXISTE AL MENOS UN MEDICAMENTO CAPAZ DE CURAR CADA ENFERMEDAD: 
mejorMedicamentoPara sintomas = find(curaTodosLos sintomas) todosLosMedicamentos
curaTodosLos sintomas medicamento = medicamento sintomas == []


-- PUNTO 1
type Medicamento = [String] -> [String]
type CuraTodosLos = [String] -> Medicamento -> Bool

-- PUNTO 2 cuales son los dos conceptos funcionales mas importantes aplicados en mejorMedicamentoPara
-- 1. Aplicacion parcial: En la definicion de mejorMedicamentoPara, se aplica parcialmente la funcion curaTodosLos
-- 2. Composicion: Se compone la funcion find con la funcion curaTodosLos para obtener el mejor medicamento para una enfermedad

-- PUNTO 3
-- QUE RESPONDE ESTA CONSULTA --> >mejorMedicamentoPara varicela
-- La respuesta de esta consulta es bicarbonato

-- Si se remplaza todosLosMedicamentos con los de abajo
-- sugestion sintomas = []
-- todosLosMedicamentos = [sugestion, amoxicilina, bicarbonato, ibuprofeno]