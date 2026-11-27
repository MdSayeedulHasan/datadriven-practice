CREATE TABLE dim_product (
    product_id BIGINT,
    seller_id BIGINT,
    listed_date DATE,
    is_active BOOLEAN,
    updated_at DATE,
    PRIMARY KEY (product_id)
);

CREATE TABLE dim_seller (
    seller_id BIGINT,
    seller_name VARCHAR,
    created_at DATE,
    PRIMARY KEY (seller_id)
);

CREATE TABLE dim_date (
    day_key DATE,
    PRIMARY KEY (day_key)
);

CREATE TABLE sales (
    sales_line_id BIGINT,
    order_id BIGINT,
    product_id BIGINT,
    seller_id BIGINT,
    sale_date DATE,
    "unit sold" INT,
    revenue DECIMAL,
    PRIMARY KEY (sales_line_id)
);

ALTER TABLE dim_product
    ADD FOREIGN KEY (seller_id) REFERENCES dim_seller (seller_id);

ALTER TABLE sales
    ADD FOREIGN KEY (seller_id) REFERENCES dim_seller (seller_id);

ALTER TABLE sales
    ADD FOREIGN KEY (product_id) REFERENCES dim_product (product_id);

ALTER TABLE sales
    ADD FOREIGN KEY (sale_date) REFERENCES dim_date (day_key);
