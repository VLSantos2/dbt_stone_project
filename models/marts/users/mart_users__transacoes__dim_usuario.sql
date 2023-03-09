{{
    config(
        materialized='table'
    )
}}
SELECT DISTINCT
     cd_usuario
    ,LAST_VALUE(nm_estado_usuario) OVER(PARTITION BY cd_usuario ORDER BY tm_transacao ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS nm_estado_usuario
    ,LAST_VALUE(nm_cidade_usuario) OVER(PARTITION BY cd_usuario ORDER BY tm_transacao ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS nm_cidade_usuario
FROM {{ ref('int_users__transacoes') }}