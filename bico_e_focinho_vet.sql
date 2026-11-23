-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260814.7ff5dd5b7e
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2026 at 05:10 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bico_e_focinho_vet`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendamentos`
--
CREATE TABLE `agendamentos` (
  `id` int NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `nome_pet` varchar(50) NOT NULL,
  `servico` varchar(50) NOT NULL,
  `veterinario` varchar(100) DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pendente'
);

--
-- Dumping data for table `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `nome_cliente`, `telefone`, `nome_pet`, `servico`, `veterinario`, `data_hora`, `valor`, `status`) VALUES
(1, 'Mariana Silva', '(12) 99123-4567', 'Thor', 'Consulta', 'Dra. Camila', '2026-11-23 09:00:00', 150.00, 'Concluído'),
(2, 'Carlos Eduardo', '(12) 98876-5432', 'Luna', 'Vacina V10', 'Dr. Rafael', '2026-11-23 10:30:00', 120.00, 'Concluído'),
(3, 'Fernanda Costa', '(12) 99741-8520', 'Bolinha', 'Banho e Tosa', 'Equipe Estética', '2026-11-24 14:00:00', 80.00, 'Agendado'),
(4, 'Roberto Almeida', '(12) 98112-3344', 'Mingau', 'Exame de Sangue', 'Dra. Camila', '2026-11-24 11:00:00', 110.00, 'Cancelado'),
(5, 'Juliana Pereira', '(12) 99234-5678', 'Mel', 'Castração', 'Dr. Rafael', '2026-11-25 08:30:00', 400.00, 'Agendado');

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--
CREATE TABLE `animal` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tutor` varchar(255) DEFAULT NULL,
  `idade` int NOT NULL
);

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`id`, `nome`, `tutor`, `idade`) VALUES
(1, 'Thor', 'Mariana Silva', 4),
(2, 'Luna', 'Carlos Eduardo', 2),
(3, 'Bolinha', 'Fernanda Costa', 6),
(4, 'Mingau', 'Roberto Almeida', 1),
(5, 'Mel', 'Juliana Pereira', 3);

-- --------------------------------------------------------

--
-- Table structure for table `aplicacoes_vacinas`
--
CREATE TABLE `aplicacoes_vacinas` (
  `id` int NOT NULL,
  `id_animal` int NOT NULL,
  `id_vacina` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `data_aplicacao` date NOT NULL,
  `dose` varchar(30) NOT NULL,
  `data_proxima_dose` date DEFAULT NULL
);

--
-- Dumping data for table `aplicacoes_vacinas`
--

INSERT INTO `aplicacoes_vacinas` (`id`, `id_animal`, `id_vacina`, `id_veterinario`, `data_aplicacao`, `dose`, `data_proxima_dose`) VALUES
(1, 1, 1, 1, '2026-10-01', '1ª dose', '2026-10-22'),
(2, 1, 1, 1, '2026-10-22', '2ª dose', '2026-11-12'),
(3, 2, 2, 2, '2026-11-23', 'Reforço anual', '2027-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--
CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
);

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `telefone`, `endereco`) VALUES
(1, 'Mariana Silva', 'mariana.silva@email.com', '(12) 99123-4567', 'Rua das Flores, 120 - Centro'),
(2, 'Carlos Eduardo', 'carlos.edu@email.com', '(12) 98876-5432', 'Av. Peixoto de Castro, 450 - Vila Zélia'),
(3, 'Fernanda Costa', 'fernanda.costa@email.com', '(12) 99741-8520', 'Rua Dom Bosco, 88 - Olaria'),
(4, 'Roberto Almeida', 'roberto.almeida@email.com', '(12) 98112-3344', 'Rua Conselheiro Rodrigues Alves, 310 - Centro'),
(5, 'Juliana Pereira', 'juliana.p@email.com', '(12) 99234-5678', 'Rua Major Rodrigo Luiz, 55 - Vila Passos');

-- --------------------------------------------------------

--
-- Table structure for table `consultas`
--
CREATE TABLE `consultas` (
  `id_consulta` int NOT NULL,
  `id_animal` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `diagnostico` text,
  `valor` decimal(10,2) DEFAULT '0.00',
  `status` varchar(20) DEFAULT 'Agendada'
) ;

--
-- Dumping data for table `consultas`
--

INSERT INTO `consultas` (`id_consulta`, `id_animal`, `id_veterinario`, `data_consulta`, `hora_consulta`, `motivo`, `diagnostico`, `valor`, `status`) VALUES
(1, 1, 1, '2026-11-23', '09:00:00', 'Check-up anual', 'Animal saudável, vacinas em dia', 150.00, 'Concluída'),
(2, 2, 2, '2026-11-23', '10:30:00', 'Falta de apetite e apatia', 'Gastrite leve, prescrito protetor gástrico', 180.00, 'Concluída'),
(3, 3, 1, '2026-11-24', '14:00:00', 'Coceira intensa na orelha', 'Otite externa, iniciado tratamento tópico', 165.00, 'Em Andamento'),
(4, 4, 3, '2026-11-24', '11:00:00', 'Avaliação pré-castração', 'Aguardando exame de sangue', 120.00, 'Agendada'),
(5, 5, 2, '2026-11-25', '08:30:00', 'Vacinação antirrábica', 'Pendente', 90.00, 'Agendada');

-- --------------------------------------------------------

--
-- Table structure for table `especialidades`
--
CREATE TABLE `especialidades` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL
);

--
-- Dumping data for table `especialidades`
--

INSERT INTO `especialidades` (`id`, `nome`) VALUES
(2020, 'Clinico Geral'),
(2021, 'Cirurgiao'),
(2022, 'Dermatologia'),
(2023, 'Cardiologia');

-- --------------------------------------------------------

--
-- Table structure for table `exames`
--
CREATE TABLE `exames` (
  `id` int NOT NULL,
  `id_consulta` int NOT NULL,
  `tipo_exame` varchar(100) NOT NULL,
  `data_solicitacao` date NOT NULL,
  `resultado` text,
  `status` varchar(30) DEFAULT 'Solicitado'
);

--
-- Dumping data for table `exames`
--

INSERT INTO `exames` (`id`, `id_consulta`, `tipo_exame`, `data_solicitacao`, `resultado`, `status`) VALUES
(1, 1, 'Hemograma Completo', '2026-11-23', 'Normal', 'Concluido'),
(2, 2, 'Ultrassom Abdominal', '2026-11-23', 'Leve inflamacao gastrica', 'Concluido'),
(3, 1, 'Hemograma Completo', '2026-11-23', 'Normal', 'Concluido'),
(4, 2, 'Ultrassom Abdominal', '2026-11-23', 'Leve inflamacao gastrica', 'Concluido'),
(5, 1, 'Hemograma Completo', '2026-11-23', 'Normal', 'Concluido'),
(6, 2, 'Ultrassom Abdominal', '2026-11-23', 'Leve inflamacao gastrica', 'Concluido');

-- --------------------------------------------------------

--
-- Table structure for table `faturas`
--
CREATE TABLE `faturas` (
  `id` int NOT NULL,
  `id_cliente` int NOT NULL,
  `data_emissao` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT '0.00',
  `status` varchar(20) DEFAULT 'Aberta'
);

--
-- Dumping data for table `faturas`
--

INSERT INTO `faturas` (`id`, `id_cliente`, `data_emissao`, `valor_total`, `status`) VALUES
(1, 1, '2026-11-23', 270.00, 'Paga'),
(2, 2, '2026-11-23', 400.00, 'Parcial');

-- --------------------------------------------------------

--
-- Table structure for table `itens_fatura`
--
CREATE TABLE `itens_fatura` (
  `id` int NOT NULL,
  `id_fatura` int NOT NULL,
  `tipo_servico` varchar(30) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL
);

--
-- Dumping data for table `itens_fatura`
--

INSERT INTO `itens_fatura` (`id`, `id_fatura`, `tipo_servico`, `descricao`, `valor`) VALUES
(1, 1, 'Consulta', 'Consulta de Rotina - Thor', 150.00),
(2, 1, 'Vacina', 'Vacina Polivalente V10', 120.00),
(3, 2, 'Consulta', 'Consulta Dermatológica - Luna', 180.00),
(4, 2, 'Procedimento', 'Exame Raspado de Pele + Curativo', 220.00);

-- --------------------------------------------------------

--
-- Table structure for table `pagamentos`
--
CREATE TABLE `pagamentos` (
  `id` int NOT NULL,
  `id_fatura` int NOT NULL,
  `data_pagamento` datetime NOT NULL,
  `forma_pagamento` varchar(30) NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL
);

--
-- Dumping data for table `pagamentos`
--

INSERT INTO `pagamentos` (`id`, `id_fatura`, `data_pagamento`, `forma_pagamento`, `valor_pago`) VALUES
(1, 1, '2026-11-23 10:15:00', 'PIX', 270.00),
(2, 2, '2026-11-23 11:30:00', 'Dinheiro', 200.00),
(3, 2, '2026-11-23 11:32:00', 'Cartao de Credito', 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `prescricoes`
--
CREATE TABLE `prescricoes` (
  `id` int NOT NULL,
  `id_consulta` int NOT NULL,
  `medicamento` varchar(100) NOT NULL,
  `dosagem` varchar(50) NOT NULL,
  `frequencia` varchar(50) NOT NULL,
  `duracao` varchar(50) NOT NULL,
  `observacoes` text
);

--
-- Dumping data for table `prescricoes`
--

INSERT INTO `prescricoes` (`id`, `id_consulta`, `medicamento`, `dosagem`, `frequencia`, `duracao`, `observacoes`) VALUES
(1, 2, 'Omeprazol 10mg', '1 comprimido', 'A cada 24h', '7 dias', NULL),
(2, 3, 'Otomax Gotas', '4 gotas', 'A cada 12h', '10 dias', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `procedimentos`
--
CREATE TABLE `procedimentos` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` decimal(10,2) NOT NULL
);

--
-- Dumping data for table `procedimentos`
--

INSERT INTO `procedimentos` (`id`, `nome`, `valor`) VALUES
(1, 'Afericao de pressao e peso', 40.00),
(2, 'Aplicacao de medicacao injetavel', 65.00),
(3, 'Limpeza auricular profunda', 90.00),
(4, 'Sutura simples', 180.00);

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--
CREATE TABLE `tutor` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `pet` varchar(250) NOT NULL
);

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`id`, `nome`, `email`, `telefone`, `endereco`, `pet`) VALUES
(1, 'Mariana Silva', 'mariana.silva@email.com', '(12) 99123-4567', 'Rua das Flores, 120 - Centro', 'Thor'),
(2, 'Carlos Eduardo', 'carlos.edu@email.com', '(12) 98876-5432', 'Av. Peixoto de Castro, 450 - Vila Zélia', 'Luna'),
(3, 'Fernanda Costa', 'fernanda.costa@email.com', '(12) 99741-8520', 'Rua Dom Bosco, 88 - Olaria', 'Bolinha');

-- --------------------------------------------------------

--
-- Table structure for table `vacinas`
--
CREATE TABLE `vacinas` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `intervalo_dias` int NOT NULL
);

--
-- Dumping data for table `vacinas`
--

INSERT INTO `vacinas` (`id`, `nome`, `intervalo_dias`) VALUES
(1, 'Polivalente V10', 21),
(2, 'Antirrabica', 365),
(3, 'Gripe Canina', 365);

-- --------------------------------------------------------

--
-- Table structure for table `veterinarios`
--
CREATE TABLE `veterinarios` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `crmv` varchar(20) NOT NULL
);

--
-- Dumping data for table `veterinarios`
--

INSERT INTO `veterinarios` (`id`, `nome`, `crmv`) VALUES
(1, 'Dra. Camila Mendes', 'CRMV-SP 12567'),
(2, 'Dr. Rafael Souza', 'CRMV-SP 67890'),
(3, 'Dr. Thiago Lima', 'CRMV-SP 54321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aplicacoes_vacinas`
--
ALTER TABLE `aplicacoes_vacinas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_vacina` (`id_vacina`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indexes for table `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_consulta` (`id_consulta`);

--
-- Indexes for table `faturas`
--
ALTER TABLE `faturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `itens_fatura`
--
ALTER TABLE `itens_fatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fatura` (`id_fatura`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fatura` (`id_fatura`);

--
-- Indexes for table `prescricoes`
--
ALTER TABLE `prescricoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_consulta` (`id_consulta`);

--
-- Indexes for table `procedimentos`
--
ALTER TABLE `procedimentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vacinas`
--
ALTER TABLE `vacinas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `veterinarios`
--
ALTER TABLE `veterinarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crmv` (`crmv`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `aplicacoes_vacinas`
--
ALTER TABLE `aplicacoes_vacinas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id_consulta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2024;

--
-- AUTO_INCREMENT for table `exames`
--
ALTER TABLE `exames`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faturas`
--
ALTER TABLE `faturas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `itens_fatura`
--
ALTER TABLE `itens_fatura`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prescricoes`
--
ALTER TABLE `prescricoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `procedimentos`
--
ALTER TABLE `procedimentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vacinas`
--
ALTER TABLE `vacinas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `veterinarios`
--
ALTER TABLE `veterinarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aplicacoes_vacinas`
--
ALTER TABLE `aplicacoes_vacinas`
  ADD CONSTRAINT `aplicacoes_vacinas_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `aplicacoes_vacinas_ibfk_2` FOREIGN KEY (`id_vacina`) REFERENCES `vacinas` (`id`),
  ADD CONSTRAINT `aplicacoes_vacinas_ibfk_3` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id`);

--
-- Constraints for table `exames`
--
ALTER TABLE `exames`
  ADD CONSTRAINT `exames_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`);

--
-- Constraints for table `faturas`
--
ALTER TABLE `faturas`
  ADD CONSTRAINT `faturas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Constraints for table `itens_fatura`
--
ALTER TABLE `itens_fatura`
  ADD CONSTRAINT `itens_fatura_ibfk_1` FOREIGN KEY (`id_fatura`) REFERENCES `faturas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_fatura`) REFERENCES `faturas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prescricoes`
--
ALTER TABLE `prescricoes`
  ADD CONSTRAINT `prescricoes_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id_consulta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
