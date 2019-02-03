obj-m := lsm9ds1_i2c.o lsm9ds1_ag_i2c.o lsm9ds1_ag.o lsm9ds1_m.o lsm9ds1_m_i2c.o
# lsm9ds1_ag_buffer.o

KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers
