Feature: HU39 - Consulta de recursos de orientación institucional

  Como representante de una institución
  Quiero consultar recursos de orientación sobre comunicación inclusiva
  Para promover una atención más comprensible y accesible

  Scenario Outline: Happy path - visualización de recursos
    Given que el representante ingresa al módulo de orientación de "<institucion>"
    When se carga la sección
    Then el sistema muestra los recursos disponibles

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |

  Scenario Outline: Alt - selección de recurso
    Given que el representante encuentra el recurso "<recurso>" de interés
    When lo selecciona
    Then el sistema muestra su contenido completo

    Examples:
      | recurso |
      | Guía de comunicación inclusiva |
      | Material de orientación |
      | Recurso institucional |

  Scenario Outline: Unhappy - recurso no disponible
    Given que el recurso "<recurso>" no puede recuperarse
    When el representante intenta abrirlo
    Then el sistema muestra un mensaje indicando que no está disponible

    Examples:
      | recurso |
      | Guía de comunicación inclusiva |
      | Material de orientación |
      | Recurso institucional |
