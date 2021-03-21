package IR.TypeSystem;

import IR.Operand.IROperand;

import java.util.ArrayList;

public class StructureType extends IRTypeSystem{

    public String StructureName;
    public ArrayList<IRTypeSystem> StructureMemberType;
    public ArrayList<String> StructureMemberName;

    public StructureType(String tmpName){
        StructureName = tmpName;
        StructureMemberType = new ArrayList<>();
        StructureMemberName = new ArrayList<>();
    }

    @Override
    public long getTypeSize() {
        long res = 0;
        for(IRTypeSystem tmpMember : StructureMemberType){
            res += tmpMember.getTypeSize();
        }
        return res;
    }

    public long getMemberOffset(long tmpIndex){
        long res = 0;
        for(int i = 0;i < tmpIndex;++i){
            res += StructureMemberType.get(i).getTypeSize();
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
