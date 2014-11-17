[#] start of __file__
dnl MPICH_SUBCFG_AFTER=src/mpid/ch3/channels/nemesis

AC_DEFUN([PAC_SUBCFG_PREREQ_]PAC_SUBCFG_AUTO_SUFFIX,[
    AM_COND_IF([BUILD_CH3_NEMESIS],[
        for net in $nemesis_networks ; do
            AS_CASE([$net],[sfi],[build_nemesis_netmod_sfi=yes])
        done
    ])
    AM_CONDITIONAL([BUILD_NEMESIS_NETMOD_SFI],[test "X$build_nemesis_netmod_sfi" = "Xyes"])
])dnl

AC_DEFUN([PAC_SUBCFG_BODY_]PAC_SUBCFG_AUTO_SUFFIX,[
AM_COND_IF([BUILD_NEMESIS_NETMOD_SFI],[
    AC_MSG_NOTICE([RUNNING CONFIGURE FOR ch3:nemesis:sfi])

    PAC_SET_HEADER_LIB_PATH(sfi)
    PAC_CHECK_HEADER_LIB_FATAL(sfi, rdma/fabric.h, fabric, fi_getinfo)

    AC_DEFINE([ENABLE_COMM_OVERRIDES], 1, [define to add per-vc function pointers to override send and recv functions])
])dnl end AM_COND_IF(BUILD_NEMESIS_NETMOD_SFI,...)
])dnl end _BODY

[#] end of __file__
