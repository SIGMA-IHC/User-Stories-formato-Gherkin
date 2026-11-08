Feature: HU42 - Consulta de versión de la aplicación

  Como usuario de Sigma
  Quiero visualizar la versión instalada de la aplicación
  Para conocer qué versión estoy utilizando

  Scenario Outline: Happy path - visualización de versión
    Given que el usuario accede a la sección "Acerca de Sigma" desde "<pantalla>"
    When consulta la información
    Then el sistema muestra el número de versión instalada

    Examples:
      | pantalla |
      | Menú principal |
      | Configuración |
      | Perfil de usuario |

  Scenario Outline: Unhappy - información no disponible
    Given que ocurre un error al recuperar los datos de la aplicación en "<dispositivo>"
    When el usuario consulta la versión
    Then el sistema muestra un mensaje indicando que la información no está disponible

    Examples:
      | dispositivo |
      | Dispositivo móvil |
      | Tableta |
      | Navegador web |
