
#ifndef OTBIOGDAL_EXPORT_H
#define OTBIOGDAL_EXPORT_H

#ifdef OTB_STATIC
#  define OTBIOGDAL_EXPORT
#  define OTBIOGDAL_HIDDEN
#  define OTBIOGDAL_EXPORT_TEMPLATE
#  define OTBIOGDAL_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBIOGDAL_EXPORT
#    ifdef OTBIOGDAL_EXPORTS
        /* We are building this library */
#      define OTBIOGDAL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBIOGDAL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBIOGDAL_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBIOGDAL_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBIOGDAL_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBIOGDAL_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBIOGDAL_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBIOGDAL_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBIOGDAL_HIDDEN
#    define OTBIOGDAL_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBIOGDAL_DEPRECATED
#  define OTBIOGDAL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBIOGDAL_DEPRECATED_EXPORT
#  define OTBIOGDAL_DEPRECATED_EXPORT OTBIOGDAL_EXPORT OTBIOGDAL_DEPRECATED
#endif

#ifndef OTBIOGDAL_DEPRECATED_NO_EXPORT
#  define OTBIOGDAL_DEPRECATED_NO_EXPORT OTBIOGDAL_HIDDEN OTBIOGDAL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBIOGDAL_NO_DEPRECATED
#    define OTBIOGDAL_NO_DEPRECATED
#  endif
#endif

#endif /* OTBIOGDAL_EXPORT_H */
