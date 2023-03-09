SELECT
     "codigo da transacao"           AS cd_transacao
    ,"data e hora da transacao"      AS tm_transacao
    ,"metodo de captura"             AS nm_captura
    ,"bandeira do cartao"            AS nm_bandeira_cartao
    ,"metodo de pagamento"           AS nm_metodo_pagamento
    ,"estado da transacao"           AS nm_estado_transacao
    ,"valor da transacao"            AS vl_transacao
    ,"codigo do usuario"             AS cd_usuario
    ,"estado do usuario"             AS nm_estado_usuario
    ,"cidade do usuario"             AS nm_cidade_usuario
FROM {{ source('raw_data_stone','transacoes_usuarios') }}