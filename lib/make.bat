setlocal

cd /d %~dp0

gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_basic.c -o ccv_basic.o 
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_algebra.c -o ccv_algebra.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_daisy.c -o ccv_daisy.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_memory.c -o ccv_memory.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_cache.c -o ccv_cache.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_util.c -o ccv_util.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_numeric.c -o ccv_numeric.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_io.c -o ccv_io.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c ccv_sift.c -o ccv_sift.o
gcc -fms-extensions -O3 -msse2 -Wall -std=c99 -c 3rdparty/sha1.c -o 3rdparty/sha1.o
gcc -shared -o ccv.dll ccv_memory.o 3rdparty/sha1.o ccv_io.o ccv_cache.o ccv_numeric.o ccv_algebra.o ccv_util.o ccv_basic.o ccv_daisy.o ccv_sift.o -lws2_32 -Wl,--output-def,ccv.def,--out-implib,libccv.a
ar rcs libccv.a ccv_memory.o 3rdparty/sha1.o ccv_io.o ccv_cache.o ccv_numeric.o ccv_algebra.o ccv_util.o ccv_basic.o ccv_daisy.o ccv_sift.o -lws2_32 -Wl,--output-def,ccv.def,--out-implib,libccv.a
copy /y ccv.dll ..\bin