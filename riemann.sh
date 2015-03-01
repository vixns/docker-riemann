#!/bin/sh
exec ${JAVA_HOME}/bin/java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled \
-XX:+AggressiveOpts -XX:+UseFastAccessorMethods -XX:+UseCompressedOops -XX:+CMSClassUnloadingEnabled \
-cp "/usr/share/riemann/riemann.jar" riemann.bin start /etc/riemann/riemann.config