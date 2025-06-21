
#ifndef OTBSampling_EXPORT_H
#define OTBSampling_EXPORT_H

#ifdef OTB_STATIC
#  define OTBSampling_EXPORT
#  define OTBSampling_HIDDEN
#  define OTBSampling_EXPORT_TEMPLATE
#  define OTBSampling_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBSampling_EXPORT
#    ifdef OTBSampling_EXPORTS
        /* We are building this library */
#      define OTBSampling_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBSampling_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBSampling_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBSampling_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBSampling_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBSampling_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBSampling_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBSampling_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBSampling_HIDDEN
#    define OTBSampling_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBSampling_DEPRECATED
#  define OTBSampling_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBSampling_DEPRECATED_EXPORT
#  define OTBSampling_DEPRECATED_EXPORT OTBSampling_EXPORT OTBSampling_DEPRECATED
#endif

#ifndef OTBSampling_DEPRECATED_NO_EXPORT
#  define OTBSampling_DEPRECATED_NO_EXPORT OTBSampling_HIDDEN OTBSampling_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBSAMPLING_NO_DEPRECATED
#    define OTBSAMPLING_NO_DEPRECATED
#  endif
#endif

#endif /* OTBSampling_EXPORT_H */
