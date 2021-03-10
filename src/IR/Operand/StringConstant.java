package IR.Operand;

import IR.TypeSystem.IRTypeSystem;

public class StringConstant extends Constant{
    public String value;

    public StringConstant(IRTypeSystem tmpIRType, String tmpvalue){
        super(tmpIRType);
        value = tmpvalue;
    }

    @Override
    public String toString() {
        String res = value;
        res = res.replace("\\","\\5C");
        res = res.replace("\n","\\0A");
        res = res.replace("\"","\\22");
        res = res.replace("\0","\\00");
        return "c\""+res+"\"";
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof StringConstant)
            return value.equals(obj.toString());
        return false;
    }
}
