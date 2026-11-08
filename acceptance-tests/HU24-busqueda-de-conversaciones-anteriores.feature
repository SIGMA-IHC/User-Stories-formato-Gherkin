Feature: HU24 - Búsqueda de conversaciones anteriores

  Como usuario registrado
  Quiero buscar conversaciones anteriores mediante palabras clave
  Para encontrar rápidamente información de una interacción pasada

  Scenario Outline: Happy path - búsqueda exitosa
    Given que existen conversaciones registradas relacionadas con "<palabra_clave>"
    When el usuario ingresa la palabra clave "<palabra_clave>"
    Then el sistema muestra los resultados coincidentes

    Examples:
      | palabra_clave |
      | matrícula |
      | horario |
      | consulta |

  Scenario Outline: Unhappy - búsqueda sin resultados
    Given que ninguna conversación coincide con el término "<termino>" ingresado
    When el usuario realiza la búsqueda
    Then el sistema muestra un mensaje indicando que no se encontraron resultados

    Examples:
      | termino |
      | xyz123 |
      | tema sin coincidencias |
      | consulta inexistente |

  Scenario Outline: Alt - limpiar búsqueda
    Given que el usuario ha aplicado el término de búsqueda "<palabra_clave>"
    When selecciona "Limpiar"
    Then el sistema vuelve a mostrar la lista completa de conversaciones

    Examples:
      | palabra_clave |
      | matrícula |
      | horario |
      | consulta |
