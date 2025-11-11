module FprimePythonReference {

    @ Sample enumeration for Python bindings
    enum PythonEnumeration : U8 {
        ENUMERATION_A,
        ENUMERATION_B,
        ENUMERATION_C
    }

    @ Sample array for Python bindings
    array PythonArray = [3] F32

    @ Sample simple struct for python bindings
    struct PythonSimpleStruct {
        a: U32,
        b: F32,
    }

    @ Sample struct for python bindings
    struct PythonComplexStruct {
        u: PythonSimpleStruct,
        w: PythonArray,
        x: U32,
        y: string,
        z: PythonEnumeration,
    }
}
