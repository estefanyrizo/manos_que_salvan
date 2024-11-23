INSERT INTO opciones_procedencia_adopcion (nombre_opcion_procedencia, descripcion_opcion_procedencia)
VALUES
('Rescatada', 'Mascota proveniente de la calle.'),
('Doméstica', 'Mascota proveniente de un hogar.');

INSERT INTO tipos_mascotas (nombre, descripcion)
VALUES
('Perro', 'Mascotas de tipo perro.'),
('Gato', 'Mascotas de tipo gato.'),
('Tortuga', 'Mascotas de tipo tortuga.'),
('Hamster', 'Mascotas de tipo hámster.'),
('Conejo', 'Mascotas de tipo conejo.'),
('Ave', 'Mascotas de tipo ave.');


INSERT INTO razas_mascotas (nombre, descripcion, tipo_mascota_id)
VALUES
-- Razas de perros
('Labrador Retriever', 'Raza amigable y activa.', 1),
('Pastor Alemán', 'Raza leal y protectora.', 1),
('Bulldog', 'Raza tranquila y cariñosa.', 1),
('Poodle', 'Raza inteligente y juguetona.', 1),
('Beagle', 'Raza curiosa y amigable.', 1),
('Chihuahua', 'Raza pequeña y valiente.', 1),
('Dálmata', 'Raza enérgica y con manchas características.', 1),
('Golden Retriever', 'Raza amigable y versátil.', 1),
('Siames', 'Raza con un carácter juguetón y curioso.', 2),
('Persa', 'Raza de pelo largo y comportamiento tranquilo.', 2),
('Maine Coon', 'Raza grande y sociable.', 2),
('Bengalí', 'Raza con apariencia de leopardo y activa.', 2),
('Esfinge', 'Raza sin pelo, afectuosa y curiosa.', 2),
('Angora Turco', 'Raza elegante y juguetona.', 2),
('Abisinio', 'Raza atlética y activa.', 2),
('Tortuga de Orejas Rojas', 'Especie acuática muy popular.', 3),
('Tortuga Sulcata', 'Tortuga terrestre de gran tamaño.', 3),
('Tortuga Rusa', 'Especie terrestre pequeña y resistente.', 3),
('Tortuga Leopardo', 'Tortuga terrestre con un caparazón decorado.', 3),
('Tortuga de Caja', 'Tortuga terrestre con caparazón abombado.', 3),
('Hámster Sirio', 'Hámster grande, amigable y solitario.', 4),
('Hámster Enano Ruso', 'Hámster pequeño y sociable.', 4),
('Hámster Roborovski', 'Hámster enano y muy activo.', 4),
('Hámster Chino', 'Hámster con cuerpo largo y ágil.', 4),
('Conejo Holandés', 'Raza pequeña con un patrón característico en su pelaje.', 5),
('Conejo Cabeza de León', 'Raza con una melena distintiva alrededor de su cabeza.', 5),
('Conejo Rex', 'Raza de pelaje corto y suave.', 5),
('Conejo Angora', 'Raza de pelo largo y esponjoso.', 5),
('Conejo Lop', 'Raza con orejas largas y caídas.', 5),
('Conejo Enano', 'Raza pequeña y juguetona.', 5),
('Canario', 'Ave conocida por su canto melodioso.', 6),
('Periquito', 'Ave pequeña y colorida.', 6),
('Cacatúa', 'Ave inteligente y expresiva.', 6),
('Agapornis', 'Ave conocida como inseparable, sociable y colorida.', 6),
('Loro Amazónico', 'Ave parlanchina y colorida.', 6),
('Guacamayo', 'Ave grande, colorida y sociable.', 6),
('Jilguero', 'Ave con un canto melodioso y carácter alegre.', 6);

INSERT INTO tipos_publicaciones (nombre_tipo_publicacion, codigo_tipo_publicacion, descripcion)
VALUES 
('Adopción', 'adopcion', 'Publicación para dar en adopción a una mascota.'),
('Mascota encontrada', 'mascota_encontrada', 'Publicación para reportar una mascota encontrada.'),
('Mascota perdida', 'mascota_perdida', 'Publicación para reportar una mascota perdida.'),
('Maltrato animal', 'maltrato_animal', 'Publicación para denunciar casos de maltrato animal.');

-- Insertar departamentos
INSERT INTO departamentos (id, nombre) VALUES (1, 'León'), (2, 'Chontales'), (3, 'Rivas'), (4, 'Costa Caribe Sur'), (5, 'Boaco'), (6, 'Costa Caribe Norte'), (7, 'Masaya'), (8, 'Chinandega'), (9, 'Nueva Segovia'), (10, 'Matagalpa'), (11, 'Managua'), (12, 'Estelí'), (13, 'Granada'), (14, 'Carazo'), (15, 'Río San Juan'), (16, 'Jinotega'), (17, 'Madriz');

-- Insertar municipios
INSERT INTO municipios (id, nombre, departamento_id) VALUES (1, 'Achuapa', 1), (2, 'El Jicaral', 1), (3, 'El Sauce', 1), (4, 'La Paz Centro', 1), (5, 'Larreynaga', 1), (6, 'León', 1), (7, 'Nagarote', 1), (8, 'Quezalguaque', 1), (9, 'Santa Rosa del Peñón', 1), (10, 'Telica', 1), (11, 'Acoyapa', 2), (12, 'Comalapa', 2), (13, 'El Coral', 2), (14, 'Juigalpa', 2), (15, 'La Libertad', 2), (16, 'San Francisco de Cuapa', 2), (17, 'San Pedro de Lóvago', 2), (18, 'Santo Domingo', 2), (19, 'Santo Tomás', 2), (20, 'Villa Sandino', 2), (21, 'Altagracia', 3), (22, 'Belén', 3), (23, 'Buenos Aires', 3), (24, 'Cárdenas', 3), (25, 'Moyogalpa', 3), (26, 'Potosí', 3), (27, 'Rivas', 3), (28, 'San Jorge', 3), (29, 'San Juan del Sur', 3), (30, 'Tola', 3), (31, 'Bluefields', 4), (32, 'Corn Island', 4), (33, 'Desembocadurade Río Grande', 4), (34, 'El Ayote', 4), (35, 'El Rama', 4), (36, 'El Tortuguero', 4), (37, 'Kukra Hill', 4), (38, 'La Cruz de Río Grande', 4), (39, 'Laguna de Perlas', 4), (40, 'Muelle de los Bueyes', 4), (41, 'Nueva Guinea', 4), (42, 'Paiwas', 4), (43, 'Boaco', 5), (44, 'Camoapa', 5), (45, 'San José de Los Remates', 5), (46, 'San Lorenzo', 5), (47, 'Santa Lucía', 5), (48, 'Teustepe', 5), (49, 'Bonanza', 6), (50, 'Mulukukú', 6), (51, 'Prinzapolka', 6), (52, 'Puerto Cabezas', 6), (53, 'Rosita', 6), (54, 'Siuna', 6), (55, 'Waslala', 6), (56, 'Waspán', 6), (57, 'Catarina', 7), (58, 'La Concepción', 7), (59, 'Masatepe', 7), (60, 'Masaya', 7), (61, 'Nandasmo', 7), (62, 'Nindirí', 7), (63, 'Niquinohomo', 7), (64, 'San Juan de Oriente', 7), (65, 'Tisma', 7), (66, 'Chichigalpa', 8), (67, 'Chinandega', 8), (68, 'Cinco Pinos', 8), (69, 'Corinto', 8), (70, 'El Realejo', 8), (71, 'El Viejo', 8), (72, 'Posoltega', 8), (73, 'Puerto Morazán', 8), (74, 'San Francisco del Norte', 8), (75, 'San Pedro del Norte', 8), (76, 'Santo Tomásdel Norte', 8), (77, 'Somotillo', 8), (78, 'Villanueva', 8), (79, 'Ciudad Antigua', 9), (80, 'Dipilto', 9), (81, 'El Jícaro', 9), (82, 'Jalapa', 9), (83, 'Macuelizo', 9), (84, 'Mozonte', 9), (85, 'Murra', 9), (86, 'Ocotal', 9), (87, 'Quilalí', 9), (88, 'San Fernando', 9), (89, 'Santa María', 9), (90, 'Wiwilí de Nueva Segovia', 9), (91, 'Ciudad Darío', 10), (92, 'El Tuma - La Dalia', 10), (93, 'Esquipulas', 10), (94, 'Matagalpa', 10), (95, 'Matiguás', 10), (96, 'Muy Muy', 10), (97, 'Rancho Grande', 10), (98, 'Río Blanco', 10), (99, 'San Dionisio', 10), (100, 'San Isidro', 10), (101, 'San Ramón', 10), (102, 'Sébaco', 10), (103, 'Terrabona', 10), (104, 'Ciudad Sandino', 11), (105, 'El Crucero', 11), (106, 'Managua', 11), (107, 'Mateare', 11), (108, 'San Francisco Libre', 11), (109, 'San Rafael del Sur', 11), (110, 'Ticuantepe', 11), (111, 'Tipitapa', 11), (112, 'VillaCarlos Fonseca', 11), (113, 'Condega', 12), (114, 'Estelí', 12), (115, 'La Trinidad', 12), (116, 'Pueblo Nuevo', 12), (117, 'San Juan de Limay', 12), (118, 'San Nicolás', 12), (119, 'Diriá', 13), (120, 'Diriomo', 13), (121, 'Granada', 13), (122, 'Nandaime', 13), (123, 'Diriamba', 14), (124, 'Dolores', 14), (125, 'El Rosario', 14), (126, 'Jinotepe', 14), (127, 'La Conquista', 14), (128, 'La Paz de Carazo', 14), (129, 'San Marcos', 14), (130, 'Santa Teresa', 14), (131, 'El Almendro', 15), (132, 'El Castillo', 15), (133, 'Morrito', 15), (134, 'San Carlos', 15), (135, 'San Juan del Norte', 15), (136, 'San Miguelito', 15), (137, 'El Cuá', 16), (138, 'Jinotega', 16), (139, 'La Concordia', 16), (140, 'San José de Bocay', 16), (141, 'San Rafael del Norte', 16), (142, 'San Sebastián de Yalí', 16), (143, 'Santa María de Pantasma', 16), (144, 'Wiwilí de Jinotega', 16), (145, 'Las Sabanas', 17), (146, 'Palacagüina', 17), (147, 'San José de Cusmapa', 17), (148, 'San Juan de Río Coco', 17), (149, 'San Lucas', 17), (150, 'Somoto', 17), (151, 'Telpaneca', 17), (152, 'Totogalpa', 17), (153, 'Yalagüina', 17);
