
#ifndef OTBSupervised_EXPORT_H
#define OTBSupervised_EXPORT_H

#ifdef OTB_STATIC
#  define OTBSupervised_EXPORT
#  define OTBSupervised_HIDDEN
#  define OTBSupervised_EXPORT_TEMPLATE
#  define OTBSupervised_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBSupervised_EXPORT
#    ifdef OTBSupervised_EXPORTS
        /* We are building this library */
#      define OTBSupervised_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBSupervised_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBSupervised_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBSupervised_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBSupervised_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBSupervised_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBSupervised_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBSupervised_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBSupervised_HIDDEN
#    define OTBSupervised_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBSupervised_DEPRECATED
#  define OTBSupervised_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBSupervised_DEPRECATED_EXPORT
#  define OTBSupervised_DEPRECATED_EXPORT OTBSupervised_EXPORT OTBSupervised_DEPRECATED
#endif

#ifndef OTBSupervised_DEPRECATED_NO_EXPORT
#  define OTBSupervised_DEPRECATED_NO_EXPORT OTBSupervised_HIDDEN OTBSupervised_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBSUPERVISED_NO_DEPRECATED
#    define OTBSUPERVISED_NO_DEPRECATED
#  endif
#endif

#endif /* OTBSupervised_EXPORT_H */
