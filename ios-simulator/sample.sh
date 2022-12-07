device="iPhone SE"
deviceid=$(xcrun simctl list devices | grep -m 1 $device |grep -E -o -i 
'([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})')


# This script opens the iOS Simulator with an iPhone SE

# Make sure the iOS Simulator is installed
if ! [ -x "$(command -v xcrun)" ]; then
  echo "Error: Xcode and the iOS Simulator are not installed. Please 
install Xcode to use the iOS Simulator."
  exit 0
fi

# Check if a simulator is already running
if xcrun simctl list | grep "$device" | grep -q "Booted"; then
  echo "Error: A simulator is already running. Please close the existing 
simulator and try again."
  exit 0
fi


{
	$(xcrun simctl boot $deviceid)
} || {
	echo "--"
}
fi
exit 0
