{{
    config(
        materialized='table'
    )
}}
SELECT
     cd_transacao
    ,tm_transacao
    ,nm_captura
    ,nm_bandeira_cartao
    ,nm_metodo_pagamento
    ,nm_estado_transacao
    ,vl_transacao
    ,cd_usuario
FROM {{ ref('int_users__transacoes') }}
