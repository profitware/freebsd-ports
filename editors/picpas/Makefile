# $FreeBSD$

PORTNAME=	picpas
PORTVERSION=	0.8.6
DISTVERSIONPREFIX=	v
CATEGORIES=	editors
PKGNAMESUFFIX=	${LAZARUS_PKGNAMESUFFIX}

MAINTAINER=	acm@FreeBSD.org
COMMENT=	Multi-platform Pascal for Microchip PIC16F microcontrollers

LICENSE=	GPLv2

gtk2_CONFLICTS_INSTALL=	${PORTNAME}-qt4 ${PORTNAME}-qt5
qt4_CONFLICTS_INSTALL=	${PORTNAME}-gtk2 ${PORTNAME}-qt5
qt5_CONFLICTS_INSTALL=	${PORTNAME}-gtk2 ${PORTNAME}-qt4

USES=		dos2unix fpc lazarus:flavors
USE_FPC=	chm fcl-base fcl-image fcl-json fcl-registry fcl-xml pasjpeg regexpr \
		rtl-objpas x11
USE_XORG=	x11
DOS2UNIX_REGEX=	.*\.([txt]|pas|lpi|txt|lfm)
USE_GITHUB=	yes
GH_ACCOUNT=	t-edson
GH_PROJECT=	PicPas
GH_TAGNAME=	e095d58
GH_TUPLE=	t-edson:MiConfig:a4a988a:miconfig/miconfig \
		t-edson:MisUtils:742eff3:misutils/misutils  \
		t-edson:PicUtils:b38865a:picutils/picutils \
		t-edson:SynFacilUtils:2909899:syncfacilutils/syncfacilutils \
		t-edson:UtilsGrilla:07744b9:utilsgrilla/utilsgrilla \
		t-edson:ogEditGraf:4552327:ogeditgraf/ogeeditgraf \
		t-edson:t-Xpres:6665922:txpres/txpres

USE_FPC_gtk2=	cairo
USE_GNOME_gtk2=	cairo
USE_FPC+=	${USE_FPC_${FLAVOR}}
USE_GNOME+=	${USE_GNOME_${FLAVOR}}

LAZARUS_PROJECT_FILES=	Source/PicPas.lpi
LAZBUILD_ARGS=		-d

post-patch:
	${REINPLACE_CMD} 's|%%DATADIR%%|${DATADIR}|g' ${WRKSRC}/Source/Globales.pas

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/PicPas-freebsd ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	@${MKDIR} ${STAGEDIR}${DATADIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} "devices syntax samples temp themes units" ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
