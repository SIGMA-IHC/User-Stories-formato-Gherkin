Feature: HU13 - Ingreso de mensajes mediante teclado

  Como persona que no conoce lengua de señas
  Quiero escribir mensajes utilizando el teclado de mi dispositivo
  Para comunicarme con una persona que utiliza lengua de señas

  Scenario Outline: Happy path - ingreso de mensaje
    Given que el usuario accede al módulo de comunicación
    When escribe un mensaje "<mensaje>" en el campo de texto
    Then el sistema muestra el contenido ingresado
    And habilita la opción de enviarlo

    Examples:
      | mensaje                |
      | Hola, ¿cómo estás?     |
      | Necesito ayuda         |
      | Muchas gracias         |

  Scenario Outline: Unhappy - mensaje vacío
    Given que el usuario no ha escrito ningún contenido "<mensaje>"
    When presiona "Enviar"
    Then el sistema impide el envío
    And solicita ingresar un mensaje

    Examples:
      | mensaje |
      |         |
      |         |

  Scenario Outline: Preferencia - edición de mensaje
    Given que el usuario escribió un mensaje con errores "<mensaje_original>"
    When modifica el contenido antes de enviarlo
    Then el sistema actualiza el texto ingresado a "<mensaje_corregido>"

    Examples:
      | mensaje_original | mensaje_corregido |
      | Ola              | Hola              |
      | Gracais          | Gracias           |
      | Buen dia         | Buen día          |
