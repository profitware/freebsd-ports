# Created by: Edwin Groothuis <edwin@mavetju.org>
# $FreeBSD$

PORTNAME=	ipv6calc
PORTVERSION=	1.0.0
CATEGORIES=	net-mgmt ipv6
MASTER_SITES=	ftp://ftp.bieringer.de/pub/linux/IPv6/ipv6calc/

MAINTAINER=	dbaio@FreeBSD.org
COMMENT=	Convert, change, and calculate with IPv6 addresses

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_mips=		fails to build: libipv6addr.c: addr_test_method may be used uninitialized in this function
BROKEN_mips64=		fails to build: libipv6addr.c: addr_test_method may be used uninitialized in this function
BROKEN_powerpc64=	fails to build: libipv6addr.c: addr_test_method may be used uninitialized in this function

USES=		gmake perl5 shebangfix ssl
GNU_CONFIGURE=	yes

SHEBANG_FILES=	tools/*.pl tools/*.sh.in

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/*

.include <bsd.port.mk>
