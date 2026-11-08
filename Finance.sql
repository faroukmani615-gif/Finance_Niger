CREATE TABLE clients (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    ville VARCHAR(50),
    telephone VARCHAR(20),
    profession VARCHAR(50),
    date_naissance DATE,
    date_inscription DATE
);

CREATE TABLE comptes (
    id_compte SERIAL PRIMARY KEY,
    id_client INT REFERENCES clients(id_client),
    type_compte VARCHAR(20) CHECK (type_compte IN ('Courant', 'Epargne', 'Business')),
    solde NUMERIC(12,2) DEFAULT 0,
    devise VARCHAR(5) DEFAULT 'FCFA',
    date_ouverture DATE,
    statut VARCHAR(20) DEFAULT 'Actif'
);

CREATE TABLE transactions (
    id_transaction SERIAL PRIMARY KEY,
    id_compte INT REFERENCES comptes(id_compte),
    type_transaction VARCHAR(20) CHECK (type_transaction IN ('Depot', 'Retrait', 'Virement', 'Paiement')),
    montant NUMERIC(12,2),
    date_transaction DATE,
    description VARCHAR(100)
);

CREATE TABLE prets (
    id_pret SERIAL PRIMARY KEY,
    id_client INT REFERENCES clients(id_client),
    montant_pret NUMERIC(12,2),
    taux_interet NUMERIC(4,2),
    duree_mois INT,
    date_octroi DATE,
    statut VARCHAR(20) CHECK (statut IN ('En cours', 'Rembourse', 'En retard'))
);

INSERT INTO clients (nom, prenom, ville, telephone, profession, date_naissance, date_inscription) VALUES
('MOUSSA', 'Ibrahim', 'Niamey', '90123456', 'Commercant', '1987-05-12', '2023-01-15'),
('ADAMOU', 'Aicha', 'Niamey', '90234567', 'Enseignante', '1991-03-20', '2023-02-10'),
('GARBA', 'Abdoulaye', 'Zinder', '90345678', 'Agriculteur', '1984-11-02', '2023-01-20'),
('ISSOUFOU', 'Fatima', 'Maradi', '90456789', 'Infirmiere', '1990-07-18', '2023-03-05'),
('HAMIDOU', 'Oumarou', 'Tahoua', '90567890', 'Mecanicien', '1995-09-25', '2023-04-12'),
('ABDOUL', 'Mariam', 'Agadez', '90678901', 'Couturiere', '1992-01-30', '2023-02-28'),
('SOULEY', 'Ali', 'Dosso', '90789012', 'Chauffeur', '1986-06-14', '2023-05-01'),
('YAHAYA', 'Hadjara', 'Niamey', '90890123', 'Etudiante', '2002-12-05', '2024-01-10'),
('BOUBACAR', 'Sani', 'Diffa', '90901234', 'Eleveur', '1983-04-22', '2023-06-15'),
('MAHAMADOU', 'Zainab', 'Tillaberi', '91012345', 'Vendeuse', '1994-08-11', '2023-07-20'),
('AMADOU', 'Yacouba', 'Niamey', '91123456', 'Pecheur', '1989-10-09', '2023-08-02'),
('SIDI', 'Aminata', 'Zinder', '91234567', 'Comptable', '1993-02-17', '2023-09-11'),
('KABORE', 'Issa', 'Maradi', '91345678', 'Boucher', '1986-05-28', '2023-10-03'),
('DIALLO', 'Mamadou', 'Niamey', '91456789', 'Ingenieur', '1990-11-15', '2024-02-14'),
('HASSAN', 'Rahila', 'Tahoua', '91567890', 'Coiffeuse', '1996-04-08', '2024-03-01'),
('TANKO', 'Abdou', 'Niamey', '91678901', 'Developpeur', '1998-09-19', '2024-03-20'),
('ALIOU', 'Halima', 'Niamey', '91789012', 'Pharmacienne', '1984-12-30', '2024-04-05'),
('SALIFOU', 'Balkissa', 'Dosso', '91890123', 'Menuisiere', '1991-06-06', '2024-04-18'),
('ABOUBACAR', 'Kader', 'Agadez', '91901234', 'Guide touristique', '1995-03-13', '2024-05-02'),
('OUmarou', 'Fatouma', 'Niamey', '92012345', 'Entrepreneure', '1982-08-26', '2024-05-15');

INSERT INTO comptes (id_client, type_compte, solde, date_ouverture, statut) VALUES
(1, 'Courant', 950000, '2023-01-15', 'Actif'),
(1, 'Epargne', 1500000, '2023-02-01', 'Actif'),
(2, 'Epargne', 520000, '2023-02-10', 'Actif'),
(3, 'Courant', 380000, '2023-01-20', 'Actif'),
(4, 'Courant', 720000, '2023-03-05', 'Actif'),
(5, 'Courant', 250000, '2023-04-12', 'Actif'),
(6, 'Epargne', 410000, '2023-02-28', 'Actif'),
(7, 'Courant', 175000, '2023-05-01', 'Actif'),
(8, 'Epargne', 85000, '2024-01-10', 'Actif'),
(9, 'Courant', 620000, '2023-06-15', 'Actif'),
(10, 'Courant', 310000, '2023-07-20', 'Actif'),
(11, 'Courant', 195000, '2023-08-02', 'Actif'),
(12, 'Courant', 1050000, '2023-09-11', 'Actif'),
(12, 'Epargne', 2200000, '2023-10-01', 'Actif'),
(13, 'Courant', 480000, '2023-10-03', 'Actif'),
(14, 'Business', 4200000, '2024-02-14', 'Actif'),
(15, 'Epargne', 290000, '2024-03-01', 'Actif'),
(16, 'Courant', 1250000, '2024-03-20', 'Actif'),
(17, 'Business', 3100000, '2024-04-05', 'Actif'),
(18, 'Courant', 210000, '2024-04-18', 'Actif'),
(19, 'Epargne', 580000, '2024-05-02', 'Actif'),
(20, 'Business', 6500000, '2024-05-15', 'Actif'),
(2, 'Courant', 195000, '2024-01-05', 'Inactif'),
(4, 'Epargne', 980000, '2023-12-01', 'Actif'),
(6, 'Courant', 135000, '2024-02-10', 'Actif');

INSERT INTO transactions (id_compte, type_transaction, montant, date_transaction, description) VALUES
(1, 'Depot', 600000, '2024-06-01', 'Depot espece - Grand Marche'),
(1, 'Retrait', 120000, '2024-06-03', 'Retrait guichet'),
(1, 'Virement', 250000, '2024-06-05', 'Virement fournisseur'),
(2, 'Depot', 350000, '2024-06-02', 'Epargne mensuelle'),
(3, 'Depot', 180000, '2024-06-01', 'Salaire'),
(3, 'Paiement', 60000, '2024-06-04', 'Facture NIGELEC'),
(4, 'Depot', 300000, '2024-06-03', 'Vente mil'),
(5, 'Depot', 450000, '2024-06-02', 'Depot espece'),
(6, 'Depot', 90000, '2024-06-05', 'Depot espece'),
(7, 'Depot', 220000, '2024-06-01', 'Depot espece'),
(8, 'Depot', 140000, '2024-06-06', 'Salaire'),
(9, 'Retrait', 100000, '2024-06-03', 'Retrait'),
(10, 'Depot', 340000, '2024-06-02', 'Vente marche Katako'),
(11, 'Depot', 380000, '2024-06-04', 'Depot espece'),
(12, 'Depot', 200000, '2024-06-01', 'Depot espece'),
(13, 'Depot', 700000, '2024-06-02', 'Salaire'),
(14, 'Depot', 900000, '2024-06-03', 'Epargne'),
(15, 'Depot', 520000, '2024-06-05', 'Virement client'),
(16, 'Depot', 2500000, '2024-06-01', 'Paiement contrat'),
(17, 'Retrait', 350000, '2024-06-04', 'Achat materiel'),
(18, 'Depot', 1000000, '2024-06-02', 'Salaire'),
(19, 'Depot', 2800000, '2024-06-03', 'Vente pharmacie'),
(20, 'Depot', 130000, '2024-06-05', 'Depot espece'),
(21, 'Depot', 450000, '2024-06-01', 'Salaire'),
(22, 'Depot', 3500000, '2024-06-02', 'Investissement'),
(23, 'Depot', 110000, '2024-06-03', 'Salaire'),
(24, 'Depot', 550000, '2024-06-04', 'Epargne'),
(25, 'Depot', 95000, '2024-06-06', 'Depot espece'),
(1, 'Paiement', 80000, '2024-06-07', 'Abonnement Canal+'),
(16, 'Paiement', 175000, '2024-06-07', 'Loyer bureau Plateau'),
(22, 'Retrait', 600000, '2024-06-08', 'Retrait business');

INSERT INTO prets (id_client, montant_pret, taux_interet, duree_mois, date_octroi, statut) VALUES
(1, 1800000, 8.50, 12, '2023-08-15', 'En cours'),
(3, 900000, 9.00, 18, '2023-09-01', 'En cours'),
(5, 600000, 10.00, 6, '2024-01-10', 'Rembourse'),
(9, 1400000, 8.00, 24, '2023-11-20', 'En cours'),
(10, 350000, 12.00, 6, '2024-02-15', 'En retard'),
(12, 2800000, 7.50, 36, '2024-01-05', 'En cours'),
(14, 6000000, 7.00, 48, '2024-03-01', 'En cours'),
(16, 2200000, 8.50, 24, '2024-04-01', 'En cours'),
(20, 12000000, 6.50, 60, '2024-04-20', 'En cours'),
(2, 450000, 10.50, 12, '2023-12-01', 'Rembourse'),
(4, 700000, 9.50, 12, '2024-02-01', 'En cours'),
(6, 400000, 11.00, 9, '2024-03-10', 'En retard'),
(13, 800000, 9.00, 18, '2024-01-20', 'En cours'),
(17, 3500000, 7.50, 36, '2024-03-15', 'En cours'),
(18, 500000, 10.00, 12, '2024-04-10', 'En cours'),
(7, 280000, 12.50, 6, '2024-02-20', 'Rembourse'),
(11, 450000, 11.50, 12, '2024-05-01', 'En cours'),
(19, 1000000, 8.00, 18, '2024-05-10', 'En cours');

SELECT COUNT(*) FROM clients WHERE ville = 'Niamey';
SELECT nom, prenom, ville, profession FROM clients
WHERE ville IN ('Zinder', 'Maradi') ORDER BY ville, nom;
