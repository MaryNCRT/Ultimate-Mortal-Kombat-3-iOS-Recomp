<div align="center">

# Ultimate Mortal Kombat 3 — Decompilación iOS y port a PC

**Decompilación en curso de la versión iOS de 2011 de Ultimate Mortal Kombat 3, con el objetivo de un port nativo para Windows y Linux.**

[English](README.md) · [Metodología](docs/METHODOLOGY.md) · [Arquitectura](docs/ARCHITECTURE.md) · [Progreso](docs/PROGRESS.md) · [Divulgación sobre IA](AI-DISCLOSURE.md)

</div>

> **Nota:** la documentación completa del proyecto está en inglés, para que llegue a más gente. Este archivo es un resumen en español.

---

## Aquí no se distribuye nada con copyright

**Este repositorio no contiene código del juego, ni datos, ni assets.** Ni un solo byte propiedad de Electronic Arts o Warner Bros. está subido aquí.

Lo que hay es trabajo **propio**: herramientas de análisis, documentación de formatos de archivo, C escrito a mano y bancos de pruebas. Todo lo que toca el juego original lo lee de **una copia que aportas tú** y genera su salida localmente, donde `.gitignore` la mantiene fuera del repositorio.

Necesitas una copia obtenida legalmente de *Ultimate Mortal Kombat 3* para iOS (versión 1.2.59). Sin ella, nada de esto te sirve para nada.

---

## Qué es este proyecto

En 2011 EA Mobile publicó *Ultimate Mortal Kombat 3* para iPhone, construido sobre un motor 3D propio llamado **LIME**. Como casi todos los juegos de iOS de esa época, lleva años siendo injugable: necesita un iPhone con iOS 3–6, y hace mucho que no está en la App Store.

Este proyecto busca recuperarlo como **software nativo de PC**, no emulado: código fuente que se pueda leer, modificar y compilar para Windows y Linux.

**Es un proyecto largo** — realistamente un año o más. Todavía no hay nada jugable. Lo que sí hay es un método que funciona, mucho conocimiento verificado, y herramientas que hacen tratable el trabajo restante.

---

## Por qué este caso es inusualmente viable

Casi toda decompilación empieza dedicando años a una sola pregunta: *¿dónde empieza y acaba cada función, y cómo se llamaba?* Los binarios comerciales vienen sin símbolos.

**Este binario conserva sus símbolos de depuración (tabla STABS).** Eso cambia la naturaleza del proyecto:

- **4.342 funciones con nombre** — los nombres originales de C y C++ sobreviven
- **135 archivos fuente** en 19 directorios, con el árbol de EA reconstruible
- Cada función está **atribuida al `.cpp` o `.c` del que salió**
- La ruta de compilación original está incrustada en el binario
- **`cryptid = 0`** — sin DRM de FairPlay

No estamos decompilando a ciegas. Ese es exactamente el punto al que otros proyectos tardan años en llegar.

---

## Cómo se reparte el trabajo

| Parte | Funciones | Qué se hace |
|---|---|---|
| SDK comercial de EA (tienda, Facebook, analítica) | ~1.412 (33%) | **Borrar / stubear** |
| Capa de plataforma iOS | 229 (5%) | **Reescribir nativa** |
| Multijugador (GameKit) | 126 (3%) | Stubear |
| **El juego de verdad** | **2.572 (59%)** | **Decompilar** |

Un tercio del binario es andamiaje comercial que se tira.

---

## El método: nunca te fíes de un decompilador

La decisión técnica central del proyecto es que **la salida del decompilador es un borrador, jamás la verdad.**

Construimos un segundo camino independiente desde el mismo código máquina: `tools/armrecomp/recomp.py` traduce ARM/Thumb a C **literalmente**, instrucción por instrucción. Es ilegible, y da igual: es **fiel por construcción**. Lo llamamos el **oráculo**.

Una versión limpia escrita a mano solo se acepta cuando un **test diferencial** demuestra que se comporta igual que el oráculo en miles de entradas.

Esto no es paranoia. Cazó un fallo real de inmediato:

```c
/* Lo que produjo Ghidra para _Len() — INCORRECTO */
float _Len(float *v)
{
  float in_s0;                    /* nunca se asigna */
  ...
  return in_s0;                   /* devuelve basura */
}
```

Compila. Parece razonable. Devuelve una variable sin inicializar, porque el compilador de EA usó **instrucciones NEON de 2 carriles para matemática escalar** y Ghidra pierde la raíz cuadrada por completo.

**El 27% de las funciones del motor están afectadas por ese patrón.** Sin una segunda fuente de verdad, ese fallo habría aparecido un año después como "los modelos se ven raros", sin forma de rastrearlo.

---

## Estado actual

| Módulo | Decompilado | Verificado | C limpio | Test diferencial |
|---|---|---|---|---|
| `Matrix.cpp` (11 fn) | ✅ | ✅ | ✅ | **40.006 casos, 0 divergencias** |
| `limeVector.cpp` (2 fn) | ✅ | ✅ | ✅ | **20.013 casos, 0 divergencias** |
| `RenderMesh.cpp` (19 fn) | ✅ | 🔄 el cargador | ⬜ | **590 archivos, 7.326 mallas** |
| Resto de `lime/common` | ✅ | ⬜ | ⬜ | ⬜ |

Dos módulos están realmente terminados: 13 funciones de 2.572. El porcentaje es pequeño; lo valioso es la **tubería** que los produjo, que ya funciona sola.

---

## Hallazgos

**El formato `.meshset` está resuelto y verificado.** No por deducción: ejecutando el propio `LIME_LoadMeshSet` de EA, recompilado, sobre los datos reales del juego — **590 archivos, 7.326 mallas, 2,9 M de vértices, coincidencia byte a byte**.

**La versión 1.2.59 ya arranca en touchHLE, con un parche de 2 bytes.** Nadie la tenía funcionando. La causa: touchHLE reporta los idiomas como códigos cortos (`["es","en"]`), la tabla de EA no los reconoce, salta un `assert(false)` — y touchHLE **no implementa `___assert_rtn`**, así que muere sin decir cuál falló.

**El SDK de EA no impide arrancar.** Se suponía que había que neutralizar ~1.412 funciones. En la práctica solo una bloqueaba. De ahí sale la regla que ahora gobierna el port: **ningún stub debe usar `assert()`**.

---

## Cómo empezar

Lee **[docs/GETTING-STARTED.md](docs/GETTING-STARTED.md)** (en inglés). No asume conocimientos previos de ingeniería inversa y explica para qué sirve cada pieza.

```bash
pip install capstone

# Extrae la slice armv7 de TU PROPIA copia
python tools/macho.py ruta/a/UMK3 --thin armv7 --out UMK3.armv7

# Reconstruye el árbol de fuentes original
python tools/stabs.py UMK3.armv7 --tree

# Genera el oráculo de un módulo
python tools/armrecomp/recomp.py UMK3.armv7 --file Matrix.cpp --out recompiled --name matrix
```

---

## Divulgación sobre IA

**Buena parte de este proyecto se produjo con asistencia de IA** — concretamente Claude de Anthropic, a través de Claude Code. Eso incluye el análisis, las herramientas, el trabajo de decompilación y la documentación.

Lo decimos claramente porque la comunidad de ingeniería inversa tiene opiniones divididas y firmes sobre esto, y porque mereces saber cómo se produjo el código que estás leyendo. Los detalles están en [AI-DISCLOSURE.md](AI-DISCLOSURE.md).

En corto: todo lo verificable se verificó **mecánicamente**, contra el comportamiento real del binario original. Los tests diferenciales existen precisamente porque ni un decompilador ni un modelo de lenguaje son de fiar por su palabra.

---

## Legal

*Ultimate Mortal Kombat 3* y sus assets son propiedad de sus respectivos titulares. Este proyecto no está afiliado ni respaldado por Electronic Arts, Warner Bros., NetherRealm Studios ni Midway Games.

El trabajo aquí es ingeniería inversa con fines de **interoperabilidad y preservación**: hacer que un software que ya no funciona en ninguna plataforma actual vuelva a funcionar, en hardware que sus dueños ya tienen. No se redistribuye código ni datos del juego.

El código propio del proyecto está bajo licencia [MIT](LICENSE).
