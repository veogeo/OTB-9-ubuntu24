
#ifndef OTBTestKernel_EXPORT_H
#define OTBTestKernel_EXPORT_H

#ifdef OTB_STATIC
#  define OTBTestKernel_EXPORT
#  define OTBTestKernel_HIDDEN
#  define OTBTestKernel_EXPORT_TEMPLATE
#  define OTBTestKernel_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBTestKernel_EXPORT
#    ifdef OTBTestKernel_EXPORTS
        /* We are building this library */
#      define OTBTestKernel_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBTestKernel_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBTestKernel_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBTestKernel_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBTestKernel_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBTestKernel_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBTestKernel_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBTestKernel_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBTestKernel_HIDDEN
#    define OTBTestKernel_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBTestKernel_DEPRECATED
#  define OTBTestKernel_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBTestKernel_DEPRECATED_EXPORT
#  define OTBTestKernel_DEPRECATED_EXPORT OTBTestKernel_EXPORT OTBTestKernel_DEPRECATED
#endif

#ifndef OTBTestKernel_DEPRECATED_NO_EXPORT
#  define OTBTestKernel_DEPRECATED_NO_EXPORT OTBTestKernel_HIDDEN OTBTestKernel_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBTESTKERNEL_NO_DEPRECATED
#    define OTBTESTKERNEL_NO_DEPRECATED
#  endif
#endif

#endif /* OTBTestKernel_EXPORT_H */
