
#ifndef OTBCarto_EXPORT_H
#define OTBCarto_EXPORT_H

#ifdef OTB_STATIC
#  define OTBCarto_EXPORT
#  define OTBCarto_HIDDEN
#  define OTBCarto_EXPORT_TEMPLATE
#  define OTBCarto_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBCarto_EXPORT
#    ifdef OTBCarto_EXPORTS
        /* We are building this library */
#      define OTBCarto_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBCarto_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBCarto_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBCarto_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBCarto_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBCarto_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBCarto_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBCarto_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBCarto_HIDDEN
#    define OTBCarto_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBCarto_DEPRECATED
#  define OTBCarto_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBCarto_DEPRECATED_EXPORT
#  define OTBCarto_DEPRECATED_EXPORT OTBCarto_EXPORT OTBCarto_DEPRECATED
#endif

#ifndef OTBCarto_DEPRECATED_NO_EXPORT
#  define OTBCarto_DEPRECATED_NO_EXPORT OTBCarto_HIDDEN OTBCarto_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBCARTO_NO_DEPRECATED
#    define OTBCARTO_NO_DEPRECATED
#  endif
#endif

#endif /* OTBCarto_EXPORT_H */
