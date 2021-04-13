# Mx-Compiler



```
--------------------
|    AST Builder   |
--------------------
         |
         V
--------------------
|  Semantic Check  |
--------------------
         |
         V
--------------------
|    IR Builder    |
--------------------
         |
         V
------------------------------
|  Control Flow Constructor  |
------------------------------
         |
         V
--------------------
|  Dominator Tree  |
--------------------
         |
         V
------------------------
|  Dominance Frontier  |
------------------------
         |
         V
---------------------
|  SSA Constructor  |
---------------------
         |
         V
--------------------
|  SSA Destructor  |
--------------------
         |
         V
--------------------
|  Inst Selector   |
--------------------
         |
         V
----------------------
|  Liveness Analysis |
----------------------
         |
         V
---------------------------------------
|  Graph Coloring Register Allocator  |
---------------------------------------
         |
         V
--------------------
|   ASM Printer    |
--------------------


```





Sparse conditional constant propagation

- Dominator Tree reference: Lengauer-Tarjan algorithm