echo found the following configs:
ls -al /startup-sequence/configs/
echo using datadir of $DATADIR
mkdir -p $DATADIR
cp /startup-sequence/configs/znc.conf $DATADIR/configs
echo DATADIR CONFIGS ARE
ls -al $DATADIR/configs/
cat $DATADIR/configs/znc.conf
/opt/znc/bin/znc --foreground --datadir "$DATADIR" "$@"
