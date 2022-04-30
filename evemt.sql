-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.48-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.0.0.5460
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para eventos
CREATE DATABASE IF NOT EXISTS `eventos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `eventos`;

-- Volcando estructura para tabla eventos.asis
CREATE TABLE IF NOT EXISTS `asis` (
  `Fecha` date NOT NULL DEFAULT '2018-01-01',
  `fk_usuario` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `tiempo` varchar(2) NOT NULL DEFAULT 'NN',
  PRIMARY KEY (`Fecha`,`fk_usuario`,`Evento_idEvento`,`tiempo`),
  KEY `foranea_evento_idx` (`Evento_idEvento`),
  KEY `fk_idusuarioasi_idx` (`fk_usuario`),
  CONSTRAINT `fk_ideventoasi` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuarioasi` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.asis: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `asis` DISABLE KEYS */;
INSERT INTO `asis` (`Fecha`, `fk_usuario`, `Evento_idEvento`, `tiempo`) VALUES
	('2018-05-19', 14, 7, 'AM'),
	('2018-05-19', 14, 7, 'PM'),
	('2018-06-06', 7, 16, 'PM'),
	('2018-06-06', 8, 16, 'PM'),
	('2018-06-06', 28, 16, 'PM');
/*!40000 ALTER TABLE `asis` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.certficado
CREATE TABLE IF NOT EXISTS `certficado` (
  `idCertficado` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `Asistencia_idAsistencia` int(11) NOT NULL,
  PRIMARY KEY (`idCertficado`),
  KEY `fk_Certficado_Asistencia1` (`Asistencia_idAsistencia`),
  CONSTRAINT `fk_Certficado_Asistencia1` FOREIGN KEY (`Asistencia_idAsistencia`) REFERENCES `asistencia` (`idAsistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.certficado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `certficado` DISABLE KEYS */;
/*!40000 ALTER TABLE `certficado` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.cronograma
CREATE TABLE IF NOT EXISTS `cronograma` (
  `idCronograma` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idEvento` int(11) NOT NULL,
  `fk_idusuario` int(11) NOT NULL,
  `tema` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`idCronograma`),
  KEY `fk_Cronograma_usuario1_idx` (`fk_idusuario`),
  KEY `fk_Cronograma_evento1_idx` (`fk_idEvento`),
  CONSTRAINT `fk_Cronograma_evento1` FOREIGN KEY (`fk_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cronograma_usuario1` FOREIGN KEY (`fk_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.cronograma: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `cronograma` DISABLE KEYS */;
INSERT INTO `cronograma` (`idCronograma`, `fk_idEvento`, `fk_idusuario`, `tema`, `fecha`, `hora`) VALUES
	(1, 14, 21, ' leer 2018', '2018-05-22', '08:00:00'),
	(2, 14, 19, ' la lectura y sus beneficios ', '2018-05-22', '09:00:00'),
	(3, 14, 17, ' lectura critica ', '2018-05-22', '14:00:00'),
	(4, 16, 19, ' La mariposas y la paz ', '2018-06-21', '08:00:00'),
	(5, 16, 17, ' el tratado de la paz ', '2018-06-21', '10:00:00'),
	(6, 8, 17, '  la en el mundo', '2018-06-17', '08:00:00');
/*!40000 ALTER TABLE `cronograma` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.detalle_evento
CREATE TABLE IF NOT EXISTS `detalle_evento` (
  `idDetalle_evento` int(11) NOT NULL AUTO_INCREMENT,
  `Evento_idEvento` int(11) NOT NULL,
  `Sitio_idSitio` int(11) NOT NULL,
  PRIMARY KEY (`idDetalle_evento`),
  KEY `fk_Detalle_evento_Evento1` (`Evento_idEvento`),
  KEY `FK_detalle_evento_sitio` (`Sitio_idSitio`),
  CONSTRAINT `fk_Detalle_evento_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  CONSTRAINT `FK_detalle_evento_sitio` FOREIGN KEY (`Sitio_idSitio`) REFERENCES `sitio` (`idSitio`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.detalle_evento: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_evento` DISABLE KEYS */;
INSERT INTO `detalle_evento` (`idDetalle_evento`, `Evento_idEvento`, `Sitio_idSitio`) VALUES
	(2, 7, 1),
	(3, 8, 1),
	(4, 9, 1),
	(5, 10, 1),
	(6, 14, 1),
	(8, 16, 1),
	(9, 18, 1),
	(10, 17, 1),
	(11, 19, 1),
	(12, 20, 1),
	(13, 21, 1);
/*!40000 ALTER TABLE `detalle_evento` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.detalle_material
CREATE TABLE IF NOT EXISTS `detalle_material` (
  `idDetalle_Material` int(11) NOT NULL AUTO_INCREMENT,
  `FK_idEvento` int(11) NOT NULL,
  `FK_idMaterial` int(11) NOT NULL,
  PRIMARY KEY (`idDetalle_Material`),
  KEY `fk_Detalle_Material_material__evento1_idx` (`FK_idMaterial`),
  KEY `fk_Detalle_Material_evento1_idx` (`FK_idEvento`),
  CONSTRAINT `fk_Detalle_Material_evento1` FOREIGN KEY (`FK_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Material_material__evento1` FOREIGN KEY (`FK_idMaterial`) REFERENCES `material` (`idMaterial__Evento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.detalle_material: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_material` DISABLE KEYS */;
INSERT INTO `detalle_material` (`idDetalle_Material`, `FK_idEvento`, `FK_idMaterial`) VALUES
	(4, 7, 6),
	(5, 7, 1),
	(6, 7, 4),
	(7, 8, 5),
	(8, 8, 4),
	(9, 8, 3),
	(10, 9, 3),
	(11, 9, 4),
	(12, 10, 4),
	(13, 10, 1),
	(14, 14, 5),
	(15, 14, 3),
	(16, 14, 4),
	(17, 16, 4),
	(18, 18, 5),
	(19, 18, 4),
	(20, 17, 4),
	(21, 17, 5),
	(22, 19, 6),
	(23, 20, 4),
	(24, 21, 3);
/*!40000 ALTER TABLE `detalle_material` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_empresa` varchar(100) DEFAULT NULL,
  `Nit` bigint(11) DEFAULT NULL,
  `celular` bigint(11) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.empresa: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`idempresa`, `Nombre_empresa`, `Nit`, `celular`, `Correo`) VALUES
	(1, 'App-Event', 1232323, 3165807846, 'appevent2018@gmail.com');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.evento
CREATE TABLE IF NOT EXISTS `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `director_evento` int(11) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Fecha_creacion` date DEFAULT NULL,
  `Fecha_fin` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `director_evento_idx` (`director_evento`),
  CONSTRAINT `director_evento` FOREIGN KEY (`director_evento`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.evento: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` (`idEvento`, `Nombre`, `director_evento`, `Estado`, `Descripcion`, `Fecha_creacion`, `Fecha_fin`, `Hora`) VALUES
	(7, 'Marco Normativo Y Forense ', NULL, 'activo', 'por una cultura de paz y respeto por la vida', '2018-05-19', '2018-05-19', '08:00:00'),
	(8, 'III Congreso Internacional', NULL, 'activo', 'Responsabilidad social en el posconflicto ', '2019-02-16', '2019-02-18', '08:00:00'),
	(9, 'congreso Tic', NULL, 'activo', 'ejes: realidad aumentada . inteligencia artificial', '2018-05-21', '2018-05-25', '08:00:00'),
	(10, 'Maratón de Programación ', NULL, 'activo', 'Nivel 1 Pseint. Java\r\nNivel 2 Java c++\r\n', '2019-01-25', '2019-01-27', '13:00:00'),
	(12, 'Congreso Nacional De Investigación ', NULL, 'activo', 'Impacto de la ivestigacion en las regiones', '2018-05-17', '2018-05-18', '08:00:00'),
	(13, 'seminario ', NULL, 'activo', 'seminario investigación ttic ', '2018-05-11', '2018-05-11', '08:00:00'),
	(14, 'Congreso literatura', 20, 'activo', 'lengua y literatura', '2018-05-22', '2018-05-24', '08:00:00'),
	(16, 'Congreso Internacional por la paz ', 20, 'activo', ' Trasformando vidas ', '2018-06-21', '2018-06-22', '08:00:00'),
	(17, '1° CONGRESO INTERNACIONAL', 20, 'activo', 'por la defensa de la diversidad   y lucha contra la corrupción ', '2018-10-11', '2018-10-13', '08:00:00'),
	(18, 'En- mafi', 20, 'activo', 'impacto', '2018-05-30', '2018-06-01', '08:00:00'),
	(19, 'Festival de Gimnasia', 29, 'activo', 'licenciatura en educación física y deportes ', '2018-06-08', '2018-06-08', '08:00:00'),
	(20, 'Evento de Prueba', 29, 'activo', 'porvando ando ', '2018-06-08', '2018-06-08', '08:00:00'),
	(21, 'Sustentacion', 20, 'activo', 'a ver si pasamos ', '2018-06-08', '2018-06-08', '08:00:00');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.galeria
CREATE TABLE IF NOT EXISTS `galeria` (
  `idGaleria` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idGaleria`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.galeria: ~63 rows (aproximadamente)
/*!40000 ALTER TABLE `galeria` DISABLE KEYS */;
INSERT INTO `galeria` (`idGaleria`, `foto`) VALUES
	(1, '../../Imagenes/'),
	(2, '../../Imagenes/28945241_1988512351398434_235121633_o.jpg'),
	(3, '../../Imagenes/'),
	(4, '../../Imagenes/Heisenberg-large.png'),
	(5, '../../Imagenes/WIN_20180421_12_45_45_Pro.jpg'),
	(6, '../../Imagenes/29468295_1618408568245165_5276302679583227904_n.jpg'),
	(7, '../../Imagenes/Heisenberg-large.png'),
	(8, '../../Imagenes/icono.png'),
	(9, '../../Imagenes/logg.png'),
	(10, '../../Imagenes/29468295_1618408568245165_5276302679583227904_n.jpg'),
	(11, '../../Imagenes/icono.png'),
	(12, '../../Imagenes/uni3.jpg'),
	(13, '../../Imagenes/uni5.jpg'),
	(14, '../../Imagenes/uni2.jpg'),
	(15, '../../Imagenes/yo.jpg'),
	(17, '../../Imagenes/logg.png'),
	(18, '../../Imagenes/andres.jpg'),
	(19, '../../Imagenes/Flor.jpg'),
	(21, '../../Imagenes/uni2.jpg'),
	(22, '../../Imagenes/28945241_1988512351398434_235121633_o.jpg'),
	(23, '../../Imagenes/28945480_1988512328065103_1957655827_o.jpg'),
	(24, '../../Imagenes/Banner_SimposioMVZ.jpg'),
	(25, '../../Imagenes/sdf.jpg'),
	(26, '../../Imagenes/sda.jpg'),
	(27, '../../Imagenes/Banner_maratonPROGRAMACION2018.jpg'),
	(28, '../../Imagenes/28945241_1988512351398434_235121633_o.jpg'),
	(29, '../../Imagenes/rosa.png'),
	(30, '../../Imagenes/31749511_628716954175060_7271397220019077120_n.jpg'),
	(31, '../../Imagenes/rosa.png'),
	(32, '../../Imagenes/rosa.png'),
	(33, '../../Imagenes/rosa.png'),
	(34, '../../Imagenes/bbx_138990510_tomando-cocacola1.jpg'),
	(35, '../../Imagenes/maxresdefault.jpg'),
	(36, '../../Imagenes/944x240-Banner V Congreso Nacional de Inv.Admon..jpg'),
	(37, '../../Imagenes/944x240-1er Congreso Internacional- 2do didactiva de la lengua castellana.jpg'),
	(38, '../../Imagenes/28945241_1988512351398434_235121633_o.jpg'),
	(39, '../../Imagenes/Banner_maratonPROGRAMACION2018.jpg'),
	(40, '../../Imagenes/944x240-1er Congreso Internacional- 2do didactiva de la lengua castellana.jpg'),
	(41, '../../Imagenes/Banner_EnMaFi-2018.jpg'),
	(42, '../../Imagenes/944x240-Congreso Internacional Theobroma.jpg'),
	(43, '../../Imagenes/maxresdefault.jpg'),
	(44, '../../Imagenes/slide-2.jpg'),
	(45, '../../Imagenes/3A0.jpg'),
	(46, '../../Imagenes/descarga.png'),
	(47, '../../Imagenes/u.jpg'),
	(48, '../../Imagenes/bbx_138990510_tomando-cocacola1.jpg'),
	(49, '../../Imagenes/Flor.jpg'),
	(50, '../../Imagenes/944x240-Congreso Internacional Theobroma.jpg'),
	(51, '../../Imagenes/944x240-1 - Congreso Internacional - Defensa de la biodiversidad.jpg'),
	(52, '../../Imagenes/bbx_138990510_tomando-cocacola1.jpg'),
	(53, '../../Imagenes/944x240-Banner EnMaFi-2018 -UDLA.jpg'),
	(54, '-----'),
	(55, '../../Imagenes/3A0.jpg'),
	(56, '../../Imagenes/logg.png'),
	(57, '../../Imagenes/Flor.jpg'),
	(58, '../../Imagenes/Festival de la Gimnasia Educativa.jpg'),
	(59, '../../Imagenes/face-recognition-using-opencv-2.png'),
	(60, '../../Imagenes/tensorflow-3-638.jpg'),
	(61, '../../Imagenes/28945241_1988512351398434_235121633_o.jpg'),
	(62, '../../Imagenes/sda.jpg'),
	(63, '../../Imagenes/OpenCV_Logo_with_text.png'),
	(64, '../../Imagenes/944x240-ArazaLAB.jpg'),
	(65, '../../Imagenes/0d9def0c985b2acb5cf8c162963095d2.png');
/*!40000 ALTER TABLE `galeria` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.galeria_eventos
CREATE TABLE IF NOT EXISTS `galeria_eventos` (
  `idGaleria_eventos` int(11) NOT NULL AUTO_INCREMENT,
  `FK_idEvento` int(11) NOT NULL,
  `FK_idGaleria` int(11) NOT NULL,
  PRIMARY KEY (`idGaleria_eventos`),
  KEY `fk_Galeria_eventos_evento1_idx` (`FK_idEvento`),
  KEY `fk_Galeria_eventos_galeria1_idx` (`FK_idGaleria`),
  CONSTRAINT `fk_Galeria_eventos_evento1` FOREIGN KEY (`FK_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Galeria_eventos_galeria1` FOREIGN KEY (`FK_idGaleria`) REFERENCES `galeria` (`idGaleria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.galeria_eventos: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `galeria_eventos` DISABLE KEYS */;
INSERT INTO `galeria_eventos` (`idGaleria_eventos`, `FK_idEvento`, `FK_idGaleria`) VALUES
	(1, 7, 24),
	(2, 8, 25),
	(3, 9, 26),
	(4, 10, 27),
	(6, 12, 36),
	(7, 13, 37),
	(8, 14, 40),
	(11, 16, 50),
	(12, 17, 51),
	(13, 18, 53),
	(14, 19, 58),
	(16, 20, 62),
	(17, 21, 64);
/*!40000 ALTER TABLE `galeria_eventos` ENABLE KEYS */;

-- Volcando estructura para procedimiento eventos.insertMaterial
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMaterial`( pk_evento varchar(50), pk_Material varchar(50) )
BEGIN
DECLARE cont int;
set cont=(select max(idDetalle_Material)+1 from detalle_material);
insert into detalle_Material values (cont,pk_evento,pk_Material);
END//
DELIMITER ;

-- Volcando estructura para procedimiento eventos.insert_evento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_evento`(
	IN `p_nombre` VARCHAR(50),
    IN `P_fkdirector` int(11),
	IN `p_descripcion` VARCHAR(50),
	IN `p_fecha_creacion` date,
	IN `p_fecha_fin`date,
	IN `p_hora`time,
    IN `p_imagen` varchar(200)
  
)
BEGIN

DECLARE cont int;
set cont=(select max(idEvento)+1 from evento);
insert into evento values(cont,p_nombre,P_fkdirector,'activo',
p_descripcion,p_fecha_creacion,p_fecha_fin,p_hora);
insert into galeria (foto) values (p_imagen);
insert into galeria_eventos(FK_idEvento,FK_idGaleria) 
values((select max(idEvento) from evento),(select  max(idGaleria) from galeria));
UPDATE usuario_rol set Rol_idRol=4  WHERE Usuario_idUsuario=P_fkdirector ;

END//
DELIMITER ;

-- Volcando estructura para procedimiento eventos.insert_material
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_material`(
p_Nombre varchar (90),
p_Descripcion varchar (100)
)
BEGIN
declare cont int;
set cont=(select max(idMaterial__Evento)+1  from material);
insert into material(idMaterial__Evento,Nombre_Material,Descripcion,estado) values
(cont,p_Nombre,p_Descripcion,'A' );
END//
DELIMITER ;

-- Volcando estructura para procedimiento eventos.insert_ponente
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_ponente`(
	IN `p_nombre` VARCHAR(50),
	IN `p_apellidos` VARCHAR(50),
	IN `p_correo` VARCHAR(50),
	IN  p_tipo varchar(50),
	IN `p_contrasena` VARCHAR(50),
	IN  p_tema VARCHAR(50),
	IN  p_hora TIME
)
BEGIN

DECLARE cont int;
set cont=(select max(idPonente)+1 from Ponente);
insert into Ponente values(cont,p_nombre,p_apellidos,p_correo,p_tipo, md5(p_contrasena),p_tema,p_hora,2);
END//
DELIMITER ;

-- Volcando estructura para procedimiento eventos.insert_usuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_usuario`(
	IN `p_nombre` VARCHAR(50),
	IN `p_apellidos` VARCHAR(50),
    IN `p_cedula`  BIGINT ,
	IN `p_correo` VARCHAR(50),
	IN `p_contrasena` VARCHAR(50),
	IN `p_recontrasena` VARCHAR(50),
    IN `p_imagen` varchar(200)
)
BEGIN

DECLARE cont int;
set cont=(select max(idusuario)+1 from usuario);
insert into usuario values(cont,p_nombre,p_apellidos,P_cedula,p_correo,md5(p_contrasena),md5(p_recontrasena),'A');
insert into usuario_rol (Usuario_idUsuario,Rol_idRol) values((select max(idusuario)from usuario),3);
insert into galeria (foto) values (p_imagen);
insert into usuario_galeria(FK_idusuario,FK_idGaleria) 
values((select max(idusuario) from usuario),(select  max(idGaleria) from galeria));
END//
DELIMITER ;

-- Volcando estructura para procedimiento eventos.insert_usu_Admin
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_usu_Admin`(
	IN `p_nombre` VARCHAR(50),
	IN `p_apellidos` VARCHAR(50),
	IN `p_cedula`  BIGINT ,
	IN `p_correo` VARCHAR(50),
	IN `p_contrasena` VARCHAR(50),
	IN `p_recontrasena` VARCHAR(50),
    IN `p_rol` varchar(200),
	IN `p_imagen` varchar(200)
)
BEGIN

DECLARE cont int;
set cont=(select max(idusuario)+1 from usuario);
insert into usuario values(cont,p_nombre,p_apellidos,p_cedula,p_correo,md5(p_contrasena),md5(p_recontrasena),'A');
insert into usuario_rol (Usuario_idUsuario,Rol_idRol) values((select max(idusuario)from usuario),p_rol);
insert into galeria (foto) values (p_imagen);
insert into usuario_galeria(FK_idusuario,FK_idGaleria) 
values((select max(idusuario) from usuario),(select  max(idGaleria) from galeria));
END//
DELIMITER ;

-- Volcando estructura para tabla eventos.material
CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial__Evento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Material` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`idMaterial__Evento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.material: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` (`idMaterial__Evento`, `Nombre_Material`, `Descripcion`, `estado`) VALUES
	(1, 'parlantes', 'dispositivo de sonido', 'A'),
	(2, 'sillas', 'Rimax', 'A'),
	(3, 'computador', 'Tipo Portatil ', 'A'),
	(4, 'microfono', 'inalambrico', 'A'),
	(5, 'lasser', 'apuntador', 'A'),
	(6, 'carpas', 'se necesitan unas 20 carpas', 'A');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `idMenú` int(11) NOT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Icono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMenú`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.menu: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`idMenú`, `Titulo`, `Icono`) VALUES
	(1, 'Gestionar Usuario', 'fa fa-group'),
	(2, 'Eventos', 'fa fa-newspaper-o'),
	(3, 'Reportes', 'fa fa-check'),
	(4, 'Sitios', 'fa fa-university'),
	(5, 'Material', 'fa fa-cog'),
	(6, 'Certificado', 'fa fa-file-text-o'),
	(7, 'Pago', 'fa fa-credit-card'),
	(8, 'Cronograma', 'fa fa-calendar-o'),
	(9, 'Asistencia ', 'fa fa-file-text-o'),
	(10, 'Refrigerios ', 'fa fa-check');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `idPago` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Fecha_Pago` varchar(45) DEFAULT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_Pago_Evento1` (`Evento_idEvento`),
  CONSTRAINT `fk_Pago_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.pago: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idpersona` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.refri
CREATE TABLE IF NOT EXISTS `refri` (
  `fecha` date NOT NULL DEFAULT '2018-01-01',
  `fk_evento` int(11) NOT NULL,
  `fk_usuario` int(11) NOT NULL,
  `tiempo` varchar(2) NOT NULL DEFAULT 'NN',
  PRIMARY KEY (`fk_evento`,`fecha`,`fk_usuario`,`tiempo`),
  KEY `fk_usuariorefri_idx` (`fk_usuario`),
  CONSTRAINT `fk_eventrefri` FOREIGN KEY (`fk_evento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuariorefri` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.refri: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `refri` DISABLE KEYS */;
INSERT INTO `refri` (`fecha`, `fk_evento`, `fk_usuario`, `tiempo`) VALUES
	('2018-06-06', 16, 7, 'PM'),
	('2018-06-06', 16, 8, 'PM');
/*!40000 ALTER TABLE `refri` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.registro_event
CREATE TABLE IF NOT EXISTS `registro_event` (
  `idRegistro_event` int(11) NOT NULL AUTO_INCREMENT,
  `FK_idEvento` int(11) NOT NULL,
  `FK_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idRegistro_event`),
  KEY `fk_Registro_event_evento1_idx` (`FK_idEvento`),
  KEY `fk_Registro_event_usuario1_idx` (`FK_idusuario`),
  CONSTRAINT `fk_Registro_event_evento1` FOREIGN KEY (`FK_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_event_usuario1` FOREIGN KEY (`FK_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.registro_event: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `registro_event` DISABLE KEYS */;
INSERT INTO `registro_event` (`idRegistro_event`, `FK_idEvento`, `FK_idusuario`) VALUES
	(2, 7, 8),
	(3, 8, 9),
	(7, 8, 14),
	(8, 8, 4),
	(9, 7, 15),
	(10, 7, 14),
	(12, 10, 12),
	(14, 9, 9),
	(16, 9, 7),
	(19, 8, 6),
	(20, 8, 5),
	(23, 8, 1),
	(25, 9, 17),
	(27, 10, 18),
	(28, 7, 18),
	(29, 10, 19),
	(30, 7, 19),
	(31, 18, 14),
	(32, 18, 31),
	(33, 16, 8),
	(34, 16, 7),
	(35, 16, 28),
	(36, 17, 28),
	(37, 17, 31),
	(38, 17, 8),
	(39, 7, 12),
	(40, 20, 14),
	(41, 21, 34);
/*!40000 ALTER TABLE `registro_event` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` int(11) NOT NULL,
  `Nombre_Rol` varchar(35) DEFAULT NULL,
  `Estado` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.rol: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`idRol`, `Nombre_Rol`, `Estado`) VALUES
	(1, 'Administrador', 'Activo'),
	(2, 'Ponente', 'Activo'),
	(3, 'Participante', 'Activo'),
	(4, 'Director Evento', 'Activo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.rol_vista
CREATE TABLE IF NOT EXISTS `rol_vista` (
  `id` int(11) NOT NULL,
  `rol_idRol` int(11) NOT NULL,
  `vista_idVista` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Rol_Vista_rol1_idx` (`rol_idRol`),
  KEY `fk_Rol_Vista_vista1_idx` (`vista_idVista`),
  CONSTRAINT `fk_Rol_Vista_rol1` FOREIGN KEY (`rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_Vista_vista1` FOREIGN KEY (`vista_idVista`) REFERENCES `vista` (`idVista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.rol_vista: ~38 rows (aproximadamente)
/*!40000 ALTER TABLE `rol_vista` DISABLE KEYS */;
INSERT INTO `rol_vista` (`id`, `rol_idRol`, `vista_idVista`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(9, 2, 25),
	(10, 2, 6),
	(11, 3, 25),
	(12, 3, 22),
	(13, 1, 9),
	(17, 2, 11),
	(18, 1, 13),
	(19, 1, 14),
	(20, 1, 15),
	(25, 1, 20),
	(26, 2, 15),
	(29, 2, 20),
	(34, 3, 20),
	(36, 2, 21),
	(37, 3, 21),
	(38, 1, 23),
	(40, 1, 26),
	(41, 4, 3),
	(46, 4, 6),
	(47, 4, 27),
	(48, 4, 28),
	(49, 4, 29),
	(50, 4, 9),
	(51, 4, 14),
	(52, 4, 15),
	(53, 4, 30),
	(54, 3, 31),
	(55, 3, 32),
	(56, 1, 33),
	(57, 4, 34),
	(58, 3, 18),
	(59, 4, 35);
/*!40000 ALTER TABLE `rol_vista` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.sitio
CREATE TABLE IF NOT EXISTS `sitio` (
  `idSitio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_sitio` varchar(45) DEFAULT NULL,
  `Estado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idSitio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.sitio: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `sitio` DISABLE KEYS */;
INSERT INTO `sitio` (`idSitio`, `Nombre_sitio`, `Estado`) VALUES
	(1, 'Campus Porvenir', 'activo'),
	(2, 'sala3', 'activo'),
	(3, 'sala computo', 'activo'),
	(6, 'Sede Centro', 'activo'),
	(7, 'sede idema', 'activo'),
	(8, 'sede leticia', 'activo');
/*!40000 ALTER TABLE `sitio` ENABLE KEYS */;

-- Volcando estructura para procedimiento eventos.update_uauario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_uauario`(
p_nombre varchar(100),
p_apellido varchar (100),
p_correo varchar (100),
p_contrasena varchar (100),
p_idusuario int  (11),
p_idrol int (11)
)
BEGIN

UPDATE usuario SET nombres=p_nombre , apellidos =p_apellido , correo =p_correo , contrasena=md5(p_contrasena)WHERE idusuario=p_idusuario; 
UPDATE usuario_rol set Rol_idRol=p_idrol  WHERE Usuario_idUsuario=p_idusuario ;

END//
DELIMITER ;

-- Volcando estructura para tabla eventos.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `cedula` bigint(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `recontrasena` varchar(100) DEFAULT NULL,
  `estado` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.usuario: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idusuario`, `nombres`, `apellidos`, `cedula`, `correo`, `contrasena`, `recontrasena`, `estado`) VALUES
	(1, 'pepe', 'perezs', 1234123456, 'pepito@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(2, 'juan', 'losano', 2234563123, 'jvc@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(4, 'javier', 'Ortiz', 6545367892, 'javi@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(5, 'mateo ', 'Molina', 2456788992, 'mateo@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(6, 'victor ', 'cediel', 3454678893, 'victor@hotmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(7, 'Andres Felipe', 'Carvajal', 4555626243, 'Andy@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(8, 'Alejandra', 'Florez ', 4354657838, 'aleja@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(9, 'Cristian Camilo', 'Marulanda ', 5466738929, 'cristian@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'I'),
	(12, 'Mateo', 'Molina ', 5467838998, 'molinamateo447@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(14, 'Jaime felipe', 'Florez', 6475783858, 'jai.florez@udla.edu.co', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(15, 'David ', 'Ospina', 5463788299, 'ospi@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(17, 'yesica', 'perez', 6546373383, 'yeka@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(18, 'Patricia', 'Rodriguez', 5463637838, 'pao@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(19, 'Gabriel', 'Garcia', 5463673782, 'gar@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(20, 'Alejandra ', 'penna', 5463737389, 'alejita@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(21, 'Juan', 'Rodriguez', 4647838939, 'Juan@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(24, 'Duvan', 'Ceron', 6657890993, 'duvanceroon@hotmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(25, 'yeison ', 'cuesta', 6537474893, 'jaflors074@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(26, 'David Hernando', 'Florez', 5636738748, 'jaflors2010@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(27, 'Mateo  Hernando', 'Molina', 6536373383, 'matius9991@hotmail.es', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(28, 'Daniel Steven', 'Restrepo', 1083882135, 'dani@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(29, 'Fredy ', 'Garzon', 1234567890, 'fredy@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(30, 'Lesly', 'Martines', 1234567889, 'lesly@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '827ccb0eea8a706c4c34a16891f84e7b', 'A'),
	(31, 'fredy javier', 'Rodriguez', 1083772135, 'fred@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(32, 'Fabian ', 'Forero', 1234567890, 'fa.forero@udla.edu.cco', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(33, 'Juan Mateo', 'Mendieta', 1233345677, 'mat.molina@udla.edu.co', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(34, 'Pedro', 'Paramo', 1234567812, 'pedro@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A'),
	(35, 'sinforoso', 'rodriges', 121323, 'sinforo@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '81dc9bdb52d04dc20036dbd8313ed055', 'A');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.usuario_galeria
CREATE TABLE IF NOT EXISTS `usuario_galeria` (
  `idusuario_galeria` int(11) NOT NULL AUTO_INCREMENT,
  `FK_idusuario` int(11) NOT NULL,
  `FK_idGaleria` int(11) NOT NULL,
  PRIMARY KEY (`idusuario_galeria`),
  KEY `fk_usuario_galeria_usuario1_idx` (`FK_idusuario`),
  KEY `fk_usuario_galeria_Galeria1_idx` (`FK_idGaleria`),
  CONSTRAINT `fk_usuario_galeria_Galeria1` FOREIGN KEY (`FK_idGaleria`) REFERENCES `galeria` (`idGaleria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_galeria_usuario1` FOREIGN KEY (`FK_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.usuario_galeria: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_galeria` DISABLE KEYS */;
INSERT INTO `usuario_galeria` (`idusuario_galeria`, `FK_idusuario`, `FK_idGaleria`) VALUES
	(1, 1, 1),
	(2, 2, 4),
	(5, 4, 5),
	(6, 5, 6),
	(7, 6, 7),
	(8, 7, 8),
	(9, 8, 9),
	(10, 9, 10),
	(14, 12, 17),
	(16, 14, 19),
	(18, 15, 29),
	(20, 17, 31),
	(21, 18, 32),
	(22, 19, 33),
	(23, 20, 34),
	(24, 21, 35),
	(27, 24, 45),
	(28, 25, 46),
	(29, 26, 47),
	(30, 27, 52),
	(31, 28, 54),
	(32, 29, 55),
	(33, 30, 56),
	(34, 31, 57),
	(35, 32, 59),
	(36, 33, 60),
	(37, 34, 63),
	(38, 35, 65);
/*!40000 ALTER TABLE `usuario_galeria` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.usuario_rol
CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `idUsuario_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario_Rol`),
  KEY `fk_Usuario_Rol_Usuario` (`Usuario_idUsuario`),
  KEY `fk_Usuario_Rol_Rol1` (`Rol_idRol`),
  CONSTRAINT `fk_Usuario_Rol_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `fk_Usuario_Rol_Usuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.usuario_rol: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` (`idUsuario_Rol`, `Usuario_idUsuario`, `Rol_idRol`) VALUES
	(1, 1, 3),
	(2, 2, 1),
	(5, 4, 3),
	(6, 5, 3),
	(7, 6, 2),
	(8, 7, 3),
	(9, 8, 3),
	(10, 9, 3),
	(14, 12, 3),
	(16, 14, 3),
	(18, 15, 3),
	(20, 17, 2),
	(21, 18, 3),
	(22, 19, 2),
	(23, 20, 4),
	(24, 21, 2),
	(27, 24, 2),
	(28, 25, 3),
	(29, 26, 3),
	(30, 27, 3),
	(31, 28, 3),
	(32, 29, 4),
	(33, 30, 3),
	(34, 31, 3),
	(35, 32, 3),
	(36, 33, 3),
	(37, 34, 3),
	(38, 35, 3);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;

-- Volcando estructura para tabla eventos.vista
CREATE TABLE IF NOT EXISTS `vista` (
  `idVista` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `icono` varchar(45) DEFAULT NULL,
  `Menu_idMenu` int(11) NOT NULL,
  PRIMARY KEY (`idVista`),
  KEY `fk_Vista_Menu` (`Menu_idMenu`),
  CONSTRAINT `fk_Vista_Menu` FOREIGN KEY (`Menu_idMenu`) REFERENCES `menu` (`idMenú`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla eventos.vista: ~32 rows (aproximadamente)
/*!40000 ALTER TABLE `vista` DISABLE KEYS */;
INSERT INTO `vista` (`idVista`, `nombre`, `url`, `icono`, `Menu_idMenu`) VALUES
	(1, 'Registrar Usuario', ' ../Aministrador\\Registrar_usu_admi.aspx', 'fa fa-pencil', 1),
	(2, 'Consultar Usuario', '../Aministrador/Consultar_usu_admin.aspx', 'fa fa-eye', 1),
	(3, 'Actualizar Usuario', '../Aministrador/Actualizar_usuario.aspx', 'fa fa-edit', 1),
	(5, 'Registrar Evento', '../Aministrador/Evento.aspx', 'fa fa-pencil', 2),
	(6, 'Consultar Evento', '../Eventos/Cevent.aspx', 'fa fa-eye', 2),
	(7, 'Actualizar Evento', '../Aministrador/Actualizar_event.aspx', 'fa fa-edit', 2),
	(8, 'Eliminar Evento', '../Eventos/Eevent.aspx', 'fa fa-remove', 2),
	(9, 'Registrar Sitio', '../Sitio/RSitio.aspx', 'fa fa-pencil', 4),
	(11, 'Consultar Sitio', '../Sitio/CSitio.aspx', 'fa fa-eye', 4),
	(12, 'Eliminar Sitio', '../Sitio/ESitio.aspx', 'fa fa-remove', 4),
	(13, 'Administrar Evento', '../Aministrador/Administrar_evento.aspx', 'fa fa-pencil', 2),
	(14, 'Registrar Material', '../Aministrador/Registrar_Material_admin.aspx', 'fa fa-pencil', 5),
	(15, 'Consultar Material', '../Material/Consultar_Material.aspx', 'fa fa-eye', 5),
	(16, 'Modificar Material', '../MoMaterial/Momaterial.aspx', 'fa fa-edit', 5),
	(17, 'Eliminar Material', '../ElMaterial/Elmaterial.aspx', 'fa fa-remove', 5),
	(18, 'Generar Certificado', '../Participante/Certificados.aspx', 'fa fa-file-text-o', 6),
	(19, 'Subir Certificado', '../Pago/pagocer.aspx', 'fa fa-cloud-upload', 7),
	(20, 'Consultar Cronograma', '../Aministrador/ver_cornograma.aspx', 'fa fa-search', 8),
	(21, 'Registrarse a Evento', '../Participante/Registrase_Event.aspx        ', 'fa fa-pencil-square-o', 2),
	(22, 'Galeria Eventos', '../Participante/consultar_eventos.aspx   ', 'fa fa-eye', 2),
	(23, 'Información eventos', '../Aministrador/cosulta_detalle_even.aspx', 'fa fa-eye', 3),
	(25, 'Actualizar Usuario', '../Participante/Actualizar_perfil.aspx', 'fa fa-pencil-square-o', 1),
	(26, 'Agregar Actividad', '../Eventos/cronograma.aspx', 'fa fa-pencil-square-o', 2),
	(27, 'Actualizar evento', '../Director/Actualizar_evento_director.aspx', 'fa fa-pencil-square-o', 2),
	(28, 'Administrar evento ', '../Director/Administrar_evento_director.aspx', 'fa fa-pencil-square-o', 2),
	(29, 'Agregar Actividad', '../Director/Agregar_actividad.aspx', 'fa fa-edit', 2),
	(30, 'Ver Conograma', '../Director/ver_cronograma_director.aspx', 'fa fa-eye', 8),
	(31, 'Mis Eventos', '../Participante/mis_eventos.aspx', 'fa fa-eye', 3),
	(32, 'Mis Certificados', '../Participante/Certificados.aspx', 'fa fa-eye', 3),
	(33, 'Inscritos  eventos ', '../Aministrador/inscritos_eventos.aspx', 'fa fa-eye', 3),
	(34, 'Registrar Asistencia', '../Director/asistencia.aspx', 'fa fa-file-text-o', 9),
	(35, 'Registrar Refrigerios ', '../Director/refrijerios.aspx', 'fa fa-pencil-square-o', 10);
/*!40000 ALTER TABLE `vista` ENABLE KEYS */;

-- Volcando estructura para disparador eventos.tr_insertrefri_before_tiempo
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_insertrefri_before_tiempo` BEFORE INSERT ON `refri` FOR EACH ROW BEGIN
	set new.tiempo=date_format(now(),'%p');
    set new.fecha=now();

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador eventos.tr_inst_before_tiempo
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_inst_before_tiempo` BEFORE INSERT ON `asis` FOR EACH ROW BEGIN
	set new.tiempo=date_format(now(),'%p');
    set new.Fecha=now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
