package Util;

abstract public class Type {
    //int bool string null void class

    private String name;
    private long size;

    public Type(String name, long size){
        this.name = name;
        this.size = size;
    }

    public String getName(){
        return name;
    }

    public long getSize(){
        return size;
    }

    @Override public String toString(){
        return name;
    }
}
