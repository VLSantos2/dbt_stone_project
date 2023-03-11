{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key='cd_transacao'
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
    ,nm_estado_usuario
    ,nm_cidade_usuario
FROM {{ ref('stg_raw_data_stone__transacoes_usuarios') }}
WHERE
    nm_estado_transacao IN ('paid','refused','refunded','chargedback')
    {% if is_incremental() %}
        AND tm_transacao >= (SELECT MAX(tm_transacao) from {{ this }})     
    {% endif %}
