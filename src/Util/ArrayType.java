package Util;

public class ArrayType extends Type{
    private Type baseType;
    private int dimension;

    //int size()

    public ArrayType(Type baseType, int dimension){
        super (baseType.getName(),0);
        this.baseType = baseType;
        this.dimension = dimension;


    }
}
