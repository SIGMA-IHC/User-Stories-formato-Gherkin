Feature: HU50 - Acceso a soporte de la aplicación

  Como usuario de Sigma
  Quiero acceder a un apartado de soporte
  Para obtener orientación cuando tenga dificultades al utilizar las funcionalidades de la aplicación

  Scenario Outline: Happy path - acceso a soporte
    Given que el usuario necesita asistencia por "<motivo>"
    When selecciona la opción "Soporte"
    Then el sistema muestra los canales de ayuda disponibles

    Examples:
      | motivo |
      | Dificultad de acceso |
      | Problema de funcionamiento |
      | Duda sobre una funcionalidad |

  Scenario Outline: Alt - selección de tipo de consulta
    Given que el usuario accede al apartado de soporte
    When selecciona el tipo de problema "<tipo_problema>" que presenta
    Then el sistema muestra la información correspondiente para solicitar ayuda

    Examples:
      | tipo_problema |
      | Problema de acceso |
      | Problema de funcionamiento |
      | Problema con el reconocimiento de señas |

  Scenario Outline: Unhappy - soporte no disponible
    Given que ocurre un error al cargar la información de soporte "<seccion>"
    When el usuario intenta acceder
    Then el sistema muestra un mensaje indicando que el servicio no está disponible temporalmente

    Examples:
      | seccion |
      | Canales de ayuda |
      | Información de contacto |
      | Opciones de soporte |
