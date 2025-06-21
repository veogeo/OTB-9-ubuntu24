
#ifndef OTBApplicationEngine_EXPORT_H
#define OTBApplicationEngine_EXPORT_H

#ifdef OTB_STATIC
#  define OTBApplicationEngine_EXPORT
#  define OTBApplicationEngine_HIDDEN
#  define OTBApplicationEngine_EXPORT_TEMPLATE
#  define OTBApplicationEngine_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBApplicationEngine_EXPORT
#    ifdef OTBApplicationEngine_EXPORTS
        /* We are building this library */
#      define OTBApplicationEngine_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBApplicationEngine_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBApplicationEngine_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBApplicationEngine_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBApplicationEngine_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBApplicationEngine_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBApplicationEngine_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBApplicationEngine_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBApplicationEngine_HIDDEN
#    define OTBApplicationEngine_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBApplicationEngine_DEPRECATED
#  define OTBApplicationEngine_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBApplicationEngine_DEPRECATED_EXPORT
#  define OTBApplicationEngine_DEPRECATED_EXPORT OTBApplicationEngine_EXPORT OTBApplicationEngine_DEPRECATED
#endif

#ifndef OTBApplicationEngine_DEPRECATED_NO_EXPORT
#  define OTBApplicationEngine_DEPRECATED_NO_EXPORT OTBApplicationEngine_HIDDEN OTBApplicationEngine_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBAPPLICATIONENGINE_NO_DEPRECATED
#    define OTBAPPLICATIONENGINE_NO_DEPRECATED
#  endif
#endif

#endif /* OTBApplicationEngine_EXPORT_H */
