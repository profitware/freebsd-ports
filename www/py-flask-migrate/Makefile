# $FreeBSD$

PORTNAME=	Flask-Migrate
PORTVERSION=	2.2.1
DISTVERSIONPREFIX=	v
CATEGORIES=	www python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Database schema migrations for Flask applications

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Flask>=0.9:www/py-flask@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}alembic>=0.8.4:databases/py-alembic@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-editor>=0:devel/py-python-editor@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils
USE_GITHUB=	yes
GH_ACCOUNT=	miguelgrinberg

NO_ARCH=	yes

.include <bsd.port.mk>
