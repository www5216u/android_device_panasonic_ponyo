#!/bin/sh

VENDOR=panasonic
DEVICE=ponyo
OUTDIR=vendor/$VENDOR/$DEVICE
MAKEFILE=../../../$OUTDIR/$DEVICE-vendor-blobs.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    $OUTDIR/proprietary/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \\
    $OUTDIR/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \\
    $OUTDIR/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \\
    $OUTDIR/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \\
    $OUTDIR/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \\
    $OUTDIR/proprietary/lib/libgsl.so:system/lib/libgsl.so \\
    $OUTDIR/proprietary/lib/libC2D2.so:system/lib/libC2D2.so \\
    $OUTDIR/proprietary/lib/libOpenVG.so:system/lib/libOpenVG.so \\
    $OUTDIR/proprietary/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \\
    $OUTDIR/proprietary/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \\
    $OUTDIR/proprietary/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \\
    $OUTDIR/proprietary/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \\
    $OUTDIR/proprietary/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \\
    $OUTDIR/proprietary/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \\
    $OUTDIR/proprietary/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \\
    $OUTDIR/proprietary/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \\
    $OUTDIR/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \\
    $OUTDIR/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \\
    $OUTDIR/proprietary/lib/libaudcal.so:obj/lib/libaudcal.so \\
    $OUTDIR/proprietary/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \\
    $OUTDIR/proprietary/lib/libnv.so:obj/lib/libnv.so \\
    $OUTDIR/proprietary/lib/liboncrpc.so:obj/lib/liboncrpc.so \\
    $OUTDIR/proprietary/lib/libril.so:obj/lib/libril.so \\
    $OUTDIR/proprietary/lib/libreference-ril.so:obj/lib/lib/libreference-ril.so

PRODUCT_COPY_FILES += \\
EOF

LINEEND=" \\"
COUNT=`cat proprietary-files.txt | grep -v ^# | grep -v ^$ | wc -l | awk {'print $1'}`
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    COUNT=`expr $COUNT - 1`
    if [ $COUNT = "0" ]; then
        LINEEND=""
    fi
    echo "    $OUTDIR/proprietary/$FILE:system/$FILE$LINEEND" >> $MAKEFILE
done

(cat << EOF) > ../../../$OUTDIR/$DEVICE-vendor.mk
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

# Live wallpaper packages
PRODUCT_PACKAGES := \\
    LiveWallpapers \\
    LiveWallpapersPicker

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES := \\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := vendor/$VENDOR/$DEVICE/overlay

\$(call inherit-product, vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk)
EOF

(cat << EOF) > ../../../$OUTDIR/BoardConfigVendor.mk
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

USE_CAMERA_STUB := false
EOF
