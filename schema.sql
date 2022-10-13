CREATE TABLE `items` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `qty` int(11) NOT NULL,
  `got` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;