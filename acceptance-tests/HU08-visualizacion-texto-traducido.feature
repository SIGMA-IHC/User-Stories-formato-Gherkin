Feature: HU08 - Visualización del texto traducido

  Como persona que no conoce lengua de señas
  Quiero visualizar en texto el significado de una seña reconocida
  Para comprender el mensaje recibido

  Scenario Outline: Happy path - traducción visualizada
    Given que el sistema reconoce correctamente la seña "<sena>"
    When finaliza el procesamiento
    Then muestra la palabra o expresión correspondiente "<traduccion>" en la pantalla

    Examples:
      | sena    | traduccion |
      | Hola    | Hola       |
      | Gracias | Gracias    |
      | Adiós   | Adiós      |

  Scenario Outline: Unhappy - traducción no disponible
    Given que el sistema no encuentra una traducción correspondiente para "<sena>"
    When intenta mostrar el resultado
    Then informa que no existe una interpretación disponible

    Examples:
      | sena                |
      | Seña desconocida 1  |
      | Seña desconocida 2  |

  Scenario Outline: Preferencia - tamaño de texto
    Given que el usuario necesita visualizar el resultado con mayor claridad
    When aumenta el tamaño de letra en los ajustes a "<tamano>"
    Then el sistema muestra la traducción con la dimensión seleccionada

    Examples:
      | tamano  |
      | Grande  |
      | Muy grande |
