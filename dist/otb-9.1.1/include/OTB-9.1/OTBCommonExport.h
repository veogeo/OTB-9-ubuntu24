
#ifndef OTBCommon_EXPORT_H
#define OTBCommon_EXPORT_H

#ifdef OTB_STATIC
#  define OTBCommon_EXPORT
#  define OTBCommon_HIDDEN
#  define OTBCommon_EXPORT_TEMPLATE
#  define OTBCommon_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBCommon_EXPORT
#    ifdef OTBCommon_EXPORTS
        /* We are building this library */
#      define OTBCommon_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBCommon_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBCommon_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBCommon_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBCommon_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBCommon_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBCommon_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBCommon_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBCommon_HIDDEN
#    define OTBCommon_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBCommon_DEPRECATED
#  define OTBCommon_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBCommon_DEPRECATED_EXPORT
#  define OTBCommon_DEPRECATED_EXPORT OTBCommon_EXPORT OTBCommon_DEPRECATED
#endif

#ifndef OTBCommon_DEPRECATED_NO_EXPORT
#  define OTBCommon_DEPRECATED_NO_EXPORT OTBCommon_HIDDEN OTBCommon_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBCOMMON_NO_DEPRECATED
#    define OTBCOMMON_NO_DEPRECATED
#  endif
#endif

#endif /* OTBCommon_EXPORT_H */
