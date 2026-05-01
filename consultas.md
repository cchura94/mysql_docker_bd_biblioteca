# Consulas SQL
## DQL (Data Query Language)
### Selección, filtros ordenación y agrupación
#### 1. Listar todos los libros.
```sql
SELECT * FROM libros;
```
#### 2. (Where) filtrar registros: Mostrar libros con más de 200 páginas
```sql
SELECT * FROM libros where cant_pagina > 200
SELECT * FROM libros where cant_pagina < 200
SELECT * FROM libros where cant_pagina >= 200
SELECT * FROM libros where cant_pagina <= 200
```

#### 3. (Order By) (Ordenar resultados): Listar libros ordenados por número de páginas
```sql
SELECT *  FROM libros ORDER By cant_pagina DESC
SELECT *  FROM libros ORDER By cant_pagina ASC
```

#### 4. (Group by) (agrupar datos): Cantidad de libros por gestión
```sql
SELECT gestion, COUNT(*) as total_libros
FROM libros
GROUP By gestion;
```

## Funciones de Agregación
### SUM,MAX,MIN,AVG
#### 5. SUM (suma total): Total de páginas de todos los libros
```sql
SELECT SUM(cant_pagina) AS total_paginas
FROM libros;
```

#### 6. MAX (valor máximo): Libro con mayor número de páginas
```sql
SELECT MAX(cant_pagina) as max_paginas
FROM libros;
```
#### 7. MIN (valor mínimo): Libro con menor número de páginas
```sql
SELECT MIN(cant_pagina) as min_paginas
FROM libros;
```
#### 8. AVG (promedio): Promedio de páginas de los libros
```sql
SELECT AVG(cant_pagina) as promedio_paginas
FROM libros;
```
## Operadores Lógicos

