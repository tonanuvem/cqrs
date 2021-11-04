USE usuarios;

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `created_at` timestamp,
  `address` varchar(255)
);

INSERT INTO users (full_name,created_at, address) VALUES("Indiana Jones",NOW(),"Falling Ball Avenue");
INSERT INTO users (full_name,created_at, address) VALUES("Jack Sparrow",NOW(),"Master Ship Square");
INSERT INTO users (full_name,created_at, address) VALUES("John Snow",NOW(),"Kinds Landing Westeros");
