#!/bin/bash
VER="1.0"
ILOG="install.log"
ISUMMARY="install-nvme-wheel-summary.log"

echo "Get get-pip.py."
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py | tee $ILOG $ISUMMARY
echo "Install get-pip.py"
python2.7 get-pip.py --force-reinstall | tee $ILOG $ISUMMARY
echo "Install pip wheel"
pip install wheel | tee $ILOG $ISUMMARY
echo "Install pip flask"
pip install flask | tee $ILOG $ISUMMARY
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
cd $parent_path/patch-initiator-2.3.0.0.3-4/ | tee $ILOG $ISUMMARY
cd $parent_path/patch-initiator-2.3.0.0.3-4/NVME_WHEEL_PACKAGE_1.3.24 | tee $ILOG $ISUMMARY
echo "Install nvme wheel"
chmod +x $parent_path/patch-initiator-2.3.0.0.3-4/NVME_WHEEL_PACKAGE_1.3.24/INSTALL.sh | tee $ILOG $ISUMMARY
source $parent_path/patch-initiator-2.3.0.0.3-4/NVME_WHEEL_PACKAGE_1.3.24/INSTALL.sh | tee $ILOG $ISUMMARY

done
echo "=================================" | tee -a $ILOG $ISUMMARY
echo "      Host Install Complete" | tee -a $ILOG $ISUMMARY
echo "=================================" | tee -a $ILOG $ISUMMARY
