# Encargo remoto — terminar mkreact.c (y qué NO tocar)

**CERRADO — mkreact.c llegó a 207/207 el 2026-09-18 y las 6 fallas que
quedaban contra `landfn.sh` también se resolvieron ese día** (4 eran un bug
del verificador en `tools/facts_c.py`, una — `t_background_death` — es una
excepción documentada por tabla `tbb`, y `gup2` tenía un bug real ya
corregido). `playback.c` también está 4/4. Ver `docs/PROGRESS.md`. Todo lo
de abajo es el encargo tal como se escribió, dejado como registro histórico.

Para pasarle a otra persona/instancia de Claude que trabaje en paralelo sin
pisarse con lo que ya está en marcha aquí. Escrito el 2026-09-17.

## El estado ahora mismo

```
mkreact.c   101/207   (49%)
gamecode/logic total   1637/2172  (75.4%)
```

Yo (esta sesión) sigo activamente en `mkreact.c`, trabajando **en orden
alfabético desde el principio del archivo**. Para no duplicar trabajo, este
encargo cubre la **segunda mitad** de lo que falta en `mkreact.c`, más los
archivos que siguen enteros pendientes en el directorio.

**No toques la primera mitad de la lista de abajo — la estoy trabajando yo en
este momento.** Si dos personas escriben la misma función a la vez, una de
las dos pierde el tiempo.

## Reglas que no son negociables

1. **El binario es la fuente de verdad, no lo que "parece razonable".** Cada
   función se lee del desensamblado real, instrucción por instrucción. No se
   adivina.
2. **Verificar antes de dar por hecho.** Este repo tiene un verificador
   automático (`tools/factdiff.py` + `tools/facts_asm.py` + `tools/facts_c.py`)
   que compara la C escrita contra una recompilación literal del binario y
   señala cualquier diferencia en valores, llamadas, ramas o manejadores. **No
   se cuenta una función como terminada hasta que pase por él.** Ver más abajo
   cómo correrlo.
3. **No tocar `EXTRACTED\` ni `IPA\`** — son las fuentes originales.
4. **No usar el código fuente filtrado de UMK3** si en algún momento se
   ofrece — ha sido rechazado en este proyecto y se sigue rechazando.
5. **Estilo de casa**: mirar cualquier función ya escrita en `mkreact.c` para
   el patrón — banner con la dirección armv7, el tamaño, la transcripción en
   pseudo-C, y luego prosa explicando **qué significa** (no solo qué hace).
6. Cuando un campo de `MK3OBJ` / `MK3OBJPROC` / `MK3THREAD` no tiene nombre
   todavía en `mk3logic.h`, comprobar primero si el offset ya está ocupado por
   otro campo antes de inventar uno nuevo — varias veces ya nos ha pasado que
   un offset "libre" en realidad ya tenía nombre y solo faltaba mirar.

## Cómo verificar una función (el paso obligatorio)

```bash
# 1. recompilar el archivo entero una vez (tarda ~1-2 min)
cd TOOLS/armrecomp
python recomp.py "<ruta al binario>/UMK3.armv7" --file mkreact.c --out /tmp/rc_mkreact.c

# 2. por cada función terminada
cd ../../umk3repo
sh tools/landfn.sh mkreact <nombre_funcion_1> <nombre_funcion_2> ...
```

`landfn.sh` compila el archivo y luego compara cada función nombrada contra
su propio desensamblado. Si dice `FALLA`, la función **no está lista**, aunque
compile sin errores — compilar solo prueba que el C es C válido, no que sea
el mismo C que el binario ejecuta.

Leer `docs/VERIFICATION.md` y las cabeceras de `tools/factdiff.py`,
`tools/facts_asm.py` y `tools/facts_c.py` antes de dudar de un resultado del
verificador: ya se ha dado el caso de que el verificador tenía el fallo, no
el código, y ahí están documentados los que ya se encontraron.

## Lo que YO estoy trabajando ahora — no tocar

Primera mitad alfabética de lo pendiente en `mkreact.c` (56 funciones, lista
exacta al momento de escribir esto — se va reduciendo según avanzo):

```
t_avoid_corner_trap_b   t_b_boss_hit1          t_b_combo
t_b_combo_hard          t_b_duck_hit_hard      t_b_duck_hit_soft
t_b_lo_punch            t_b_punch              t_b_uppercut
t_back_to_the_fight     t_blast_through_anything  t_block_shake
t_brp1                  t_ccp3                 t_check_stay_down
t_combo1                t_combo43              t_death_slam_pause
t_dizzy_by_boss         t_drone_flipk_getup    t_fall_down_pit
t_fall_in_lava          t_fall_on_trax         t_ken_masters_xfer
t_land_on_my_back       t_onback3              t_pit_fall_scan
t_r_airpunch            t_r_axe_up             t_r_boomerang
t_r_combo0              t_r_combo1             t_r_combo1_stab
t_r_combo2              t_r_combo2_stab        t_r_combo3
t_r_combo5              t_r_combo6             t_r_combo_klang
t_r_duck_airpunch       t_r_duck_kickh         t_r_duck_kickl
t_r_duck_punch          t_r_ermac_fatal_slam   t_r_ermac_slam
t_r_fan                 t_r_fan_lift           t_r_flip_kick
t_r_flip_punch          t_r_floor_ice          t_r_freeze
t_r_hat                 t_r_hi_kick            t_r_hi_punch
t_r_ind_charge          t_r_jade_prop
```

## Lo que SÍ está libre — tu lote

**Segunda mitad de `mkreact.c`** (50 funciones aprox., de la M/N en adelante
alfabéticamente) — correr este comando para obtener la lista EXACTA en el
momento de empezar, porque yo sigo consumiendo la primera mitad y la línea de
corte se mueve:

```bash
cd tools
python - <<'PYEOF'
import sys
sys.path.insert(0, '.')
import dumpfn
rows = dumpfn.table()
by = {}
for i, (a, s, p) in enumerate(rows):
    end = rows[i + 1][0] if i + 1 < len(rows) else a + 64
    by.setdefault(dumpfn.plain(s), (a, end, p))
done = dumpfn.written()
SEP = chr(92)
pend = sorted(
    n for n, (a, e, p) in by.items()
    if p.replace(SEP, '/').endswith('mkreact.c') and n not in done
)
mid = len(pend) // 2
print("SEGUNDA MITAD (tu lote):")
for n in pend[mid:]:
    print(" ", n)
PYEOF
```

Esto siempre da la mitad que NO estoy tocando yo en este instante, porque
recalcula sobre lo que de verdad queda sin escribir.

## Archivos hermanos, completamente libres (nadie los está tocando)

Si prefieres trabajar en un archivo entero sin coordinarte con nadie más,
estos están **100% sin empezar o casi sin empezar** y nadie de este lado los
está tocando:

| archivo | hechas | total | notas |
|---|---|---|---|
| `mkbonus.c` | 0 | 8 | pequeño, buen primer archivo |
| `mkfriend.c` | 0 | 45 | sin empezar |
| `mkboss.c` | 29 | 104 | 75 pendientes |
| `mkdrone.c` | 156 | 394 | 238 pendientes — el más grande, es la IA |
| `mkzap.c` | 112 | 174 | 62 pendientes — proyectiles |
| `playback.c` | 3 | 4 | falta solo 1 función |

Todos son parte de `decomp/gamecode/logic/`. `mkfriend.c` y `mkboss.c` no son
Scorpion (son otros personajes/jefes), así que si el foco sigue siendo
Scorpion, `mkzap.c` (sus proyectiles) o `mkbonus.c` (pequeño y rápido) son
mejor uso del tiempo que `mkboss.c`.

**No tocar**: `joy.c`, `mk3.c`, `mkanimal.c`, `mkcanned.c`, `mkcombo.c`,
`mkfatal.c`, `mkprop.c`, `mkrepell.c`, `mkslam.c`, `mkstat.c`, `moves.c`,
`other.c`, `a_fn.c`, `a_robo.c` — todos están al 100%.

## Herramientas útiles que ya existen (no reinventar)

- `tools/aniparts.py` — vuelca cualquier stream de animación con sus partes,
  nombres de frame y saltos resueltos.
- `tools/anicheck.py` — compara las tablas de animación del port de Godot
  contra el binario.
- `tools/dumpfn.py` — la tabla de funciones (dirección, tamaño, archivo,
  escrita/pendiente).
- `tools/pushfn.py`, `leaffn.py`, `microfn.py`, `parkfn.py` — generadores
  automáticos para formas conocidas. En `mkreact.c` solo aciertan 1 de 135
  pendientes (el archivo se ramifica mucho), así que no esperar mucho de
  ellos aquí, pero merece la pena probarlos primero en archivos como
  `mkbonus.c` o `mkzap.c` por si acaso.

## Cuándo avisar en vez de seguir solo

- Si el verificador dice `FALLA` y tras releer el desensamblado sigue sin
  cuadrar (no un error de transcripción, sino algo que no se entiende).
- Si aparece un campo en `MK3OBJ`/`MK3OBJPROC` que contradice lo que ya dice
  `mk3logic.h` para ese mismo offset — mejor preguntar que forzar un cambio
  que rompa otras 100 funciones que ya lo usan.
- Si se encuentra una tabla de saltos (`tbb`) — el verificador tiene un hueco
  conocido ahí (ver `tools/factdiff.py`, sección "Known gaps", punto 5) y hay
  que resolverla a mano y dejarlo dicho en el banner de la función.
