Feature: HU44 - Reporte de problemas técnicos

  Como usuario de Sigma
  Quiero reportar problemas técnicos desde la aplicación
  Para comunicar errores que dificulten el uso de sus funcionalidades

  Scenario Outline: Happy path - reporte exitoso
    Given que el usuario identifica el problema técnico "<problema>"
    When describe el inconveniente y selecciona "Enviar reporte"
    Then el sistema registra la incidencia

    Examples:
      | problema |
      | Error al iniciar la aplicación |
      | Fallo al utilizar el reconocimiento de señas |
      | Problema al acceder a una funcionalidad |

  Scenario Outline: Unhappy - descripción incompleta
    Given que el usuario intenta enviar un reporte con la descripción "<descripcion>"
    When selecciona "Enviar"
    Then el sistema solicita completar la información

    Examples:
      | descripcion |
      |  |
      |     |
      | Sin descripción del problema |

  Scenario Outline: Alt - confirmación de reporte
    Given que el reporte "<reporte>" se registró correctamente
    When finaliza el envío
    Then el sistema muestra un mensaje de confirmación

    Examples:
      | reporte |
      | Error de inicio |
      | Fallo de reconocimiento |
      | Problema de acceso |
