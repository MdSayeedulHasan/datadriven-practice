# A Number for the Seller

*They want a total. Give them the right schema first.*

[Data Modeling · Easy · on DataDriven](https://datadriven.io/problems/a_number_for_the_seller)

## How it went

| | |
|---|---|
| Solved | 2026-11-27 |
| Accepted | on the first submission |
| Hints | none |
| Concepts | Attributes, Dimension Tables, Fact Tables, Foreign Keys, Grain Definition, Metric Additivity, One-to-Many, Pre-Aggregation, Primary Keys, Star Schema, Surrogate Keys |

## The design

```mermaid
erDiagram
    dim_product {
        BIGINT product_id PK
        BIGINT seller_id FK
        DATE listed_date
        BOOLEAN is_active
        DATE updated_at
    }
    dim_seller {
        BIGINT seller_id PK
        VARCHAR seller_name
        DATE created_at
    }
    dim_date {
        DATE day_key PK
    }
    sales {
        BIGINT sales_line_id PK
        BIGINT order_id
        BIGINT product_id FK
        BIGINT seller_id FK
        DATE sale_date FK
        INT unit_sold
        DECIMAL revenue
    }
    dim_seller only one optionally to zero or more dim_product : "seller_id"
    dim_seller only one optionally to zero or more sales : "seller_id"
    dim_product only one optionally to zero or more sales : "product_id"
    dim_date only one optionally to zero or more sales : "sale_date = day_key"
```

The accepted design is in [`schema.sql`](./schema.sql) as DDL and in [`schema.json`](./schema.json) as JSON.
