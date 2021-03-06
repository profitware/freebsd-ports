# Created by: Yukihiro Nakai <nakai@FreeBSD.org>
# $FreeBSD$

PORTNAME=	golem
PORTVERSION=	0.0.6
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Small window manager with themes and plugins

LICENSE=	BSD3CLAUSE

BROKEN_aarch64=		fails to link: can't create dynamic relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol: display in readonly segment

USES=		gmake perl5 tar:bzip2
USE_PERL5=	build
USE_XORG=	xpm
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-i18n
MAKE_ARGS=	DEVEL=1

CFLAGS_amd64=	-fPIC

OPTIONS_DEFINE=	ESOUND XINERAMA
OPTIONS_DEFAULT=	XINERAMA
OPTIONS_SUB=	yes

ESOUND_USE=	GNOME=esound
ESOUND_CONFIGURE_ON=	--enable-sound

XINERAMA_USE=	XORG=xinerama
XINERAMA_CONFIGURE_ON=	--enable-xinerama

post-patch:
	@${REINPLACE_CMD} -e '/cl_thread\.c/d' ${WRKSRC}/complib/user/Makefile
	@${REINPLACE_CMD} -e 's,^#include.*,typedef struct { \
		int counter; } atomic_t;,' \
			${WRKSRC}/complib/asm-generic/cl_atomic_asm.h \
			${WRKSRC}/complib/asm-ppc/cl_atomic_asm.h

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/golem
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/golem/plugins/*.so

.include <bsd.port.mk>
