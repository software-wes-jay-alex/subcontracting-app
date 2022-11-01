
CREATE TABLE User (
	Login_id char(20),
	Name VARCHAR(50),
	Password VARCHAR(16),
	PRIMARY KEY (Login_id)
	);


CREATE TABLE Material(
	Material varchar(10) not null,
	quantity int default 0,
	Type VARCHAR(50),
	PRIMARY KEY (Material)
    );

CREATE TABLE List (
	List varchar(10) not null,
    PRIMARY KEY (List),
    Material_FK VARCHAR(10),
    Login_id_FK VARCHAR(10),
    FOREIGN KEY (Material_FK) REFERENCES Material (Material),
    FOREIGN KEY (Login_id_FK) REFERENCES User(Login_id)
);

CREATE TABLE Asset (
	Asset_id VARCHAR (10),
    Login_id_FK VARCHAR(10),
    FOREIGN KEY (Login_id_FK) REFERENCES User(Login_id)
    );