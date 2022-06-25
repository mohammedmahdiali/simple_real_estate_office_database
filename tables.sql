CREATE TABLE type (
	type_id INT PRIMARY KEY IDENTITY(1,1),
	type_name NVARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE purpose (
	purpose_id INT PRIMARY KEY IDENTITY(1,1),
	purpose_name NVARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE customer (
	customer_id INT PRIMARY KEY IDENTITY(1,1),
	customer_name NVARCHAR(50) NOT NULL,
	customer_phone VARCHAR(20) UNIQUE NOT NULL,
	customer_email VARCHAR(50) UNIQUE
);


CREATE TABLE property (
	property_id INT PRIMARY KEY IDENTITY(1,1),
	property_purpose INT NOT NULL,
	property_type INT NOT NULL,
	property_price FLOAT NOT NULL,
	property_area FLOAT NOT NULL,
	property_bedrooms INT NOT NULL DEFAULT 0,
	property_bathrooms INT NOT NULL DEFAULT 0,
	property_place NVARCHAR(70) NOT NULL DEFAULT N'بغداد',
	property_date DATETIME2 NOT NULL,
	customer_id INT NOT NULL,

	CONSTRAINT PROPERTY_PURPOSE_FK FOREIGN KEY (property_purpose) REFERENCES purpose (purpose_id),

	CONSTRAINT PROPERTY_TYPE_FK FOREIGN KEY (property_type) REFERENCES type (type_id),

	CONSTRAINT PROPERTY_CUSTOMER_FK FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);