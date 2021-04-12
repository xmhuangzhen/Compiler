package Optimize;

import RISCV.Operand.RISCVRegister;


public class Edge {
    public RISCVRegister u, v;

    public Edge(RISCVRegister tmpu, RISCVRegister tmpv) {
        u = tmpu;
        v = tmpv;
    }

    @Override
    public boolean equals(Object obj) {
        return obj instanceof Edge && ((Edge) obj).u.equals(u) && ((Edge) obj).v.equals(v);
    }

    @Override
    public int hashCode() {
        return u.hashCode() ^ v.hashCode();
    }
}