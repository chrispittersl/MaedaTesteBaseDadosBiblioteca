-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 15-Jan-2021 às 04:41
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teste_maeda_bd`
--
CREATE DATABASE IF NOT EXISTS `teste_maeda_bd` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `teste_maeda_bd`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `associado`
--

DROP TABLE IF EXISTS `associado`;
CREATE TABLE IF NOT EXISTS `associado` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  `sexo` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `associado`
--

INSERT INTO `associado` (`matricula`, `nome`, `sexo`) VALUES
(1, 'Christopher', 'Masculino'),
(2, 'Yara', 'Feminino'),
(3, 'Keila', 'Feminino'),
(4, 'Lina', 'Feminino'),
(5, 'Jonathan', 'Masculino'),
(6, 'Maurício', 'Masculino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `assunto`
--

DROP TABLE IF EXISTS `assunto`;
CREATE TABLE IF NOT EXISTS `assunto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `assunto`
--

INSERT INTO `assunto` (`id`, `descricao`) VALUES
(1, 'Política'),
(2, 'Arte'),
(3, 'Drama'),
(4, 'Comédia'),
(5, 'Terror');

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id`, `nome`) VALUES
(1, 'Monteiro Lobato'),
(2, 'Sherlock Holmes'),
(3, 'George Orwell'),
(4, 'Aristóteles'),
(5, 'Al Brooks');

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
CREATE TABLE IF NOT EXISTS `biblioteca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `biblioteca`
--

INSERT INTO `biblioteca` (`id`, `descricao`, `endereco`) VALUES
(1, 'De São Paulo', 'Rua paulista, 525');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_livro` int(11) NOT NULL,
  `id_assunto` int(11) NOT NULL,
  KEY `id_livro` (`id_livro`,`id_assunto`),
  KEY `id_assunto` (`id_assunto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_livro`, `id_assunto`) VALUES
(23432, 3),
(231411, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

DROP TABLE IF EXISTS `livro`;
CREATE TABLE IF NOT EXISTS `livro` (
  `isbn` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_biblioteca` int(11) NOT NULL,
  `id_associado` int(11) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `id_biblioteca` (`id_biblioteca`,`id_associado`),
  KEY `id_associado` (`id_associado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`isbn`, `titulo`, `id_biblioteca`, `id_associado`) VALUES
(3231, 'Sei la', 1, 4),
(23432, 'Insustentável', 1, 5),
(212131, 'Divergente', 1, 6),
(231411, 'Insurgente', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `matricula` int(11) NOT NULL,
  `id_biblioteca` int(11) NOT NULL,
  KEY `matricula` (`matricula`,`id_biblioteca`),
  KEY `id_biblioteca` (`id_biblioteca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `matricula`
--

INSERT INTO `matricula` (`matricula`, `id_biblioteca`) VALUES
(1, 1),
(1, 1),
(3, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `producao`
--

DROP TABLE IF EXISTS `producao`;
CREATE TABLE IF NOT EXISTS `producao` (
  `id_autor` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  KEY `id_autor` (`id_autor`,`id_livro`),
  KEY `id_livro` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `producao`
--

INSERT INTO `producao` (`id_autor`, `id_livro`) VALUES
(4, 231411),
(5, 23432);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`isbn`),
  ADD CONSTRAINT `categoria_ibfk_2` FOREIGN KEY (`id_assunto`) REFERENCES `assunto` (`id`);

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`id_associado`) REFERENCES `associado` (`matricula`),
  ADD CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id`);

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `associado` (`matricula`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id`);

--
-- Limitadores para a tabela `producao`
--
ALTER TABLE `producao`
  ADD CONSTRAINT `producao_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`),
  ADD CONSTRAINT `producao_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
