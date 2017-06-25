#!/bin/sh
/usr/bin/rsync -av "${BUILT_PRODUCTS_DIR}/SourceryRuntime.framework" "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
