-- Crear tabla users
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

-- Crear tabla cards
CREATE TABLE IF NOT EXISTS cards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    number TEXT NOT NULL,
    cvv TEXT NOT NULL,
    date TEXT NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Crear tabla payments
CREATE TABLE IF NOT EXISTS payments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount REAL NOT NULL,
    date TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Success', 'Fail')),
    card_id INTEGER,
    FOREIGN KEY (card_id) REFERENCES cards (id)
);

-- Crear tabla suscriptions
CREATE TABLE IF NOT EXISTS suscriptions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    price REAL NOT NULL,
    recurrency TEXT NOT NULL CHECK (recurrency IN ('Day', 'Month', 'Year')),
    date TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Active', 'Inactive')),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Crear tabla cuotas
CREATE TABLE IF NOT EXISTS cuotas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount REAL NOT NULL,
    date TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Success', 'Fail')),
    suscription_id INTEGER,
    FOREIGN KEY (suscription_id) REFERENCES suscriptions (id)
);

-- Crear tabla tokens
CREATE TABLE IF NOT EXISTS tokens (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    value TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Active', 'Used', 'Expired')),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id)
);



-- Insertar 15 usuarios con nombres y contraseñas en formato hash
INSERT INTO users (name, email, password) VALUES
('Juan Pérez', 'juan.perez@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99'),
('María García', 'maria.garcia@hotmail.com', '7c6a180b36896a0a8c02787eeafb0e4c'),
('Pedro Rodríguez', 'pedro.rodriguez@yahoo.com', '6cb75f652a9b52798eb6cf2201057c73'),
('Ana López', 'ana.lopez@gmail.com', '96e79218965eb72c92a549dd5a330112'),
('Miguel Torres', 'miguel.torres@hotmail.com', '50d858e0985ecc7f60418aaf0cc5ab07'),
('Carmen Martínez', 'carmen.martinez@yahoo.com', '25f9e794323b453885f5181f1b624d0b'),
('Roberto Morales', 'roberto.morales@gmail.com', '670b14728ad9902aecba32e22fa4f6bd'),
('Sofía Guzmán', 'sofia.guzman@hotmail.com', '80dc1cd362f4c91e0e0e7c5f553b7f56'),
('Carlos Herrera', 'carlos.herrera@yahoo.com', 'a3d1e3db3e32f662a13a049c1f8a6af1'),
('Laura Ramírez', 'laura.ramirez@gmail.com', 'eef015adf1ec85a00be48f1e7587c95d'),
('Diego Ortega', 'diego.ortega@hotmail.com', 'b5e4b4f4a343a4d09a4f1fa20aa0ac15'),
('Sandra Castro', 'sandra.castro@yahoo.com', 'c20ad4d76fe97759aa27a0c99bff6710'),
('Ricardo Ríos', 'ricardo.rios@gmail.com', '6ea9ab1baa0efb9e19094440c317e21b'),
('Elena Navarro', 'elena.navarro@hotmail.com', '6f4922f45568161a8cdf4ad2299f6d23'),
('Fernando Peña', 'fernando.pena@yahoo.com', '2ab96390c7dbe3439de74d0c9b0b1767');



-- Insertar tarjetas para los usuarios
INSERT INTO cards (number, cvv, date, user_id) VALUES
('1234567812345678', '123', '2025-01-31', 1),
('2345678923456789', '234', '2025-05-30', 2),
('3456789034567890', '345', '2025-09-30', 3),
('4567890145678901', '456', '2026-02-28', 3),
('5678901256789012', '567', '2024-12-31', 4),
('6789012367890123', '678', '2025-06-30', 5),
('7890123478901234', '789', '2025-08-31', 6),
('8901234589012345', '890', '2024-11-30', 6),
('9012345690123456', '901', '2025-04-30', 7),
('0123456701234567', '012', '2025-07-31', 8),
('1234567812345678', '123', '2025-10-31', 9),
('2345678923456789', '234', '2025-01-31', 10),
('3456789034567890', '345', '2025-05-30', 11),
('4567890145678901', '456', '2025-09-30', 12),
('5678901256789012', '567', '2026-02-28', 12),
('6789012367890123', '678', '2024-12-31', 13),
('7890123478901234', '789', '2025-06-30', 14);




-- Insertar suscripciones para 10 usuarios seleccionados aleatoriamente
INSERT INTO suscriptions (price, recurrency, date, status, user_id) VALUES
(10.99, 'Day', '2023-04-21', 'Active', 1),
(15.99, 'Month', '2023-05-13', 'Active', 3),
(10.99, 'Day', '2023-04-25', 'Active', 4),
(15.99, 'Month', '2023-04-24', 'Active', 5),
(10.99, 'Day', '2023-05-01', 'Active', 6),
(15.99, 'Month', '2023-05-03', 'Active', 7),
(10.99, 'Day', '2023-05-01', 'Active', 9),
(15.99, 'Month', '2023-04-30', 'Active', 10),
(10.99, 'Day', '2023-04-29', 'Active', 12),
(15.99, 'Month', '2023-05-01', 'Active', 14);

-- Insertar 15 pagos aleatorios utilizando tarjetas generadas previamente
INSERT INTO payments (amount, date, status, card_id) VALUES
(10.99, '2023-04-24', 'Success', 1),
(15.99, '2023-04-27', 'Success', 2),
(5.00, '2023-04-29', 'Success', 3),
(20.00, '2023-04-23', 'Fail', 4),
(10.99, '2023-05-01', 'Success', 5),
(30.00, '2023-05-02', 'Success', 6),
(15.99, '2023-05-04', 'Success', 7),
(25.00, '2023-04-25', 'Fail', 8),
(10.00, '2023-04-30', 'Success', 9),
(15.99, '2023-04-28', 'Success', 10),
(35.00, '2023-05-03', 'Success', 11),
(10.99, '2023-04-22', 'Success', 12),
(40.00, '2023-05-05', 'Fail', 13),
(15.00, '2023-04-26', 'Success', 14),
(15.99, '2023-05-01', 'Success', 15);


-- Insertar 20 cuotas distribuidas aleatoriamente entre 7 suscripciones generadas
INSERT INTO cuotas (amount, date, status, suscription_id) VALUES
(10.99, '2023-05-21', 'Success', 1),
(15.99, '2023-05-21', 'Success', 2),
(15.99, '2023-06-21', 'Success', 2),
(10.99, '2023-05-21', 'Success', 3),
(10.99, '2023-06-21', 'Success', 3),
(15.99, '2023-05-21', 'Success', 4),
(15.99, '2023-06-21', 'Success', 4),
(15.99, '2023-07-21', 'Success', 4),
(10.99, '2023-05-21', 'Success', 5),
(10.99, '2023-06-21', 'Success', 5),
(15.99, '2023-05-21', 'Success', 6),
(15.99, '2023-06-21', 'Success', 6),
(15.99, '2023-07-21', 'Success', 6),
(10.99, '2023-05-21', 'Success', 7),
(15.99, '2023-05-21', 'Success', 8),
(15.99, '2023-06-21', 'Success', 8),
(10.99, '2023-05-21', 'Success', 9),
(10.99, '2023-06-21', 'Success', 9),
(15.99, '2023-05-21', 'Success', 10),
(15.99, '2023-06-21', 'Success', 10);


-- Insertar tokens para cada usuario
INSERT INTO tokens (value, status, user_id) VALUES
('bf4e4e21d4fbc4e0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d1', 'Active', 1),
('bf4e4e21d4fbc4e0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d1', 'Used', 1),
('d6e0f6a2b4c4e4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e2', 'Active', 2),
('d6e0f6a2b4c4e4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e2', 'Used', 2),
('b4e4d4f4c4a4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d3', 'Active', 3),
('b4e4d4f4c4a4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d3', 'Used', 3),
('c4d4e4f4c4a4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d4', 'Active', 4),
('c4d4e4f4c4a4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d4', 'Used', 4),
('c4f4e4f4c4a4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d5', 'Active', 5),
('c4f4e4f4c4a4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d5', 'Used', 5),
('d4f4e4f4c4a4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d6', 'Active', 6),
('d4f4e4f4c4a4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d6', 'Used', 6),
('e4f4e4f4c4a4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d7', 'Active', 7),
('e4f4e4f4c4a4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d7', 'Used', 7),
('f4f4e4f4c4a4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d8', 'Active', 8),
('f4f4e4f4c4a4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d8', 'Used', 8),
('a3e4d4c4e4f4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d9', 'Active', 9),
('a3e4d4c4e4f4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d9', 'Used', 9),
('a3e4d4c4e4f4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d10', 'Active', 10),
('a3e4d4c4e4f4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d10', 'Used', 10),
('b3e4d4c4e4f4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d11', 'Active', 11),
('b3e4d4c4e4f4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d11', 'Used', 11),
('c3e4d4c4e4f4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d12', 'Active', 12),
('c3e4d4c4e4f4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d12', 'Used', 12),
('d3e4d4c4e4f4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d13', 'Active', 13),
('d3e4d4c4e4f4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d13', 'Used', 13),
('e3e4d4c4e4f4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d14', 'Active', 14),
('e3e4d4c4e4f4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d14', 'Used', 14),
('f3e4d4c4e4f4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d0a202a4a0d4e4b4d15', 'Active', 15),
('f3e4d4c4e4f4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d0bdfdbfdcf4e4b4d15', 'Used', 15);

--Ver 10 pagos con usuario y tarjeta
SELECT
    u.name AS Usuario,
    p.amount AS Monto,
    p.date AS Fecha,
    c.number AS Tarjeta,
    p.status AS Estado
FROM
    users u
JOIN
    payments p ON u.id = c.user_id
JOIN
    cards c ON p.card_id = c.id
ORDER BY RANDOM()
LIMIT 10;
