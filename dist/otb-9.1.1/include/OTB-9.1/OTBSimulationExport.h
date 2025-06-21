
#ifndef OTBSimulation_EXPORT_H
#define OTBSimulation_EXPORT_H

#ifdef OTB_STATIC
#  define OTBSimulation_EXPORT
#  define OTBSimulation_HIDDEN
#  define OTBSimulation_EXPORT_TEMPLATE
#  define OTBSimulation_EXPORT_EXPLICIT_TEMPLATE
#else
#  ifndef OTBSimulation_EXPORT
#    ifdef OTBSimulation_EXPORTS
        /* We are building this library */
#      define OTBSimulation_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBSimulation_EXPORT __attribute__((visibility("default")))
#    endif
#  endif
#  ifndef OTBSimulation_EXPORT_TEMPLATE
        /* We are building this library */
#      define OTBSimulation_EXPORT_TEMPLATE __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OTBSimulation_EXPORT_TEMPLATE __attribute__((visibility("default")))
#  endif
#  ifndef OTBSimulation_EXPORT_EXPLICIT_TEMPLATE
        /* We are building this library */
#      define OTBSimulation_EXPORT_EXPLICIT_TEMPLATE 
#    else
        /* We are using this library */
#      define OTBSimulation_EXPORT_EXPLICIT_TEMPLATE 
#  endif
#  ifndef OTBSimulation_HIDDEN
#    define OTBSimulation_HIDDEN __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OTBSimulation_DEPRECATED
#  define OTBSimulation_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OTBSimulation_DEPRECATED_EXPORT
#  define OTBSimulation_DEPRECATED_EXPORT OTBSimulation_EXPORT OTBSimulation_DEPRECATED
#endif

#ifndef OTBSimulation_DEPRECATED_NO_EXPORT
#  define OTBSimulation_DEPRECATED_NO_EXPORT OTBSimulation_HIDDEN OTBSimulation_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OTBSIMULATION_NO_DEPRECATED
#    define OTBSIMULATION_NO_DEPRECATED
#  endif
#endif

#endif /* OTBSimulation_EXPORT_H */
