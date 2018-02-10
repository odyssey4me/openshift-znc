DATADIR=${OVERRIDE_DATADIR:-$DATADIR}
echo using datadir of $DATADIR
mkdir -p $DATADIR/configs
cp /startup-sequence/configs/znc.conf $DATADIR/configs
echo DATADIR CONFIGS ARE
ls -al $DATADIR/configs/
cat $DATADIR/configs/znc.conf
/opt/znc/bin/znc --foreground --datadir "$DATADIR" "$@"
