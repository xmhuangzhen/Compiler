package Optimize;

import IR.IRModule;

abstract public class Pass {
    public IRModule curIRModule;

    public Pass(IRModule tmpModule) {
        curIRModule = tmpModule;
    }

    abstract public boolean run();
}
