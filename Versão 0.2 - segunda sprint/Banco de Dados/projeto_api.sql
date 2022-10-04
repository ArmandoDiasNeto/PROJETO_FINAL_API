-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Out-2022 às 23:16
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_api`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `numero_cartao` int(16) NOT NULL,
  `limite` float DEFAULT NULL,
  `valor_compras` float DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `senha` int(4) NOT NULL,
  `fk_login_conta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `extrato`
--

CREATE TABLE `extrato` (
  `id` int(11) NOT NULL,
  `tipo_movimentacao` varchar(50) NOT NULL,
  `valor` float NOT NULL,
  `data` date NOT NULL,
  `fk_login_conta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_conta`
--

CREATE TABLE `login_conta` (
  `senha` varchar(6) NOT NULL,
  `agencia` varchar(4) NOT NULL,
  `conta` varchar(6) NOT NULL,
  `id` int(11) NOT NULL,
  `numero_conta` int(3) NOT NULL,
  `saldo` float DEFAULT NULL,
  `chave_pix` varchar(8) DEFAULT NULL,
  `recarga_celular` int(11) DEFAULT NULL,
  `nome_cliente` text NOT NULL,
  `cpf_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL,
  `numero_boleto` int(20) NOT NULL,
  `valor` float NOT NULL,
  `data` date NOT NULL,
  `fk_login_conta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cartao`
--
ALTER TABLE `cartao`
  ADD PRIMARY KEY (`numero_cartao`);

--
-- Índices para tabela `extrato`
--
ALTER TABLE `extrato`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `login_conta`
--
ALTER TABLE `login_conta`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_login_conta_id` (`fk_login_conta_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `extrato`
--
ALTER TABLE `extrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `login_conta`
--
ALTER TABLE `login_conta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `fk_login_conta_id` FOREIGN KEY (`fk_login_conta_id`) REFERENCES `login_conta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
