DEPENDS_append = " \
    virtual/bootloader \
"
do_configure[nostamp] = "1"
do_compile[depends] += "virtual/bootloader:do_deploy"
do_compile[nostamp] = "1"
