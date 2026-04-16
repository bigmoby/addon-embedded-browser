#!/usr/bin/with-contenv bashio
# ==============================================================================
# Setup noVNC
# ==============================================================================
declare ingress_entry
ingress_entry=$(bashio::addon.ingress_entry)

# Fix the websockify WebSocket path so it works through HA ingress
sed -i "s#websockify#${ingress_entry#?}/novnc/websockify#g" /opt/novnc/vnc_lite.html

# Inject support for rfb.resizeSession via URL parameter ?resize=remote
# vnc_lite.html only reads 'scale' by default – this adds 'resize=remote' support
sed -i "s|rfb\.scaleViewport = readQueryVariable('scale', false);|rfb.scaleViewport = readQueryVariable('scale', false);\n        rfb.resizeSession = readQueryVariable('resize', '') === 'remote';|" \
    /opt/novnc/vnc_lite.html || \
    bashio::log.warning "Could not inject resizeSession support (vnc_lite.html structure may differ)"

# Inject CSS:
#  - hide the noVNC top bar so the VNC fills the full vertical space
#  - force #screen to fill the entire viewport
#  - center the canvas within #screen (fallback when not using resize=remote)
sed -i 's|</head>|<style>\
html,body{margin:0;padding:0;width:100vw;height:100vh;overflow:hidden;background:#000;}\
#top_bar{display:none!important;}\
#screen{position:fixed!important;top:0;left:0;right:0;bottom:0;width:100vw!important;height:100vh!important;display:flex!important;align-items:center;justify-content:center;overflow:hidden!important;}\
</style></head>|' /opt/novnc/vnc_lite.html || \
    bashio::log.warning "Could not inject CSS into vnc_lite.html"

