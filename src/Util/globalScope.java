package Util;

import Util.error.semanticError;

import java.util.HashMap;

public class globalScope extends Scope {
    private HashMap<String, Type> types;

    public globalScope(Scope parentScope) {
        super(parentScope);

        types = new HashMap<>();

        //int bool void string null

    }

    public void addType(String name, Type t, position pos) {
        if (types.containsKey(name))
            throw new semanticError("multiple definition of " + name, pos);
        types.put(name, t);
    }

    public boolean checkName(String name){
        return types.containsKey(name);
    }

    public Type getTypeFromName(String name, position pos) {
        if (types.containsKey(name)) return types.get(name);
        throw new semanticError("no such type: " + name, pos);
    }
}
