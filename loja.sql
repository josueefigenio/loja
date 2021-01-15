/*
SQLyog Community v12.09 (32 bit)
MySQL - 10.4.10-MariaDB : Database - loja
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`loja` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `loja`;

/*Table structure for table `categorias_pai` */

DROP TABLE IF EXISTS `categorias_pai`;

CREATE TABLE `categorias_pai` (
  `categoria_pai_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_pai_nome` varchar(45) NOT NULL,
  `categoria_pai_ativa` tinyint(1) DEFAULT NULL,
  `categoria_pai_meta_link` varchar(100) DEFAULT NULL,
  `categoria_pai_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `categoria_pai_data_alteracao` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`categoria_pai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `categorias_pai` */

insert  into `categorias_pai`(`categoria_pai_id`,`categoria_pai_nome`,`categoria_pai_ativa`,`categoria_pai_meta_link`,`categoria_pai_data_criacao`,`categoria_pai_data_alteracao`) values (1,'informatica',1,'informatica','2021-01-13 16:46:00','2021-01-13 16:46:00');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`description`) values (1,'admin','Administrator'),(2,'clientes','clientes');

/*Table structure for table `login_attempts` */

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `login_attempts` */

insert  into `login_attempts`(`id`,`ip_address`,`login`,`time`) values (8,'127.0.0.1','admin@admim',1610706314);

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_nome` varchar(45) NOT NULL,
  `marca_meta_link` varchar(255) NOT NULL,
  `marca_ativa` tinyint(1) DEFAULT NULL,
  `marca_data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `marca_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `marcas` */

insert  into `marcas`(`marca_id`,`marca_nome`,`marca_meta_link`,`marca_ativa`,`marca_data_criacao`,`marca_data_alteracao`) values (2,'positivo','positivo',1,'2021-01-13 16:29:20',NULL),(3,'Dell','dell',1,'2021-01-13 16:29:31',NULL),(4,'phillips','phillips',0,'2021-01-13 16:29:43',NULL);

/*Table structure for table `sistema` */

DROP TABLE IF EXISTS `sistema`;

CREATE TABLE `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_produtos_destaques` int(11) NOT NULL,
  `sistema_texto` tinytext DEFAULT NULL,
  `sistema_data_alteracao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sistema` */

insert  into `sistema`(`sistema_id`,`sistema_razao_social`,`sistema_nome_fantasia`,`sistema_cnpj`,`sistema_ie`,`sistema_telefone_fixo`,`sistema_telefone_movel`,`sistema_email`,`sistema_site_url`,`sistema_cep`,`sistema_endereco`,`sistema_numero`,`sistema_cidade`,`sistema_estado`,`sistema_produtos_destaques`,`sistema_texto`,`sistema_data_alteracao`) values (1,'Loja virtual Vende tudo','Vende tudo!','80.838.809/0001-26','683.90228-49','(41) 3232-3030','(41) 9999-9999','vendetudo@contato.com.br','80510-000','80510-000','Rua da Programação','54','Curitiba','PR',6,'Preço e qualidade!','2021-01-11 21:32:46');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`ip_address`,`username`,`password`,`email`,`activation_selector`,`activation_code`,`forgotten_password_selector`,`forgotten_password_code`,`forgotten_password_time`,`remember_selector`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`) values (1,'127.0.0.1','administrator','$2y$12$1DezMKbLiyMyNilklB7ONOrPG.AjfmdFXRXE.1RQUwhR99QDWqb0W','admin@admin.com',NULL,'',NULL,NULL,NULL,NULL,NULL,1268889823,1610726504,1,'Admin','istrator','ADMIN','0'),(2,'127.0.0.1','lucio','$2y$10$dDo1/ZMrd3NHp9DQZdqgk.pX5VVC6ocDfFVQ6zzs6jwXRx6VA/mXm','lucio@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1610381584,NULL,1,'lucio','gomes',NULL,NULL),(3,'127.0.0.1','usuaario','$2y$10$gGwqG1BeigLWvgKj4DKHcef30Q70fQVa4aPg..LV7KRjfZdbhfemG','joauw@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1610383810,NULL,1,'usyarui','ususario',NULL,NULL),(4,'127.0.0.1','tico','$2y$10$FbLP1RRAgVZ/SXTuMsOiyOicBLej8NeLo2DlL4YRtR9u0H4S8O2iK','tico@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1610385403,NULL,1,'tico','tico',NULL,NULL),(5,'127.0.0.1','joao','$2y$10$B4r6LN6rcZN0oQlssoubROUEyvi55RyUwGtPeOquQNxQ0tmXNrBTK','joao@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1610385471,NULL,1,'joao','joao',NULL,NULL);

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `users_groups` */

insert  into `users_groups`(`id`,`user_id`,`group_id`) values (4,1,1),(6,2,2),(7,3,2),(8,4,1),(9,5,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
