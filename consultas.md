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
### AND, OR, NOT
#### 9. AND (y Lógico) Libros con más de 100 páginas y de la gestión 2022
```sql
SELECT * FROM libros
Where cant_pagina > 100 AND gestion = '2022'
```
#### 10. OR (y Lógico) Libros con menos de 100 páginas o de la gestión 2002
```sql
SELECT * FROM libros
WHERE cant_pagina < 100 OR gestion = 2002
```
#### 11. NOT (negación) Libros que no son de la gestión 2002
```sql
select * from libros where not gestion = '2002'
```

## Join
#### 12. JOIN : Mostrar préstamos con nombre de usuario y titulo del libro
```sql
SELECT prestamos.fecha_prestamo, usuarios.name, libros.titulo
FROM prestamos
JOIN usuarios ON prestamos.usuario_id = usuarios.id
JOIN libros ON libros.id = prestamos.libro_id;
```

```sql
SELECT p.fecha_prestamo, u.name, l.titulo
FROM prestamos p
JOIN usuarios u ON p.usuario_id = u.id
JOIN libros l ON l.id = p.libro_id;
```
- Cantidad libros no devuelto
```sql
SELECT u.name, l.titulo, DATEDIFF(CURDATE(), p.fecha_prestamo) AS dias_atraso, 
CASE 
	WHEN DATEDIFF(CURDATE(), p.fecha_prestamo) > 5 THEN 'DESACTIVAR'
	ELSE 'ACTIVO'
END AS estado_usuario
FROM prestamos p 
JOIN usuarios u ON p.usuario_id = u.id
JOIN libros l ON p.libro_id = l.id;
```
- Cantidad Libros en MORA 
```sql
SELECT COUNT(*) AS libros_mora
FROM prestamos p
WHERE DATEDIFF(CURDATE(), p.fecha_prestamo) > 15;
```