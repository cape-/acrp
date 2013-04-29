acrp
====

# ACRP - Sistema de Gestión

## Desarrollo Inicial

### Alcances
Asentar ingresos y egresos del aeroclub, imputando cada concepto a un activo. De forma de poder llevar una simple pero correcta discriminación y análisis de flujo monetario. Como parte del control se realizará la carga de Personas y Activos que formen parte del circuito lógico de Ingresos y Egresos, como se detalla a continuación.
#### Activos fijos
    * Aviones
    * Hangares
    * Instalaciones (Pista, Rodaje, Area Combustible, Oficina, Quincho, etc.)
  
#### Otros activos
    * Cuotas Sociales
    * Combustibles
    * Aceites
  
#### Personas
    * Personal
    * Instructores
    * Socios
    * Clientes
    * Proveedores

#### Ingresos:
    Modelo: Fuente de Ingreso > Concepto (var. precio varía por) [Imputa a]
    Socios > Hs. De Vuelo (var. Tipo de Avión) [Avión]
    Socios > Cuota Social [Cuotas Sociales]
    Socios > Combustible [Combustibles]
    Socios > Aceite[Aceites]
    Socios > Hangaraje (var. Categoría) [Hangar]
    Clientes > Búsqueda (var. Hs. de Vuelo) [Avión]
    Clientes > Vuelos de Bautismo (var. Tipo de Avión) [Avión]
    Clientes > Combustible [Combustibles]
    Clientes > Aceite [Aceites]
    Otros > Publicidad
    Otros > Ingreso Eventual (venta de un Avión por ej.)

#### Egresos:
    Insumos > Combustible [Proveedor]
    Insumos > Aceite [Proveedor]
    Insumos > Otros [Proveedor]
    Servicios > Pago [Servicio]
    Avión > Repuesto [Proveedor]
    Avión > Taller > Inspección 25hs. [Proveedor]
    Avión > Taller > Inspección 50hs. [Proveedor]
    Avión > Taller > Inspección 100hs. [Proveedor]
    Avión > Taller > Overhaul [Proveedor]
    Avión > Taller > Reparación [Proveedor]
    Hangar > Mantenimiento > Materiales [Proveedor]
    Hangar > Mantenimiento > Mano de Obra [Proveedor/Personal]
    Instalación > Mantenimiento > Materiales [Proveedor]
    Instalación > Mantenimiento > Mano de Obra [Proveedor/Personal]
    Personal > Salario [Personal]
    Personal > Viáticos [Personal]
    Personal > Honorarios [Personal]
    Personal > Adelanto [Personal]

#### Consumos (consumos internos, no implican flujo monetario pero sí consumo de activos)
    Avión > Combustible
    Avión > Aceite

