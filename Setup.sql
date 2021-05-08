


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
('SPY', 'S&P 500', 422.12, 422.81, 272.99, 67742619, NULL, 334000000, NULL);


CREATE TABLE if not exists Watchlist
(
  
  Watchlist_id INTEGER AUTO_INCREMENT NOT NULL,
  name character varying(25),
  stock_ticker character varying(10),
  PRIMARY KEY (Watchlist_id),
  FOREIGN KEY (stock_ticker)
      REFERENCES Stock (ticker) 
      ON UPDATE Restrict ON DELETE Restrict
);
INSERT INTO Watchlist (name, stock_ticker) VALUES
('test', 'SPY');

CREATE TABLE if not exists TransactionRecord
(
  transaction_record_id INTEGER AUTO_INCREMENT NOT NULL,
  stock_ticker character varying(10),
  num_shares double precision,
  total_purchase_price double precision,
  PRIMARY KEY (transaction_record_id),
  FOREIGN KEY (stock_ticker)
      REFERENCES Stock (ticker) 
      ON UPDATE Restrict ON DELETE Restrict
);

INSERT INTO TransactionRecord ( stock_ticker, num_shares, total_purchase_price) VALUES
( 'SPY', '1', '422');


CREATE TABLE if not exists Portfolio
(
  portfolio_name character varying(25) NOT NULL,
  transaction_record_id INTEGER,
  PRIMARY KEY (portfolio_name),
  FOREIGN KEY (transaction_record_id)
      REFERENCES TransactionRecord (transaction_record_id) 
      ON UPDATE Restrict ON DELETE Restrict
);
INSERT INTO Portfolio (portfolio_name, transaction_record_id) VALUES
('crypto', '1');

CREATE TABLE if not exists User
(
  
  user_id INTEGER AUTO_INCREMENT NOT NULL,
  portfolio_name character varying(25),
  password_hash character varying(50),
  username character varying(25),
  Watchlist_id INTEGER,
  PRIMARY KEY (user_id),
  FOREIGN KEY (portfolio_name)
      REFERENCES Portfolio (portfolio_name) 
      ON UPDATE Restrict ON DELETE Restrict,
  FOREIGN KEY (Watchlist_id)
      REFERENCES Watchlist (Watchlist_id) 
      ON UPDATE Restrict ON DELETE Restrict
);
INSERT INTO User (username, portfolio_name, password_hash, Watchlist_id) VALUES
('stockboi98', 'crypto', 'noodles', 1);

CREATE TABLE if not exists Watchlist_Record
(
  user_id INTEGER AUTO_INCREMENT NOT NULL,
  Watchlist_id INTEGER,
  FOREIGN KEY (user_id)
      REFERENCES User (user_id) 
      ON UPDATE Restrict ON DELETE Restrict,
  FOREIGN KEY (Watchlist_id)
      REFERENCES Watchlist (Watchlist_id) 
      ON UPDATE Restrict ON DELETE Restrict,
PRIMARY KEY (watchlist_id, user_id)
);
INSERT INTO Watchlist_Record (watchlist_id, user_id) VALUES
('1', '1');















