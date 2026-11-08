Feature: HU19 - Edición de mensajes antes del envío

  Como persona que no conoce lengua de señas
  Quiero modificar el contenido de un mensaje antes de enviarlo
  Para asegurar que la información transmitida sea correcta

  Scenario Outline: Happy path - edición exitosa
    Given que el usuario ha redactado el mensaje "<mensaje_original>"
    When modifica su contenido antes de enviarlo por "<mensaje_modificado>"
    Then el sistema actualiza el texto en el campo de escritura

    Examples:
      | mensaje_original | mensaje_modificado |
      | Hola | Buenos días |
      | ¿Cómo estás? | ¿Cómo te encuentras? |
      | Necesito ayuda | Necesito asistencia |

  Scenario Outline: Unhappy - eliminación accidental
    Given que el usuario elimina el contenido del mensaje
    When intenta enviarlo con el contenido "<contenido>"
    Then el sistema bloquea el envío

    Examples:
      | contenido |
      | "" |
      | "   " |
      | " " |

  Scenario Outline: Alt - limpieza de texto
    Given que el usuario desea redactar un mensaje diferente a partir de "<mensaje_original>"
    When selecciona "Limpiar"
    Then el sistema elimina el contenido del campo de escritura

    Examples:
      | mensaje_original |
      | Hola |
      | Necesito ayuda |
      | Buenos días |
