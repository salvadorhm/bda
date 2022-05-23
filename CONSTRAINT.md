# SQLite CONSTRAINTS (Restricciones)

## Constraints (restricciones) en SQLite

Constraints (restricciones) en SQL son una forma de restringir los valores de una columna de una tabla, permitiendo que los valores de la columna no sean repetidos, o que no sean nulos, o que esten en un rango de valores, o que sean de una lista de valores, o que tengan una expresion regular, o una convinacion de restricciones.

**Nota:** Una tabla puede tener una o varias restricciones, y a continuación se describen algunos de los tipos de restricciones que soporta SQLite:

## 1. NOT NULL (no nulo)

Esta restriccion obliga a que la columna no sea nula, es decir debe tener un valor forzosamente.

### Ejemplo:

```sql
CREATE TABLE tabla (
    columna1 INTEGER NOT NULL
);
```

### Isertar un valor nulo en la columna

```sql
INSERT INTO tabla (columna1) VALUES (NULL);
```

### Resultado

```sql
SQL Error [19]: [SQLITE_CONSTRAINT_NOTNULL]  A NOT NULL constraint failed (NOT NULL constraint failed: tabla.columna1)
```

## 2. PRIMARY KEY (clave primaria)

Esta restriccion obliga a que una o varias columnas sean una clave primaria, un conjunto de columnas que no pueden ser nulas y que no pueden ser repetidas, y que sirven para identificar una fila de la tabla de forma unica.

### Ejemplo:

```sql
CREATE TABLE tabla (
    columna1 INTEGER PRIMARY KEY,
    columna2 INTEGER NOT NULL
);
```

Una llave primaria puede contener una o varias columnas.

```sql
CREATE TABLE tabla (
    columna1 INTEGER,
    columna2 INTEGER,
    PRIMARY KEY (columna1, columna2)
);
```

### Insertar un valor en la tabla

```sql
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
INSERT INTO tabla (columna1, columna2) VALUES (1, 2);
```

### Resultado

```sql
SQL Error [19]: [SQLITE_CONSTRAINT_PRIMARYKEY]  A PRIMARY KEY constraint failed (UNIQUE constraint failed: tabla.columna1)
```

En el caso de que la llave primaria contenga dos columnas:


```sql
SQL Error [19]: [SQLITE_CONSTRAINT_PRIMARYKEY]  A PRIMARY KEY constraint failed (UNIQUE constraint failed: tabla.columna1, tabla.columna2)
```
