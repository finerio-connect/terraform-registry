# terraform-registry

Repositorio centralizado para publicar, versionar y consumir modulos reutilizables de Terraform dentro del ecosistema de Finerio. Su objetivo es entregar configuraciones de infraestructura como codigo seguras, consistentes y faciles de mantener, acelerando el trabajo de los equipos de plataforma, seguridad y producto.

## Objetivos principales
- Estandarizar patrones de infraestructura repetibles (redes, cuentas, pipelines, observabilidad, etc.).
- Simplificar la distribucion y el versionado de modulos aprobados.
- Reducir errores de configuracion y tiempos de despliegue.
- Asegurar que las mejores practicas de seguridad y cumplimiento se apliquen de forma transversal.

## Alcance y publico objetivo
- Equipos internos que definen e implementan infraestructura en la nube mediante Terraform.
- Mantenedores de modulos que desean compartir plantillas consistentes y auditables.
- Personas desarrolladoras que necesitan consumir piezas reutilizables sin reconstruir su infraestructura desde cero.

## Estructura sugerida del repositorio
> Ajustar conforme se vayan agregando modulos reales.

```
terraform-registry/
├── modules/
│   ├── networking/
│   │   └── vpc/
│   ├── security/
│   │   └── iam-role/
│   └── observability/
│       └── cloudwatch-dashboard/
├── examples/
│   └── <modulo>/
└── docs/
    └── <modulo>.md
```

- `modules/`: codigo fuente de cada modulo versionable, organizado por dominio.
- `examples/`: escenarios de referencia que muestran como consumir cada modulo.
- `docs/`: guias y notas especificas por modulo o dominio.

## Flujo de trabajo recomendado
1. **Crear o actualizar un modulo** dentro de `modules/<dominio>/<modulo>`.
2. **Ejecutar pruebas** (por ejemplo, `terraform validate` y `terraform fmt`) para garantizar calidad.
3. **Actualizar ejemplos y documentacion** vinculada al modulo.
4. **Abrir un pull request** describiendo cambios, impactos y pasos de despliegue.
5. **Publicar la version** mediante etiquetas SemVer (`vMAJOR.MINOR.PATCH`) una vez aprobado.

## Buenas practicas de modulos
- Declarar `terraform` y `required_providers` en cada `versions.tf`.
- Documentar variables, salidas y ejemplos mediante `README` locales.
- Incluir `terraform fmt` y `terraform validate` en CI.
- Diseñar interfaces limpias: variables de entrada claras, salidas minima y especificamente necesarias.
- Evitar hardcodes; utilizar variables y data sources cuando sea viable.

## Versionado y compatibilidad
- Adherir a SemVer para comunicar cambios: mayores rompen compatibilidad, menores agregan funcionalidades y parches corrigen errores.
- Mantener un historial de cambios (`CHANGELOG.md`) por modulo o a nivel general.
- Eliminar versiones obsoletas solo despues de anunciar un periodo de adopcion de la nueva version.

## Requisitos minimos
- Terraform >= 1.3.x.
- Plugins o providers alineados con las versiones soportadas por los equipos de plataforma.
- Acceso autenticado al repositorio para publicar y consumir modulos.

## Roadmap inicial
- Definir convenciones de nombrado y estructura de carpetas oficiales.
- Configurar plantillas de PR y GitHub Actions para validaciones automaticas.
- Incorporar modulos base (por ejemplo, redes, IAM, observabilidad).
- Documentar politicas de revision y aprobacion de modulos.

## Recursos recomendados
- [Documentacion oficial de Terraform](https://developer.hashicorp.com/terraform/docs)
- [Guia de writing-terraform-modules](https://developer.hashicorp.com/terraform/language/modules/develop)
- [Semantic Versioning](https://semver.org/lang/es)

---

> Actualizar este README a medida que se agreguen modulos reales, procesos automatizados y lineamientos internos adicionales.
