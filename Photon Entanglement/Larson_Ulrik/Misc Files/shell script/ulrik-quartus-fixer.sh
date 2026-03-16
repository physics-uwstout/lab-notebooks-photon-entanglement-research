if [ $# -ne 0 ]
then
echo "This is a quick patch, silly; why would this script accept arguments?"
fi

if [ "$EUID" -ne 0 ]
then
whodis=$(whoami)
echo -e "\e[1;31mYou are not root; you are $whodis\e[0m"
echo -e "\e[1;31mThis will not work without root privileges!!!\e[0m"
echo -e "\e[1;34mConsider: \"su root\"\e[0m"
else

command_location="$PATH:/home/photanglement/intelFPGA/23.1std/quartus/linux64"
do_configure_library=0

echo "Arranging environment..."
export PATH="$PATH:$command_location"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PATH"

if [ $do_configure_library -ne 0 ]
then
echo "Configuring library..."
ldconfig
fi

echo "Murdering jtag processes..."
killall jtagd
echo "Configuring jtag..."
jtagreturn=$(jtagconfig -n)
echo $jtagreturn

echo "Done!"
fi
