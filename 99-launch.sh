echo using datadir of $DATADIR
cp /startup-sequence/configs/* $DATADIR/configs
/opt/znc/bin/znc --foreground --datadir "$DATADIR" "$@"
