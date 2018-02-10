# copy startup config to default data dir
mkdir -p $DATADIR/configs
cp /startup-sequence/configs/znc.conf $DATADIR/configs

# allow for override of the datadir
DATADIR=${OVERRIDE_DATADIR:-$DATADIR}

echo using datadir of $DATADIR
echo DATADIR CONFIG IS
cat $DATADIR/configs/znc.conf

#run the ZNC app
/opt/znc/bin/znc --foreground --datadir "$DATADIR" "$@"
