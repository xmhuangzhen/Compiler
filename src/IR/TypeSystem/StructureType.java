package IR.TypeSystem;

import IR.Operand.IROperand;

import java.util.ArrayList;

public class StructureType extends IRTypeSystem{

    public String StructureName;
    public ArrayList<IRTypeSystem> StructureMember;

    public StructureType(String tmpName){
        StructureName = tmpName;
    }

    @Override
    public int getTypeSize() {
        int res = 0;
        for(IRTypeSystem tmpMember : StructureMember){
            res += tmpMember.getTypeSize();
        }
        return res;
    }

    @Override
    public IROperand getValue() {
        return null;
    }

    @Override
    public String toString() {
        return "%"+StructureName;
    }
}
