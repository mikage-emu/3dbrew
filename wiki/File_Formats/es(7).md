La consola 3DS utiliza varios tipos de archivos, la siguiente es una
lista de los formatos conocidos.

## [NCCH](NCCH "wikilink")

.[CXI](NCCH#CXI "wikilink") - Imagen ejectubale CTR - Hay dos posibles
variaciones de este formato.

`1. Datos empaquetados con formato CCI/CSU. Son ejecutados desde un cartucho.`

`2. Datos empaquetados con formato CIA. Son instalados en la memoria SDMC o en la NAND.`

.[CFA](NCCH#CFA "wikilink") - Archivo de datos CTR - Rom-FS creado para
ser utilizado de forma externa. Esta es una versión no ejecutable del
formato de contenedor NCCH. Este formato se utiliza generalmente junto
con una versión ejecutable del formato de contenedor NCCH (CXI).

.[APP](SD_Filesystem#title "wikilink") - El archivo NCCH, pero en su
forma encriptada. La clave con la que fué encriptado este archivo
depende de cada consola, en principio habría una llave de encriptado por
cada consola. Este formato se utiliza en juegos/aplicaciones ya
instaladas, como por ejemplo las descargas de la tienda en linea (eShop)
y del CDN.

## [NCSD](NCSD "wikilink")

.[CCI](NCSD "wikilink") - Imagen de cartucho CTR - Quemada/Copiada en
una memoria ROM (o cargada por dispositivos (hardware) oficiales
dedicados a la depuración). Este formato es también el formato actual de
la copias(dumps) de la ROM, y el formato de la respuesta a las
peticiones de lectura entre la consola 3DS y un cartucho. El formato se
puede describir como un simple contenedor NCCH con un número máximo de
ocho (8) HCCH.

.[CSU](NCSD "wikilink") - Actualización de sistema CTR - Este formato
cambia un poco dependiendo de las diferentes revisiones

## Formato de archivo de descriptor

.BSF - Datos de descripción que se utilizan cuando se muestran a la
salida los archivos ICN/BNR. El formato .XBSF utilizado por CiTRUS está
basado en el concepto del formato .BSF.

.RSF - Datos de descripción utilizados cuando se muestra a la salida un
archivo CCI/CXI. Este formato especifica opciones como: El título, el
tipo de datos guardados y otros parecidos.

.DESC - Datos de descripción utilizados cuando se muestra a la salida un
archivo con formato CCI/CXI file. Es una versión compleja del formato
.RSF format, porque puede especificar opciones más complejas. La pareja
de llaves firmadas NCCH RSA-2048 está almacenada en este archivo y es
tomada de aquí.

## [ExeFS](ExeFS "wikilink") Formatos de archivos relacionados

.AXF - Código ARM previamente ensamblado. Se utiliza antes de ser ligado
al formato '.code' de [ExeFS](ExeFS "wikilink") . Practicamente son
archivos con formato ELF diseñados especificamente para la arquietectura
ARM. La región plana que se encuentra en el formato CXI se obtiene de
este archivo.

.BNR - Esta formato por un .[CBMD](CBMD "wikilink") y un
.[BCWAV](BCWAV "wikilink"), en este mismo orden. Se agregan datos de
relleno (padding) para asegurar que el .[BCWAV](BCWAV "wikilink") esté
alineado a 0x10 bytes. No contiene otra cosa.

.[ICN](SMDH "wikilink") - Contiene íconos, nombres y banderas para la
aplicación.

## [Formatos de archivos relacionados con la instalación de un título](Estructura_de_datos_para_el_Título "wikilink")

.[CIA](CIA "wikilink") - Archivo que se puede importar CTR - Este
formato permite la instalación en la consola 3DS. Los archivos con
formato CIA pueden contener archivos [NCCH](NCCH "wikilink") para la
instalación de [SDMC](Sistema_de_archivos_SD "wikilink") o NAND CTR. Los
archivos con formato CIA también pueden contener archivos .SRL (formato
para las imágenes ejecutables de la consola DS(i) ) para la instalación
en la NAND TWL de la consola 3DS.

.[TMD](TMD "wikilink") - Datos de los datos (metadatos) del título - El
formato se utiliza con juegos/aplicaciones instaladas o instalables. Se
destaca su presencia en archivos .[CIA](CIA "wikilink") (sin cifrar), en
el [tarjeta SD card](sistema_de_archivos_SD "wikilink") (encriptado), en
la memoria NAND (encriptado) y en el CDN de Nintendo (sin cifrar).

.[CTX](Estructura_de_dato_del_título "wikilink") - Cuando se inician las
descargas de aplicaciones en la tienda en línea (eShop) se crea este
archivo. Después, este archivo se rellena con datos reales. Cuando la
descarga se completa, este archivo se borra de la tarjeta SD (Es posible
que se mueva su ubicación a la memoria NAND). Este archivo está cifrado
con la llave de la consola. El formato contiene un certificado firmado
seguido de datos cuyo significado es desconocido.El formato tiene un
tamaño de 1.50 Kbyte. Aquí se puede encontrar un ejemplo
.[1](http://dl.dropbox.com/u/37418652/00000000.ctx)

## Formatos de archivos de Audio

.[(B)CWAV](BCWAV "wikilink") - Formato de archivo con forma de onda CTR

.CSAR - Es una adaptación CTR del formato BRSAR.

## Formato de archivos de gráficos

.[CBMD](CBMD "wikilink") - Datos de modelo básico CTR - Formato de
archivo antes de utilizarse en un *banner* CTR para juegos y otras
aplicaciones.

.CTPK - Paquete de texturas CTR

.CMDL - Datos de modelo CTR

.CTEX - Datos de textura CTR

.CSKA / .CSKLA - Datos de animación por esqueletos CTR

.CMATA - Datos de material de animación CTR

.CMDLA - Datos de animación del modelo CTR

.CLGT - Datos de ilunimación CTR

.CPTL - Datos de partículas CTR

.CLTS - Datos que se guardan en una tabla de búsqueda ""lookuptable" CTR

.CENV - Datos del entorno CTR.

.CCAM - Datos de la cámara CTR

.CMAT - Datos de materiales CTR

## Otros formatos de archivos

.CDI - Imagen de desarrollo CTR - Los archivos CDI son procesos del
sistema que otros tipos de aplicaciones utilizan y dependen de ellos.
para el acceso a otras funciones de bajo nivel. Los archivos CDI
normalmente son los mismos títulos que se muestran en la lista de
dependencia del encabezado CXI. sólo que están compilados en un formato
diferente. La diferencia es que el formato CDI se utilliza en un entorno
diferente, en un entorno de desarrollo. Estos archivos son cargados en
la memoria del dispositivo de depuración junto con los dos núcleos para
poder ejecutarlos.

.NSA - Archivo utilizado por muchos protocolos de comunicación de la
consola 3DS.

.CIP - (Proceso inicial CTR)

.[CRO](CRO0 "wikilink") - Es una librería de enlace dinámico "DLL" para
CTR.

.[CRS](CRO0 "wikilink") - Contiene símbolos para las "DLL" CRO.

.[CRR](CRR0 "wikilink") - Contiene datos para verificar los archivos
CRO.

.[MPO](MPO "wikilink") - Formato de objetos compuestos por varias
imágenes - El documento que describe el formato MPO está en el siguiente
enlace: <http://www.cipa.jp/english/hyoujunka/kikaku/pdf/DC-007_E.pdf>.
El documento es un estándar DC-007 de la Asociación de Productos para
Cámaras e Imágenes (CIPA por sus siglas en inglés), creado para
almacenar varias imágenes en un mismo archivo.

.CGRP - Grupo CTR - Utilizado para empaquetar formato como (CWAR, CWAV,
CWSD, CBNK, CSEQ, etc...) de forma muy parecida al formato MRG de la
consola Wii. (No tienen la misma estructura, pero ambos empaquetan
varios tipos de archivos)

## Sistema de Archivos

El sistema de archivos de la consola 3DS necesita rutas absolutas. Puede
manejar nombres de archivos largos y cortos, es decir en formato de 8.3
(ocho caracteres para el nombre y tres caracters para la extensión) y en
formato de 255 caracteres como máximo.

## Cifrado AES modo Contador (CTR AES)

AES es un esquema de cifrado basado en bloques que utliza la NIST
("National Institute of Standards and Technology"). Se puede utilizar de
cinco modos diferentes, uno de ellos es el modo Contador ("Counter") o
CTR. AES-CTR genera un valor único por cada paquete de datos. Este valor
lo tiene que genera el que cifra y se lo tiene que comunicar al que
decifra. Este valor es llamado en otros contextos el vector de
inicialización o IV por sus siglas en ingles. El que cifra necesita
asegurar que este valor IV sea único.

AES-CTR utiliza el cifrado de bloques AES para crear un cifrado de
flujo. Esto se logra aplicando la operación XOR entre los datos y el
flujo de llaves que genera AES. AES-CTR se puede paralelizar y permite
calcular previamente el flujo de llaves.

En el documento RFC 3686 se comentá que el AES-CTR es inapropiado cuando
la llave es estática, y también que se debe de utilizar junto con una
función de autentificación, como SHA.

Para cifrar, AES-CTR divide los datos en bloques de 128 bits (o 16
octetos ). A cada bloque se le asocia una llave de 128 bits que se
produce del flujo de llaves, y luego se aplica la función XOR entre el
bloque de datos y la llave del flujo.

El algoritmo se puede resumir así:

`bloque_CTR = Valor NONCE (32 bits) || Valor IV (64 bits) || puros unos (32 bits)`
`Para  i = 1 hasta n - 1, en incrementos de uno en uno.`
`Realizar`
`       datos_cifrados[i] = datos[i] XOR AES(bloque_CTR)`
`       bloque_CTR = bloque_CTR + 1`
`Fin`
`datos_cifrados[n] = datos[n] XOR truncar(AES(bloque_CTR))`