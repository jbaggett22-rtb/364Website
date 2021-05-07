


drop table if exists Watchlist_Record;
drop table  if  exists User;
drop table if  exists Portfolio;
drop table if  exists TransactionRecord;

drop table if  exists Watchlist;
drop table if  exists Stock;


CREATE TABLE if not exists Stock
(
  ticker character varying(10) NOT NULL,
  name character varying(25),
  opening_price double precision,
  52_week_high double precision,
  52_week_low double precision,
  average_volume integer,
  pe_ratio double precision,
  market_cap integer,
  dividend double precision,
  PRIMARY KEY (ticker)
);
INSERT INTO Stock (ticker, name, opening_price, 52_week_high, 52_week_low, average_volume, pe_ratio, market_cap, dividend) VALUES
('NIO', 'NIO Limited', 60.45, 67.43, 38.83, 400000000, NULL, 2000, NULL);

INSERT INTO Stock (ticker, name, opening_price, 52_week_high, 52_week_low, average_volume, pe_ratio, market_cap, dividend) VALUES
('LIT', 'lithiumx', 60.45, 67.43, 38.83, 400000000, NULL, 2000, NULL);

CREATE TABLE if not exists Watchlist
(
  id character varying(8) NOT NULL,
  name character varying(25),
  stock_ticker character varying(10),
  PRIMARY KEY (id),
  FOREIGN KEY (stock_ticker)
      REFERENCES Stock (ticker) 
      ON UPDATE Restrict ON DELETE Restrict
);
INSERT INTO Watchlist (id, name, stock_ticker) VALUES
('18930402', 'lithium', 'LIT');

CREATE TABLE if not exists TransactionRecord
(
  transaction_record_id character varying(8) NOT NULL,
  stock_ticker character varying(10),
  num_shares double precision,
  total_purchase_price double precision,
  PRIMARY KEY (transaction_record_id),
  FOREIGN KEY (stock_ticker)
      REFERENCES Stock (ticker) 
      ON UPDATE Restrict ON DELETE Restrict
);

INSERT INTO TransactionRecord (transaction_record_id, stock_ticker, num_shares, total_purchase_price) VALUES
('33333333', 'LIT', '22', '450');

INSERT INTO TransactionRecord (transaction_record_id, stock_ticker, num_shares, total_purchase_price) VALUES
('12345678', 'LIT', '22', '450');

CREATE TABLE if not exists Portfolio
(
  portfolio_name character varying(25) NOT NULL,
  transaction_record_id character varying(8) NOT NULL,
  PRIMARY KEY (portfolio_name),
  FOREIGN KEY (transaction_record_id)
      REFERENCES TransactionRecord (transaction_record_id) 
      ON UPDATE Restrict ON DELETE Restrict
);
INSERT INTO Portfolio (portfolio_name, transaction_record_id) VALUES
('crypto', '12345678');

CREATE TABLE if not exists User
(
  user_id character varying(8) NOT NULL,
  portfolio_name character varying(25),
  password_hash character varying(50),
  username character varying(25),
  watchlist_name character varying(25),
  PRIMARY KEY (user_id),
  FOREIGN KEY (portfolio_name)
      REFERENCES Portfolio (portfolio_name) 
      ON UPDATE Restrict ON DELETE Restrict,
  FOREIGN KEY (watchlist_name)
      REFERENCES Watchlist (id) 
      ON UPDATE Restrict ON DELETE Restrict
);
INSERT INTO User (user_ID, username, portfolio_name, password_hash, watchlist_name) VALUES
('22222222', 'stockboi98', 'crypto', '&#*($^(*^@(*)(HJIOSH', '18930402');

CREATE TABLE if not exists Watchlist_Record
(
  user_id character varying(8),
  watchlist_id character varying(8),
  FOREIGN KEY (user_id)
      REFERENCES User (user_id) 
      ON UPDATE Restrict ON DELETE Restrict,
  FOREIGN KEY (watchlist_id)
      REFERENCES Watchlist (id) 
      ON UPDATE Restrict ON DELETE Restrict,
PRIMARY KEY (watchlist_id, user_id)
);
INSERT INTO Watchlist_Record (watchlist_id, user_id) VALUES
('18930402', '22222222');















