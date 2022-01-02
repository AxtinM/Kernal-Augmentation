
all:
	@(cd sipgen; $(MAKE))
	@(cd siplib; $(MAKE))

install:
	@(cd sipgen; $(MAKE) install)
	@(cd siplib; $(MAKE) install)
	@test -d $(DESTDIR)/usr/lib/python3/dist-packages || mkdir -p $(DESTDIR)/usr/lib/python3/dist-packages
	cp -f sipconfig.py $(DESTDIR)/usr/lib/python3/dist-packages/sipconfig.py
	cp -f /home/mdx8/Kernel_Augmentation/first_proj/Manual/sip-4.19.13/sipdistutils.py $(DESTDIR)/usr/lib/python3/dist-packages/sipdistutils.py
	/usr/bin/python3 /home/mdx8/Kernel_Augmentation/first_proj/Manual/sip-4.19.13/mk_distinfo.py "$(DESTDIR)" /usr/lib/python3/dist-packages/sip-4.19.13.dist-info installed.txt

clean:
	@(cd sipgen; $(MAKE) clean)
	@(cd siplib; $(MAKE) clean)
