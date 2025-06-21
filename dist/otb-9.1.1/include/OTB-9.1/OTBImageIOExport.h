
#ifndef OTBImageIO_EXPORT_H
#define OTBImageIO_EXPORT_H

#ifdef OTB_STATIC
#  define OTBImageIO_EXPORT
#  define OTBImageIO_HIDDEN
#  define OTBImageIO_EXPORT_TEMPLATE
#  define OTBImageIO_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBImageIO_EXPORT
#    ifdef OTBImageIO_EXPORTS
        /* We are building this library */
#      define OTBImageIO_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBImageIO_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBImageIO_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBImageIO_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBImageIO_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBImageIO_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBImageIO_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBImageIO_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBImageIO_HIDDEN
#    define OTBImageIO_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBImageIO_DEPRECATED
#  define OTBImageIO_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBImageIO_DEPRECATED_EXPORT
#  define OTBImageIO_DEPRECATED_EXPORT OTBImageIO_EXPORT OTBImageIO_DEPRECATED
#endif

#ifndef OTBImageIO_DEPRECATED_NO_EXPORT
#  define OTBImageIO_DEPRECATED_NO_EXPORT OTBImageIO_HIDDEN OTBImageIO_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBIMAGEIO_NO_DEPRECATED
#    define OTBIMAGEIO_NO_DEPRECATED
#  endif
#endif

#endif /* OTBImageIO_EXPORT_H */
