Feature: HU18 - Organización de frases por categorías

  Como persona que no conoce lengua de señas
  Quiero encontrar frases organizadas por situaciones cotidianas
  Para localizar rápidamente expresiones adecuadas al contexto de comunicación

  Scenario Outline: Happy path - visualización de categorías
    Given que el usuario ingresa al módulo de frases
    When consulta las categorías disponibles
    Then el sistema muestra opciones como "<categoria>"

    Examples:
      | categoria          |
      | Saludos            |
      | Consultas          |
      | Solicitudes de ayuda |

  Scenario Outline: Alt - selección de categoría
    Given que el usuario necesita realizar una consulta
    When selecciona la categoría correspondiente "<categoria>"
    Then el sistema muestra las frases relacionadas

    Examples:
      | categoria          |
      | Consultas          |
      | Saludos            |
      | Solicitudes de ayuda |

  Scenario Outline: Unhappy - categoría sin contenido
    Given que una categoría "<categoria>" no tiene frases disponibles
    When el usuario la selecciona
    Then el sistema muestra un mensaje indicando que no existen expresiones registradas

    Examples:
      | categoria           |
      | Categoría vacía 1   |
      | Categoría vacía 2   |
