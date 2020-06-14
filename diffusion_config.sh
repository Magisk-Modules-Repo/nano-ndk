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
  return # stub
}

custom_install() {
  ui_print " ";
  ui_print "Installing nano to $BIN ...";
  ui_print "Installing terminfo to $ETC ...";
  set_perm 0 0 755 $BIN/nano $BIN/nano.bin;
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


