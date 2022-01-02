wget https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.13/sip-4.19.13.tar.gz
wget https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.11.3/PyQt5_gpl-5.11.3.tar.gz
# install SIP first
tar xzf sip-4.19.13.tar.gz
cd sip-4.19.13
python3 ./configure.py
make
make install
# install pyqt
tar xzf PyQt5_gpl-5.11.3.tar.gz
cd PyQt5_gpl-5.11.3
python3 ./configure.py --sip /Users/karsten/.pyenv/versions/3.7.0/Python.framework/Versions/3.7/bin/sip  # <-- This has to point to your sip install location
make -j4
make install
