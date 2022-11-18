# 一个简易的RISC-V处理器实现

## 项目简介

实现了除`fence`,` ecall`, `ebreak`, `csrr`指令外的其他RV32I指令。



## 目录结构

### ./src

存放项目源码

### ./instructs_hex_file

存放用于导入的指令和数据hex文件。



## 各模块设计

各模块均采用verilog实现。

修改：memory和code模块采用为方便导入数据，采用Digital的RAM和ROM模块。