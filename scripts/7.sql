ALTER TABLE Drug
ADD quantity INT;

ALTER TABLE Drug_Type
ADD CONSTRAINT chk_price CHECK (price > 0);
