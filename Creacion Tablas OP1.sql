-- Creación de la tabla TipoTransporte
CREATE TABLE TipoTransporte (
    IdRol INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- Creación de la tabla RolEmpleado
CREATE TABLE RolEmpleado (
    IdRol INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- Creación de la tabla Empleado
CREATE TABLE Empleado (
    Codigo VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(255),
    Identificacion INT,
    Tipo VARCHAR(50),
    Experiencia VARCHAR(255)
);

-- Creación de la tabla Transporte
CREATE TABLE Transporte (
    IdTransporte INT PRIMARY KEY,
    Tipo VARCHAR(50),
    Modelo VARCHAR(255),
    Capacidad INT,
    FechaCompra DATE,
    Estado VARCHAR(50),
    Conductor VARCHAR(50),
    FOREIGN KEY (Conductor) REFERENCES Empleado(Codigo)
);

-- Creación de la tabla Mantenimiento
CREATE TABLE Mantenimiento (
    IdMantenimiento INT PRIMARY KEY,
    Fecha DATE,
    Descripcion TEXT,
    RealizadoA VARCHAR(255)
);

-- Creación de la tabla EmpleadoMantenimiento
CREATE TABLE EmpleadoMantenimiento (
    IdEmpleado INT,
    IdMantenimiento INT,
    PRIMARY KEY (IdEmpleado, IdMantenimiento),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(Codigo),
    FOREIGN KEY (IdMantenimiento) REFERENCES Mantenimiento(IdMantenimiento)
);

-- Creación de la tabla Viaje
CREATE TABLE Viaje (
    IdViaje INT PRIMARY KEY,
    IdTransporte INT,
    IdRuta INT,
    Fecha DATE,
    Hora TIME,
    EstimacionPasajeros INT,
    FOREIGN KEY (IdTransporte) REFERENCES Transporte(IdTransporte),
    FOREIGN KEY (IdRuta) REFERENCES Ruta(IdRuta)
);

-- Creación de la tabla Ruta
CREATE TABLE Ruta (
    IdRuta INT PRIMARY KEY,
    Nombre VARCHAR(100),
    TiempoPromedio INT
);

-- Creación de la tabla RutaEstacion
CREATE TABLE RutaEstacion (
    IdEstacion INT,
    IdRuta INT,
    PRIMARY KEY (IdEstacion, IdRuta),
    FOREIGN KEY (IdEstacion) REFERENCES Estacion(IdEstacion),
    FOREIGN KEY (IdRuta) REFERENCES Ruta(IdRuta)
);

-- Creación de la tabla Estacion
CREATE TABLE Estacion (
    IdEstacion INT PRIMARY KEY,
    Altitud DOUBLE,
    Latitud DOUBLE,
    Nombre VARCHAR(100),
    CapacidadMaxima INT
);
