Feature: HU29 - Visualización de instrucciones de uso
  Como persona que no conoce lengua de señas, quiero consultar instrucciones sobre el funcionamiento de Sigma, para aprender a utilizar sus herramientas de comunicación correctamente.

  Scenario Outline: Happy path - acceso a tutorial
    Given que el usuario ingresa a la sección de ayuda desde "<pantalla>"
    When selecciona "Cómo utilizar Sigma"
    Then el sistema muestra instrucciones sobre las funcionalidades principales.

    Examples:
      | pantalla |
      | Pantalla principal |
      | Menú de ayuda |
      | Módulo de comunicación |

  Scenario Outline: Alt - consulta de funcionalidad específica
    Given que el usuario necesita aprender a utilizar la funcionalidad "<funcionalidad>"
    When selecciona dicha funcionalidad en el tutorial
    Then el sistema muestra los pasos correspondientes.

    Examples:
      | funcionalidad |
      | Reconocimiento de señas |
      | Envío de mensajes |
      | Visualización de mensajes |

  Scenario Outline: Unhappy - contenido no disponible
    Given que ocurre un error de carga del tutorial "<tutorial>"
    When el usuario intenta consultar las instrucciones
    Then el sistema muestra un mensaje indicando que no fue posible recuperar el contenido.

    Examples:
      | tutorial |
      | Tutorial de inicio |
      | Tutorial de reconocimiento de señas |
      | Tutorial de comunicación |
