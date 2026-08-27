<div align="center">

<img src="docs/img/banner.jpg" alt="Ultimate Mortal Kombat 3 Recomp" width="880">

# Ultimate Mortal Kombat 3 — Decompilación de iOS y port a PC

**Decompilación en curso de la versión iOS de 2011 de Ultimate Mortal Kombat 3, con el objetivo de llegar a un port nativo para Windows y Linux.**

[Primeros pasos](docs/GETTING-STARTED.md) · [Metodología](docs/METHODOLOGY.md) · [Motor LIME](docs/LIME-ENGINE.md) · [Formatos de assets](docs/X-TABLES.md) · [Visor de mallas](docs/MESH-VIEWER.md) · [Bugs del juego](docs/GAME-BUGS.md) · [Contenido oculto](docs/HIDDEN-CONTENT.md) · [Escenarios](docs/STAGES.md) · [Iluminación](docs/LIGHTING.md) · [Formato de fuentes](docs/FONT-FORMAT.md) · [Formato .scene](docs/SCENE-FORMAT.md) · [Formato PVR](docs/PVR-FORMAT.md) · [Listas de frames](docs/FRAMELISTS.md) · [Referencia MAME](docs/MAME-ARCADE.md) · [Build de iPad](docs/IPAD-BUILD.md) · [Arquitectura](docs/ARCHITECTURE.md) · [Progreso](docs/PROGRESS.md) · [Relevo](docs/HANDOFF.md) · [Encargo](docs/ENCARGO.md) · [Declaración sobre IA](AI-DISCLOSURE.md) · [English](README.md)

</div>

> **Nota:** la documentación de `docs/` está en inglés para que llegue a más gente. Este README es la versión completa en español, a la par con la inglesa.

---

## Aquí no se distribuye ningún contenido con derechos de autor

**Este repositorio no publica ningún archivo del juego.** Ni texturas, ni modelos, ni audio, ni código compilado — nada que puedas sacar de aquí y usar. Todo se compila contra **una copia que aportas tú**.

Conviene ser preciso con las imágenes que sí hay. El banner combina fan art del logotipo de *Ultimate Mortal Kombat 3* con **renders de los modelos del juego hechos por ermaccer**, bajo licencia CC BY 4.0 — ambos acreditados [más abajo](#el-banner). Las capturas de [la documentación del visor de mallas](docs/MESH-VIEWER.md) son nuestras, hechas con nuestras propias herramientas. En ambos casos vale lo mismo: un render representa la geometría del juego; no es un archivo de assets, no se puede desempaquetar para volver a serlo, y no forma parte de ninguna compilación. Las marcas *Mortal Kombat* y los personajes que aparecen pertenecen a Warner Bros. Entertainment.

Lo que hay es trabajo *nuestro*: herramientas de análisis, documentación de formatos de archivo, C escrito a mano y arneses de pruebas. Todo lo que toca el juego original lo lee de **una copia que aportas tú** y produce su salida en local, donde el `.gitignore` la mantiene fuera del repositorio.

Necesitas una copia obtenida legalmente de *Ultimate Mortal Kombat 3* para iOS (versión 1.2.59) para que algo de esto te sirva. Si no la tienes, nada de este repositorio te va a resultar útil.

---

## Qué es este proyecto

En 2011 EA Mobile publicó *Ultimate Mortal Kombat 3* para iPhone. Estaba construido sobre un motor 3D propio llamado **LIME** y, como la mayoría de los juegos de iOS de aquella época, lleva años siendo imposible de jugar: necesita un iPhone con iOS 3–6 y hace mucho que se retiró de la App Store.

Este proyecto intenta recuperarlo como es debido, en forma de **software nativo de PC** en vez de emulación: código fuente que se pueda leer, modificar y compilar para Windows y Linux.

<div align="center">

<img src="docs/img/pose-cast.png" alt="Seis personajes de UMK3 posados por tools/pose.py" width="860">

<img src="docs/img/viewer-graveyard.png" alt="El escenario Graveyard dibujado por tools/meshview.py" width="300">

<sub>Seis del plantel en guardia de combate y el escenario Graveyard, dibujados por [`tools/pose.py`](tools/pose.py) y [`tools/meshview.py`](tools/meshview.py). El árbol de huesos, la pose, los pesos de skinning, la topología, las UVs, la decodificación PVRTC y la matriz de proyección salen todos de los parsers y el código decompilado de este proyecto. Sin emulador y sin binario del motor. [Cómo funciona](docs/MESH-VIEWER.md).</sub>

<img src="docs/img/demo-graveyard.png" alt="La demo nativa dibujando el escenario Graveyard con Sub-Zero animado" width="860">

<img src="docs/img/demo-balcony.png" alt="La misma demo dibujando el escenario Balcony" width="430">

<sub>**La demo nativa** — [`runtime/demo.c`](runtime/demo.c): una ventana OpenGL de verdad movida por el C de este proyecto, sin Python y sin emulador por ningún lado. **Dibuja los 18 escenarios**, cada uno con el efecto que declaran sus propios ficheros: las siete bandas de niebla de Graveyard, las dieciséis antorchas de Balcony, las siete cuchillas del Pit. Sub-Zero sale skinneado y animado desde `.bones`, `.skin` y `.skinanim`; el escenario se monta recorriendo el grafo del `.scene` y colocando cada objeto con la paleta de matrices que trae el fichero, a su tamaño real según su propio `boundsRadius`. El modo de mezcla de cada malla lo decide su **nombre** — `ATST_*` significa alpha test, que es justo lo que hace el motor. Ver [formato .scene](docs/SCENE-FORMAT.md).</sub>

</div>

Los objetivos a largo plazo, en orden:

| Objetivo | Estado |
|---|---|
| Entender el binario y sus formatos de archivo | ✅ en gran parte hecho |
| Recuperar C legible, función a función | 🔄 en curso |
| Sustituir la capa de plataforma iOS por una nativa de PC | 🔄 empezada — ventana, contexto GL y carga de assets funcionan en Windows y Linux; sin audio ni mapeo de mando |
| Widescreen, soporte de mando, mods | ⬜ planeado |
| **Dos jugadores locales en una máquina** | ⬜ planeado — [la build de iPad lo trae](docs/IPAD-BUILD.md) |
| Restaurar contenido oculto e inalcanzable | ⬜ tras tener build jugable |
| 60 fps, netcode moderno | ⬜ a largo plazo |

**Este es un proyecto largo.** De forma realista, es un año o más de trabajo. Aquí todavía no hay nada jugable. Lo que sí hay es un método que funciona, una cantidad considerable de conocimiento verificado, y herramientas que hacen abordable el trabajo que queda.

---

## Por qué este caso es inusualmente abordable

La mayoría de los proyectos de decompilación empiezan invirtiendo años en responder a una sola pregunta: *¿dónde empieza y acaba cada función, y cómo se llamaba?* Los binarios comerciales vienen sin símbolos; te dan direcciones y nada más.

**Este binario no fue stripped y conserva su tabla de depuración STABS.** Ese único hecho cambia la naturaleza del proyecto:

- **4.342 funciones con nombre** — sobreviven los nombres originales de C y C++
- **135 unidades de traducción** en 19 directorios — el árbol de fuentes original de EA, recuperable
- Cada función está **atribuida al archivo `.cpp` o `.c` del que salió**
- La ruta de compilación está incrustada en el binario:
  `/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/`
- **`cryptid = 0`** — sin DRM de FairPlay. El código se lee de principio a fin.

O sea, que no estamos decompilando a ciegas. Sabemos que `RenderMesh.cpp` tenía 19 funciones y cómo se llamaban; sabemos que `mkdrone.c` tenía 394. Ese es el punto de partida al que la mayoría de proyectos tardan años en llegar.

---

## Cómo se reparte el trabajo

Las 4.342 funciones del binario se dividen en cuatro grupos muy distintos:

| Parte | Funciones | Qué se hace con ella |
|---|---|---|
| SDK comercial y social de EA (tienda, Facebook, analítica, JSON) | ~1.412 (33%) | **Borrar / stubear** — nada de eso hace falta sin conexión |
| Capa de plataforma iOS (`lime/iphone`, audio) | 229 (5%) | **Reescribir nativa** — código nuevo, sin ingeniería inversa |
| Multijugador en red (GameKit) | 126 (3%) | Stubear |
| **El juego de verdad** (`lime/common`, `gamecode`, lógica de combate) | **2.572 (59%)** | **Decompilar** |

Un tercio del binario es andamiaje comercial que se tira. Solo la última fila es trabajo real.

---

## El método: no fiarse nunca de un decompilador

La decisión técnica central de este proyecto —y la que merece la pena copiar si estás haciendo algo parecido— es que **la salida del decompilador se trata como un borrador, nunca como la verdad.**

Construimos un segundo camino independiente desde el mismo código máquina:

- **`tools/armrecomp/recomp.py`** — un recompilador estático que traduce ARM/Thumb a C *literalmente*, instrucción a instrucción, con el estado de la CPU en un struct `arm_ctx` explícito. No interpreta: transcribe. La salida es ilegible, y está bien que lo sea: es fiel por construcción.
- Ghidra produce C **legible**, que es lo que de verdad queremos publicar.
- Una versión limpia escrita a mano de cada función solo se acepta cuando un **test diferencial** demuestra que se comporta igual que la recompilada a lo largo de miles de entradas.

Esto no es paranoia. Detectó un fallo real y silencioso casi de inmediato:

```c
/* Lo que Ghidra produjo para _Len() — INCORRECTO */
float _Len(float *v)
{
  float in_s0;                    /* nunca se asigna */
  FloatVectorMult(uVar1, uVar1, 2, 0x20);
  FloatVectorAdd(uVar1, uVar2, 2);
  return in_s0;                   /* devuelve basura */
}
```

Compila. Parece plausible. Devuelve una variable sin inicializar, porque el compilador de EA usó **instrucciones NEON de 2 carriles para hacer matemática escalar**, y Ghidra las modela como operaciones vectoriales opacas, perdiendo el `vsqrt` por completo.

**Hay 153 funciones afectadas en todo el binario**, un 23% del núcleo del motor — y, medido como es debido, hay más en `FrontEnd.cpp` y `GameCode.cpp` que en el motor. Sin una segunda fuente de verdad, ese fallo —y los que hubiera como él— habría aflorado un año después como «los modelos se ven raros», sin forma de rastrear el origen.

El razonamiento completo está en [docs/METHODOLOGY.md](docs/METHODOLOGY.md).

---

## Progreso general

```
███████████████████░░░░░░░░░░░░░░░░░░░░░  47,29%
```

| Área | Peso | Hecho | |
|---|---:|---:|---|
| Análisis del binario y mapeo del árbol de fuentes | 4% | 100% | `██████████` |
| Herramientas y el oráculo de verificación | 8% | 100% | `██████████` |
| Especificaciones de los formatos de assets | 8% | 100% | `██████████` |
| `lime/common` — núcleo del motor (109 fn) | 12% | **100%** | `██████████` |
| `gamecode` — lógica de juego (291 fn) | 18% | 75,26% (219) | `████████░░` |
| `gamecode/logic` — motor de combate (2.172 fn) | 28% | 0,14% (3) | `░░░░░░░░░░` |
| Capa de plataforma PC nativa (161 fn a reescribir) | 17% | 10% | `█░░░░░░░░░` |
| Stubs del EA SDK (~1.412 fn) | 5% | 0% | `░░░░░░░░░░` |

**47,29% del esfuerzo total estimado. Todavía no hay nada jugable.**

**Las tres filas del medio se cuentan; el resto son estimaciones.**
`tools/progress.py` lee el árbol en cada ejecución para `lime/common`,
`gamecode` y `gamecode/logic`; las otras cinco son juicios que mantiene una
persona.

Esas tres también estaban escritas a mano en el script, y se notó: `gamecode`
figuraba en 0% y `gamecode/logic` en 4% mucho después de que ambos tuvieran
cuerpos verificados en el repo. El global que producía era 34,82% frente a un
35,04% real — **acertado por casualidad**, porque un número estaba siete puntos
bajo y el otro cuatro alto, y los pesos casi los cancelaban. Un contador de
progreso que hay que editar a mano para reflejar el progreso va a estar mal; que
estuviera mal en una dirección favorecedora es lo que lo mantuvo con vida.

**Por qué las áreas de base cuentan.** Las tres primeras filas están terminadas y
son lo que hace tratable el resto: el árbol de fuentes está recuperado, todos los
formatos de assets están especificados, y cada función tiene ya un camino
automatizado desde el código máquina hasta un test diferencial. Eso es progreso
real aunque no renderice un solo píxel.

**El núcleo del motor es la cuarta fila, y está terminado.** Las 109 funciones
tienen cuerpo; los nueve ficheros están además verificados contra el
original recompilado.

**Por qué el número sigue sin ser alto.** Solo el motor de combate son 2.172
funciones y apenas se ha empezado. Realistamente esto es un año de trabajo o más.

### `lime/common` está completo — y esto es lo que significa y lo que no

Las **109 de 109** funciones del núcleo del motor tienen cuerpo. Todas compilan,
todas pasan la verja estructural, y el módulo entero construye limpio con
`-Wall -Wextra`.

**No significa que las 109 estén verificadas.** Cuatro módulos tienen tests
diferenciales contra el original recompilado; el resto están leídas, escritas y
compiladas, que es una afirmación más débil y honesta:

| | |
|---|---|
| Verificado por comportamiento | `Matrix`, `limeVector`, el cargador de `RenderMesh`, la matemática de `RenderSkinned`, el pool de `Events`, las conversiones de `LIMEDS_Misc` |
| Casos comparados | 103.907 sintéticos, más 590 ficheros y 7.327 mallas de datos reales |
| Divergencias | **0** |
| Escrito, compilado, aún sin pasar por el oráculo | el resto |

Varios cuerpos son **estructurales**: la secuencia de llamadas y los accesos a
campos están recuperados, y alguna condición de rama o algún enum de GL queda
marcado en el comentario como no fijado en vez de adivinado. Esas marcas son la
parte interesante del fichero — son por donde debe mirar quien siga, y están ahí
a propósito.

La regla que ha llevado hasta aquí está escrita en [ENCARGO.md](docs/ENCARGO.md):
un cuerpo sobre un layout sin confirmar es peor que ningún cuerpo. Se puso a
prueba dos veces. `symcheck` rechazó un `LIME_RenderSceneOverrideTextures`
construido sobre dos accesores inventados, y el contador fue **hacia atrás** de
104 a 103 antes de encontrar el layout real. Y `LIME_UpdateEvents` tenía un
cuerpo escrito con confianza y equivocado que solo destapó un test diferencial.

---

## Estado actual

| Módulo | Decompilado | Verificado | C limpio | Test diferencial |
|---|---|---|---|---|
| `Matrix.cpp` (11 fn) | ✅ | ✅ | ✅ | **40.006 casos, 0 divergencias** |
| `limeVector.cpp` (2 fn) | ✅ | ✅ | ✅ | **20.013 casos, 0 divergencias** |
| `RenderMesh.cpp` — cargador (3 de 19 fn) | ✅ | ✅ | ✅ | **590 archivos, 7.327 mallas, 0 divergencias** |
| `other.c` — `SwitchQueue` (1 de 333 fn) | ✅ | ✅ | ✅ | **500 pushes, 0 divergencias** |
| `RenderScene.cpp` (14 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `RenderSkinned.cpp` (20 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `Events.cpp` (22 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `limeFont.cpp` (6 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `LIMEDS_Misc.cpp` (8 fn) | ✅ | ⬜ | ⬜ | ⬜ |
| `DS_DebugWin.c` (7 fn) | ✅ | ⬜ | ⬜ | ⬜ |

Tres módulos y medio están de verdad terminados: decompilados, verificados, reescritos a mano y demostrados equivalentes. Eso son 17 funciones de 2.572, incluida la primera del motor de combate. El porcentaje es pequeño; el *proceso* que las produjo es el activo de verdad, y ya funciona desatendido.

Estado detallado, decisiones y deuda técnica conocida: [docs/PROGRESS.md](docs/PROGRESS.md).

---

## Cosas descubiertas por el camino

**Un archivo que no parsea suele ser una variante, no corrupcion.** Tres formatos resultaron tener mas de un layout, y en los tres el indicio fue el mismo: la lectura alternativa divide *exacto*, no casi. `.meshset` tiene tres variantes; `.bones` tiene dos, de 24 y 25 bytes por hueso; y `SINDEL_STANDARD.skinanim` usa una cabecera de 16 bytes donde los otros 28 usan 12 — su contador leia `1065353216`, que es `0x3F800000`, el float 1.0 confundido con un entero. `.bones` y `.skinanim` recorren ahora **29 de 29** archivos.

El mismo razonamiento colapso cuatro "excepciones conocidas" en una. `ROBO1` y `ROBO2` fallaban en `.bones`, `.skin`, `.scene` y por no tener `.events` — son simplemente **otra exportacion**. `ROBO2_STANDARD.skin` mide exactamente cuatro bytes menos que `SEKTOR_STANDARD.skin`, el blockCount que falta, y sus primeros 1.276 bytes son identicos byte a byte.

**Todos los formatos de assets de LIME estan resueltos.** `.scene` fue el ultimo, y es el que mejor muestra por que el proyecto rechaza los casi-aciertos: un intento anterior ajusto una formula que acertaba en **71 de 92** archivos de un solo objeto, y se descarto en vez de publicarse. Estaba mal — cada objeto lleva sus propias pistas de animacion, y un tercer array viene despues de todos. Leer el loader da los tres strides directamente, y la pieza que faltaba se escondia en un modo de direccionamiento: `ldr r3, [r1, #0x28]!`, una carga pre-indexada *con escritura*, que avanza el cursor 40 bytes como efecto secundario de leer. **545 de 547 archivos** aterrizan ahora en su ultimo byte exacto, y el recorrido depende de tres contadores que varian de forma independiente en 63, 74 y 175 valores distintos.

Los dos que no parsean son `ROBO1` y `ROBO2` — **el mismo par que rompe todos los demas formatos**, con un hueso de 24 bytes en vez de 25 en `.bones` y la variante sin indexar de `.meshset`. Cuatro formatos, una anomalia consistente.

**El decodificador PVRTC funciona — y el fallo estaba en los datos de prueba.** El juego publica 38 texturas dos veces, como `NAME.PNG` *y* `NAME.pvr`, lo que es una implementacion de referencia gratis que hizo innecesario descargar ningun conversor. Contra ella el decodificador saca **1,5% de error medio** —0,6% en 2bpp, 2,4% en 4bpp— y el residuo esta *demostrado* que es compresion y no un bug: sube con el gradiente local de la imagen (4,75 en zonas planas, 30–51 en bordes duros) y es plano segun la posicion del bloque. Un bloque de 4×4 que mezcla dos colores no puede contener un borde dentro de si mismo; asi es exactamente como falla la compresion por bloques.

Llegar ahi costo tres rondas perdidas. El decodificador marcaba 5,5% y catorce hipotesis cuidadosas lo empeoraban todas — porque **tres de los trece pares PNG/PVR son assets distintos que comparten nombre**. El PNG de `FE_METAL_BG` enmarca el arte de otra forma; el de `MYBLOOD` es la fuente sin procesar con clave cromatica magenta. Ese solo archivo inflaba la nota de 3,83 a 14,00. Poner las imagenes lado a lado lo resolvio de una mirada, y es la tercera vez que este proyecto paga por no mirar la imagen.

**Los renderizadores son codigo de ejemplo de Apple, y con ellos un tercio de la capa de plataforma.** `ES1Renderer.m` tiene exactamente los cuatro metodos de la plantilla `GLES2Sample` de Apple — `init`, `render`, `resizeFromLayer:`, `dealloc` — y `ES2Renderer.m` anade exactamente los cuatro de shaders. Junto con `Finch/`, **68 de las 229 funciones de la capa de plataforma (30%) no hay que decompilar**. Ademas explica por que el binario importa `glGenFramebuffers` *y* `glGenFramebuffersOES`: la plantilla de ES 1.1 usa los nombres de extension y la de ES 2.0 los core, un juego por renderizador.

**Lo del NEON era lo normal de la epoca, no una rareza de EA.** En el Cortex-A8 del iPhone 3GS y el 4, la unidad VFP escalar no esta segmentada y NEON si — asi que hacer matematica escalar con NEON de 2 carriles era *mas rapido*, aun desperdiciando un carril. Era practica estandar en 2010. Y explica por que la slice armv6 sale limpia: NEON llego con armv7, y los ARM11 a los que apunta armv6 no lo tienen. El `Info.plist` fija el toolchain exacto: GCC 4.2 (no clang), Xcode 4.0, SDK 4.3, compilado en Snow Leopard.

**La otra slice del binario decompila limpia donde la nuestra no.** El binario fat trae armv6 y armv7; el proyecto siempre uso armv7, que es donde el compilador de EA emitio NEON empaquetado de 2 carriles para matematica escalar — el patron que hace que Ghidra pierda el calculo en silencio. ARMv6 no tiene NEON, asi que su slice es una compilacion independiente del mismo codigo en VFP escalar. Ahi `_Len` son nueve instrucciones obvias que calculan `sqrtf(x*x+y*y+z*z)`. **107 funciones estan afectadas en armv7 y no en armv6**, y mas de la mitad estan en `FrontEnd.cpp` y `GameCode.cpp`, no en el motor: el famoso "27% de `lime/common`" exageraba el motor (mide 23%) y ademas miraba donde no era. `tools/slices.py`.

**El motor de audio nunca fue de EA.** `lime/iphone/Finch/` es una copia vendorizada de [zoul/Finch](https://github.com/zoul/Finch), un motor de sonido OpenAL con licencia MIT — las siete clases estan presentes con sus nombres previos al refactor. Son **56 de las 229 funciones de la capa de plataforma, un 24%, que no hay que decompilar**. La leccion general sale mas barata que el hallazgo: antes de decompilar cualquier modulo de plataforma, comprobar si el nombre de clase pertenece a una libreria de terceros conocida de la epoca. `GBMusicTrack.m` se comprobo igual y **no** se pudo confirmar, asi que sigue en la lista.

**Todos los formatos de assets necesarios para dibujar un personaje animado están resueltos.** `.meshset` (geometría), `.skin` (pesos de skinning), `.bones` (esqueleto), `.skinanim` (animación) y `.events` (pistas de efectos) se leen correctamente contra los datos publicados. `.scene` es el último que queda, aunque `LIME_LoadScene` ya ha soltado su mapa de campos y la regla que ata los ficheros entre sí: **una escena es una familia de hermanos derivada sustituyendo los últimos seis caracteres del nombre**, sin índice ni manifiesto en ninguna parte. Ver [MESHSET-FORMAT.md](docs/MESHSET-FORMAT.md), [SKIN-FORMAT.md](docs/SKIN-FORMAT.md) y [EVENTS-FORMAT.md](docs/EVENTS-FORMAT.md).

**Aterrizar en el último byte de un archivo puede no demostrar nada.** Si todos los registros miden lo mismo, *cualquier* división de ese tamaño recorre el archivo a la perfección: 324 bytes se leen igual de bien como 268+56 que como 324+0. A `.events` se le audito exactamente esa circularidad, porque `numEntries` parecia constante a 1. Sobre el corpus completo de 1.547 pistas toma diez valores distintos y 103 pistas no valen 1, asi que el recorrido si era evidencia real. Una constante deja el recorrido sin valor; y una constante vista sobre parte de los datos puede no ser constante. Importan las dos mitades, y la estructura ahora se deriva de la aritmetica de punteros del propio loader, para no depender del recorrido en ningun caso.

**El juego imprime sus propias tablas de inputs.** La lista de movimientos reimprime cada frame la secuencia de entradas del movimiento mostrado, un entero por linea. El periodo de la repeticion es el numero de inputs del movimiento. Eso hace recuperables las tablas de movimientos —el dato del motor de combate que peor lleva el analisis estatico— con solo recorrer la lista con un log abierto, sin decompilar nada. [Issue #5](https://github.com/MaryNCRT/Ultimate-Mortal-Kombat-3-iOS-Recomp/issues/5).

**El formato de modelos `.meshset` está resuelto y verificado.** No adivinando, sino ejecutando el propio `LIME_LoadMeshSet` de EA, recompilado, contra los datos reales del juego y comparando lo que deja en memoria con nuestra especificación: **590 archivos, 7.326 mallas, 2,9 M de vértices, coincidencia byte a byte** en índices, vértices y volúmenes envolventes. Una sola discrepancia, en un buffer de iluminación. Ver [docs/MESHSET-FORMAT.md](docs/MESHSET-FORMAT.md).

**La versión 1.2.59 ya corre en touchHLE, con un parche de 2 bytes.** La base de datos de compatibilidad solo listaba la 1.0.4; hasta donde sabemos, nadie tenía funcionando la versión final. La causa resultó ser un fallo en dos partes: touchHLE reporta los idiomas preferidos como códigos cortos (`["es","en"]`), la tabla de locales de EA solo reconoce los largos, `getLocaleIndex` devuelve −1 y salta un `assert(false)` — que mata el emulador en el acto, porque **touchHLE no implementa `___assert_rtn`**. Basta con parchear `LocaleManager::setLocale` para que retorne de inmediato. Análisis completo: [docs/TOUCHHLE-PATCH.md](docs/TOUCHHLE-PATCH.md).

Ese parche importa más allá de la comodidad: una copia del juego en ejecución es una **referencia de comportamiento** para la decompilación, y es la única que va a servir para la lógica de combate, donde la recompilación estática choca con tablas de punteros a función.

**El SDK de EA no hace falta neutralizarlo.** La suposición de partida era que habría que desactivar ~1.412 funciones de comercio y analítica. En la práctica, exactamente una función bloqueaba el arranque. `Mayhem`, `EASDK_Handler` e incluso el sistema de logros se inicializaron sin problema. La regla operativa que salió de ahí, y que ahora gobierna todo el port: **ningún stub debe llamar nunca a `assert()`** — el código de EA comprueba invariantes que un port no puede cumplir.

---

## Estructura del repositorio

```
tools/
  armrecomp/recomp.py    recompilador estático ARM/Thumb → C (el oráculo de verificación)
  patch_ipa.py           aplica parches al binario y reempaqueta un .ipa
  decomp_driver.py       ordena funciones por dificultad, dirige Ghidra, verifica
  macho.py               parser Mach-O: slices, símbolos, secciones, resolución de stubs
  stabs.py               reconstruye el árbol de fuentes original desde la tabla STABS
  disasm.py              desensambla una función concreta por nombre
  archstats.py           proporción ARM/Thumb e inventario de mnemónicos
  rank.py                puntúa funciones por dificultad
  meshset.py             lector de .meshset (las tres variantes)
  umk3paths.py           resolución de rutas compartida por todas las herramientas
  xref.py                localiza llamadas a un símbolo importado; recupera argumentos de assert()
  ghidra/                scripts de decompilación headless
  signatures/            firmas de funciones y layouts de structs que se le dan a Ghidra

decomp/lime/             C verificado y escrito a mano — el producto de verdad
runtime/                 runtime de CPU/memoria contra el que corre el código recompilado
tests/                   arneses de pruebas diferenciales
docs/                    especificaciones de formatos, metodología, progreso
```

Todo lo derivado del binario comercial —C recompilado, salida cruda de Ghidra, volcados de símbolos— se genera en local y queda excluido por el `.gitignore`.

---

## Primeros pasos

Si nunca has trabajado en algo así, lee **[docs/GETTING-STARTED.md](docs/GETTING-STARTED.md)**. No da por supuesto ningún conocimiento previo de ingeniería inversa y explica para qué sirve cada pieza, por qué existe y qué harías tú primero.

La versión corta, para impacientes:

```bash
# 1. Requisitos: Python 3.10+, un compilador de C (MinGW-w64 o gcc), Ghidra 11+, JDK 21+
pip install capstone

# 2. Extrae la slice armv7 de TU PROPIA copia del juego.
#    Un .ipa es un ZIP; el ejecutable está en Payload/UMK3.app/UMK3
python tools/macho.py thin ruta/a/UMK3 armv7 work/UMK3.armv7

# 3. Vuelca los símbolos y reconstruye el árbol de fuentes original de EA
python tools/macho.py syms  work/UMK3.armv7 work/symbols.txt
python tools/macho.py funcs work/UMK3.armv7 work/functions.txt
python tools/stabs.py work/UMK3.armv7 work

# 4. Mira qué funciones de un módulo son las más fáciles de atacar primero
python tools/rank.py work/UMK3.armv7 Matrix.cpp

# 5. Genera la implementación de referencia — el oráculo — de ese módulo
python tools/armrecomp/recomp.py work/UMK3.armv7 \
    --file Matrix.cpp --out recompiled --name matrix --with-deps

# 6. Compila y ejecuta su test diferencial
gcc -std=c11 -O1 -I runtime -I recompiled \
    tests/test_matrix_diff.c decomp/lime/Matrix.c recompiled/matrix.c runtime/arm_runtime.c \
    -o build/test_matrix_diff -lm
./build/test_matrix_diff
```

Todo lo derivado del binario acaba en `work/`, que está ignorado por git. Usa `UMK3_WORK` para ponerlo en otro sitio, y `GHIDRA_HOME` antes de usar `tools/decomp_driver.py`. Todas las rutas las resuelve `tools/umk3paths.py`.

---

## Contribuir

Las contribuciones son bienvenidas, y el proyecto está estructurado para que se pueda trabajar en paralelo sin pisarse: cada módulo es independiente y el criterio de aceptación es objetivo.

**Una regla importa más que las demás: una función no está terminada hasta que su test diferencial pasa con cero divergencias.** Código legible que se comporta *casi* como el original es peor que no tener código, porque falla en silencio y mucho más tarde.

Mira [CONTRIBUTING.md](CONTRIBUTING.md) para saber cómo coger un módulo, y [docs/PROGRESS.md](docs/PROGRESS.md) para ver qué está libre.

---

## Declaración sobre el uso de IA

**Buena parte de este proyecto se produjo con asistencia de IA** — en concreto Claude, de Anthropic, a través de Claude Code. Eso incluye el análisis, las herramientas, el trabajo de decompilación, la documentación y este mismo README.

Lo decimos claramente porque la comunidad de ingeniería inversa tiene opiniones dispares y firmes sobre la decompilación asistida por IA, y porque tienes derecho a saber cómo llegó a existir el código que estás leyendo. Los detalles —qué generó la IA, qué dirigió una persona y cómo se estableció la corrección al margen de eso— están en [AI-DISCLOSURE.md](AI-DISCLOSURE.md).

La versión corta: toda afirmación de este repositorio que se pudiera verificar, se verificó mecánicamente contra el comportamiento real del binario original. Los tests diferenciales existen precisamente porque ni un decompilador ni un modelo de lenguaje merecen que se les crea sin más.

---

## Créditos

**El juego lo hicieron otras personas, y ninguna somos nosotros.**

*Ultimate Mortal Kombat 3* lo creó **Midway Games** en 1995, con diseño de Ed Boon y John Tobias. La conversión para iPhone de 2011 que estudia este proyecto la construyó **EA Mobile**, sobre un motor 3D propio que su código llama **LIME**. Los ingenieros que lo escribieron dejaron su rastro en el trabajo sin querer: la tabla de depuración que publicaron es lo que hace posible este proyecto. A quien se olvidó de hacer strip a ese binario: gracias.

Este repositorio no contiene nada de su código. Contiene nuestra descripción de lo que hace su código, y nuestra propia reimplementación.

**Este proyecto** lo mantiene [MaryNCRT](https://github.com/MaryNCRT), que marca la dirección, toma las decisiones de alcance y aporta la copia obtenida legalmente del juego contra la que corre todo el análisis.

Las herramientas, el análisis, la decompilación y la documentación se produjeron con **Claude, de Anthropic**, vía Claude Code, bajo esa dirección. Los commits llevan el trailer `Co-Authored-By:` donde corresponde. Ver [AI-DISCLOSURE.md](AI-DISCLOSURE.md) para el relato completo de lo que eso significa y de cómo se estableció la corrección de forma independiente.

### El banner

El logotipo de *Ultimate Mortal Kombat 3* lo **rehízo en UHD [u/JuananoLaGarza](https://www.reddit.com/user/JuananoLaGarza/)** y lo publicó en r/MortalKombat como *[Ultimate Mortal Kombat 3 logo redone in UHD](https://www.reddit.com/r/MortalKombat/comments/mvm4uo/ultimate_mortal_kombat_3_logo_redone_in_uhd/)*. Se usa aquí con crédito. Si eres el autor y prefieres que este proyecto no lo use, abre un issue y se retira.

La figura de Sub-Zero y el escenario del fondo son **renders de [ermaccer](https://github.com/ermaccer)**, sacados de *[UMK3 iOS MeshSet Tool](https://ermaccer.github.io/posts/umk3iosmeshsettool/)* (los archivos `csubzero.png` y `m_balcony.jpg`), usados bajo **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)**, que es la licencia de ese post. Son salida de su propio conversor, que además es la herramienta contra la que se contrastó en su día nuestro parser de `.meshset`: el banner está hecho, literalmente, de aquello que este proyecto estudia.

La palabra "RECOMP", la insignia de iOS y la composición son de [MaryNCRT](https://github.com/MaryNCRT).

**Sí, parece el banner de una aplicacion pirata del 2011, es la idea.**

Está hecho rápido y a propósito en el lenguaje visual de aquello de lo que trata: un port móvil de la época en que el arte promocional de cada juego era un personaje plantado delante de un escenario, el logo encima y la insignia de la plataforma en una esquina. Algo más pulido habría parecido de otro juego. Esto parece de **este** — una conversión para iPhone de 2011 de un arcade de 1995, que es exactamente lo que se está desmontando aquí.

Es provisional y a nadie le duele cambiarlo. Pero un proyecto sin cara ninguna es más difícil de querer que uno con una cara un poco tonta, y este va a durar un año o más. La identidad no es el trabajo, pero ayuda a que el trabajo se termine.

Si algún día se sustituye, lo suyo sería una marca que no se apoye en absoluto en la registrada: cuanto más visible se haga el proyecto, mejor le vendrá.

---

## Trabajo previo y agradecimientos

Este proyecto se apoya en el trabajo de otras personas:

- **[touchHLE](https://github.com/touchHLE/touchHLE)** — emulador de alto nivel para aplicaciones de iPhone OS. Usado como referencia de comportamiento, y objetivo de nuestro parche de compatibilidad.
- **[N64Recomp](https://github.com/N64Recomp/N64Recomp)** y **[Zelda64Recomp](https://github.com/Zelda64Recomp/Zelda64Recomp)** — el enfoque de recompilación estática en el que se inspira `recomp.py`.
- **[BattleShip](https://github.com/JRickey/BattleShip)** — un port a PC de Super Smash Bros. 64 cuya estructura de repositorio y modelo legal sigue este proyecto.
- **[ermaccer](https://github.com/ermaccer)** — [UMK3IOS.MeshSetTool](https://github.com/ermaccer/UMK3IOS.MeshSetTool), la primera herramienta pública para el formato de mallas de este juego y la referencia contra la que se contrastó nuestro parser. Los renders del banner de esta página también son suyos, sacados de [su artículo](https://ermaccer.github.io/posts/umk3iosmeshsettool/), usados bajo [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- **[Ghidra](https://ghidra-sre.org/)**, **[Capstone](https://www.capstone-engine.org/)** y **[GhidraMCP](https://github.com/13bm/GhidraMCP)**.

---

## Legal

*Ultimate Mortal Kombat 3* y todos sus contenidos son propiedad de sus respectivos titulares de derechos. Este proyecto no está afiliado, respaldado ni conectado con Electronic Arts, Warner Bros. Interactive Entertainment, NetherRealm Studios ni Midway Games.

El trabajo que hay aquí es ingeniería inversa realizada con fines de **interoperabilidad y preservación**: conseguir que un software que ya no funciona en ninguna plataforma actual vuelva a funcionar, en hardware que sus dueños ya tienen. No se redistribuye ningún código ni dato del juego. Todas las herramientas operan sobre una copia que el usuario ya posee.

El código propio del proyecto se publica bajo la [Licencia MIT](LICENSE).
