Feature: HU16 - Visualización de respuestas mediante elementos visuales

  Como persona que no conoce lengua de señas
  Quiero visualizar respuestas representadas mediante elementos visuales compatibles
  Para facilitar la comprensión de la comunicación

  Scenario Outline: Happy path - respuesta visualizada
    Given que el sistema dispone de una representación visual correspondiente al mensaje "<mensaje>"
    When procesa la respuesta
    Then muestra el recurso visual asociado

    Examples:
      | mensaje       |
      | Hola          |
      | Gracias       |
      | Buenos días   |

  Scenario Outline: Unhappy - recurso visual no disponible
    Given que no existe una representación visual para el mensaje ingresado "<mensaje>"
    When el sistema intenta mostrarla
    Then informa que el recurso no está disponible

    Examples:
      | mensaje                  |
      | Mensaje no compatible 1  |
      | Mensaje no compatible 2  |

  Scenario Outline: Alt - retorno a texto
    Given que el usuario no puede visualizar el recurso visual correspondiente al mensaje "<mensaje>"
    When selecciona la opción de texto
    Then el sistema muestra el contenido escrito correspondiente

    Examples:
      | mensaje       |
      | Hola          |
      | Gracias       |
