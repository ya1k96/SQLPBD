
# BDI-Proyecto 2021
## PRESENTACIÓN
### PROYECTO DE ESTUDIO BASES DE DATOS I

**Licenciatura en Sistemas de Información**
**Facultad de Ciencias Exactas y Naturales y Agrimensura**
**Universidad Nacional del Nordeste**

Año 2021

## YoSubo
> Integrantes Grupo 13
    > - Alegre Hernán
    > - Martínez Yamil
    > - Romero Larisa
    > -Sosa Agustín


### CAPITULO I
Descripción del Proyecto
Nuestro sistema tiene como objetivo brindar acceso a todos los servicios de minibús-ómnibus que tienen recorridos a distintos lugares de la región, teniendo así sus horarios de salida como de llegada, asientos disponibles, etc. En cierta medida, se pretende unificarlos para tener todos los destinos, horarios, bases y salidas próximas almacenados. La información referida a la cantidad de  clientes/usuarios que necesitan viajar a un destino (sean estos usuario frecuentes o mensuales) será registrada para llevar un mejor control administrativo, así como también las unidades con los que una empresa en particular cuenta, asignarles horarios para salidas, etc.

Alcance del Proyecto
La empresa que brinde el servicio, tiene como punto de partida una base, esta será la dirección física donde espera para la siguiente salida, en origen y en destino. Deberá contar con un administrador, encargado de publicar horarios, confirmarlos y/o rechazarlos. También  hará publico un perfil donde se realizarán actualizaciones relevantes para los clientes/usuarios. 

El usuario tendrá a disposición un menú, donde será capaz de realizar búsquedas filtrando por localidad u horario, también podrá optar por repetir un horario del historial. Una vez confirmada la salida se opta por subir a la combi en la base, o en un hotspot, que es simplemente una alternativa, un punto referenciado en el mapa donde la combi puede recoger al usuario/cliente.

Se prevé poder seguir a las empresas proveedoras a modo de estar actualizados sobre todos los movimientos y novedades, incluido información sobre disponibilidad, cambios de horario o base. 

Las unidades representan los móviles con los que la empresa cuenta, se identifican por modelo, marca y año. Se asocian a una salida, pudiendo alternar horarios.
Para las salidas será necesario asociar un horario y reservas, estos últimos contienen a los usuarios que pidieron un lugar para viajar y si hay actualmente lugares disponibles. Los usuarios pueden ser invitados o registrados, con correo y contraseña. Es probable que un usuario quiera saber cuáles son las próximas salidas a un destino, por lo que será necesario tener consultas actualizadas con los detalles: hora, lugar (base), y disponibilidad.

### CAPITULO II
**Procedimiento almacenado:**
Los procedimientos almacenados se utilizan para agrupar las instrucciones de T-SQL y cualquier lógica asociada necesaria para llevar a cabo una tarea.

Nos proporcionan a nosotros los usuarios un acceso fácil a la base de datos, se puede tener acceso a la base de datos sin tener que conocer los detalles de la arquitectura de tablas -simplemente se ejecutan los procedimientos almacenados que llevan a cabo las tareas solicitadas.

Los procedimientos almacenados pueden aceptar datos de entrada, utilizar variables locales y devolver datos.

**Vistas:**

Una vista es una tabla virtual cuyo contenido está definido por una consulta. Al igual que una tabla, una vista consta de un conjunto de columnas y filas de datos con un nombre.

La consulta que define la vista puede provenir de una o de varias tablas, o bien de otras vistas de la base de datos actual u otras bases de datos. 

**Triggers:**

Un "trigger" (disparador o desencadenador) es un tipo de procedimiento almacenado que se ejecuta cuando se intenta modificar los datos de una tabla (o vista). Se definen para una tabla (o vista) específica. Se crean para conservar la integridad referencial y la coherencia entre los datos entre distintas tablas.

**Transacciones:**

Una transacción es un conjunto de operaciones que van a ser tratadas como una única unidad. Estas transacciones deben cumplir 4 propiedades fundamentales comúnmente conocidas como ACID (atomicidad, coherencia, asilamiento y durabilidad). 
Este conjunto de operaciones debe marcarse como transacción para que todas las operaciones que la conforman tengan éxito o todas fracasen.

**Permisos y Roles:**

SQL Server provee roles de servidor para ayudar a administrar permisos en un servidor. Estos roles son perfiles de seguridad que agrupan  otros perfiles.

Las roles fijos  de servidor se proporcionan para mayor comodidad y compatibilidad con versiones anteriores.  Es mejor asignar permisos más específicos siempre que sea posible.
 
Para administrar fácilmente los permisos de las bases de datos, SQL Server proporciona varios roles primarios de seguridad que agrupan a otros roles primarios. Son como los grupos del sistema operativo Windows.

Los roles  de nivel de base de datos son de toda la base de datos en su ámbito de permisos.
Existen dos tipos de roles de nivel de base de datos: roles fijos de bases de datos, que viene ya  predefinidos  y roles de base de datos definidos por el usuario.
 

### CAPITULO III
(metodología / herramientas)

 HERRAMIENTAS
Whatsapp
Google Meet
Replit
SQL Server Magnament Studio
Youtube
### CAPITULO IV
(implementación)

Diagrama del Modelo de datos


Entidades
(descripción de las tablas)

**Base:** esta tabla contendrá las direcciones físicas donde espera para la siguiente salida. 

**Tipo Base:** esta tabla contendrá la información si la salida es desde la base o de un hotspot. 

**Horarios:** esta tabla contendrá los horarios de salida. 

**Combi:** esta tabla contendrá información acerca de la combi. 

**Localidad:** esta tabla contendrá el nombre de todas las localidades. 

**Salidas:** esta tabla contendrá información de la salida, la unidad, el horario y fecha. 

**Unidades:** esta tabla contendrá información acerca de los móviles con los que la empresa cuenta. 

**Modelo:** esta tabla contendrá información acerca del modelo de las unidades. 

**Marca:** esta tabla contendrá información acerca la marca de las unidades. 

**Reservas:** esta tabla contendrá información acerca de las reservas, tipo de reserva, el usuario, y la salida. 

**Usuario:** esta tabla contendrá información sobre los mismos. 

**Tipo reserva:** esta tabla contendrá información acerca del tipo de reserva. 

**Tipo usuario:** esta tabla contendrá información acerca si son usuarios frecuentes o mensuales.

### Diccionario de datos

 ### Base
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idBase| Int| 4| Si |N° consecutivo de la base|
|idTipoBase| Int |4 |Si |N° consecutivo del tipo de base|
|idCombi| Int |4 |Si| N° consecutivo de la combi|
|Dirección| Varchar| 255 |Si| Dirección de la base|

 
 ### Tipo base
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idTipoBase| Int| 4| Si| N° consecutivo del tipo de base|
|descripción| Varchar| 200| Si| Descripción del tipo de base|

 
 ### Horarios
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idHorario|Int|4|Si|N° consecutivo del horario|
|idCombi |Int| 4| Si |N° consecutivo de la combi|
|Hora| Int| 4| Si| N° consecutivo de la hora|
|Destino |Varchar| 200 |Si| Nombre del destino|
|origen |varchar| 200| Si| Nombre de origen|

 
 ### Combi
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idCombi| Int| 4| Si| N° consecutivo de la combi|
|idLocalidad| Int| 4| Si| N° consecutivo de la localidad|
|nombre| Varchar| 225| Si| Nombre de la combi|

 
 ### Localidad
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idLocalidad |Int| 4| Si| N° consecutivo de la localidad|
|descripción| Varchar| 255| Si| Descripción de la localidad|

 

 ### Salida
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idSalida| Int |4 |Si| N° consecutivo de la salida|
|idUnidad| Int |4 |Si |N° consecutivo de la unidad|
|idHorario| Int| 4| Si| N° consecutivo del horario|
|fecha| Date| |Si |Fecha de salida|

 
 ### Unidades
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idUnidad| Int| 4 |Si |N° consecutivo de la unidad|
|idModelo |Int |4 |Si |N° consecutivo del modelo de la unidad|
|idMarca |Int| 4 |Si| N° consecutivo de la marca de la unidad|
|Disponible |Int |4 |Si |N° consecutivo de disponibilidad|
|capacidad| Int| 4 |si |N° consecutivo de capacidad|

 
 ### Modelo
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idModelo| Int| 4| Si| N° consecutivo del modelo de la unidad|
|idMarca| Int| 4| Si| N° consecutivo de la marca de la unidad|
|descripción| Varchar| 250| Si |Descripción del modelo de la unidad|
|año| Int| 4| Si| Año del modelo de la unidad|

 ### Reservas
| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
| idReserva      | int | 4 | Si | N° consecutivo de las reservas|
|idSalida |Int |4 |Si| N° consecutivo de la salida|
|idTipoReserva | Int| 4| Si| N° consecutivo del tipo de reserva|
|idUsuario |Int |4 |Si |N° consecutivo del usuario|

### Usuario

| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idUsuario| Int| 4 |Si| N° consecutivo del usuario|
|idTipoUsuario| Int| 4| No| N° consecutivo del tipo de usuario|
|Nombre| Varchar| 100| No| Nombre del usuario|
|Correo| Varchar| 250| No| Correo del usuario|   
|Contras| Varchar| 50| No| Contraseña del usuario|

 
### Marca

| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idMarca| Int| 4| Si| N° consecutivo de la marca de la unidad|
|Descripción| Varchar| 250| Si| Descripción de la  marca de la unidad|

### Tipo usuario

| Columna       | Tipo          | Long |Acepta Nulos  |Contenido  |
| ------------- |:-------------:| -----:| -----:| -----:|
|idTipoUsuario| Int| 4| Si| N° consecutivo del tipo de usuario|
|Descripción| Varchar| 250| Si| Descripción del tipo de usuario | 

 

 

### CAPITULO V
 

DIFICULTADES
Las dificultades que tuvimos y aún surgen en el desarrollo de nuestro proyecto es variaciones de las entidades, a menudo que vamos avanzando en el proyecto se nos ocurren planteamientos diferentes a cada uno de los integrantes, lo planteamos individualmente y en una reunión lo conversamos entre todos los integrantes. Si bien, es bueno las nuevas ideas pero atrasa el desarrollo del proyecto. 

 

DESAFIOS
Uno de los desafíos que encontramos fue llevar una necesidad del entorno hacia una solución informática nuestra. 

 

CONCLUSIÓN
En conclusión no es una experiencia nueva el de colaborar en equipo pero cuando se aprende algo nuevo es un poco más rebuscado el éxito de la finalización del proyecto, ya que, vamos avanzando a prueba de errores. Lo bueno de todo esto es que nos sirve y servirá para nuestro aprendizaje como profesionales. 

BIBLIOGRAFÍA
>https://docs.microsoft.com/es-es/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver15

(material de lectura/consulta que se utilizó para el desarrollo del trabajo)

ANEXO
Videos
 

Script SQL
 archivo script del proyecto

Documentación complementaria