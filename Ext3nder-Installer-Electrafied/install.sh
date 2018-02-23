cp /Ext3nder-Installer-Electrafied/ldid /bootstrap/bin/
chmod 755 /bootstrap/bin/ldid
echo "This install script is ONLY for Electra betas"
ln -s /Ext3nder-Installer-Electrafied/Library/MobileSubstrate/DynamicLibraries/Ext3nder_SpringBoard.dylib /Ext3nder-Installer-Electrafied/Library/Switches/Ext3nderSwitch.bundle/
chmod +x /Ext3nder-Installer-Electrafied/Library/MobileSubstrate/DynamicLibraries/*
cp /Ext3nder-Installer-Electrafied/Library/MobileSubstrate/DynamicLibraries/* /Library/SBInject/
echo "Copying Files to SBinject"
mkdir /Library/Switches/
cp -r /Ext3nder-Installer-Electrafied/Library/Switches/Ext3nderSwitch.bundle /Library/Switches/
echo "Copied Switches"
cp -r /Ext3nder-Installer-Electrafied/var/* /var/
echo "Copied var, going to run postinst now!"
jtool --sign --ent p.ent --inplace postinst
jtool --sign --ent p.ent --inplace postrm
chmod +x ./postinst
chmod +x ./postrm
/Ext3nder-Installer-Electrafied/postinst
echo "Finished Running postinst, Signing binaries!"
jtool --sign --ent p.ent --inplace /Applications/Ext3nder.app/Extender
jtool --sign --ent p.ent --inplace /Applications/Ext3nder.app/deceit.dylib
jtool --sign --ent p.ent --inplace /Applications/Ext3nder.app/Extender.dylib
jtool --sign --ent p.ent --inplace /Applications/Ext3nder.app/Sys.dylib
chmod +x /Applications/Ext3nder.app/Extender
chmod +x /Applications/Ext3nder.app/deceit.dylib
chmod +x /Applications/Ext3nder.app/Ext3nder.dylib
chmod +x /Applications/Ext3nder.app/Sys.dylib
chmod +x /Applications/Ext3nder.app/WebUpload.bundle/libWebServer.dylib
rm /bootstrap/bin/ldid
echo "You should be good!"

echo "You may need to respring!"
exit


