echo using datadir of $DATADIR
cp /startup-sequence/configs/znc.conf $DATADIR/configs
echo DATADIR CONFIGS ARE
ls $DATADIR/configs
cat $DATADIR/configs/znc.conf
/opt/znc/bin/znc --foreground --datadir "$DATADIR" "$@"
