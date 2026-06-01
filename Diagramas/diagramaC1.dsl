workspace "E-Catalog" "Diagrama de Contexto C4 - Level 1" {

    model {
        // Usuarios
        ingeniero = person "Ingeniero" "Consulta información de piezas y gestiona el catálogo: alta, baja y modificación."
        personalIT = person "Personal IT" "Monitorea y mantiene el sistema estable y funcionando."
        developer = person "Developer" "Extiende y mantiene el desarrollo del sistema."

        // Sistema externo
        authSystem = softwareSystem "Auth Collins Aerospace" "Sistema de autenticación corporativo de Collins Aerospace." "External"

        // Sistema central
        eCatalog = softwareSystem "E-Catalog" "Catálogo digital de piezas manufacturadas y compradas. Permite consultar información de forma rápida e intuitiva."

        // Relaciones
        ingeniero  -> eCatalog   "Consulta y Gestiona el catálogo de piezas"
        personalIT -> eCatalog   "Monitorea el estado del sistema"
        developer  -> eCatalog   "Desarrolla y mantiene el sistema"
        eCatalog   -> authSystem "Delega la autenticación de usuarios"
    }

    views {
        systemContext eCatalog "Contexto" "Diagrama de Contexto C4 - E-Catalog" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                shape Person
                background #1168BD
                color #ffffff
            }
            element "Software System" {
                background #1168BD
                color #ffffff
            }
            element "External" {
                background #999999
                color #ffffff
            }
        }
    }
}
