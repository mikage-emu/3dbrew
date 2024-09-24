## Comment convertir une vidéo 3D pour la 3DS

<code> ffmpeg -y -i "video.mp4" -s 960x240 -aspect 2:1 -r 20 -vcodec
mjpeg -qscale 1 -vf crop=480:240:0:0 -acodec libmp3lame -ar 41000 -ab
96k -ac 2 "left.avi" ffmpeg -y -i "video.mp4" -s 960x240 -aspect 2:1 -r
20 -vcodec mjpeg -qscale 1 -vf crop=480:240:480:0 -an "right.avi"

ffmpeg -y -i "left.avi" -i "right.avi" -vcodec copy -acodec
adpcm_ima_wav -ac 2 -vcodec copy -map 0:0 -map 0:1 -map 1:0
"VID_0001.AVI" </code>

Les deux premières lignes génèrent les vidéos de droite et de gauche, la
dernière les assemble et crée la vidéo 3D.

Mettez le fichier dans DCIM\xxxNINxx

------------------------------------------------------------------------

Voir aussi [3DSExplorer](3DSExplorer/FR "wikilink") pour une conversion
simplifiée.