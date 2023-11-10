# Diffusion Installer Config
# osm0sis @ xda-developers

INST_NAME="Nano Installer Script";
AUTH_NAME="osm0sis @ xda-developers";

USE_ARCH=false
USE_ZIP_OPTS=true

custom_setup() {
  return # stub
}

custom_zip_opts() {
  return # stub
}

custom_target() {
  # use /product/bin/nano if /system_ext/bin/nano exists to remain higher in $PATH
  if [ -e /system/system_ext/bin/nano ]; then
    TARGET=$TARGET/product;
  fi;
}

custom_install() {
  ui_print " ";
  set_perm 0 0 755 $BIN/nano $BIN/nano.bin-arm $BIN/nano.bin-arm64;
  if $BIN/nano.bin-arm64 --version >/dev/null; then
    ui_print "Installing nano (arm64) to $BIN ...";
    mv -f $BIN/nano.bin-arm64 $BIN/nano.bin;
  else
    ui_print "Installing nano (arm) to $BIN ...";
    mv -f $BIN/nano.bin-arm $BIN/nano.bin;
  fi;
  rm -f $BIN/nano.bin-arm*;
  ui_print "Installing terminfo to $ETC ...";
  if ! $BOOTMODE; then
    ui_print "Installing nano recovery script to /sbin ...";
    cp -rf sbin/* /sbin;
    set_perm 0 0 755 /sbin/nano;
  fi;
}

custom_postinstall() {
  return # stub
}

custom_uninstall() {
  return # stub
}

custom_postuninstall() {
  return # stub
}

custom_cleanup() {
  return # stub
}

custom_exitmsg() {
  if ! $BOOTMODE && [ "$ACTION" == installation ]; then
    ui_print " ";
    ui_print "nano may now be run temporarily from";
    ui_print "terminal/adb shell for this recovery session,";
    ui_print "and from now on in booted Android.";
  fi;
}

# additional custom functions


