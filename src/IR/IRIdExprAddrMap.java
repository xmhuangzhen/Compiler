package IR;

import IR.Operand.Register;

import java.util.LinkedHashMap;
import java.util.Map;

public class IRIdExprAddrMap {
    public Map<String, Register> AddrMap;
    public IRIdExprAddrMap ParentMap;

    public IRIdExprAddrMap(IRIdExprAddrMap tmpParentMap){
        ParentMap = tmpParentMap;
        AddrMap = new LinkedHashMap<>();
    }

    public boolean CheckIdExprAddr(String tmpName){
        if(AddrMap.containsKey(tmpName)) return true;
        if(ParentMap == null) return false;
        return ParentMap.CheckIdExprAddr(tmpName);
    }

    public Register GetIdExprAddr(String tmpName){
        if(AddrMap.containsKey(tmpName)) return AddrMap.get(tmpName);
        if(ParentMap == null) return null;
        return ParentMap.GetIdExprAddr(tmpName);
    }
}
