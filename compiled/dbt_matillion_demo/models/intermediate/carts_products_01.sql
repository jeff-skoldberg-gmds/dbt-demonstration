SELECT 
    flattened.value:id::INTEGER||carts_id  AS carts_products_id,
    carts_id,
    userid,
    products,
    flattened.value:discountPercentage::FLOAT AS discountPercentage,
    flattened.value:discountedPrice::FLOAT AS discountedPrice,
    flattened.value:price::FLOAT AS price,
    flattened.value:quantity::INTEGER AS quantity,
    flattened.value:title::STRING AS title,
    flattened.value:total::FLOAT AS total,
    file_name,
    file_row_number,
    copied_at
FROM 
    analytics.intermediate.carts_02,
    LATERAL FLATTEN(input => products) AS flattened