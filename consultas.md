# Consulas SQL
## DQL (Data Query Language)
### Selección, filtros ordenación y agrupación
#### 1. Listar todos los libros.
```
SELECT * FROM libros;
```
#### 2. (Where) filtrar registros: Mostrar libros con más de 200 páginas
```
SELECT * FROM libros where cant_pagina > 200
SELECT * FROM libros where cant_pagina < 200
SELECT * FROM libros where cant_pagina >= 200
SELECT * FROM libros where cant_pagina <= 200
```

#### 3. (Order By) (Ordenar resultados): Listar libros ordenados por número de páginas
```
SELECT *  FROM libros ORDER By cant_pagina DESC
SELECT *  FROM libros ORDER By cant_pagina ASC
```

#### 4. (Group by) (agrupar datos): Cantidad de libros por gestión
```
SELECT gestion, COUNT(*) as total_libros
FROM libros
GROUP By gestion;
```

## Funciones de Agregación