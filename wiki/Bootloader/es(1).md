Cuando la 3DS no encuentra el chip de la NAND, se muestra el siguiente
error:

<figure>
<img src="CTR_Bootrom_Error.jpg" title="CTR_Bootrom_Error.jpg"
width="500" />
<figcaption>CTR_Bootrom_Error.jpg</figcaption>
</figure>

El procedimiento del 3DS 'Boot:

- 0 Segundos unidad está encendida bootrom comienza la ejecución

<!-- -->

- 2 Segundos - bootROM intenta inicializar la NAND. Si el NAND está
  inicializado correctamente, el bootROM de arranque pone en marcha el
  firmware cargado desde la division NAND FIRM que maneja el arranque
  del resto del sistema. El núcleo ARM11 cargado de la firma carga
  entonces los módulos CXI ARM11 de sistemas integrados en el kernel. Si
  la NAND no se puede inicializar (es decir, el chip NAND no está
  conectado / dañado ) aparece una pantalla azul de error similar a la
  pantalla anterior.

<!-- -->

- 3 Segundos - Todo el hardware esencial está activo. El módulo PM lanza
  NS, NS inicia el menú activo. Para los unidades comerciales este menú
  suele ser el menú Home.

<!-- -->

- 4 Segundos - las pantallas LCD se inicializa

<!-- -->

- 7 Segundos - Menú Inicio está completamente inicializado / cargado