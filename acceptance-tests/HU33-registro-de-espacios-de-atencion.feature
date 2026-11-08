Feature: HU33 - Registro de espacios de atención

  Como representante de una institución
  Quiero registrar los espacios donde se brinda atención al público
  Para identificar los lugares en los que se puede utilizar Sigma

  Scenario Outline: Happy path - registro de espacio
    Given que el representante ingresa el nombre "<nombre>" y tipo "<tipo>" de espacio
    When selecciona "Guardar"
    Then el sistema registra el espacio dentro de la institución

    Examples:
      | nombre | tipo |
      | Recepción | Atención al público |
      | Secretaría | Administrativo |
      | Módulo de información | Atención al público |

  Scenario Outline: Unhappy - nombre duplicado
    Given que el espacio "<nombre>" ya se encuentra registrado
    When el representante intenta agregarlo nuevamente
    Then el sistema muestra una advertencia de duplicidad

    Examples:
      | nombre |
      | Recepción |
      | Secretaría |
      | Módulo de información |

  Scenario Outline: Unhappy - datos incompletos
    Given que el representante omite la información obligatoria "<dato>"
    When intenta guardar el espacio
    Then el sistema solicita completar los campos faltantes

    Examples:
      | dato |
      | Nombre del espacio |
      | Tipo de espacio |
      | Nombre y tipo de espacio |
