CREATE TABLE customer (
    customer_id BIGINT,
    customer_name VARCHAR,
    PRIMARY KEY (customer_id)
);

CREATE TABLE customer_address (
    address_id BIGINT,
    customer_id BIGINT,
    valid_from TIMESTAMP,
    valid_to TIMESTAMP,
    is_current_address BOOLEAN,
    updated_at TIMESTAMP,
    PRIMARY KEY (address_id)
);

ALTER TABLE customer_address
    ADD FOREIGN KEY (customer_id) REFERENCES customer (customer_id);
