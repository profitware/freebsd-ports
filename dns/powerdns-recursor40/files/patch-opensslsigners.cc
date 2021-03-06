--- opensslsigners.cc.orig	2018-01-22 13:39:07 UTC
+++ opensslsigners.cc
@@ -33,7 +33,8 @@
 #include "opensslsigners.hh"
 #include "dnssecinfra.hh"
 
-#if (OPENSSL_VERSION_NUMBER < 0x1010000fL || defined LIBRESSL_VERSION_NUMBER)
+#if (OPENSSL_VERSION_NUMBER < 0x1010000fL || \
+	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL))
 /* OpenSSL < 1.1.0 needs support for threading/locking in the calling application. */
 static pthread_mutex_t *openssllocks;
 
