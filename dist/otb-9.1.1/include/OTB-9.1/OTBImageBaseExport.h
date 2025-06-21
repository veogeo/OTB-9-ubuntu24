
#ifndef OTBImageBase_EXPORT_H
#define OTBImageBase_EXPORT_H

#ifdef OTB_STATIC
#  define OTBImageBase_EXPORT
#  define OTBImageBase_HIDDEN
#  define OTBImageBase_EXPORT_TEMPLATE
#  define OTBImageBase_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBImageBase_EXPORT
#    ifdef OTBImageBase_EXPORTS
        /* We are building this library */
#      define OTBImageBase_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBImageBase_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBImageBase_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBImageBase_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBImageBase_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBImageBase_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBImageBase_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBImageBase_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBImageBase_HIDDEN
#    define OTBImageBase_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBImageBase_DEPRECATED
#  define OTBImageBase_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBImageBase_DEPRECATED_EXPORT
#  define OTBImageBase_DEPRECATED_EXPORT OTBImageBase_EXPORT OTBImageBase_DEPRECATED
#endif

#ifndef OTBImageBase_DEPRECATED_NO_EXPORT
#  define OTBImageBase_DEPRECATED_NO_EXPORT OTBImageBase_HIDDEN OTBImageBase_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBIMAGEBASE_NO_DEPRECATED
#    define OTBIMAGEBASE_NO_DEPRECATED
#  endif
#endif

#endif /* OTBImageBase_EXPORT_H */
