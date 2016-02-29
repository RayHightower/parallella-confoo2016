#Installs the neccessary dependencies
#From the para-para README

###Libelf prerequisite
wget www.mr511.de/software/libelf-0.8.13.tar.gz
tar -zxvf libelf-0.8.13.tar.gz
cd libelf-0.8.13
./configure
sudo make install
cd ../

###Libevent prerequisite
wget github.com/downloads/libevent/libevent/libevent-2.0.18-stable.tar.gz
tar -zxvf libevent-2.0.18-stable.tar.gz
cd libevent-2.0.18-stable
./configure
sudo make install
cd ../

###Libconfig prerequisite
wget www.hyperrealm.com/libconfig/libconfig-1.4.8.tar.gz
tar -zxvf libconfig-1.4.8.tar.gz
cd libconfig-1.4.8
./configure
sudo make install
cd ../

###Install parallella opencl package
#wget http://www.browndeertechnology.com/code/coprthr-1.6.0-parallella.tgz
#tar -zxvf coprthr-1.6.0-parallella.tgz
#sudo ./browndeer/scripts/install_coprthr_parallella.sh

#Use a fork--has everything master has + a few useful additions.
git clone https://github.com/olajep/coprthr.git
cd coprthr
./configure --enable-epiphany
make
sudo make install


### Add paths to .bashrc
echo 'export PATH=/usr/local/browndeer/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/browndeer/lib:/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc

### Add paths to root .bashrc
sudo su
echo 'export PATH=/usr/local/browndeer/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/browndeer/lib:/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc

### Add paths to .cshrc
echo 'setenv PATH /usr/local/bin:$PATH' >> ~/.cshrc
echo 'setenv LD_LIBRARY_PATH /usr/local/browndeer/lib:/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.cshrc
```

#MPI:

wget http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.1.tar.gz
tar -zxvf openmpi-1.8.1.tar.gz
cd openmpi-1.8.1
./configure --prefix=/usr/local \
            --enable-mpirun-prefix-by-default \
            --enable-static
make all
sudo make install

#Link epiphany tools to normal location:

sudo ln /opt/openmpi/bin/* /usr/local/bin

#Add BDT libs to linker path:

sudo echo "/usr/local/browndeer/lib" >> /etc/ld.so.conf

#Install coprthr_mpi preview library (for fft2d)

#Yes, I know this is awful practice, but the BDT site is throwing errors for me
wget https://web.archive.org/web/20150812193158/http://www.browndeertechnology.com/code/bdt-libcoprthr_mpi-preview.tgz
tar -zxvf bdt-libcoprthr_mpi-preview.tgz
cd libcoprthr_mpi
sudo ./install.sh
cd ../

