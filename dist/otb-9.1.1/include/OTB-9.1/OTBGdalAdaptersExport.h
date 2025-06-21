
#ifndef OTBGdalAdapters_EXPORT_H
#define OTBGdalAdapters_EXPORT_H

#ifdef OTB_STATIC
#  define OTBGdalAdapters_EXPORT
#  define OTBGdalAdapters_HIDDEN
#  define OTBGdalAdapters_EXPORT_TEMPLATE
#  define OTBGdalAdapters_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBGdalAdapters_EXPORT
#    ifdef OTBGdalAdapters_EXPORTS
        /* We are building this library */
#      define OTBGdalAdapters_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBGdalAdapters_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBGdalAdapters_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBGdalAdapters_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBGdalAdapters_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBGdalAdapters_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBGdalAdapters_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBGdalAdapters_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBGdalAdapters_HIDDEN
#    define OTBGdalAdapters_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBGdalAdapters_DEPRECATED
#  define OTBGdalAdapters_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBGdalAdapters_DEPRECATED_EXPORT
#  define OTBGdalAdapters_DEPRECATED_EXPORT OTBGdalAdapters_EXPORT OTBGdalAdapters_DEPRECATED
#endif

#ifndef OTBGdalAdapters_DEPRECATED_NO_EXPORT
#  define OTBGdalAdapters_DEPRECATED_NO_EXPORT OTBGdalAdapters_HIDDEN OTBGdalAdapters_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBGDALADAPTERS_NO_DEPRECATED
#    define OTBGDALADAPTERS_NO_DEPRECATED
#  endif
#endif

#endif /* OTBGdalAdapters_EXPORT_H */
