--- src/Makefile.orig	2017-08-06 10:42:53.992510000 -0400
+++ src/Makefile	2017-08-06 10:44:57.344366000 -0400
@@ -16,7 +16,7 @@
 uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
 uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
 OPTIMIZATION?=-O2
-DEPENDENCY_TARGETS=hiredis linenoise lua
+DEPENDENCY_TARGETS=hiredis linenoise
 NODEPS:=clean distclean
 
 # Default settings
@@ -63,8 +63,8 @@
 # Override default settings if possible
 -include .make-settings
 
-FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
-FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
+FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS)
+FINAL_LDFLAGS=$(LDFLAGS) $(DEBUG)
 FINAL_LIBS=-lm
 
 ifeq ($(uname_S),SunOS)
@@ -112,7 +112,7 @@
 endif
 endif
 # Include paths to dependencies
-FINAL_CFLAGS+= -I../deps/hiredis -I../deps/linenoise -I../deps/lua/src
+FINAL_CFLAGS+= -I../deps/hiredis -I../deps/linenoise
 
 ifeq ($(MALLOC),tcmalloc)
 	FINAL_CFLAGS+= -DUSE_TCMALLOC
@@ -130,6 +130,9 @@
 	FINAL_LIBS+= ../deps/jemalloc/lib/libjemalloc.a
 endif
 
+FINAL_CFLAGS+=-I${PREFIX}/include/lua51
+FINAL_LIBS+= -L${PREFIX}/lib -llua-5.1
+
 REDIS_CC=$(QUIET_CC)$(CC) $(FINAL_CFLAGS)
 REDIS_LD=$(QUIET_LINK)$(CC) $(FINAL_LDFLAGS)
 REDIS_INSTALL=$(QUIET_INSTALL)$(INSTALL)
@@ -150,6 +153,7 @@
 REDIS_SERVER_NAME=redis-server
 REDIS_SENTINEL_NAME=redis-sentinel
 REDIS_SERVER_OBJ=adlist.o quicklist.o ae.o anet.o dict.o server.o sds.o zmalloc.o lzf_c.o lzf_d.o pqsort.o zipmap.o sha1.o ziplist.o release.o networking.o util.o object.o db.o replication.o rdb.o t_string.o t_list.o t_set.o t_zset.o t_hash.o config.o aof.o pubsub.o multi.o debug.o sort.o intset.o syncio.o cluster.o crc16.o endianconv.o slowlog.o scripting.o bio.o rio.o rand.o memtest.o crc64.o bitops.o sentinel.o notify.o setproctitle.o blocked.o hyperloglog.o latency.o sparkline.o redis-check-rdb.o redis-check-aof.o geo.o lazyfree.o module.o evict.o expire.o geohash.o geohash_helper.o childinfo.o defrag.o siphash.o rax.o t_stream.o listpack.o localtime.o
+REDIS_SERVER_OBJ+=fpconv.o lua_bit.o lua_cjson.o lua_cmsgpack.o lua_struct.o strbuf.o
 REDIS_CLI_NAME=redis-cli
 REDIS_CLI_OBJ=anet.o adlist.o redis-cli.o zmalloc.o release.o anet.o ae.o crc64.o
 REDIS_BENCHMARK_NAME=redis-benchmark
@@ -201,7 +205,7 @@
 
 # redis-server
 $(REDIS_SERVER_NAME): $(REDIS_SERVER_OBJ)
-	$(REDIS_LD) -o $@ $^ ../deps/hiredis/libhiredis.a ../deps/lua/src/liblua.a $(FINAL_LIBS)
+	$(REDIS_LD) -o $@ $^ ../deps/hiredis/libhiredis.a $(FINAL_LIBS)
 
 # redis-sentinel
 $(REDIS_SENTINEL_NAME): $(REDIS_SERVER_NAME)
