# LunaShop 🛍🐱

Una app de catálogo de productos con diseño minimalista y creativo. Desarrollada en SwiftUI como parte de un reto técnico.

## 🧱 Arquitectura

Utiliza **MVVM** con un enfoque de `ProductStore` centralizado (aggregate model) para mantener los datos y el estado de forma simple y reactiva. Esto permite una estructura ligera, perfecta para proyectos pequeños, pero escalable si fuera necesario.

## 🚀 Tecnologías

- SwiftUI

- MVVM + Observable
- Xcode 15.2+

## 🎨 Diseño

Diseño propio inspirado en estética minimalista con referencias a gatos 🐾, manteniendo una UI amigable y clara.



## 🛠 Cómo correr el proyecto

1. Clona el repositorio
2. Abre `LunaShop.xcodeproj` con Xcode 15 o superior
3. Ejecuta en un simulador iPhone 14 o más reciente

## 🧠 Decisiones técnicas

- Se centralizó el estado en un `ProductStore` para facilitar la comunicación entre vistas sin necesidad de coordinadores complejos.
- Las vistas se conectan al modelo con `@Environment`.
- Se usaron datos mockeados para simplificar la implementación.

---
