Feature: HU38 - Registro de incidencias de comunicación

  Como representante institucional
  Quiero registrar dificultades presentadas durante la atención de personas con discapacidad auditiva
  Para identificar problemas recurrentes y evaluar oportunidades de mejora

  Scenario Outline: Happy path - registro de incidencia
    Given que el representante identifica una dificultad de comunicación "<dificultad>"
    When completa el formulario y selecciona "Registrar"
    Then el sistema almacena la incidencia con su fecha y descripción

    Examples:
      | dificultad |
      | Dificultad para comprender una consulta |
      | Problemas de comunicación durante la atención |
      | Dificultad al transmitir información |

  Scenario Outline: Unhappy - descripción vacía
    Given que el representante intenta registrar una incidencia con la descripción "<descripcion>"
    When presiona "Guardar"
    Then el sistema solicita completar el campo obligatorio

    Examples:
      | descripcion |
      |  |
      |     |
      | Sin descripción |

  Scenario Outline: Alt - consulta de incidencias
    Given que existen incidencias registradas para la institución "<institucion>"
    When el representante accede al historial
    Then el sistema muestra los registros disponibles

    Examples:
      | institucion |
      | Institución Educativa San Martín |
      | Centro de Atención Inclusiva |
      | Universidad de Ejemplo |
