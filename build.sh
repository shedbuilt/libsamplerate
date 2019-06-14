#!/bin/bash
# Configure
./configure --prefix=/usr \
            --disable-static &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" htmldocdir="$SHED_PKG_DOCS_INSTALL_DIR" install || exit 1
# Prune Documentation
if [ -z "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    rm -rf "${SHED_FAKE_ROOT}${SHED_PKG_DOCS_INSTALL_DIR}"
fi
