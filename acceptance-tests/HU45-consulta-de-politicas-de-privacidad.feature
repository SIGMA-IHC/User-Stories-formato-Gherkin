Feature: HU45 - Consulta de políticas de privacidad

  Como usuario de Sigma
  Quiero consultar las políticas de privacidad
  Para conocer cómo se maneja la información utilizada durante mi experiencia en la aplicación

  Scenario Outline: Happy path - visualización de políticas
    Given que el usuario accede a la sección de privacidad desde "<pantalla>"
    When selecciona "Política de privacidad"
    Then el sistema muestra el documento correspondiente

    Examples:
      | pantalla |
      | Menú principal |
      | Configuración |
      | Perfil de usuario |

  Scenario Outline: Unhappy - documento no disponible
    Given que ocurre un error al cargar el documento "<documento>"
    When el usuario intenta consultarlo
    Then el sistema muestra un mensaje indicando que no fue posible recuperar la información

    Examples:
      | documento |
      | Política de privacidad |
      | Documento de privacidad |
      | Información de privacidad |

  Scenario Outline: Alt - consulta de información específica
    Given que el usuario desea revisar el apartado "<apartado>"
    When se desplaza por el documento
    Then el sistema permite consultar su contenido

    Examples:
      | apartado |
      | Tratamiento de información |
      | Privacidad de datos |
      | Uso de información |
