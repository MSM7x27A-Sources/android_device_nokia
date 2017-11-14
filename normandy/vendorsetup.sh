/bin/cp device/nokia/normandy/post_process_props_hook.py build/tools/
chmod  0775 build/tools/post_process_props_hook.py

add_lunch_combo cm_normandy-eng
add_lunch_combo cm_normandy-userdebug
add_lunch_combo cm_normandy-user dist

sh device/nokia/normandy/patches/apply.sh
croot

rm -rf out/target/product/normandy/obj/PACKAGING/target_files_intermediates
rm -f out/target/product/normandy/system/build.prop
rm -f out/target/product/normady/root/default.prop 
