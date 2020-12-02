
---------------------
--  expense_tracker  --
---------------------

CREATE KEYSPACE expense_tracker WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};

USE expense_tracker;

CREATE TABLE transactions (
    name text,
    transaction_type text,
    category text,
    amount text,
    date date,
    PRIMARY KEY(name,date)
) WITH CLUSTERING ORDER BY (date DESC);

COPY transactions (name, transaction_type, category, amount, date) FROM 'transactions.csv' WITH header = true AND delimiter = '|';
