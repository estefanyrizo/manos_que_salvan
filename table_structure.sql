DROP TABLE IF EXISTS departamentos;
CREATE TABLE departamentos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL
);

DROP TABLE IF EXISTS municipios;
CREATE TABLE municipios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  departamento_id INTEGER NOT NULL,
  FOREIGN KEY (departamento_id) REFERENCES departamentos (id)
);

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL,
  email TEXT,
  password TEXT NOT NULL,
  nombre TEXT NOT NULL,
  apellido TEXT NOT NULL,
  biografia TEXT NOT NULL,
  municipio_id INTEGER,
  creado_en TEXT,
  cantidad_seguidos INTEGER NOT NULL DEFAULT 0,
  cantidad_seguidores INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (municipio_id) REFERENCES municipios (id)
);

DROP TABLE IF EXISTS seguidores;
CREATE TABLE seguidores (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
  usuario_seguido_id INTEGER NOT NULL,
  usuario_seguidor_id INTEGER NOT NULL,
  FOREIGN KEY (usuario_seguido_id) REFERENCES usuarios (id),
  FOREIGN KEY (usuario_seguidor_id) REFERENCES usuarios (id)
);

DROP TABLE IF EXISTS tipos_mascotas;
CREATE TABLE tipos_mascotas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  descripcion TEXT
 );
 
 DROP TABLE IF EXISTS razas_mascotas;
 CREATE TABLE razas_mascotas(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL,
  descripcion TEXT,
  tipo_mascota_id INTEGER NOT NULL,
  FOREIGN KEY (tipo_mascota_id) REFERENCES tipos_mascotas (id)
 );
 
 DROP TABLE IF EXISTS tipos_publicaciones;
 CREATE TABLE tipos_publicaciones (
 	id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_tipo_publicacion TEXT NOT NULL,
  codigo_tipo_publicacion TEXT NOT NULL,
  descripcion TEXT
 );
 
 DROP TABLE IF EXISTS opciones_procedencia_adopcion;
 CREATE TABLE opciones_procedencia_adopcion (
 	id INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_opcion_procedencia TEXT NOT NULL,
  descripcion_opcion_procedencia TEXT
 );
 
 DROP TABLE IF EXISTS publicaciones;
 CREATE TABLE publicaciones (
 	id INTEGER PRIMARY KEY AUTOINCREMENT,
  titulo TEXT,
  descripcion TEXT,
  imagen_url TEXT,
	usuario_id INTEGER NOT NULL,
  estado INTEGER NOT NULL DEFAULT 1, -- Activa 1 - Inactiva 0
  tipo_publicacion_id INTEGER NOT NULL,
  creado_en TEXT,
  actualizado_en TEXT,
   
  nombre_mascota TEXT,
  raza_mascota_id INTEGER,
  color_mascota TEXT,
  tamano_mascota_metros REAL,
  peso_mascota_kg REAL,
  fecha_evento_ocurrido TEXT, -- Para adopcion es fecha de nacimiento
  ubicacion_evento_ocurrido TEXT, -- Solo para los 3 reportes
  procedencia_id INTEGER, -- Solo para publicación de adopcion
   
  cantidad_me_gusta INTEGER NOT NULL DEFAULT 0,
  cantidad_comentarios INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (tipo_publicacion_id) REFERENCES tipos_publicaciones (id),
  FOREIGN KEY (raza_mascota_id) REFERENCES razas_mascotas (id),
  FOREIGN KEY (procedencia_id) REFERENCES opciones_procedencia_adopcion (id)
 );
 
 DROP TABLE IF EXISTS me_gusta;
 CREATE TABLE me_gusta (
 	id INTEGER PRIMARY KEY AUTOINCREMENT,
  usuario_id INTEGER NOT NULL,
  publicacion_id INTEGER NOT NULL,
  creado_en TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (publicacion_id) REFERENCES publicaciones (id)
 );
 
 DROP TABLE IF EXISTS comentarios;
 CREATE TABLE comentarios (
 	id INTEGER PRIMARY KEY AUTOINCREMENT,
 	contenido TEXT NOT NULL,
  usuario_id INTEGER NOT NULL,
  publicacion_id INTEGER NOT NULL,
  creado_en TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (publicacion_id) REFERENCES publicaciones (id)
 );
 
 DROP TABLE IF EXISTS asociaciones_beneficas;
 CREATE TABLE asociaciones_beneficas (
 	id INTEGER PRIMARY KEY AUTOINCREMENT,
 	nombre TEXT NOT NULL,
  descripcion TEXT,
  direccion TEXT,
  mision TEXT,
  email TEXT,
  numero_telefonico TEXT,
  imagen_url TEXT,
  sitio_web_url TEXT
 );

DROP TABLE IF EXISTS cuentas_bancarias_asociaciones_beneficas;
 CREATE TABLE cuentas_bancarias_asociaciones_beneficas (
 	id INTEGER PRIMARY KEY AUTOINCREMENT,
	asociacion_benefica_id INTEGER NOT NULL,
  numero_cuenta TEXT,
  banco TEXT,
  moneda TEXT,
  FOREIGN KEY (asociacion_benefica_id) REFERENCES asociaciones_beneficas (id)
 );