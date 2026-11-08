Feature: HU22 - Historial de conversaciones
  Como usuario registrado, quiero consultar mis conversaciones anteriores, para revisar información intercambiada durante interacciones previas.

  Scenario Outline: Happy path - visualización de historial
    Given que existen "<cantidad>" conversaciones almacenadas
    When el usuario accede al historial
    Then el sistema muestra la lista de conversaciones registradas.

    Examples:
      | cantidad |
      | 1 |
      | 3 |
      | 5 |

  Scenario Outline: Unhappy - historial vacío
    Given que el usuario no ha iniciado conversaciones anteriores en la cuenta "<cuenta>"
    When accede al historial
    Then el sistema muestra un mensaje indicando que aún no existen registros.

    Examples:
      | cuenta |
      | Cuenta recién creada |
      | Cuenta sin conversaciones |
      | Cuenta con historial vacío |

  Scenario Outline: Alt - consulta de conversación
    Given que existe la conversación "<conversacion>" en el historial
    When el usuario la selecciona
    Then el sistema muestra los mensajes correspondientes.

    Examples:
      | conversacion |
      | Consulta académica |
      | Atención en recepción |
      | Orientación universitaria |
